$params = @{
    Type = 'CodeSigningCert'
    Subject = 'CN=DelegateManagerSelfSigned'
    CertStoreLocation = 'Cert:\CurrentUser\My'
    KeyAlgorithm = 'RSA'
    KeyLength = '2048'
}

$modulePath = '.\DelegateManager'

$existingCert = Get-ChildItem Cert:\CurrentUser\My | Where-Object {
    $_.Subject -eq $params.Subject -and $_.EnhancedKeyUsageList | Where-Object { $_.FriendlyName -eq "Code Signing" }
}

if (-not $existingCert) {
    Write-Host "Creating a new self-signed certificate..."

    $newCert = New-SelfSignedCertificate @params

    $certFile = "$env:USERPROFILE\Desktop\CodeSigningCert.cer"
    Export-Certification -Cert $newCert -FilePath $certFile

    Write-Host "Certificate created and exported to $certFile"

    Write-Host "Adding certificate to Trusted Publishers store..."
    Import-Certificate -FilePath $certFile -CertStoreLocation Cert:\CurrentUser\TrustedPublisher

    $existingCert = $newCert

} else {
    Write-Host "Using existing certificate $($params.Subject)"
}

if (-not (Test-Path -Path $modulePath)) {
    Write-Host "Error: Module file not found at $modulePath" -ForegroundColor Red
    exit 1
}

Write-Host "Signing the module..."
Set-AuthenticodeSignature -FilePath $modulePath -Certificate $existingCert

if ($?) {
  Write-Host "Module successfully signed." -ForegroundColor Green
} else {
  Write-Host "Error signing the module." -ForegroundColor Red
}

Write-Host "You should now be able to import the module without changing execution policy."

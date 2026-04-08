# Create certificates for app-based authentication to Exchange Online

App-based authentication for Exchange Online is a common pattern when automating administrative tasks with a Microsoft Entra application. In these scenarios, the application must be granted the required permissions and linked to a certificate that is trusted for authentication.

This article shows a compact workflow for creating a certificate on **Windows** and **macOS**, and then using it for Exchange Online PowerShell authentication.

> [!NOTE]
> This article is intended as a practical companion. Review the relevant Microsoft and SEPPmail documentation before using these steps in production.

## Prerequisites

Before you begin, ensure that:

- a Microsoft Entra application already exists
- the application has the required API permissions and roles
- you know the `AppId` and the tenant or organisation domain
- your local machine is allowed to store and handle the certificate material securely

---

## Windows

### Create a self-signed certificate with PowerShell

```powershell
# Create a parameter hashtable for certificate creation
$certParams = @{
    Subject           = "CN=ExoManagementRS"
    CertStoreLocation = "Cert:\CurrentUser\My"
    KeyAlgorithm      = "RSA"
    KeyLength         = 2048
    KeyUsage          = "DigitalSignature"
    KeyUsageProperty  = "Sign"
    NotAfter          = (Get-Date).AddYears(1)
    Type              = "DocumentEncryptionCert"
}

$cert = New-SelfSignedCertificate @certParams

# Export PFX file
$password = 'yourpassword'
$certPassword = ConvertTo-SecureString -String $password -Force -AsPlainText
Export-PfxCertificate -Cert $cert -FilePath "./WindowsAppCert.pfx" -Password $certPassword

# Export CER file
$pfxPath = "./WindowsAppCert.pfx"
$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($pfxPath, $password)

$cerPath = "./WindowsAppCert.cer"
[byte[]] $certBytes = $cert.Export([System.Security.Cryptography.X509Certificates.X509ContentType]::Cert)
[IO.File]::WriteAllBytes($cerPath, $certBytes)

# Output thumbprint
$thumbprint = $cert.Thumbprint
Write-Host "Cert Thumbprint: $thumbprint"
```

### Authenticate to Exchange Online with the certificate thumbprint

```powershell
# Identify the certificate
$cert = Get-ChildItem -Path Cert:\CurrentUser\My | Where-Object { $_.Subject -like "CN=Exo*" }
$thumbprint = $cert.Thumbprint
Write-Host "Certificate Thumbprint: $thumbprint"

# App ID
$appId = "00000000-aaaa-bbbb-cccc-dddeeefff000"

# Organisation domain
$org = 'yourcustomdomain.com'

# Connect to Exchange Online
Connect-ExchangeOnline -AppId $appId -Organization $org -CertificateThumbprint $thumbprint
```

---

## macOS

On macOS, certificate creation is typically handled with `openssl`, while PowerShell is still used for Exchange Online authentication.

### Create a self-signed certificate with OpenSSL

```bash
# Generate private key
openssl genrsa -out exo-app.key 2048

# Create self-signed certificate
openssl req -new -x509 -key exo-app.key -out exo-app.crt -days 730 -subj "/CN=EXO-AppOnly"

# Create PFX package (you will be prompted for a password)
openssl pkcs12 -export -out exo-app.pfx -inkey exo-app.key -in exo-app.crt
```

### Authenticate to Exchange Online with the PFX certificate

```powershell
# Read certificate password
$passwd = Read-Host -Prompt 'Enter certificate password'

# Build path to certificate
$pfxPath = Join-Path -Path (Get-Location).Path -ChildPath 'exo-app.pfx'

# Load certificate
$cert = [System.Security.Cryptography.X509Certificates.X509Certificate2]::new(
    $pfxPath,
    $passwd,
    [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]::Exportable
)

# App ID
$appId = "00000000-aaaa-bbbb-cccc-dddeeefff000"

# Organisation domain
$org = 'yourcustomdomain.com'

Connect-ExchangeOnline -AppId $appId -Certificate $cert -Organization $org
```

---

## Security recommendations

- Prefer short-lived certificates for automation identities.
- Store PFX files only in secured locations.
- Never commit certificate files or passwords to Git.
- Consider managed operational processes for certificate rotation.
- Use separate app registrations for lab, project, and production contexts.

### Example partner lab naming

For documentation or internal demos, Synedat-style example naming could look like this:

- Subject: `CN=Synedat-EXO-Automation-Lab`
- App display name: `Synedat SEPPmail EXO Lab Automation`
- File prefix: `synedat-exo-lab`

These are examples only and should be adapted to your own governance standards.

## Related official documentation

- [SEPPmail Exchange Online Configuration](https://docs.seppmail.com/en/09_ht_mso365_06_exchange-online-configuration.html)
- [SEPPmail365 / Setup with Exchange Online](https://docs.seppmail.com/en/04_com_powershell_setup-exo.html)

# Test Exchange Online transport rules with `Test-Message`

Transport rules are central to many Exchange Online + SEPPmail mail-flow scenarios. When a rule does not trigger as expected, the built-in `Test-Message` workflow can help isolate the issue without relying only on live message traffic.

## Prerequisites

- Exchange Online PowerShell module installed
- administrative permissions for the target tenant
- a mailbox to receive the diagnostic report

Connect first:

```powershell
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline
```

## Verify the module version

Make sure your Exchange Online Management module is recent enough for the required diagnostics:

```powershell
Get-Module ExchangeOnlineManagement -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
```

## Option 1: Test with a generated message

The simplest approach is to generate a diagnostic test message directly:

```powershell
Test-Message \
  -Sender 'user.ofthetenant@contoso.eu' \
  -Recipients 'anotheruser.ofthetenant@contoso.eu' \
  -SendReportTo 'someadmin@contoso.eu' \
  -TransportRules
```

The report is delivered by the tenant postmaster and shows how transport rules were evaluated.

## Option 2: Test with an existing `.eml` file

If a real message failed in your environment, export it as an `.eml` file and test it directly:

```powershell
$data = [System.IO.File]::ReadAllBytes('/Testmail.eml')
Test-Message -MessageFileData $data -SendReportTo 'someadmin@contoso.eu' -TransportRules
```

If needed, you can override the recipient with the `-Recipients` parameter.

## How to read the result

The diagnostic report helps you answer these questions:

- Which transport rule was evaluated?
- Which conditions matched?
- Which conditions failed?
- Was the rule action actually triggered?

## Troubleshooting checklist

Before concluding that a SEPPmail-related rule is broken, validate the basics:

- **Rule priority**: a higher-priority rule may already act on the message.
- **Rule state**: ensure the rule is enabled.
- **Replication delay**: allow time after recent changes.
- **Scope and conditions**: confirm recipients, senders, headers, and domains really match the rule logic.
- **Connector context**: if the rule depends on a specific mail path, validate the connector setup too.

## Example partner use case

A good public project note for Synedat would be:

> *Use `Test-Message` before changing SEPPmail-side assumptions. In many cases the issue is a rule condition mismatch, not the gateway itself.*

## Related official documentation

- [SEPPmail Exchange Online Configuration](https://docs.seppmail.com/en/09_ht_mso365_06_exchange-online-configuration.html)
- [SEPPmail365 / Setup with Exchange Online](https://docs.seppmail.com/en/04_com_powershell_setup-exo.html)

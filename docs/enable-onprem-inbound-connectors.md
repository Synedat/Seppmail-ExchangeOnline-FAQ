# Enable On-Premises inbound connectors in new Microsoft 365 tenants

## Overview

Beginning in February 2023, Microsoft restricted the creation of certain new **On-Premises inbound connectors** in Exchange Online. For SEPPmail integration scenarios, this can become a blocking issue because inbound connectors are required in several deployment patterns, including parallel-mode integration with **seppmail.cloud** and appliance-based scenarios.

This article documents a practical field workflow that has helped project teams prepare a support request successfully.

## Symptoms

A typical symptom is that the connector is created but remains disabled and cannot be enabled through the GUI or PowerShell.

Example error message:

> `Microsoft.Exchange.Management.Tasks.OrganizationInboundConnectorProhibitedException`

## Why this matters for SEPPmail

If the inbound connector cannot be enabled, Exchange Online cannot be fully integrated with the SEPPmail mail-flow design expected by the PowerShell modules and the documented connectivity patterns.

## Recommended preparation workflow

### 1. Record the original sent email identity

In Exchange Admin Center, review the inbound connector created for the SEPPmail setup and record the original **sent email identity** value.

A real-world example might look similar to:

```text
d563a719-f13b-4427-b196-eb139b7a56a8.de.seppmail.cloud
```

Keep this value safe. You will need it later.

### 2. Temporarily rename the sent email identity

Edit the connector and change the sent email identity to:

```text
seppmail.customerdomain.tld
```

Example:

```text
seppmail.contoso.eu
```

### 3. Add the same value as an accepted domain

In Microsoft 365 Admin Center, add the same name as an accepted domain.

Example:

```text
seppmail.contoso.eu
```

This domain is only used as part of the preparation workflow. It does not need to become an active production mail domain for customer communication.

### 4. Open a Microsoft support request

Use the Microsoft support process to request enablement of the inbound connector and reference the relevant Microsoft connector guidance.

A support request can be phrased along these lines:

> We require an inbound connector for our trusted third-party email security service SEPPmail. SEPPmail provides cryptographic email processing that is required for our business communication. The case relates to the restrictions described in Microsoft guidance for supported inbound connector configurations, and we have prepared the tenant accordingly.

### 5. Restore the original connector value

Once Microsoft enables the connector, restore the original sent email identity that was recorded in step 1.

If the SEPPmail transport rules are already in place, mail flow should then work as expected.

### 6. Optional cleanup

You may remove the temporary accepted domain afterwards, or keep it if your internal documentation and governance process prefer that.

## Operational notes

- Document every value you change before opening the ticket.
- Use a change record if the tenant is customer-owned.
- Re-run your Exchange Online validation after connector enablement.
- If rules and connectors were generated through SEPPmail PowerShell modules, confirm that the generated values are restored correctly.

## Example partner note

For public project documentation, Synedat can describe this as:

> *A partner-led preparation workflow to reduce friction in Microsoft support cases for SEPPmail-related Exchange Online connector enablement.*

## Related official documentation

- [SEPPmail Exchange Online Configuration](https://docs.seppmail.com/en/09_ht_mso365_06_exchange-online-configuration.html)
- [SEPPmail365 / Setup with Exchange Online](https://docs.seppmail.com/en/04_com_powershell_setup-exo.html)

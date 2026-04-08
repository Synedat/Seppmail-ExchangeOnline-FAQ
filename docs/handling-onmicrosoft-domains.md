# Handle *.onmicrosoft.com sender domains in SEPPmail scenarios

## Why this topic matters

Every Microsoft 365 tenant receives an `*.onmicrosoft.com` domain during tenant creation. If this domain remains the tenant's effective default in operational use, unusual sender addresses can appear in mail flow, for example from devices, monitoring systems, or internally generated notifications.

Examples:

- `monitoring@contosoeu.onmicrosoft.com`
- `printer4711@contosoeu.onmicrosoft.com`

In SEPPmail-related environments, that can lead to avoidable routing and signing issues.

## Typical root cause

A tenant was created with the default `*.onmicrosoft.com` domain, but later project steps did not fully shift operational usage to the custom business domain.

## Why this is problematic

### Certificate-based signing

`*.onmicrosoft.com` domains are not generally used in the same way as customer-owned public business domains for cryptographic mail identity. In practice, this can break expected signing behavior in SEPPmail scenarios.

### Outbound mail through SEPPmail

If a sender address uses `*.onmicrosoft.com`, the message may not match the customer-managed domain expectations in SEPPmail or seppmail.cloud.

### Reply behavior

Even if a message appears to leave the tenant successfully, replies to `*.onmicrosoft.com` addresses may not behave as administrators expect in customer-facing communication scenarios.

## Scenario overview

| Scenario | Expected behavior | Risk |
|---|---|---|
| Internal mail between users | Usually works internally | Low |
| Outbound mail to external recipients | May leave the tenant | Medium |
| Cryptographic processing via SEPPmail | May fail or behave unexpectedly | High |
| External inbound mail to `*.onmicrosoft.com` | Not a reliable customer-facing target | High |

## Recommended actions

1. Review the tenant's accepted domains.
2. Ensure the intended customer business domain is used operationally.
3. Avoid using `*.onmicrosoft.com` addresses for user-facing communication.
4. Review devices, monitoring tools, printers, and service accounts.
5. Check SEPPmail managed-domain expectations for the customer environment.

## What to look for in logs

If you see `*.onmicrosoft.com` senders in:

- appliance mail logs,
- project troubleshooting exports, or
- seppmail.cloud log views,

treat that as a configuration review trigger.

## Example partner wording

A concise public description for Synedat-owned repo content could be:

> *If `*.onmicrosoft.com` appears in productive sender identities, verify accepted-domain strategy before troubleshooting SEPPmail mail-flow logic.*

## Related official documentation

- [SEPPmail Exchange Online Configuration](https://docs.seppmail.com/en/09_ht_mso365_06_exchange-online-configuration.html)
- [Mail System](https://docs.seppmail.com/en/07_mi_06_ms__mail-system.html)

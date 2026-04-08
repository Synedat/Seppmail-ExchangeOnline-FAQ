# Seppmail-ExchangeOnline-FAQ

**Public partner repository maintained by Synedat for SEPPmail-related Exchange Online knowledge, operational notes, and reusable field guidance.**

This repository collects practical guidance for integrating **SEPPmail Secure E-Mail Gateway** and **seppmail.cloud** with **Microsoft Exchange Online / Microsoft 365**. It is designed as a compact, public-facing knowledge base for consultants, administrators, and project teams who need concise explanations, working examples, and links to the relevant official documentation.

> [!IMPORTANT]
> This repository complements the official SEPPmail documentation. The official product documentation remains the authoritative source for product behavior, supported configurations, and production guidance.

## Why this repository exists

Exchange Online integrations often fail for small but critical reasons: tenant defaults, connector restrictions, transport-rule logic, or certificate handling for app-based authentication. This repository turns those recurring project issues into readable, shareable documentation.

## Contents

- [Create certificates for app-based authentication to Exchange Online](docs/create-app-certificates-for-exchange-online.md)
- [Enable On-Premises inbound connectors in new Microsoft 365 tenants](docs/enable-onprem-inbound-connectors.md)
- [Handle *.onmicrosoft.com sender domains in SEPPmail scenarios](docs/handling-onmicrosoft-domains.md)
- [Test Exchange Online transport rules with `Test-Message`](docs/test-exchange-online-transport-rules.md)

## Official SEPPmail documentation

The following official documentation is especially relevant when working with this repository:

- [Exchange Online Configuration](https://docs.seppmail.com/en/09_ht_mso365_06_exchange-online-configuration.html)
- [SEPPmail365 / Setup with Exchange Online](https://docs.seppmail.com/en/04_com_powershell_setup-exo.html)
- [Securing the SEPPmail Secure E-Mail Gateway](https://docs.seppmail.com/en/09_ht_tenant_securing-seppmail.html)
- [Mail System](https://docs.seppmail.com/en/07_mi_06_ms__mail-system.html)
- [Email Relaying](https://docs.seppmail.com/en/04_com_08_iei_03_mail-relaying.html)

## Repository structure

```text
.
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── repository-profile.md
├── docs/
│   ├── create-app-certificates-for-exchange-online.md
│   ├── enable-onprem-inbound-connectors.md
│   ├── handling-onmicrosoft-domains.md
│   └── test-exchange-online-transport-rules.md
├── CONTRIBUTING.md
├── LICENSE
├── README.md
└── SECURITY.md
```

## About Synedat

**Synedat Group GmbH** is a consulting and technology company focused on software engineering, IT consulting, digitalisation, and implementation support. In client projects, Synedat works on secure, scalable, and operationally sustainable solutions across cloud, infrastructure, and application landscapes.

Within the SEPPmail ecosystem, this repository is positioned as a **partner-maintained public knowledge base**.

## Example use context

Typical partner scenarios include:

- onboarding Exchange Online tenants to **seppmail.cloud**
- integrating **SEPPmail Secure E-Mail Gateway** in Azure-based or hybrid mail-flow designs
- validating connector and transport-rule behavior during rollout or troubleshooting
- documenting field-proven operational guidance for project teams and customer administrators

## Contribution model

Contributions should remain focused on:

- practical and reproducible Exchange Online integration guidance
- concise troubleshooting notes
- cross-links to official SEPPmail documentation
- documentation quality, readability, and consistency

Please see [CONTRIBUTING.md](CONTRIBUTING.md) and [SECURITY.md](SECURITY.md).

## Support and scope

This repository is intended for **documentation and knowledge sharing**. It is not a replacement for official product support.

- Product documentation: use the official SEPPmail documentation.
- Product support: contact the official SEPPmail support channels.
- Partner/project questions: route through your Synedat delivery or consulting contact.

## Trademark notice

SEPPmail and related product names are trademarks of their respective owners. This repository is maintained by **Synedat as a partner context**, not as a claim of product ownership.

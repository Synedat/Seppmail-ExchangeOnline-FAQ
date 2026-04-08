# Security, Architecture and Compliance Notes

The material in this repository is guidance and implementation support. It is not legal advice, not an audit opinion and not a certification statement. Controls must always be tailored to the concrete environment, risk appetite and regulatory scope.

## Why this matters

Public technical repositories in the SEPPmail ecosystem are often used as bootstrap material for environments that later need to satisfy internal security reviews, external audits or customer due diligence. This repository therefore includes implementation guidance that is intentionally aligned to common control families such as access management, change control, logging, resilience and third-party governance.

## Control mapping focus

### ISO/IEC 27001:2022
Use this repository to support an ISMS-centric implementation approach with clear ownership, risk-based hardening, documented operating procedures, logging and evidence generation. Useful themes include access control, secure configuration, backup and restore, supplier management, incident response and change management.

### BAIT
For German banking environments, BAIT is a practical reference for IT governance, information security, user access management, IT projects, application development, IT operations and outsourcing / external sourcing. Treat the scripts and examples here as building blocks that still need to be embedded into your institution-specific governance model.

### DORA
For financial entities and ICT dependencies in scope, DORA increases the bar for ICT risk management, testing, incident handling, operational resilience and third-party risk visibility. The examples in this repository are therefore structured to encourage explicit ownership, testability, rollback patterns, evidence capture and service dependency documentation.

### TISAX
In automotive and supplier contexts, TISAX is commonly used to demonstrate security maturity and controlled handling of sensitive information. The repository patterns here are useful particularly for role separation, secure administration, logging, supplier coordination and documented operational procedures.

### NIS2
For entities affected by NIS2 or using it as a cyber hygiene reference, this repository provides practical patterns around technical safeguards, incident preparation, secure operations and supply-chain aware documentation.

## Typical evidence you can derive from this repository

- Reviewed README and architecture documentation
- Approved pull requests and tracked change history
- Security review notes for scripts and credentials handling
- Screenshots or exported logs from validation runs
- Runbook execution records and recovery drill notes
- Parameter files and environment baselines under version control

## Minimum implementation expectations

1. Store credentials and tokens in a dedicated secret store rather than in source code.
2. Use named technical identities with least privilege and explicit ownership.
3. Enable logging on platform, API and change levels.
4. Run repeatable validation after every change.
5. Capture evidence for restore, rollback, incident and change scenarios.
6. Review dependencies on Microsoft 365, Azure, DNS, certificates and external providers.

## Related authoritative references

- ISO/IEC 27001: https://www.iso.org/standard/27001
- BAIT / BaFin risk management overview: https://www.bafin.de/EN/Aufsicht/BankenFinanzdienstleister/Risikomanagement/risikomanagement_node_en.html
- DORA overview: https://www.esma.europa.eu/esmas-activities/digital-finance-and-innovation/digital-operational-resilience-act-dora
- TISAX overview: https://www.enx.com/tisax/
- NIS2 summary: https://eur-lex.europa.eu/EN/legal-content/summary/cybersecurity-of-network-and-information-systems.html

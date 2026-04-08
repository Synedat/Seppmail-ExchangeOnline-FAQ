# RBAC and Permissions

    Permissions should be explicit, reviewable and environment-specific. The table below is a pragmatic starting point for separating responsibilities.

    | Role | Responsibility |
    | --- | --- |
    | Repository maintainer | Owns repository quality, change control and release notes. |
| Platform administrator | Maintains Azure, Microsoft 365, DNS and network dependencies. |
| Exchange Online admin | Performs connector and transport rule changes and validates mail flow. |
| SEPPmail administrator | Configures appliance or cloud-side settings, certificates, tokens and message flow. |
| Security reviewer | Reviews hardening, secrets handling, logging and control evidence. |
| Auditor / assessor | Consumes evidence and validates that documented controls are in place. |


## Microsoft 365 / Exchange Online-oriented permission model

- Separate global administration from day-to-day messaging administration.
- Use dedicated accounts for connector and transport rule changes.
- Review certificate private key access and app registrations periodically.
- Document emergency access and rollback rights separately from routine operations.


    ## Review cadence

    - Quarterly access review for privileged roles
    - Immediate review after staff movement or partner changes
    - Mandatory review before production go-live
    - Evidence retention aligned with internal policy and regulatory expectations

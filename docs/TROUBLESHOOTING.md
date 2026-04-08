# Troubleshooting

    | Symptom | First checks |
    | --- | --- |
    | Authentication fails | Verify endpoint URL, secret source, token validity, clock skew and TLS trust. |
| Connectivity fails | Check DNS resolution, firewall rules, proxies, NSGs, inbound connectors and published ports. |
| Unexpected runtime errors | Re-run with verbose logging, capture correlation IDs, review rate limits and test with minimal parameters. |
| Configuration drift | Compare live state against code, parameter files and approved change requests. |
| Rollback needed | Stop further rollout, capture current evidence, execute the documented rollback and validate message flow or API health afterwards. |

    ## Escalation checklist

    - What changed?
    - Which environment is affected?
    - Is the issue reproducible?
    - Which dependency is failing first: identity, DNS, network, API, connector, certificate or workload?
    - What is the rollback decision point?

    ## Evidence to capture

    - Timestamp and timezone
    - Target system / tenant / subscription
    - Exact command or request
    - HTTP status code or PowerShell error text
    - Relevant logs and screenshots

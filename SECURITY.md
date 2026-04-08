# Security Policy

Please do **not** publish secrets, API tokens, certificates, private keys, customer hostnames or tenant-specific identifiers in issues or pull requests.

## Reporting a vulnerability
If you discover a security issue in one of these examples, please report it privately to the repository owner before opening a public issue.

## Safe usage notes
- treat all scripts as examples and validate them in a non-production environment first
- review access scopes, RBAC permissions and firewall rules carefully
- rotate credentials after testing if a secret was exposed accidentally
- adapt logging so that no sensitive content is written to console output or log files

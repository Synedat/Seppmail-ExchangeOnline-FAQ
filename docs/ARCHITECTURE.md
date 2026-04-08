# Architecture

    Focus on message routing, trust boundaries, certificate handling, transport rules and validation of inbound / outbound connectors.

    ## Overview diagram

    ```mermaid
flowchart LR
    A[Sender / Exchange Online] --> B[Connector and transport rules]
    B --> C[SEPPmail gateway or service]
    C --> D[Cryptographic policy / routing]
    D --> E[Recipient domain]
    B -. telemetry .-> F[Logs / monitoring]
    C -. admin API .-> G[Operations and automation]
```

    ## Design prompts

    - Which trust boundaries exist?
    - Which identities or tokens cross those boundaries?
    - Which dependencies are external and need explicit monitoring?
    - What is the fallback mode if a dependency is unavailable?
    - Which artefacts form the minimum evidence pack for change and recovery?

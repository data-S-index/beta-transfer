# beta-transfer

Staging redirect page for [Scholar Data](https://scholardata.io), deployed at `beta.scholardata.io`.

## Development

```bash
pnpm install
pnpm dev
```

## Build

```bash
pnpm build
```

## Deploy

Deployed to `beta.scholardata.io`. Any path and query parameters visited on the beta domain are forwarded to the equivalent URL on `scholardata.io`.

# static-binaries

This repo contains a bunch of statically-linked binaries of various tools,
along with the Dockerfiles / other build scripts that can be used to build
them.

This repo is compatible with [`import`](https://import.pw), so that you can
easily load static binaries that your script depends on.

## Example

```bash
#!/usr/bin/env import
import "static-binaries"
static_binaries "jq"

echo "\`jq\` is located at: $(command -v jq)"
echo "\`jq -V\`: $(jq -V)"
```

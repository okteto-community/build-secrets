## Build-secrets test

This repo demonstrates how to pass a secret file to a BuildKit build using Okteto.
It uses a template file .minimus_token that contains the placeholder $MINIMUS_TOKEN. Okteto will expand that at build time and provide the secret as /run/secrets/minimus_token to the RUN --mount=type=secret step.


NOTE: .minimus_token must contain the literal $MINIMUS_TOKEN placeholder (do not commit real secrets).


## How to test

1. Make sure you have Okteto CLI logged in and the Okteto context set (example: okteto context use <your-context>).

Provide MINIMUS_TOKEN to the build environment. Two options:

- Preferred (Okteto Admin Vars): Add MINIMUS_TOKEN in your Okteto UI under Admin / Admin Variables for the instance that runs the build.




2.  Run the build with debug/plain output and no cache:

```okteto build -l debug --progress plain --no-cache```

Inspect the build logs. Using --progress plain prevents the BuildKit progress UI from hiding lines. The RUN in the Dockerfile prints the secret 

## Quick troubleshooting

If build prints (no secret) or length 0, verify:

.minimus_token exists and contains $MINIMUS_TOKEN, and

MINIMUS_TOKEN is set in Admin Vars or exported in the environment that runs the build.


# Claude Code Sandbox Docker Image

## Settings

Update the settings as needed

## Building the Image

Build as docker image from the cc_sandbox dir:

```shell
docker build -t cc-image -f claude.Dockerfile .
```

or from the root dir:

```shell
docker build -t cc-image -f cc_sandbox/claude.Dockerfile ./cc_sandbox
```

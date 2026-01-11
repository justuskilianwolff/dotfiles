#!/bin/sh
# Create symlink so Claude's internal checks find the binary
mkdir -p /root/.local/bin
ln -sf /usr/local/bin/claude /root/.local/bin/claude
exec "$@"

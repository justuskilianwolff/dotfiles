#!/bin/sh
# Create symlink so Claude's internal checks find the binary
mkdir -p /root/.local/bin

# Only create symlink if it doesn't exist (preserves updates from `claude update`)
if [ ! -L /root/.local/bin/claude ]; then
    ln -sf /usr/local/bin/claude /root/.local/bin/claude
fi

exec "$@"

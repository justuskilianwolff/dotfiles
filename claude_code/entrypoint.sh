#!/bin/sh
# Create symlinks so tools can find binaries
mkdir --parents /root/.local/bin

# Only create symlink if it doesn't exist (preserves updates from `claude update`)
if [ ! -L /root/.local/bin/claude ]; then
    ln --symbolic --force /usr/local/bin/claude /root/.local/bin/claude
fi

exec "$@"

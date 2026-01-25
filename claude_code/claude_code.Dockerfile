FROM debian:bookworm-slim

# Add uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install curl to install docker and assistants
RUN apt-get update && apt-get install --yes \
    ca-certificates \
    curl \
    && rm --recursive --force /var/lib/apt/lists/*

# Install Docker CLI and Docker Compose
RUN curl --fail --silent --show-error --location https://get.docker.com | sh

# Install Claude to /usr/local/ (system location, survives volume mount to /root)
RUN curl --fail --silent --show-error --location https://claude.ai/install.sh | sed 's|rm -f "$binary_path"|:|' | bash && \
    mkdir --parents /usr/local/share/claude/versions && \
    CLAUDE_BIN=$(ls /root/.claude/downloads/claude-*) && \
    VERSION=$(basename "$CLAUDE_BIN" | sed 's/claude-\(.*\)-linux.*/\1/') && \
    cp "$CLAUDE_BIN" "/usr/local/share/claude/versions/$VERSION" && \
    chmod +x "/usr/local/share/claude/versions/$VERSION" && \
    ln --symbolic --force "/usr/local/share/claude/versions/$VERSION" /usr/local/bin/claude && \
    rm --recursive --force /root/.claude

# Install OpenCode to /usr/local/ (system location, survives volume mount to /root)
RUN curl --fail --silent --show-error --location https://opencode.ai/install | bash -s -- --no-modify-path && \
    cp /root/.opencode/bin/opencode /usr/local/bin/opencode && \
    chmod +x /usr/local/bin/opencode

# Install additional utilities
RUN apt-get update && apt-get install --yes \
    zsh \
    git \
    tree \
    jq \
    ripgrep \
    && rm --recursive --force /var/lib/apt/lists/*

# Install Node.js (includes npm) and pnpm
RUN curl --fail --silent --show-error --location https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install --yes nodejs && \
    npm install --global pnpm && \
    rm --recursive --force /var/lib/apt/lists/*

ENV PATH="/root/.local/bin:/usr/local/bin:$PATH"

# Set zsh as default shell
SHELL ["/bin/zsh", "-c"]
WORKDIR /workspace

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["claude"]

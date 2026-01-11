FROM debian:bookworm-slim

# Add uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install curl to install docker and cc
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Docker CLI and Docker Compose
RUN curl -fsSL https://get.docker.com | sh

# Install Claude to /usr/local/ (system location, survives volume mount to /root)
RUN curl -fsSL https://claude.ai/install.sh | sed 's|rm -f "$binary_path"|:|' | bash && \
    mkdir -p /usr/local/share/claude/versions && \
    CLAUDE_BIN=$(ls /root/.claude/downloads/claude-*) && \
    VERSION=$(basename "$CLAUDE_BIN" | sed 's/claude-\(.*\)-linux.*/\1/') && \
    cp "$CLAUDE_BIN" "/usr/local/share/claude/versions/$VERSION" && \
    chmod +x "/usr/local/share/claude/versions/$VERSION" && \
    ln -sf "/usr/local/share/claude/versions/$VERSION" /usr/local/bin/claude && \
    rm -rf /root/.claude

# Install additional utilities
RUN apt-get update && apt-get install -y \
    zsh \
    git \
    tree \
    jq \
    ripgrep \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/local/bin:/root/.local/bin:$PATH"

# Set zsh as default shell
SHELL ["/bin/zsh", "-c"]
WORKDIR /workspace

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["claude"]
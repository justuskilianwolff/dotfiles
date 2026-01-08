FROM debian:bookworm-slim

# Add uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install curl to install docker and cc
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Docker CLI and Docker Compose
RUN curl -fsSL https://get.docker.com | sh \
    && docker compose version

# Install Claude Code CLI (native)
RUN curl -fsSL https://claude.ai/install.sh | bash

# Install additional utilities (don't invalidate cache too often)
RUN apt-get update && apt-get install -y \
    zsh \
    git \
    tree \
    jq \
    ripgrep \
    && rm -rf /var/lib/apt/lists/*

# Add claude to PATH (native installer uses ~/.local/bin)
ENV PATH="/root/.local/bin:$PATH"

# Set zsh as default shell
SHELL ["/bin/zsh", "-c"]

WORKDIR /workspace

CMD ["claude"]
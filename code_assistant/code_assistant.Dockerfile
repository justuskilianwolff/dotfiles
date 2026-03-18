FROM debian:bookworm-slim

# Install system dependencies
RUN apt-get update && apt-get install --yes \
    ca-certificates \
    curl \
    git \
    jq \
    ripgrep \
    tree \
    zsh \
    && rm --recursive --force /var/lib/apt/lists/*

# Install Docker CLI
RUN curl --fail --silent --show-error --location https://get.docker.com | sh

# Install Node.js and pnpm
RUN curl --fail --silent --show-error --location https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install --yes nodejs && \
    npm install --global pnpm && \
    rm --recursive --force /var/lib/apt/lists/*

# Install Claude Code via npm (official approach, avoids installer bugs)
RUN npm install --global @anthropic-ai/claude-code

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install OpenCode (direct binary download)
RUN curl --fail --silent --show-error --location \
    "https://github.com/anomalyco/opencode/releases/latest/download/opencode-linux-x64.tar.gz" | \
    tar --extract --gzip --directory /usr/local/bin opencode

ENV PATH="/root/.local/bin:/usr/local/bin:$PATH"
SHELL ["/bin/zsh", "-c"]

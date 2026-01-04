FROM node:20-slim

# add uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
# set uv environment variable such that venvs dont interfere (macos and linux)
ENV UV_PROJECT_ENVIRONMENT=.venv_claude_code

# Install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

# Install basic tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    tree \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install modern Docker CLI + Compose v2
RUN curl -fsSL https://get.docker.com | sh \
    && docker compose version

WORKDIR /workspace

CMD ["claude"]
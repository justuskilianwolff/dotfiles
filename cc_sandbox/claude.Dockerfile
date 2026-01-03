FROM node:20-slim

# add uv 
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

# Install basic tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["claude"]
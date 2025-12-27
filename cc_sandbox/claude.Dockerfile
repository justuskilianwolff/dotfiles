FROM node:20-slim

# Install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

# Install any other tools you need
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["claude"]
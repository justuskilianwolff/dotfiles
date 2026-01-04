alias sc="docker run -it --rm \
  -v \"\$(pwd):/workspace:cached\" \
  -v claude-data:/root/ \
  -v ~/.claude/settings.json:/root/.claude/settings.json:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  cc-image"

alias ss="docker run -it --rm \
  -v \"\$(pwd):/workspace:cached\" \
  -v claude-data:/root/ \
  -v ~/.claude/settings.json:/root/.claude/settings.json:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  cc-image \
  /bin/bash"
alias sc="docker run -it --rm \
  -v \"\$(pwd):/workspace:cached\" \
  -v claude-data:/root/ \
  cc-image"

alias ss="docker run -it --rm \
  -v \"\$(pwd):/workspace:cached\" \
  -v claude-data:/root/ \
  cc-image \
  /bin/bash"
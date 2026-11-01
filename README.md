# ghost-editor

### Prerequisites

- elixir
- erlang

### Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.com/suvanshenoy/ghost-editor.git
cd ghost-editor
```

2. **Run the project**

```
mix deps.get
mix deps.compile
TARGET_ABI=musl BURRITO_TARGET=linux MIX_ENV=prod mix release --overwrite
./burrito_out/ghost_editor_linux
```

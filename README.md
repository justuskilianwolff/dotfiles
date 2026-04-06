# dotfiles

This repository just serves to sync my shell and other configs between my work and private machines.
More advanced approaches like stow or chezmoi don’t seem to be necessary yet, but never say never...

## zsh

To source all files in the `zsh` directory you can run following command in your `.zshrc` file:

```shell
DOTFILES_PATH="/Users/justuswolff/Repositories/dotfiles"

# source all files in the zsh folder of the dotfiles repo
for file in "$DOTFILES_PATH/zsh/"*; do
  [ -f "$file" ] && source "$file"
done
```

### zsh Navigation Shortcuts

The `zsh/04_navigation.sh` file provides helpful navigation functions and aliases:

- `up [N]`: Go up N directories (defaults to 1 if not specified).
- Directory shortcuts:
  - `docs`: `cd ~/Documents`
  - `down`: `cd ~/Downloads`
  - `desk`: `cd ~/Desktop`
  - `repos`: `cd ~/Repositories`
  - `f`: Open the dotfiles repo in VS Code
- Miscellaneous:
  - `h`: Show command history
  - `c`: Clear the terminal
  - `l`: List files with details and color
  - `rdf`: Shortcut for `rm -rf`
  - `o`: Open the current directory in Finder

### Zsh Plugins

The `zsh/02_plugins.sh` file loads the following plugins:

- **zsh-autopair**: Automatically closes brackets and quotes
- **zsh-syntax-highlighting**: Colors the command line as you type
- **zsh-autosuggestions**: Suggests commands based on history (accept with →)
- **zsh-autocomplete**: Adds real-time completions as you type

### Starship Prompt

The `zsh/00_start.sh` file configures [Starship](https://starship.rs/) as the shell prompt, using a custom config at `starship/config.toml`. The prompt displays:

- Date (📅) and time (🕙) on the right side
- Git branch, status, and metrics
- Python environment indicator
- Command duration

### Miscellaneous Aliases

The `zsh/98_misc.sh` file provides:

| Alias | Command                                                | Description                |
| ----- | ------------------------------------------------------ | -------------------------- |
| `bu`  | `brew update && brew upgrade && brew cu -ayf && brew cleanup` | Full Brew update    |
| `ez`  | `exec zsh`                                             | Restart zsh                |
| `it`  | `open -a iTerm .`                                      | Open iTerm in current dir  |

### Shell Utilities

The `zsh/99_end.sh` file initializes:

- **Starship**: Custom prompt (initialized last to ensure all configs are loaded)
- **Zoxide**: Smarter `cd` command (`z` to jump to frequently visited directories)
- **fzf**: Fuzzy finder (activated with `Ctrl+R` for history search)

## Homebrew

Within the `brew` directory run

```shell
brew bundle [--cleanup]
```

to install the Brewfile (and optionally) removing your other installations. To add your local installations run

```shell
brew bundle dump --cask --formula --tap --force
```

to list all casks and formulaes and forcing the override. This just handles installation. To upgrade already installed casks run

```shell
brew upgrade --cask
```

### CU for updating

Pin the versions of apps that usually make problems (spotify, stats): `brew cu pin <app_name>`. Then run all updates with: `brew cu -yaf`.

### Using on multiple accounts on same machine

- Followed the [untar anywhere approach](https://stackoverflow.com/questions/41840479/how-to-use-homebrew-on-a-multi-user-macos-sierra-setup)
- Export in .zshrc: `export HOMEBREW_PREFIX="/Users/justuswolff_private/brew"`

## BetterTouchTool Preset

The [`btt/Shared.bttpreset`](btt/Shared.bttpreset) file contains a set of custom [BetterTouchTool](https://folivora.ai/) triggers and settings for macOS automation.

### Key Features

- **Global Triggers:**

| Trigger                     | Action                                     | Notes                                  |
| --------------------------- | ------------------------------------------ | -------------------------------------- |
| `Cmd + Right Click`         | Sends the `Enter` key                      | Useful for quickly confirming actions. |
| `Cmd + Shift + Right Click` | Sends `Shift + Enter`                      | Useful for Jupyter Notebooks           |
| `Ctrl + Right Click`        | Connects to "AirPods Pro" Bluetooth device | Quickly connect to your AirPods.       |

All these triggers are also available via a two finger tap on the trackpad.

- **Spotify Specific Triggers:**

| Trigger              | Action         | Notes                          |
| -------------------- | -------------- | ------------------------------ |
| Middle Mouse Button  | Play/Pause     | Control playback with a click. |
| 1 Finger Swipe Right | Next Track     | Skip to the next song.         |
| 1 Finger Tap         | Play/Pause     | Control playback with a tap.   |
| 1 Finger Swipe Left  | Previous Track | Go back to the previous song.  |

- **VS Code Specific Triggers:**

| Trigger                        | Action                    | Notes                                                  |
| ------------------------------ | ------------------------- | ------------------------------------------------------ |
| Middle Mouse Button            | Trigger "Code Inspection" | Activates a custom code inspection.                    |
| 1 Finger Tap Middle            | Trigger "Code Inspection" | Activates a custom code inspection.                    |
| Named Trigger: Code Inspection | `Modifiers + F12`         | Custom shortcut for code inspection at mouse location. |

### Usage

1. Open BetterTouchTool.
2. Go to the "Manage Presets" section.
3. Click "Import" and select the [`btt/Shared.bttpreset`](btt/Shared.bttpreset) file.
4. Enable the "Shared" preset to activate the included triggers and settings.

## iTerm2

Load and/or export the profile configured here. I could not get the profile used by iTerm2 to be also used by VSCode but the natural key editing seems to be similar :)

## Karabiner

- Some useful shortcuts are at this [marketplace](https://ke-complex-modifications.pqrs.org/)

### Shortcuts

#### App Shortcuts

These global shortcuts use **Capslock** + [key] to quickly launch applications.

| Key | Application           |
| --- | --------------------- |
| B   | Browser (Brave)       |
| C   | Calendar              |
| D   | Microsoft To **Do**   |
| E   | Mail (E-Mail)         |
| F   | Finder                |
| G   | System Settings       |
| H   | Home Assistant        |
| M   | Spotify (Music)       |
| N   | Notion                |
| R   | Reminders             |
| S   | Slack                 |
| T   | Microsoft Teams       |
| V   | Visual Studio Code    |
| W   | WhatsApp              |
| X   | Microsoft Excel       |
| #   | iTerm (# shell start) |

#### Arrow Keys

These shortcuts use **Capslock** + [key] to emulate arrow key navigation:

| Key | Arrow Key |
| --- | --------- |
| J   | Left      |
| K   | Down      |
| L   | Up        |
| Ö   | Right     |

All Hyper key mappings use `optional: ["any"]`, meaning they work regardless of additional modifier keys held.

#### Brackets

These shortcuts use **Capslock** + [key] to type bracket pairs with the cursor positioned inside:

| Key | Output | Notes                                 |
| --- | ------ | ------------------------------------- |
| U   | `()`   | Types both brackets, cursor inside    |
| I   | `[]`   | Types both brackets, cursor inside    |
| O   | `{}`   | Types both brackets, cursor inside    |

#### Jump 10 Lines

**Capslock** + Up/Down jumps 10 lines at a time:

| Key           | Action        |
| ------------- | ------------- |
| Hyper + Up    | Move up 10 lines  |
| Hyper + Down  | Move down 10 lines |

#### Teams End Call Shortcut

Maps `Cmd+Shift+E` → `Cmd+Shift+H` in Microsoft Teams (to end/hang up calls).

#### VSCode Function Keys

Swaps function keys in VSCode to standard F1–F12 behavior (e.g., F12 sends `fn+F12`, so the default media/brightness actions become standard function key presses). Using Hyper+F1–F12 reverses this back to the original media/brightness actions.

## Miscellaneous Key Bindings

These shortcuts use **Capslock** + [key] to perform various actions (key labels based on German keyboard layout):

| Key Combination       | Result                       |
| --------------------- | ---------------------------- |
| P                     | `\|` (pipe)                  |
| Ü                     | `/` (slash)                  |
| Ä                     | `)` (closing parenthesis)    |
| Hyper + Enter         | Lock Screen (Ctrl+Cmd+Q)     |

## Hammerspoon

Since symlinking currently does not work as mentioned in this [issue](https://github.com/Hammerspoon/hammerspoon/issues/3706), just copy the `hammerspoon` folder to `~/.hammerspoon/` and run `hs.reload()` in the Hammerspoon console.

### Auto-Mute Speakers

The `init.lua` script automatically mutes the MacBook's built-in speakers when the audio output is switched to them. This prevents unexpected sound output from the internal speakers.

### Claude Code Notification Server

The `init.lua` script runs an HTTP server on port 3456 that plays a sound and shows a notification when Claude Code completes a task. This allows you to get notified when long-running tasks finish.

## Espanso

[Espanso](https://espanso.org/) is a cross-platform text expander that automatically replaces text snippets as you type.

### Setup on New Machines

1. **Install Espanso** (if not already installed via Homebrew):

   ```shell
   brew install espanso
   ```

2. **Remove any existing espanso configuration** (if it exists):
   Remove this if espanso is not running, otherwise it will be recreated automatically.

   ```shell
   rm -rf "$HOME/Library/Application Support/espanso"
   ```

3. **Create symlink to entire dotfiles espanso directory**:

   ```shell
   ln -s "$HOME/Repositories/dotfiles/espanso" "$HOME/Library/Application Support/espanso"
   ```

4. **Start espanso** (if not already running):

   ```shell
   espanso start
   ```

### Configuration

The configuration includes automatic text expansion for common contractions:

- **Negative contractions**: `dont` → `don't`, `cant` → `can't`, `wont` → `won't`, etc.
- **Question words**: `whats` → `what's`, `wheres` → `where's`, `hows` → `how's`, etc.
- **Pronouns**: `youre` → `you're`, `theyre` → `they're`, `were` → `we're`, etc.
- **Auxiliary verbs**: `ive` → `I've`, `youll` → `you'll`, `hed` → `he'd`, etc.

### Date & Time Triggers

The `match/dates.yml` file provides the following triggers:

| Trigger         | Example Output              | Description              |
| --------------- | --------------------------- | ------------------------ |
| `:date`         | `27.06.2025`                | Current date (DD.MM.YYYY)|
| `:time`         | `17:17`                     | Current time (HH:MM)     |
| `:isodate`      | `2025-06-27`                | ISO date format           |
| `:isotime`      | `17:17:00`                  | ISO time format           |
| `:day`          | `27.`                       | Day of the month          |
| `:weekday-en`   | `Thursday`                  | Weekday (English)         |
| `:weekday-de`   | `Donnerstag`                | Weekday (German)          |
| `:month-en`     | `June`                      | Month name (English)      |
| `:month-de`     | `Juni`                      | Month name (German)       |
| `:fulldate-de`  | `Donnerstag, 27. Juni 2025` | Full date (German)        |
| `:fulldate-en`  | `Thursday, June 27, 2025`   | Full date (English)       |

### Usage

Simply type any of the trigger words (e.g., `dont`) and espanso will automatically replace it with the correct contraction (`don't`). The expansion happens in real-time across all applications.

### Troubleshooting

- **Check if espanso is running**: `espanso status`
- **Restart espanso**: `espanso restart`
- **View logs**: `espanso log`
- **Test configuration**: Try typing `dont` in any text field

## Code Assistant

This repo provides shell aliases for interacting with a Code Assistant Docker container. The Docker setup itself lives in an external repository.

### Configuration

The `CA_COMPOSE_PATH` variable (defined in `zsh/10_code_assistant.sh`) points to the external Docker Compose file:

```
CA_COMPOSE_PATH="$HOME/Repositories/code_assistant/docker-compose.yml"
```

Override this in your `.zshrc` if your compose file is in a different location.

### Aliases

| Alias | Command                                                   | Description             |
| ----- | --------------------------------------------------------- | ----------------------- |
| `oc`  | `_code_assistant_run opencode`                            | Run OpenCode session    |
| `ocs` | `_code_assistant_run /bin/zsh`                            | Open shell in container |
| `occ` | Stop all running Code Assistant containers                | Stop containers         |

## Web Development Aliases

The `zsh/11_web.sh` file provides pnpm shortcuts:

| Alias  | Command                       | Description              |
| ------ | ----------------------------- | ------------------------ |
| `pna`  | `pnpm add`                    | Add dependency           |
| `pnad` | `pnpm add -D`                 | Add dev dependency       |
| `pni`  | `pnpm install`                | Install dependencies     |
| `pnr`  | `pnpm run`                    | Run a script             |
| `pnd`  | `pnpm run dev --open`         | Start dev server (opens) |
| `pnb`  | `pnpm build`                  | Build the project        |
| `pnp`  | `pnpm preview`                | Preview build            |
| `pnbp` | `pnpm build && pnpm preview`  | Build and preview        |
| `pnl`  | `pnpm lint`                   | Run linter               |
| `pnf`  | `pnpm format`                 | Run formatter            |

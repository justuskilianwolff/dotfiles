# dotfiles

This repository just serves to sync my shell and other configs between my work and private machines.
More advanced approaches like stow or chezmoi don’t seem to be necessary yet, but never say never...

## zsh

To source all files in the `zsh` directory you can run following command in your `.zshrc` file:

```shell
DOTFILES_PATH="/Users/justuswolff/Repositories/dotfiles"

# source all files in the zsh folder of teh dotfiles repo
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

## Homebrew

Within the `brew` directory run

```shell
brew bundle [--cleanup]
```

to install the Brewfile (and optionally) removing your other installations. To add your local installations run

```shell
brew bundle dump --cask --formula --tap --force
```

to list all casks and formulaes and forcing the overrride. This just handles installation. To upgrade already installed casks run

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
| F   | Finder                |
| R   | Reminders             |
| S   | Slack                 |
| T   | Microsoft Teams       |
| V   | Visual Studio Code    |
| W   | WhatsApp              |
| X   | Microsoft Excel       |
| N   | Notion                |
| M   | Spotify (Music)       |
| D   | Microsoft To Do       |
| #   | iTerm (# shell start) |
| G   | System Settings       |
| H   | Microsoft To Do       |

#### Arrow Keys

These shortcuts use **Capslock** + [key] to emulate arrow key navigation:

| Key          | Arrow Key           |
| ------------ | ------------------- |
| J            | Left                |
| K            | Down                |
| L            | Up                  |
| Ö            | Right               |
| Left Cmd + J | Left + Left Option  |
| Left Cmd + K | Down + Left Option  |
| Left Cmd + L | Up + Left Option    |
| Left Cmd + Ö | Right + Left Option |

#### Brackets

These shortcuts use **Capslock** + [key] to type brackets quickly:

| Key Combination | Bracket |
| --------------- | ------- |
| U               | (       |
| I               | [       |
| O               | {       |
| Left Cmd + U    | )       |
| Left Cmd + I    | ]       |
| Left Cmd + O    | }       |

## Miscellaneous Key Bindings

These shortcuts use **Capslock** + [key] to perform various actions:

| Key Combination                     | Result                |
| ----------------------------------- | --------------------- |
| P (Pipe)                            | &#124;                |
| Ü                                   | \                     |
| Ä (Äquals)                          | =                     |
| Shift + Cmd + Ctrl + Option + Enter | Ctrl + Cmd + Q (Lock) |

## Hammerspoon

Since symlinking currently does not work as mentioned in this [issue](https://github.com/Hammerspoon/hammerspoon/issues/3706), just copy the `hammerspoon` folder to `~/.hammerspoon/` and run `hs.reload()` in the Hammerspoon console.

### Auto-Mute Speakers

The `init.lua` script automatically mutes the MacBook's built-in speakers when the audio output is switched to them. This prevents unexpected sound output from the internal speakers.

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

### Usage

Simply type any of the trigger words (e.g., `dont`) and espanso will automatically replace it with the correct contraction (`don't`). The expansion happens in real-time across all applications.

### Troubleshooting

- **Check if espanso is running**: `espanso status`
- **Restart espanso**: `espanso restart`
- **View logs**: `espanso log`
- **Test configuration**: Try typing `dont` in any text field

## BetterTouchTool

The `btt/Default.bttpreset` file contains custom triggers for BetterTouchTool.

### Global Triggers

These triggers are active globally across all applications.

| Trigger              | Action                                     | Notes                                  |
| -------------------- | ------------------------------------------ | -------------------------------------- |
| `Shift + Rightclick` | Sends the `Enter` key                      | Useful for quickly confirming actions. |
| `Cmd + Rightclick`   | Connects to "AirPods Pro" Bluetooth device | Quickly connect to your AirPods.       |

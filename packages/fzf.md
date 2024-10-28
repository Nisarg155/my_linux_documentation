
---

# FZF Documentation

## Installation

### For Debian-based Systems
To install `fzf` using `apt`, use the following command:

```bash
sudo apt install fzf
```

## Key Bindings Setup in zsh

1. **Enable Key Bindings**  
   Add the following line to `~/.zshrc` to enable key bindings:

   ```bash
   source /usr/share/doc/fzf/examples/key-bindings.zsh
   ```

2. **Enable Auto-Completion**  
   Add this line to `~/.zshrc` to enable auto-completion in zsh:

   ```bash
   source /usr/share/doc/fzf/examples/completion.zsh
   ```

## Search Syntax

| Token     | Match Type                              | Description                                      |
|-----------|-----------------------------------------|--------------------------------------------------|
| `sbtrkt`  | Fuzzy-match                             | Matches items that contain `sbtrkt`              |
| `'wild`   | Exact-match (quoted)                    | Matches items that include `wild` exactly        |
| `'wild'`  | Exact-boundary-match (quoted both ends) | Matches items that include `wild` at boundaries  |
| `^music`  | Prefix-exact-match                      | Matches items that start with `music`            |
| `.mp3$`   | Suffix-exact-match                      | Matches items that end with `.mp3`               |
| `!fire`   | Inverse-exact-match                     | Matches items that do not include `fire`         |
| `!^music` | Inverse-prefix-exact-match              | Matches items that do not start with `music`     |
| `!.mp3$`  | Inverse-suffix-exact-match              | Matches items that do not end with `.mp3`        |

## Key Bindings and Usage

1. **Opening fzf Window**  
   Type `**` in the terminal, then use the key binding `Ctrl-T` to open the `fzf` window.  
   Use the `Enter` key to select an item from the list.

--- 

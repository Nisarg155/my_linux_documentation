# FZF Documentation 

## Installation 

1. **For apt use the following command** 
    
   ```  sudo apt install ```

## Key Bindings set up in zsh

1. **Add this following to the ~/.zshrc to enable keybindings**
   > **source   /usr/share/doc/fzf/examples/key-bindings.zsh**
2. **Add the following line to ~/.zshrc enable  auto-completion of zsh**
   >**source /usr/share/doc/fzf/examples/completion.zsh**

## Search Syntax

 | Token     | Match type                              | Description                                  |
 |-----------|-----------------------------------------|----------------------------------------------|
 | `sbtrkt`  | fuzzy-match                             | Items that match `sbtrkt`                    |
 | `'wild`   | exact-match (quoted)                    | Items that include `wild`                    |
 | `'wild'`  | exact-boundary-match (quoted both ends) | Items that include `wild` at word boundaries |
 | `^music`  | prefix-exact-match                      | Items that start with `music`                |
 | `.mp3$`   | suffix-exact-match                      | Items that end with `.mp3`                   |
 | `!fire`   | inverse-exact-match                     | Items that do not include `fire`             |
 | `!^music` | inverse-prefix-exact-match              | Items that do not start with `music`         |
 | `!.mp3$`  | inverse-suffix-exact-match              | Items that do not end with `.mp3`            |

## Key Bindings and Usages

>
> **use write \*\* in terminal and use key binding "``` Ctrl-T```"  to open fzf window and select any using enter**


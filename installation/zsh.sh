#!/bin/bash

# Define color codes
GREEN='\e[32m'
YELLOW='\e[33m'
RED='\e[31m'
BLUE='\e[34m'
RESET='\e[0m'

# Trap SIGINT (Ctrl-C) to handle script interruption
trap "echo -e '\n${RED}Script interrupted by user. Exiting...${RESET}'; exit 1" SIGINT

# Updating package list once
echo -e "${BLUE}Updating package index...${RESET}"
sudo apt update

# Creating alias file
echo -e "${BLUE}Checking if ~/.zsh_aliases exists...${RESET}"
if [ ! -f ~/.zsh_aliases ]; then
    touch ~/.zsh_aliases
    echo -e "${GREEN}Created ~/.zsh_aliases file.${RESET}"
else
    echo -e "${YELLOW}~/.zsh_aliases already exists.${RESET}"
fi

# Script to install fzf and configure key bindings in zsh
echo -e "${BLUE}Starting the installation and setup for fzf...${RESET}"

# Step 1: Install fzf using apt (Debian-based systems)
echo -e "${BLUE}Installing fzf using apt...${RESET}"
sudo apt install -y fzf

# Check if fzf was installed successfully
if [ $? -eq 0 ]; then
    echo -e "${GREEN}fzf installed successfully.${RESET}"

    # Step 2: Set up key bindings in zsh
    echo -e "${BLUE}Configuring key bindings for fzf in zsh...${RESET}"
    if ! grep -q "source /usr/share/doc/fzf/examples/key-bindings.zsh" ~/.zshrc; then
        echo "# Enables fzf key-bindings" >> ~/.zshrc
        echo "source /usr/share/doc/fzf/examples/key-bindings.zsh" >> ~/.zshrc
        echo -e "${GREEN}Key bindings added to ~/.zshrc${RESET}"
    else
        echo -e "${YELLOW}Key bindings already configured in ~/.zshrc${RESET}"
    fi

    # Step 3: Enable auto-completion in zsh
    echo -e "${BLUE}Configuring auto-completion for fzf in zsh...${RESET}"
    if ! grep -q "source /usr/share/doc/fzf/examples/completion.zsh" ~/.zshrc; then
        echo "# Enables fzf auto-completion" >> ~/.zshrc
        echo "source /usr/share/doc/fzf/examples/completion.zsh" >> ~/.zshrc
        echo -e "${GREEN}Auto-completion added to ~/.zshrc${RESET}"
    else
        echo -e "${YELLOW}Auto-completion already configured in ~/.zshrc${RESET}"
    fi

    echo -e "${GREEN}fzf installation and configuration completed successfully!${RESET}"

else
    echo -e "${RED}Failed to install fzf. Please check for errors and try again.${RESET}"
    exit 1
fi


# Step 1: Install zoxide using apt (Debian-based systems)
echo -e "${BLUE}Starting the installation and setup for zoxide...${RESET}"
echo -e "${BLUE}Installing zoxide using apt...${RESET}"
sudo apt install -y zoxide

if [ $? -eq 0 ]; then
    echo -e "${GREEN}zoxide installed successfully.${RESET}"

    # Step 2: Add eval "$(zoxide init zsh)" to ~/.zshrc
    echo -e "${BLUE}Configuring zoxide initialization in zsh...${RESET}"
    if ! grep -q 'eval "$(zoxide init zsh)"' ~/.zshrc; then
        echo "# Initializes zoxide" >> ~/.zshrc
        echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
        echo -e "${GREEN}zoxide initialization added to ~/.zshrc${RESET}"
    else
        echo -e "${YELLOW}zoxide initialization already configured in ~/.zshrc${RESET}"
    fi

    # Step 3: Add alias for cd in ~/.zsh_aliases
    echo -e "${BLUE}Configuring alias for 'cd' to use zoxide in ~/.zsh_aliases...${RESET}"
    if ! grep -q 'alias cd="z"' ~/.zsh_aliases; then
        echo "# Use zoxide with cd command" >> ~/.zsh_aliases
        echo 'alias cd="z"' >> ~/.zsh_aliases
        echo -e "${GREEN}Alias for cd added to ~/.zsh_aliases${RESET}"
    else
        echo -e "${YELLOW}Alias for cd already configured in ~/.zsh_aliases${RESET}"
    fi

    echo -e "${GREEN}zoxide installation and configuration completed successfully!${RESET}"

else
    echo -e "${RED}Failed to install zoxide. Please check for errors and try again.${RESET}"
    exit 1
fi


# Inform the user to reload the shell or source ~/.zshrc
echo -e "\n${BLUE}--------   Configuration complete. Please run 'source ~/.zshrc' or restart your terminal to apply changes.   --------${RESET}"


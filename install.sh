#!/usr/bin/env bash

# Exit on error
set -e

# Terminal colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Print styled messages
print_step() {
    printf "${CYAN}==>${NC} ${BOLD}%s${NC}\n" "$1"
}

print_success() {
    printf "${GREEN}==>${NC} ${BOLD}%s${NC}\n" "$1"
}

print_warning() {
    printf "${YELLOW}==>${NC} ${BOLD}%s${NC}\n" "$1"
}

print_error() {
    printf "${RED}==>${NC} ${BOLD}%s${NC}\n" "$1" >&2
}

# Check if running with sudo
check_sudo() {
    if [ "$EUID" -eq 0 ]; then
        print_warning "Running as root/sudo - files will be owned by root"
        read -p "Continue? (y/n) " -r
        case $REPLY in
            [Yy]* ) return 0 ;;
            * ) print_error "Installation cancelled"; exit 1 ;;
        esac
    fi
}

# Check requirements
check_requirements() {
    if ! command -v nano >/dev/null 2>&1; then
        print_error "nano is not installed. Please install nano first."
        exit 1
    fi

    # Check nano version
    NANO_VERSION=$(nano --version | head -n1 | grep -oE '[0-9]+\.[0-9]+')
    if [ "$(printf '%s\n' "2.0" "$NANO_VERSION" | sort -V | head -n1)" = "2.0" ]; then
        print_warning "Detected nano version $NANO_VERSION"
    else
        print_error "nano version 2.0 or higher is required"
        exit 1
    fi
}

# Backup existing configuration
backup_config() {
    if [ -f ~/.nanorc ]; then
        BACKUP_FILE=~/.nanorc.backup.$(date +%Y%m%d_%H%M%S)
        print_step "Backing up existing .nanorc to $BACKUP_FILE"
        cp ~/.nanorc "$BACKUP_FILE" || {
            print_error "Failed to create backup"
            exit 1
        }
    fi
}

# Create necessary directories
create_directories() {
    print_step "Creating nano syntax directory..."
    mkdir -p ~/.nano || {
        print_error "Failed to create ~/.nano directory"
        exit 1
    }
}

# Install syntax file
install_syntax_file() {
    print_step "Installing Pact syntax highlighting..."
    cp "$(dirname "$0")/pact.nanorc" ~/.nano/ || {
        print_error "Failed to copy pact.nanorc"
        exit 1
    }
}

# Configure .nanorc
configure_nanorc() {
    if [ -f ~/.nanorc ]; then
        print_step "Checking existing .nanorc configuration..."
        if ! grep -q "include \".*pact.nanorc\"" ~/.nanorc; then
            print_step "Adding Pact syntax highlighting to .nanorc..."
            echo 'include "~/.nano/pact.nanorc"' >> ~/.nanorc || {
                print_error "Failed to update .nanorc"
                exit 1
            }
            print_success "Successfully added Pact syntax highlighting"
        else
            print_warning "Pact syntax highlighting already configured in .nanorc"
        fi
    else
        print_step "Creating new .nanorc file..."
        echo 'include "~/.nano/pact.nanorc"' > ~/.nanorc || {
            print_error "Failed to create .nanorc"
            exit 1
        }
        print_success "Created new .nanorc with Pact syntax highlighting"
    fi
}

# Configure additional settings
configure_additional_settings() {
    print_step "Would you like to enable additional nano settings? (y/n)"
    read -r response
    case $response in
        [Yy]*)
            {
                echo "# Editor settings"
                echo "set linenumbers"
                echo "set tabsize 2"
                echo "set autoindent"
                echo "set tabstospaces"
                echo "set unix"
                echo "set softwrap"
            } >> ~/.nanorc
            print_success "Additional settings enabled"
            ;;
        *)
            print_warning "Skipping additional settings"
            ;;
    esac
}

# Verify installation
verify_installation() {
    print_step "Testing installation..."
    if [ -f ~/.nano/pact.nanorc ] && [ -f ~/.nanorc ]; then
        print_success "Installation completed successfully!"
        echo
        printf "${GREEN}You can now edit .pact files with syntax highlighting using nano${NC}\n"
        printf "${CYAN}Try it out:${NC} nano example.pact\n"
        
        # Print current configuration
        echo
        print_step "Current nano configuration:"
        echo "Syntax file: ~/.nano/pact.nanorc"
        echo "Config file: ~/.nanorc"
        echo
    else
        print_error "Installation verification failed"
        exit 1
    fi
}

# Main installation process
main() {
    # Print header
    printf "${CYAN}================================${NC}\n"
    printf "${CYAN}  Pact Syntax Highlighting Setup ${NC}\n"
    printf "${CYAN}================================${NC}\n"
    echo

    # Run installation steps
    check_sudo
    check_requirements
    backup_config
    create_directories
    install_syntax_file
    configure_nanorc
    configure_additional_settings
    verify_installation
}

# Run main function
main "$@"

exit 0

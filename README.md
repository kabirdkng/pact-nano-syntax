# 🎨 Pact Syntax Highlighting for Nano

<div align="center">

[![License](https://img.shields.io/badge/license-BSD%203--Clause-blue.svg)](LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/kabirdkng/pact-nano-syntax.svg)](https://github.com/kabirdkng/pact-nano-syntax/issues)
[![GitHub Stars](https://img.shields.io/github/stars/kabirdkng/pact-nano-syntax.svg)](https://github.com/kabirdkng/pact-nano-syntax/stargazers)

A vibrant, eye-pleasing syntax highlighting configuration for the [Pact smart contract language](https://pact-language.readthedocs.io/) in the Nano text editor.

[Installation](#installation) • [Features](#features) • [Usage](#usage) • [Configuration](#configuration) • [Examples](#examples) • [Contributing](#contributing)

</div>

## ✨ Features

### Comprehensive Syntax Support
- 🔵 **Smart Contract Keywords** (`module`, `interface`, `defun`, etc.)
- 🟣 **Type System** (annotations, built-in types)
- 🟡 **Control Flow** (`let`, `if`, `when`, etc.)
- 🟢 **Database Operations** (`insert`, `read`, `update`, etc.)
- 🔴 **Security Features** (`enforce`, `require`, `keyset`)
- 🟤 **Documentation** (`@doc`, property specs)

### Editor Experience
- 📝 Automatic indentation
- 🎯 Line numbering
- 🎨 Vibrant color scheme
- 🔍 Clear visual hierarchy

### Color Scheme Preview
```pact
(module token GOV
    @doc "Simple fungible token contract"
    
    (defcap GOVERNANCE ()
        "Governance capability"
        (enforce-guard (keyset-ref-guard 'admin-keyset)))

    (defschema token-schema
        @doc "Token schema"
        balance:decimal
        guard:guard)

    (deftable tokens:{token-schema})
)
```

## 🚀 Installation

### Prerequisites
- Nano text editor (v2.0.0 or higher)
- Git (optional, for cloning the repository)

### Quick Install
```bash
curl -sL https://raw.githubusercontent.com/kabirdkng/pact-nano-syntax/master/install.sh | bash
```

### Manual Installation
1. Clone the repository (optional):
```bash
git clone https://github.com/kabirdkng/pact-nano-syntax.git
cd pact-nano-syntax
./install.sh
```

2. Or install files manually:
```bash
# Create nano syntax directory
mkdir -p ~/.nano

# Copy syntax file
curl -sL https://raw.githubusercontent.com/kabirdkng/pact-nano-syntax/master/pact.nanorc -o ~/.nano/pact.nanorc

# Add to nanorc
echo 'include "~/.nano/pact.nanorc"' >> ~/.nanorc
```

## 🎮 Usage

### Basic Usage
The syntax highlighting activates automatically for `.pact` and `.repl` files:

```bash
# Create new Pact file
nano mycontract.pact

# Edit example
nano examples/basic.repl
```

### Keyboard Shortcuts
| Shortcut | Description |
|----------|-------------|
| `Ctrl+O` | Save file |
| `Ctrl+X` | Exit |
| `Ctrl+K` | Cut line |
| `Ctrl+U` | Paste line |
| `Ctrl+W` | Find text |
| `Ctrl+_` | Go to line |

## ⚙️ Configuration

### Recommended Settings
Add these to your `~/.nanorc` for the best experience:

```nanorc
# Display
set linenumbers          # Show line numbers
set constantshow         # Show cursor position
set numbercolor cyan     # Color for line numbers

# Editing
set tabsize 2           # 2-space indentation
set tabstospaces        # Convert tabs to spaces
set autoindent          # Automatic indentation
set softwrap            # Wrap long lines
set breaklonglines      # Break long lines at screen edge

# Interface
set mouse              # Enable mouse support
set cutfromcursor      # Cut from cursor to end of line

# File handling
set backup             # Create backup files
set backupdir "~/.nano/backups"  # Directory for backup files

# Key bindings
set multibuffer        # Enable multiple file buffers
set showcursor         # Show cursor position
```

Optional advanced settings (check if your nano version supports these):
```nanorc
# If supported by your nano version:
set guidestripe 80     # Show vertical guide at column 80
set minibar            # Show minibar
set indicator          # Show scroll position indicator
```

To check your nano version and supported options:
```bash
nano --version
nano --help
```

Different nano versions support different options. If you get an "Unknown option" error, simply remove that line from your `.nanorc` file. The syntax highlighting will work regardless of these additional settings.


### Color Customization
Colors can be customized by editing `~/.nano/pact.nanorc`. Available colors:
- `white`, `black`, `red`, `blue`, `green`, `yellow`, `magenta`, `cyan`
- Add `bright` prefix for lighter variants

## 📚 Examples

### Included Examples
The `examples/` directory contains:

#### `basic.repl`
- Basic module structure
- Function definitions
- Table operations
- Capability definitions

#### `init.repl`
- Namespace initialization
- Keyset configuration
- Guard definitions

### Sample Contract
```pact
(module payments GOV
    @doc "Payment processing contract"
    
    (defschema payment
        amount:decimal
        sender:string
        receiver:string)
        
    (deftable payments:{payment})
    
    (defun process-payment (amount sender receiver)
        (enforce (> amount 0.0) "Invalid amount")
        (insert payments (hash amount sender receiver)
            { "amount": amount
            , "sender": sender
            , "receiver": receiver }))
)
```

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Development Setup
1. Fork the repository
2. Create feature branch:
```bash
git checkout -b feature/amazing-feature
```

3. Make changes & test
4. Commit with clear message:
```bash
git commit -m 'Add: amazing feature'
```

5. Push & create PR:
```bash
git push origin feature/amazing-feature
```

### Testing
1. Install syntax highlighting
2. Verify with example files
3. Check all supported keywords
4. Test with different color schemes

## 📄 License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.

## 📦 Repository

- GitHub: [https://github.com/kabirdkng/pact-nano-syntax](https://github.com/kabirdkng/pact-nano-syntax)
- Issues: [https://github.com/kabirdkng/pact-nano-syntax/issues](https://github.com/kabirdkng/pact-nano-syntax/issues)
- Pull Requests: [https://github.com/kabirdkng/pact-nano-syntax/pulls](https://github.com/kabirdkng/pact-nano-syntax/pulls)

## 🔗 Useful Links

- [Pact Documentation](https://pact-language.readthedocs.io/)
- [Nano Editor Manual](https://www.nano-editor.org/docs.php)
- [Kadena Developer Portal](https://docs.kadena.io/)

---

<div align="center">
Made with ❤️ for the Pact community

[Report Bug](https://github.com/kabirdkng/pact-nano-syntax/issues) • [Request Feature](https://github.com/kabirdkng/pact-nano-syntax/issues)
</div>

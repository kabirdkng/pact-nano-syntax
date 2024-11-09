# Pact Syntax Highlighting for Nano

A vibrant, eye-pleasing syntax highlighting configuration for the [Pact smart contract language](https://pact-language.readthedocs.io/) in the Nano text editor.

## Features

- Modern and vibrant color scheme
- Complete Pact language syntax support
- Easy installation
- Example contracts included

## Installation

### Quick Install
```bash
curl -sL https://raw.githubusercontent.com/yourusername/pact-nano-syntax/main/install.sh | bash
```

### Manual Installation
```bash
git clone https://github.com/yourusername/pact-nano-syntax.git
cd pact-nano-syntax
./install.sh
```

## Usage

The syntax highlighting activates automatically for files with `.pact` and `.repl` extensions:

```bash
# Create a new Pact file
nano mycontract.pact

# Open an existing file
nano existing.pact
```

### Recommended Nano Settings

Add to your `~/.nanorc`:
```nanorc
set linenumbers
set tabsize 2
set autoindent
```

## Examples

Check the `examples/` directory for:
- `basic.pact`: Simple module

## Contributing

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">
Made with ❤️ for the Pact community
</div>
# 🎨 Pact Syntax Highlighting for Nano

<div align="center">

[![License](https://img.shields.io/badge/license-BSD%203--Clause-blue.svg)](LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/yourusername/pact-nano-syntax.svg)](https://github.com/yourusername/pact-nano-syntax/issues)
[![GitHub Stars](https://img.shields.io/github/stars/yourusername/pact-nano-syntax.svg)](https://github.com/yourusername/pact-nano-syntax/stargazers)

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
- Git (for cloning the repository)

### Quick Install
```bash
# Clone the repository
git clone https://github.com/yourusername/pact-nano-syntax.git

# Navigate to directory
cd pact-nano-syntax

# Run installer
./install.sh
```

### Manual Installation
1. Create nano syntax directory:
```bash
mkdir -p ~/.nano
```

2. Copy syntax file:
```bash
cp pact.nanorc ~/.nano/
```

3. Add to `~/.nanorc`:
```nanorc
include "~/.nano/pact.nanorc"
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
set linenumbers      # Show line numbers
set constantshow     # Show cursor position
set smooth           # Smooth scrolling

# Editing
set tabsize 2        # 2-space indentation
set tabstospaces     # Convert tabs to spaces
set autoindent       # Automatic indentation
set softwrap         # Wrap long lines

# Interface
set mouse           # Enable mouse support
set cutfromcursor   # Cut from cursor to end of line
```

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

## 🙏 Acknowledgments

- Pact Language Team
- Nano Editor Community
- All Contributors

## 🔗 Useful Links

- [Pact Documentation](https://pact-language.readthedocs.io/)
- [Nano Editor Manual](https://www.nano-editor.org/docs.php)
- [Kadena Developer Portal](https://docs.kadena.io/)

---

<div align="center">
Made with ❤️ for the Pact community

[Report Bug](https://github.com/yourusername/pact-nano-syntax/issues) • [Request Feature](https://github.com/yourusername/pact-nano-syntax/issues)
</div>

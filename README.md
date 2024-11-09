# 🎨 Pact Syntax Highlighting for Nano

<div align="center">

[![License](https://img.shields.io/badge/license-BSD%203--Clause-blue.svg)](LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/kabirdkng/pact-nano-syntax.svg)](https://github.com/kabirdkng/pact-nano-syntax/issues)

Vibrant syntax highlighting for [Pact smart contract language](https://pact-language.readthedocs.io/) in Nano editor.

[Installation](#installation) • [Usage](#usage) • [Configuration](#configuration)

</div>

## 🚀 Installation

```bash
curl -sL https://raw.githubusercontent.com/kabirdkng/pact-nano-syntax/master/install.sh | bash
```

## 🎮 Usage

```bash
nano example.pact    # Create/edit Pact file
nano example.repl    # Create/edit REPL file
```

### Color Scheme
```pact
; Comments in brightblue
(module token GOV      
    @doc "Docs in brightblue"    
    (defschema token:object      ; Types in magenta
        balance:decimal          
        guard:guard)

    (deftable tokens:{token-schema})    ; DB ops in green
    
    (defcap GOVERNANCE ()          ; Keywords in yellow     
        (enforce-guard              ; enforce in red
            (keyset-ref-guard 'admin)))  ; Symbols in brightmagenta
    
    (defun transfer (
        amount:decimal      
        receiver:string)
        (let              ; Control flow in brightgreen
            ((balance 5.0))   ; Numbers in cyan
            (enforce (> amount 0.0) "Invalid")
        )
    )
)
```

## ⚙️ Configuration

Add these settings to your `~/.nanorc`:

```nanorc
# Display
set linenumbers          # Show line numbers
set constantshow         # Show cursor position
set numbercolor cyan     # Color for line numbers
set breaklonglines      # Break long lines at screen edge
set guidestripe 80      # Show vertical guide at column 80
set minibar             # Show minibar
set indicator           # Show scroll position indicator

# Editing
set tabsize 2           # 2-space indentation
set tabstospaces        # Convert tabs to spaces
set autoindent          # Automatic indentation
set softwrap            # Wrap long lines
set cutfromcursor       # Cut from cursor to end of line
set multibuffer         # Enable multiple file buffers
set showcursor          # Show cursor position

# File handling
set backup              # Create backup files
set backupdir "~/.nano/backups"  # Directory for backup files

# Interface
set mouse               # Enable mouse support
```

Note: If any option gives "Unknown option" error, simply remove that line. Different nano versions support different options.

## 📦 Links

- [Report Issues](https://github.com/kabirdkng/pact-nano-syntax/issues)
- [Pact Documentation](https://pact-language.readthedocs.io/)
- [Nano Editor Manual](https://www.nano-editor.org/docs.php)

---

<div align="center">
Made with ❤️ for the Pact community
</div>

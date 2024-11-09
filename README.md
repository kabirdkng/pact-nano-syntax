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
(load "init.repl")

(env-data {
    "gov": {          ; Comments in brightblue
        "keys": ["test"],
        "pred": "keys-all"
    }
})

(namespace 'free)     ; Keywords in yellow
(define-keyset "free.gov" (read-keyset "gov"))

(module mod4 GOV      ; Module in brightmagenta
    (defcap GOV ()    ; Capabilities in red
        (enforce-guard (keyset-ref-guard "free.gov"))
    )

    (defschema number-values    ; Types in magenta
        @doc "stores number values"
        name:string
        value:decimal
    )

    (deftable numbers:{number-values})    ; DB ops in green

    (defun add (x y)            ; Functions in yellow
        (+ x y)                 ; Operators in white
    )

    (defun add-write (x:decimal y:decimal name:string)
        (let (                  ; Control flow in brightgreen
            (value:decimal (add x y))
        )
        (insert numbers name    ; Database ops in green
            {
                'name: name,    ; Symbols in brightmagenta
                'value:value 
            }
        )
    ))
)
```

## ⚙️ Configuration

Our installer will ask if you want to add these recommended settings to your `~/.nanorc`:

```nanorc
set linenumbers      # Show line numbers
set tabsize 2        # 2-space indentation 
set autoindent       # Automatic indentation
```

### Additional Optional Settings
For more features, you can add:
```nanorc
# Display
set constantshow     # Show cursor position
set numbercolor cyan # Color for line numbers
set guidestripe 80  # Show vertical guide
set minibar         # Show minibar
set indicator       # Show scroll position

# Editing
set tabstospaces    # Convert tabs to spaces
set softwrap        # Wrap long lines
set multibuffer     # Enable multiple files
set showcursor      # Show cursor position
set mouse          # Enable mouse support
```

Note: If any option gives "Unknown option" error, simply remove that line as it might not be supported in your nano version.

## 🔗 Links

- [Report Issues](https://github.com/kabirdkng/pact-nano-syntax/issues)
- [Pact Documentation](https://pact-language.readthedocs.io/)
- [Nano Editor Manual](https://www.nano-editor.org/docs.php)

---

<div align="center">
Made with ❤️ for the Pact community
</div>

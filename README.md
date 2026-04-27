# ACT Syntax

Vim syntax highlighting for the [ACT hardware description language](http://avlsi.csl.yale.edu/act/doku.php).

## Features

- Keyword highlighting for ACT constructs (`defproc`, `defchan`, `namespace`, etc.)
- Type highlighting (`chan`, `pint`, `pbool`, `bool`, `int`)
- Boolean constants (`true`, `false`)
- Import/export/open statements
- Comment support (`//` and `/* */`)
- String and character literals
- Number and float literals
- Preprocessor directives (`#include`, `#define`, etc.)

## Installation

### As a Vim package (recommended)

```bash
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/lfzuniga/act-syntax ~/.vim/pack/plugins/start/
```

## Credits

Based on an initial implementation by Carlos Tadeo Ortega Moreno.

# Warwick: Vim

My [castle][] for VIM. The objective is to have an environment good for
servers and my personal day to day use.

[castle]: https://github.com/technicalpickles/homesick

* Focus on web development
* No *git submodules*
* Minimal dependencies, plugins and startup time

Quick install:

    $ bash <(curl -L https://git.io/fNMTH)

## Overall config

* Light theme through `papercolor`, there is `twilight` for dark backgrounds
* The overall behavior tries to be as compatible as possible with
  Sublime/TextMate-lie editors as possible - always respecting VIM first
* If `ag` (silver searcher) is installed, use it for `vimgrep` and `ctrlp`

## Notable plugins

I use [tpope/pathogen][1] to load a bunch of plugins that require multiple files
to work:

* `CTRL+P` provides a recursive fuzzy search on the project directory
* `gf-markdown` is a GitHub flavoured markdown syntax (which takes precedence
  over regular `.md` files)
* `NerdTree` is a better file explorer with `CTRL-N` and `NerdTreeTabs` keeps
  the buffer for NerdTree consistent across tabs
* `tabline` makes tab numbers to start on 1

## Mappings

I like to use some specific mappings on determined file extensions, ans also use
the file type configuration to be sane given an environment:

* Shell files, Go, XML and JavaScript default to tabs
* PHP and Markdown default to spaces
* Git commit messages wrap lines at 72 columns and checks spelling on English

My **leader** is mapped to `\`.

* `<leader>s`: Searches for the word under cursor and puts it on a [quickfix][q]

[q]: http://vimdoc.sourceforge.net/htmldoc/quickfix.html

### Mappings: PHP

* `<leader>e`: Displays all methods on a given class on a [quickfix][q]
* `<leader>l`: Lints current file
* `<leader>d`: Executes PHPUnit for current test file (uses Composer PHPUnit)
* `<leader>c`: Checkstyle current file with PSR2 (uses Composer)

### Mappings: Git

* `<leader>d`: On the line containing a changed file, displays the diff
* `<leader>c`: Over a hash, displays the content of it with `git show` (useful
  during rebases)

### Mappings: JavaScript

* `<leader>l`: Lints current file
* `<leader>d`: Executes `npm test` for current test file

[1]: https://github.com/tpope/vim-pathogen

# Warwick: Vim

My [castle][] for VIM. The objective is to have an environment good for
servers and my personal day to day use.

[castle]: https://github.com/technicalpickles/homesick

* Focus on web development
* No *git submodules*
* Minimal dependencies and plugins
* Fast startup time (~ 2 min on the 1st bootstrap, ~70ms startuptime after)
* Easy and customizible bootstrap, make yourself at home with 1 command

Quick install, with [homeshick][] and [my dotfiles][warwick]:

    $ bash <(curl -L https://git.io/fNMTH)

You can [customize][] my bootstrap script to include your own dotfiles, although
you will be able to edit the [castles][castle] which will be cloned during the installation.

[customize]: https://gist.github.com/augustohp/0b0f96249e399d4ec731830280fbe776
[warwick]: https://github.com/augustohp/warwick
[homeshick]: https://github.com/andsens/homeshick

<a href="https://www.github.com/nightsense/snow">
<img alt="snow theme" src="https://github.com/nightsense/snow/raw/master/images/screenshot-light.png" width='420' />
</a>

## Notable plugins

I use [vim-plug][1] to load plugins:

* [CTRL+P][2] for fuzzy search on the project directory
* [NerdTree][3] as file browser as [a true panel][4]
* [Syntastic][5] for linting

[1]: https://github.com/junegunn/vim-plug
[2]: https://github.com/kien/ctrlp.vim
[3]: https://github.com/scrooloose/nerdtree
[4]: https://github.com/jistr/vim-nerdtree-tabs
[5]: https://github.com/vim-syntastic/syntastic

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


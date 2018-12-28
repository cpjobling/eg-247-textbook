The following are some common issues and questions that have arisen when
building your textbook with Jekyll.

## How to update your jupyter book

Occasionally, you may want to update your jupyter book with the latest
javascript, CSS, and templates from the main repository. This gets you new
features, bugfixes, and style improvements!

Because jupyter book is itself a repository, the easiest way to upgrade it
is to use git to get the latest version of some specific files.

Make sure that you've added the primary jupyter book repository as a "remote"
to your local copy of the repository. To add it as a remote called "template"
you could run the following command:

       git remote add template https://github.com/choldgraf/jupyter-book

You won't have to update all of your repository files (and in some cases, you
don't want to update certain files). The next sections provide guidance on
how to do this.

These sections assume that the `jupyter-book` repository is added as a "remote"
repository called `template` to your local copy.

### Checkout the latest versions of core jupyter-book files

You can grab the latest version of these files with:

```
git checkout template/master <path-to-file>
```

* `scripts/` - these are scripts for building and cleaning the book. You should just pull in the latest contents
  of this folder (unless you know what you're doing and have modified these scripts yourself).
* `Makefile` - the Makefile is tuned to whatever is inside `scripts/`. You should update it to the latest version
  as well.
* `assets` - these are assets used by jupyter-book. You should update to grab the newest ones, unless you have
  modified or added your own assets.
* `_sass` - the SASS defines the styling of the site. You should also just grab the latest version unless you know
  what you're doing.
* `_includes` and `_layouts`. These are template files, and should be auto-updated.

### Files that you might want to check

You can check the `diff` with the latest `jupyter-book` file with:

```
git diff master...template/master
```

* `_config.yml` - occasionally, there are new fields added to `jupyter-book`'s configuration file. You should
  check that the newer version of `jupyter-book` hasn't added or removed something.

### Files that you shouldn't need to change to upgrade

These are files you shouldn't need to update unless there is a major change to `jupyter-book`.

* `contents/` - these are files unique to your book, so you shouldn't need to change them.
* `_data/toc.yml` - the Table of Contents structure will not change unless there is a major version change in `jupyter-book`.
* `README.md` - is unique for your site.
* Any other folders/files that are unique to your book.

## Why isn't my math showing up properly?

This site uses MathJax to render all math, with `$` denoting inline math,
and `$$` denoting multi-line math blocks. Make sure that all of your math
is wrapped in these characters.

Another tip is to make sure that your math isn't being escaped improperly.
Jekyll strips escape characters, so you should make sure to add **two**
escape characters when needed. This is done automatically for many escape
characters in `generate_book.py`, and if you notice something that should
be included in this script, please open an issue
[at the textbook template issues page](https://github.com/choldgraf/jupyter-book/issues)

## What if I have an issue or question?

If you've got questions, concerns, or suggestions, please open an issue at
[at the jupyter book issues page](https://github.com/choldgraf/jupyter-book/issues)

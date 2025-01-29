# EG-247 Digital Signal Processing

A collection of resources created and distributed by
Dr Chris Jobling, College of Engineering, Swansea University.

This is a GitHub hosted source code repository. It contains the Jupyter notebooks and Markdown source code for the notes, slides and web pages, Matlab scripts and Simulink models used in the module. If you just want to view the slides, or the printable version of the notes you should visit the GitHub hosted Web Site [EG-247 Digital Signal Processing](http://cpjobling.github.io/eg-247-textbook) instead. Read-only links to the notes and slides are provided on the Blackboard site for EG-247.


## Using this Repository

As I am developing the notes, slides and code examples in parallel with delivery, this repository will not be complete until the end. You should therefore *fork* this repository and *clone* it rather than downloding the zip file. You also need to set up a remote *upstream* link so that you can regularly *fetch* my changes and additions and *merge* them with your local copy.

After logging into your GitHub account and *forking* and *cloning* this repo use the following command (from the GitHub command-line tools) to set up the remote *upstream* repository:

    git add remote upstream https://github.com/cpjobling/eg-247-textbook

When you want to update to my latest changes:

    git fetch upstream
    get merge upstream/master

For more on this topic see the GitHub Help Page [Fork a Repo](https://help.github.com/articles/fork-a-repo).

## Accessing the Course Documents

I am using [GitHub pages](https://pages.github.com/) to maintain the course slides and notes. To access the online version please visit <https://cpjobling.github.io/eg-247-textbook>.

The notes are being maintained using [jupyter notebooks](http://jupytor.org).
To directly access or modify the notes, checkout the `master` branch of this repo. The notes are organized in folders, one per week. The source code for the notes slides and web pages is contained in the [Markdown](http://daringfireball.net/projects/markdown/syntax) files which end in `.md`.

To rebuild the notes, slides and web pages from source you will need to install the
uv python package manager [uv](https://docs.astral.sh/uv/).

Simply run

```bash
uv sync
source .venv/bin/activate
```

YOu can use jupyter lab, or jupyter notebook to edit the source files.

You will need to use or switch to *nbclassic* to run the 
slide show version of the notes.

We are using [jupytext](https://jupytext.readthedocs.io/en/latest/index.html) so the executables are markdown (.md) files.

Open setup.md to test the set up.

```bash
jupyter nbclassic setup/setup.md
```

If the MATLAB jkerbel is working

```bash
jupyter nbclassic setup/matlab_kernel.md
```

can be used to test it.

To build the documentation run

```bash
make site
```


<!--
    Use marp-next to generate pdf
    paginate: true
    footer:
-->

# 2019-1 SCSC Linux Seminar

<small>Apr 29<sup>th</sup> 2019<br/>Donghyeon Lee</small>


<!---Table of Contents (BASELINE)

1. What is Linux?
1. Popular Distributions
1. Install Schema
1. Basic Linux Commands
1. Preparation
  1. Virtual Machine vs. Native
  1. Creating Installation Media
  1. Booting the Live Environment
  1. Preparing the Live Environment
    1. Network Setup
1. Partitioning
  1. Filesystem Hierarchy Standard
1. Base System Installation
1. System Setup
  1. fstab
  1. Time and Locale
  1. Network
    1. Wireless Network
1. Bootloader Installation
  1. What is a Bootloader?
  1. BIOS vs. EFI, MBR vs. GPT 
  1. Linux Boot Process
1. Finalizing
1. User Mangement
1. Linux Kernel and Device Drivers
  1. Loadable Kernel Modules
  1. Building a Custom Linux Kernel
1. Shell
1. Service Management
1. Package Management
  1. The Idea of Package Installation
  1. Installing From Source
  1. Package Manager
    1. `pacman`
1. Graphical User Interface
  1. Display Server
    1. Xorg
    1. Wayland
  1. Desktop Environment
    1. GNOME
    1. KDE 
    1. LXDE
    1. Xfce
  1. Window Manager
  1. Display Manager
-->

---

# Introduction to Linux

---

## What is Linux?

---

### What is Linux

Linux is a family of free OS based on the Linux kernel.

<small>Kernel: Core part of the OS</small>

The first version of the Linux as created by Linus Torvalds in 1991, as a MINIX-like free OS.

Freely modifiable(under GPL license), so everyone could make their own distro by obtaining necessary system components.

Usually packaged in a form of distribution(*distro* for short) which is a collection of necessary software packages for easy installation.

---

## Some Popular Distributions

---

### Debian GNU/Linux

- Debian GNU/Linux (There are other Debian OSes that does not use Linux kernel. (e.g. Debian GNU/Hurd))
  - Ubuntu Linux
  Perhaps the most well-known desktop-oriented Linux.
    - Linux Mint
    - Lubuntu, Kubuntu etc.
    Ubuntu with different desktop environment.
  - MX Linux

---

### Red Hat

Popular for server/enterprise use

- Red Hat -> RHEL (Red Hat Enterprise Linux)
Open-sourced but paid (provides technical support services).
  - CentOS
  RHEL redistributed with RHEL trademarks removed(free).
  - Fedora (Derived from Red Hat)

---

### SLS

- Slackware
One of the oldest Linux distro still maintained.
Unix-like Linux
  - SUSE
    - OpenSUSE
    More open-source friendly version of SUSE

---

### Other Independent Linux Distros

- Arch
  Minimalistic, cutting-edge OS
  - Manjaro
  Easier version of Arch
- Gentoo
Installing from the source(including OS itself).
- Android
Popular smartphone OS.

---

## Basic Linux Commands

---

### Redirection and pipe

Redirection: Redirect standard I/Os from/to file(s).
Piping: Redirect *stdout* of one program to *stdin* of another program.

- Redirect to file(*stdout*)
`COMMAND > FILE` : Overwrite
`COMMAND >> FILE` : Append
- Redirect from file(*stdin*)
`COMMAND < FILE`
- Redirect *stderr*
`COMMAND 2> FILE`

Feed output of `prog_a` to `prog_b`
`prog_a | prog_b`

---

### Command Options

- Single-Character Options
  `-OPTION`
  e.g. `-h`,`-a`
  Some commands MAY NOT support this.
- Multi-Character Options
  `--OPTION`
  e.g. `--help`,`--all`

Common Options
- `-h`,`--help` Display help text
- `-v`,`--verbose` Give more detailed information.
- `--version`(sometimes `-v` or `-V`) Display version information.

---

### Navigation

---

### `ls`

**l**i**s**t. List directory contents

`ls [OPTION]... [FILE]`

Options
- `-a`,`--all` Show hidden files and directories(starting with `.`).
- `-l` **l**ong. Use long listing format.
- `-h`,`--human-readable` Prints human-readable size.
- `--color` Colourize.
- `-s`,`--size` Print size.

For more detailed usage, type `man ls`.

---

### `cd`

**c**hange **d**irectory. Changes current directory 

`cd [PATH]`

Shell internal command

For most shells, typing just `cd` changes current directory to home(`~`).

---

### `pwd`

**p**rint **w**orking **d**irectory. Print name of current/working directory.

`pwd [OPTION]`

For more detailed usage, type `man pwd`.

---

### `locate`

Find files by name.

```text
locate [OPTION]... PATTERN...
```

- `-A`,`--all` Print entries that match all PATTERNs.
- `-L`,`--follow` Follow symlink when counting.
- `-i`,`--ignore-case` Case-insensitive search.
- `-P`,`-H`,`--nofollow` Do not follow symlinks.
- `-r REGEXP`, `--regexp REGEXP` Use regular expression. DO NOT use PATTERNs with this option set.
- `--regex` Treat PATTERNs as regular expressions.

---

### `find`

**find**. Search for files.

More powerful version of `locate`.

`find [-H] [-L] [-P] [-D debugopts] [-Olevel] [starting-point...] [expression]`

- `-name PATTERN`,`-iname PATTERN`(case insensitive) Find files by name.

Please read `man` page. There are too many options to describe here.

For more detailed usage, type `man find`.

---

### File Manupulation

---

### `cp`

**c**o**p**y. Copies files/directories.

```text
cp [OPTION]... [-T] SOURCE DEST
cp [OPTION]... SOURCE... DIRECTORY
cp [OPTION]... -t DIRECTORY SOURCE...
```

- `-f`,`--force` Force copy.
- `-i`,`--interactive` Prompt before overwriting.
- `-n`,`--no-clobber` Do not overwrite.
- `-r`,`-R`,`--recursive` Recursive copy.
- `-t DIRECTORY`, `--target-directory=DIRECTORY`
  Copies everything into DIRECTORY
- `-T`, `--no-target-directory`
  Treat DEST as normal file(not directory).

For more detailed usage, type `man cp`.

---

### `mv`

**m**o**v**e. Move/rename files/directories.

```text
mv [OPTION]... [-T] SOURCE DEST
mv [OPTION]... SOURCE... DIRECTORY
mv [OPTION]... -t DIRECTORY SOURCE...
```

- `-f`,`--force` Force move/rename(i.e. no prompt before overwriting).
- `-i`,`--interactive` Prompt before overwriting.
- `-n`,`--no-clobber` Do not overwrite.
- `-t DIRECTORY`, `--target-directory=DIRECTORY`
  Moves everything into DIRECTORY
- `-T`, `--no-target-directory`
  Treat DEST as normal file(not directory).
- `-v`,`--verbose` Give more detailed information.

For more detailed usage, type `man mv`.

---

### `rm`

**r**emo**v**e. Remove/unlink files/directories.

```text
rm [OPTION]... [FILE]...
```

- `-f`,`--force` Force removal, never prompt
- `-i` Prompt before every removal
- `-r`,`-R`,`--recursive` Recursive removal(i.e. remove directories and their contents.
- `-v`,`--verbose` Give more detailed information.

For more detailed usage, type `man rm`.

---

### `mkdir`

**m**a**k**e **dir**ectory. Make directories.

```text
mkdir [OPTION]... DIRECTORY...
```

- `-p`,`--parents` Make parent directories if necessary.
- `-v`,`--verbose` Give more detailed information.

For more detailed usage, type `man mkdir`.

---

### `rmdir`

**r**e**m**ove **dir**ectory. Remove **empty** directories.

```text
rmdir [OPTION]... DIRECTORY...
```

For more detailed usage, type `man rmdir`.

---

### `touch`

Change file timestamps. Create a new file if specified file does not exist.

```text
touch [OPTION]... FILE...
```

- `-d`, `--date=STRING` Use provided STRING instead of current time.


For more detailed usage, type `man touch`.

---

### `chmod`

**ch**ange file **mod**. Change file mode bits(=access permissions).

```text
chmod [OPTION]... MODE[,MODE]... FILE...
chmod [OPTION]... OCTAL-MODE FILE...
chmod [OPTION]... --reference=RFILE FILE...
```

Symbolic mode : `[ugoa...][[-+=][permissions...]...]`

- `u` Owner(user)
- `g` Group
- `o` Others

Permissions : `rwxXst`
`+`/`-` Set/unset mode bit
`=` Set only specified bit.

- `r` **R**ead
- `w` **W**rite
- `x` E**x**ecute/search

---

### Other Commands

---

### `cat`

Con**cat**enate files and print to *stdout*.

```text
cat [OPTION]... [FILE]...
```

---

### `less`

View large files one page at a time.

```text
less -?
less --help
less -V
less --version
less [-[+]aABcCdeEfFgGiIJKLmMnNqQrRsSuUVwWX~]
     [-b space] [-h lines] [-j line] [-k keyfile]
     [-{oO} logfile] [-p pattern] [-P prompt] [-t tag]
     [-T tagsfile] [-x tab,...] [-y lines] [-[z] lines]
     [-# shift] [+[+]cmd] [--] [filename]...
```

---

# Install Preparation

---

## Virtual Machine vs. Bare Metal(Native)

---

### Preparing VM

---

## Creating a Installation Media

---

## Booting the Live Environment

---

## Preparing the Live Environment

---

### Network Setup

---

# Installation

---

## Partitioning

---

### Filesystem Hierarchy Standard

---

### Swap Partition

---

## Base System Installation

---

## System Setup

---

### `/etc/fstab`

---

### Time and Locale

---

### Network

---

#### Wireless Network

---

## Bootloader Installation

---

### What is a Bootloader?

---

### BIOS vs. EFI, MBR vs. GPT

---

### Linux Boot Process

---

## Finalizing

---

# Linux Management

---

## User Management

---

## Service Management

---

### `systemd`

---

## Package Management

---

### How Does Linux Install Packages?

---

### Installing a Package From the Source

---

### Package Manager

---

### Using `pacman`

---

## Device Drivers and the Kernel

---

### How Linux Handles Devices

---

### Loadable Kernel Modules

---

### Building a Custom Linux Kernel

---

## CLI Shell

---

# Graphical User Interface

---

## Display Server

---

### Xorg

---

### Wayland

---

## Desktop Environment

---

### GNOME

---

### KDE

---

### LXDE

---

### Xfce

---

## Window Manager

---

## Display Manager

---

# Thank You!

---
paginate: true
style: |
  table {
    empty-cells: hide;
  }
  table.invis {
    border: 0px none;
  }
  table.invis>tbody>th,
  table.invis>tbody>tr,
  table.invis>tbody>th>td,
  table.invis>tbody>tr>td {
    border: inherit;
  }
---

<!--
    Use marp-next to generate pdf
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

- Red Hat &rarr; RHEL (Red Hat Enterprise Linux)
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

<table style="font-size: smaller; overflow: visible">
<caption style="font-size: larger; text-align: left;">Common Options</caption>
<tr><td> <code>-h</code>,<code>--help</code> </td><td> Display help text </td></tr>
<tr><td> <code>-v</code>,<code>--verbose</code> </td><td> Give more detailed information. </td></tr>
<tr><td> <code>--version</code>(sometimes <code>-v</code> or <code>-V</code>) </td><td> Display version information. </td></tr>
</table>

---

## Navigation

---

### `ls`

**l**i**s**t. List directory contents

`ls [OPTION]... [FILE]`

<table style="font-size: smaller; overflow: visible">
<caption style="font-size: larger; text-align: left;">Options</caption>
<tr><td> <code>-a</code>,<code>--all</code> </td><td> Show hidden files and directories(starting with <code>.</code>). </td></tr>
<tr><td> <code>-l</code> </td><td> **l**ong. Use long listing format. </td></tr>
<tr><td> <code>-h</code>,<code>--human-readable</code> </td><td> Prints human-readable size. </td></tr>
<tr><td> <code>--color</code> </td><td> Colourize. </td></tr>
<tr><td> <code>-s</code>,<code>--size</code> </td><td> Print size. </td></tr>
</table>

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

<table style="font-size: smaller; overflow: visible">
<caption style="font-size: larger; text-align: left;">Options</caption>
<tr><td> <code>-A</code>,<code>--all</code> </td><td> Print entries that match all PATTERNs. </td></tr>
<tr><td> <code>-L</code>,<code>--follow</code> </td><td> Follow symlink when counting. </td></tr>
<tr><td> <code>-i</code>,<code>--ignore-case</code> </td><td> Case-insensitive search. </td></tr>
<tr><td> <code>-P</code>,<code>-H</code>,<code>--nofollow</code> </td><td> Do not follow symlinks. </td></tr>
<tr><td> <code>-r REGEXP</code>, <code>--regexp REGEXP</code> </td><td> Use regular expression. DO NOT use PATTERNs with this option set. </td></tr>
<tr><td> <code>--regex</code> </td><td> Treat PATTERNs as regular expressions. </td></tr>
</table>

---

### `find`

**find**. Search for files.

More powerful version of `locate`.

```text
find [-H] [-L] [-P] [-D debugopts] [-Olevel] [starting-point...] [expression]
```

<table style="font-size: smaller; overflow: visible">
<caption style="font-size: larger; text-align: left;">Options</caption>
<tr><td> <code>-name PATTERN</code>,<code>-iname PATTERN</code>(case insensitive) </td><td> Find files by name. </td></tr>
</table>

Please read `man` page. There are too many options to describe here.

For more detailed usage, type `man find`.

---

## File Manupulation

---

### `cp`

**c**o**p**y. Copies files/directories.

```text
cp [OPTION]... [-T] SOURCE DEST
cp [OPTION]... SOURCE... DIRECTORY
cp [OPTION]... -t DIRECTORY SOURCE...
```
<small>

<table style="font-size: smaller; overflow: visible">
<caption style="font-size: larger; text-align: left;">Options</caption>
<tr><td> <code>-f</code>,<code>--force</code> </td><td> Force copy. </td></tr>
<tr><td> <code>-i</code>,<code>--interactive</code> </td><td> Prompt before overwriting. </td></tr>
<tr><td> <code>-n</code>,<code>--no-clobber</code> </td><td> Do not overwrite. </td></tr>
<tr><td> <code>-r</code>,<code>-R</code>,<code>--recursive</code> </td><td> Recursive copy. </td></tr>
<tr><td> <code>-t DIRECTORY</code>, <code>--target-directory=DIRECTORY</code> </td><td> Copies everything into DIRECTORY </td></tr>
<tr><td> <code>-T</code>, <code>--no-target-directory</code> </td><td> Treat DEST as normal file(not directory). </td></tr>
</table>

</small>
For more detailed usage, type `man cp`.

---

### `mv`

**m**o**v**e. Move/rename files/directories.

```text
mv [OPTION]... [-T] SOURCE DEST
mv [OPTION]... SOURCE... DIRECTORY
mv [OPTION]... -t DIRECTORY SOURCE...
```
<small>

<table style="font-size: smaller; overflow: visible">
<caption style="font-size: larger; text-align: left;">Options</caption>
<tr><td> <code>-f</code>,<code>--force</code> </td><td> Force move/rename(i.e. no prompt before overwriting). </td></tr>
<tr><td> <code>-i</code>,<code>--interactive</code> </td><td> Prompt before overwriting. </td></tr>
<tr><td> <code>-n</code>,<code>--no-clobber</code> </td><td> Do not overwrite. </td></tr>
<tr><td> <code>-t DIRECTORY</code>, <code>--target-directory=DIRECTORY</code> </td><td> Moves everything into DIRECTORY </td></tr>
<tr><td> <code>-T</code>, <code>--no-target-directory</code> </td><td> Treat DEST as normal file(not directory). </td></tr>
<tr><td> <code>-v</code>,<code>--verbose</code> </td><td> Give more detailed information. </td></tr>
</table>

</small>
For more detailed usage, type `man mv`.

---

### `rm`

**r**emo**v**e. Remove/unlink files/directories.

```text
rm [OPTION]... [FILE]...
```

<table style="font-size: smaller; overflow: visible">
<caption style="font-size: larger; text-align: left;">Options</caption>
<tr><td> <code>-f</code>,<code>--force</code> </td><td> Force removal, never prompt </td></tr>
<tr><td> <code>-i</code> </td><td> Prompt before every removal </td></tr>
<tr><td> <code>-r</code>,<code>-R</code>,<code>--recursive</code> </td><td> Recursive removal(i.e. remove directories and their contents. </td></tr>
<tr><td> <code>-v</code>,<code>--verbose</code> </td><td> Give more detailed information. </td></tr>
</table>

For more detailed usage, type `man rm`.

---

### `mkdir`

**m**a**k**e **dir**ectory. Make directories.

```text
mkdir [OPTION]... DIRECTORY...
```

<table style="font-size: smaller; overflow: visible">
<caption style="font-size: larger; text-align: left;">Options</caption>
<tr><td> <code>-p</code>,<code>--parents</code> </td><td> Make parent directories if necessary. </td></tr>
<tr><td> <code>-v</code>,<code>--verbose</code> </td><td> Give more detailed information. </td></tr>
</table>

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

<table style="font-size: smaller; overflow: visible">
<caption style="font-size: larger; text-align: left;">Options</caption>
<tr><td> <code>-d</code>, <code>--date=STRING</code> </td><td> Use provided STRING instead of current time. </td></tr>
</table>


For more detailed usage, type `man touch`.

---

### `chmod`

**ch**ange file **mod**. Change file mode bits(=access permissions).
<small>
```text
chmod [OPTION]... MODE[,MODE]... FILE...
chmod [OPTION]... OCTAL-MODE FILE...
chmod [OPTION]... --reference=RFILE FILE...
```

Symbolic mode : `[ugoa...][[-+=][permissions...]...]`

<table style="overflow: visible">
<tr><td> <code>u</code> </td><td> Owner(user) </td></tr>
<tr><td> <code>g</code> </td><td> Group </td></tr>
<tr><td> <code>o</code> </td><td> Others </td></tr>
</table>


<div>
<div style="float: left; padding-right:2em;">
Permissions : <code>rwxXst</code>
<table style="font-size:inherit; overflow: visible; padding-top: 0.75em">
<tr><td><code>+</code>/<code>-</code> </td><td> Set/unset mode bit</td></tr>
<tr><td><code>=</code> </td><td> Set only specified bit.</td></tr>
</table>
</div>
<div style="float: left;">
<table style="font-size:inherit; overflow: visible">
<tr><td> <code>r</code> </td><td> <b>R</b>ead </td></tr>
<tr><td> <code>w</code> </td><td> <b>W</b>rite </td></tr>
<tr><td> <code>x</code> </td><td> E<b>x</b>ecute/search </td></tr>
</table>
</div>
</div>
</small>

---

## Other Commands

---

### `cat`

Con**cat**enate files and print to *stdout*.

```text
cat [OPTION]... [FILE]...
```

For more detailed usage, type `man cat`.

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

For more detailed usage including keybindings, type `man less`.

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

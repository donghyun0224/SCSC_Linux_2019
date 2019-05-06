---
marp: true
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
  p.note {
    color: darkgreen;
    font-size: smaller;
    background-color: lightgreen;
    padding:0.5em;
    border-radius: 5px
  }
  p.warn {
    color: red;
    background-color: mistyrose;
    padding:0.5em;
    border-radius: 5px;
  }
  table {
    overflow: visible;
  }
  table caption {
    text-align: left;
  }
  table.smalltbl {
    font-size: smaller;
  }
---

<!--
    Use marp-next to generate pdf
-->

# 2019-1 SCSC Linux Seminar

<small>May 6<sup>th</sup> 2019<br/>Donghyeon Lee</small>


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

The first version of Linux as created by Linus Torvalds in 1991, as a MINIX-like free OS.

Freely modifiable (under GPL license), so everyone could make their own distro by obtaining necessary system components.

Usually packaged in a form of distribution (*distro* for short) which is a collection of necessary software packages for easy installation.

---

## Some Popular Distributions

---

### Debian GNU/Linux

- Debian GNU/Linux (There are other Debian OSes that does not use Linux kernel. (*e.g.*, Debian GNU/Hurd))
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
  RHEL redistributed with RHEL trademarks removed (free).
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
Installing from the source (including OS itself).
- Android
Popular smartphone OS.

---

## Basic Linux Commands

---

### Redirection and pipe

Redirection: Redirect standard I/Os from/to file(s).
Piping: Redirect *stdout* of one program to *stdin* of another program.

- Redirect to file (*stdout*)
`COMMAND > FILE` : Overwrite
`COMMAND >> FILE` : Append
- Redirect from file (*stdin*)
`COMMAND < FILE`
- Redirect *stderr*
`COMMAND 2> FILE`

Feed output of `prog_a` to `prog_b`
`prog_a | prog_b`

---

### Command Options

- Single-Character Options
  `-OPTION`
  *e.g.*, `-h`,`-a`
  Some commands MAY NOT support this.
- Multi-Character Options
  `--OPTION`
  *e.g.*, `--help`,`--all`

<table class="smalltbl">
<caption style="font-size: larger;">Common Options</caption>
<tr><td> <code>-h</code>,<code>--help</code> </td><td> Display help text </td></tr>
<tr><td> <code>-v</code>,<code>--verbose</code> </td><td> Give more detailed information. </td></tr>
<tr><td> <code>--version</code>&nbsp;(sometimes <code>-v</code> or <code>-V</code>) </td><td> Display version information. </td></tr>
</table>

<span style="font-size:70%">Command descriptions and options are from the `man` page.</span>

---

## Navigation

---

### `ls`

**l**i**s**t. List directory contents

`ls [OPTION]... [FILE]`

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
<tr><td> <code>-a</code>,<code>--all</code> </td><td> Show hidden files and directories (starting with <code>.</code>). </td></tr>
<tr><td> <code>-l</code> </td><td> <b>l</b>ong. Use long listing format. </td></tr>
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

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
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

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
<tr><td> <code>-name PATTERN</code>,<code>-iname PATTERN</code>&nbsp;(case insensitive) </td><td> Find files by name. </td></tr>
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

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
<tr><td> <code>-f</code>,<code>--force</code> </td><td> Force copy. </td></tr>
<tr><td> <code>-i</code>,<code>--interactive</code> </td><td> Prompt before overwriting. </td></tr>
<tr><td> <code>-n</code>,<code>--no-clobber</code> </td><td> Do not overwrite. </td></tr>
<tr><td> <code>-r</code>,<code>-R</code>,<code>--recursive</code> </td><td> Recursive copy. </td></tr>
<tr><td> <code>-t DIRECTORY</code>, <code>--target-directory=DIRECTORY</code> </td><td> Copies everything into DIRECTORY </td></tr>
<tr><td> <code>-T</code>, <code>--no-target-directory</code> </td><td> Treat DEST as normal file (not directory). </td></tr>
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

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
<tr><td> <code>-f</code>,<code>--force</code> </td><td> Force move/rename (<i>i.e.</i>, no prompt before overwriting). </td></tr>
<tr><td> <code>-i</code>,<code>--interactive</code> </td><td> Prompt before overwriting. </td></tr>
<tr><td> <code>-n</code>,<code>--no-clobber</code> </td><td> Do not overwrite. </td></tr>
<tr><td> <code>-t DIRECTORY</code>, <code>--target-directory=DIRECTORY</code> </td><td> Moves everything into DIRECTORY </td></tr>
<tr><td> <code>-T</code>, <code>--no-target-directory</code> </td><td> Treat DEST as normal file (not directory). </td></tr>
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

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
<tr><td> <code>-f</code>,<code>--force</code> </td><td> Force removal, never prompt </td></tr>
<tr><td> <code>-i</code> </td><td> Prompt before every removal </td></tr>
<tr><td> <code>-r</code>,<code>-R</code>,<code>--recursive</code> </td><td> Recursive removal (<i>i.e.</i>, remove directories and their contents. </td></tr>
<tr><td> <code>-v</code>,<code>--verbose</code> </td><td> Give more detailed information. </td></tr>
</table>

For more detailed usage, type `man rm`.

---

### `mkdir`

**m**a**k**e **dir**ectory. Make directories.

```text
mkdir [OPTION]... DIRECTORY...
```

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
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

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
<tr><td> <code>-d</code>, <code>--date=STRING</code> </td><td> Use provided STRING instead of current time. </td></tr>
</table>


For more detailed usage, type `man touch`.

---

### `chmod`

**ch**ange file **mod**. Change file mode bits (=access permissions).
<small>
```text
chmod [OPTION]... MODE[,MODE]... FILE...
chmod [OPTION]... OCTAL-MODE FILE...
chmod [OPTION]... --reference=RFILE FILE...
```

Symbolic mode : `[ugoa...][[-+=][permissions...]...]`

<table>
<tr><td> <code>u</code> </td><td> Owner (user) </td></tr>
<tr><td> <code>g</code> </td><td> Group </td></tr>
<tr><td> <code>o</code> </td><td> Others </td></tr>
</table>


<div>
<div style="float: left; padding-right:2em;">
Permissions : <code>rwxXst</code>
<table style="font-size:inherit; padding-top: 0.75em">
<tr><td><code>+</code>/<code>-</code> </td><td> Set/unset mode bit</td></tr>
<tr><td><code>=</code> </td><td> Set only specified bit.</td></tr>
</table>
</div>
<div style="float: left;">
<table style="font-size:inherit;">
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

## Virtual Machine vs. Bare Metal (Native)

- Advantages of VM
  - Can try multiple OSes on the same computer.
  - No need to repartition the disk drive.
  - Guest OS does not affect host system.
- Drawbacks of VM
  - Less efficient (Slower)
  - Indirect HW access

Good for testing a new OS with minimized risk.

---

### Popular VM Softwares

- VMWare

- Oracle VirtualBox

---

### Preparing VM

- Select appropirate guest OS (Arch Linux or Linux 4.X or 5.X (if avaliable)).
- If you selected Arch Linux, VM software will choose optimal memory and disk size.
- If you selected general Linux or configuring VM manually, use 1GiB of RAM and &ge;10GiB of virtual disk (20GiB suggested).

---

### Preparing Existing Disk

- Resize existing partition to make empty space.
    - You could resize from Windows OS using third party utilities (reboot required).
    - You could also resize your partition from Arch Live USB with `ntfsresize` command.
- &ge;10GiB Required. Resize as you want.
  <p class="warn" style="margin-top:1em;">
  <b>WARNING</b><br>
  Resizing, partitioning and formatting the disk might cause DATA LOSS.<br>
  Backup your data if necessary.<br>
  Install at YOUR OWN risk.<br>
  </p>

---

## Creating a Installation Media

---

### Downloading Latest Arch .iso Image

1. Visit [https://www.archlinux.org/download/](https://www.archlinux.org/download/).
1. Download via BitTorrent or HTTP.
1. Verify signature/hash (Optional).

---

### LiveUSB - Linux

Use `dd` to write the image to the disk.

Run as root.
```text
# dd if=<PATH TO ISO FILE> of=<YOUR USB DRIVE> status=progress bs=<BLOCK SIZE> oflag=sync
# sync
```

---

### LiveUSB - Linux

Use **win32diskimager**, **USBwriter** or **Rufus** to write image to the USB drive.
Select `dd mode` for **Rufus**.

---

### Optical Media (CD/DVD)

Just burn the image.

---

### PXE Boot (Network Boot)

- For Linux, follow instructions in the [Arch Wiki-PXE](https://wiki.archlinux.org/index.php/PXE).
- For Windows, you may use serva community edition [(Application Note Section 3.17)](https://www.vercot.com/~serva/an/NonWindowsPXE3.html#linux).

---

## Booting the Live Environment

---

### Entering the Boot Menu/Firmware Setup.

- You might need to enter the Boot Menu/Firmware Setup to boot from the external devices (*e.g.*, USB)
- Press a hotkey during the POST (when the logo displays) to enter the Boot Menu/Firmware Setup.
- Hotkey differs from hardware to hardware (consult the manual).
- Usually `F2`,`Del`,`F10` for the Setup, `F8`~`F12` for the Boot Menu.

---

### Boot Menu

Usually looks like this:
<style scoped>
table {
  padding:0.5em;
  float: left;
}
table,th,td,tr {
  font-family:monospace;
  color:blue;
  border-collapse:collapse;
  overflow:visible;
}
tr>* {
  background-color:lightgrey;
  border: 2px solid blue;
  padding:0.3em;
}
th {
  text-align: center;
  color:white;
}
td, tr {
  border-top: 0px none;
  border-bottom: 0px none;
}
td:empty:after{
  content: "\00a0";
}
tr:last-child {
  border-bottom: 2px solid blue;
}
table>tbody>tr:nth-child(3)>td {
  color:white;
}
td:first-child {
  border-right: 0px none;
}
td:nth-child(2) {
  border-left: 0px none;
}
</style>

<table>
<tr><th colspan="2">Boot Menu:</th></tr>
<tr><td>1.</td><td>+Removable Devices</td></tr>
<tr><td>2.</td><td>+Hard Drive</td></tr>
<tr><td>3.</td><td> CD-ROM/DVD-ROM</td></tr>
<tr><td>4.</td><td> Network Boot from AMD Am79C970A</td></tr>
<tr><td/><td/></tr>
<tr><td/><td>&lt;Enter Setup&gt;</td></tr>
</table>

Select appropirate boot option.

---

### Firmware Setup

- If you cannot use Boot Menu, you have to enter firmware setup and change boot order.
- Boot order setting is usally located under `Boot` section.
- Change boot order and settings as necessary.

<p style="margin-top:1.5em; font-size: smaller;" class="note">
<b>UEFI Users:</b><br>
If you use Windows, run <code>shutdown /r /o /t 0</code> to enter Advanced Boot Options and enter UEFI Firmware Settings.<br>
If you use Linux, run <code>systemctl reboot --firmware-setup</code> to enter Firmware Setup.<br>
</p>

---

## Preparing the Live Environment

---

### Keyboard Setup

- Default layout: US English

1. List available layouts
    ```text
    /usr/share/kbd/keymaps/**/*.map.gz
    ```
1. Select layout
    ```text
    loadkeys <LAYOUT>
    ```

- For most Korean keyboards, US English layout is just fine.

---

### Font Setup

1. List available console fonts
    ```text
    /usr/share/kbd/consolefonts/
    ```
1. Select font
    ```text
    setfont <FONT> [-m <MAPPING>]
    ```

---

### Network Setup

- Enter `ip link` to list network interfaces.
- Recent version of Arch Linux uses Predictable Network Interface Names.

- Interfaces starting with `en` are usually ethernet (wired) interfaces.
- Interfaces starting with `wl` are usually wireless interfaces.

---

### Static IP

<style scoped>
p,ol,pre {
  font-size: 75%;
}
h3 {
  padding-bottom: 0.5em;
}
</style>

1. Flush Settings.
    <pre>ip addr flush dev <i>device</i></pre>
1. Setup IP address.
    <pre>ip address add <i>address/prefix_len</i> broadcast + dev <i>interface</i></pre> 
1. Setup routing table.
    <pre>ip route add default via <i>gateway address</i> dev <i>interface</i></pre>
1. In `resolv.conf` (type `man resolv.conf` for more details), add:
    <pre>nameserver <i>DNS Address</i></pre>
   to set DNS Server

<p class="note" style="margin-top:0.5em">
<b><i>NOTE:</i></b><br>
<code><i>address/prefix_len</i></code> uses CIDR notaion (<i>e.g.</i>, <code>192.168.0.123/24</code>).<br>
</p>

---

### Wireless Network

1. View Devices
    ```text
    ip link
    ```
    Devices starting with `wl` are WLAN devices.

1. Bring Interface Up (If the device state is DOWN)
   <pre>ip link set <i>interface</i> up</pre>
   If soft-blocked (see `rfkill`output),
   <pre>rfkill unblock wifi</pre>

---

### Wireless Network (cont'd)

3. Scan Access Point (AP)s
   <pre>iw dev <i>interface</i> scan | less</pre>
    - SSID: Name of the network
    - Signal: Signal Strength (in dBm)
    - Security
        - Does not have `Privacy` in the `capability` section &rarr; not encrypted.
        - Has `RSN` block &rarr; WPA2
        - Has `WPA` section &rarr; WPA is enabled.
        - Encrypted but neither `RSN` nor `WPA` present &rarr; WEP

---

### Wireless Network (cont'd)

4. Connecting to the AP
    - No encryption
        <pre>iw dev <i>interface</i> connect "<i>your_essid</i>"</pre>
    - WEP
        <pre>iw dev <i>interface</i> connect "<i>your_essid</i>" key 0:<i>your_key</i></pre>
    - WPA-Personal
        <pre style="font-size:80%">wpa_supplicant -B -i <i>interface</i> -c <(wpa_passphrase <i>MYSSID</i> <i>passphrase</i>)</pre>
    You may need to run `dhclient` to receive IP address from the DHCP server.

For more information such as WPA-Enterprise, see [ArchWiki-WPA supplicant](https://wiki.archlinux.org/index.php/WPA_supplicant)

---

### Testing Network Setup

- Type `ip addr` to display current IP address.
- Type <code>ping <i>server-domain-name</i></code> to check connectivity to the internet
    - Example: `ping google.com`

---

### Sync Time

1. Use `timedatectl` (component of `systemd`) to set timezone.
    1. Check status and timezone
        ```text
        timedatectl status
        ```
    1. List all timezones
        ```text
        timedatectl list-timezones
        ```
    1. Select timezone
        <pre>timedatectl set-timezone <i>Zone/SubZone</i></pre>
        or
        <pre>ln -sf /usr/share/zoneinfo/<i>Zone/SubZone</i> /etc/localtime</pre>

---

### Sync Time (cont'd)

2. Sync with NTP server
    ```text
    timedatectl set-ntp true
    ```
    or force resync by restarting the daemon using following command:
    ```text
    systemctl restart systemd-timesyncd
    ```

---

# Installation

---

## Partitioning

- You must have at least 1 root partition for mounting `/` directory.
- If you are using UEFI/GPT booting, you will need 1 EFI system partition.
- You can separate paths into multiple discrete partitions(*e.g.* `/home`, `/var`, etc.).
- Although Linux could be used without swap(with enough RAM), it is highly recommanded to have swap partition.

---

### Partition Table

- Table on the disk that describes the partitions on that disk.
- Master Boot Record (MBR) - Old (IBM PC XT and onwards).
    - The first sector(or LBA 0) of the disk contains MBR &rarr; Only one MBR per disk.
    - MBR includes bootloader &rarr; One bootloader per MBR &rarr; One bootloader per disk.
    - Maximum 2<sup>32</sup> sectors. (2TiB for 512B/Sector).
    - Limits maximum number of (primary) partitions per disk to 4.
- GUID Partition Table (GPT)
    - Supports larger disks (&le;2<sup>64</sup> sectors &rarr; &le;8ZiB for 512B/Sector).
    - Can use multiple bootloaders.
    - Can have more than 4 primary partitions per disk.


---

### Filesystem Hierarchy Standard

<style scoped>
table * {
  font-size: 90%;
}
</style>
Linux Standard for directory structure and directory contents.

All files and directories are located under the root (`/`).

| Directory | Description |
| :--- | :--- |
| `/` | *Primary hierarchy* root and root directory of the entire file system hierarchy. |
| `/bin` | Essential command binaries that need to be available in single user mode; for all users, *e.g.*, `cat`, `ls`, `cp`. |
| `/boot` | Boot loader files, *e.g.*, kernels, initrd. |
| `/dev` | device files, *e.g.*, `/dev/null`, `/dev/disk0`, `/dev/sda1`, `/dev/tty`, `/dev/random.` |
| `/etc` | Host-specific system-wide configuration files. |

<span style="font-size: 70%">from [Wikipedia-Filesystem Hierachy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)</span>

---

### Filesystem Hierarchy Standard (cont'd)

<style scoped>
table * {
  font-size: 90%;
}
</style>

| Directory (cont'd) | Description (cont'd) |
| :--- | :--- |
| `/home` | Users' home directories, containing saved files, personal settings, etc. |
| `/lib` | Libraries essential for the binaries in /bin and /sbin. |
| <code>/lib<i>&lt;qualifier&gt;</i></code><br/><i>e.g.</i>, <code>/lib32</code>, <code>/lib64</code> | Alternative format essential libraries. |
| `/media` | Mount points for removable media such as CD-ROMs (&ge;FHS-2.3). |
| `/mnt` | Temporarily mounted filesystems. |
| `/opt` | Optional application software packages. |
| `/proc` | Virtual filesystem providing process and kernel information as files (procfs). |

<span style="font-size: 70%">from [Wikipedia-Filesystem Hierachy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)</span>

---

### Filesystem Hierarchy Standard (cont'd)

<style scoped>
table * {
  font-size: 90%;
}
</style>

| Directory (cont'd) | Description (cont'd) |
| :--- | :--- |
| `/root` | Home directory for the root user. |
| `/run` | Run-time variable data: Information about the running system since last boot. |
| `/sbin` | Essential system binaries, *e.g.*, `fsck`, `init`, `route`. |
| `/srv` | Site-specific data served by this system (&ge;FHS-2.3). |
| `/sys` | Contains information about devices, drivers, and some kernel features. |
| `/tmp` | Temporary files. Often not preserved between system reboots. |

<span style="font-size: 70%">from [Wikipedia-Filesystem Hierachy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)</span>

---

### Filesystem Hierarchy Standard (cont'd)

<style scoped>
table * {
  font-size: 90%;
}
</style>

| Directory (cont'd) | Description (cont'd) |
| :--- | :--- |
| `/usr` | *Secondary hierarchy* for read-only user data; contains the majority of (multi-)user utilities and applications. |
| &emsp;`/usr/bin` | Non-essential command binaries (not needed in single user mode); for all users. |
| &emsp;`/usr/include` | Standard include files. |
| &emsp;`/usr/lib` | Libraries for the binaries in `/usr/bin` and `/usr/sbin`. |
| &emsp;<code>/usr/lib<i>&lt;qualifier&gt;</i></code><br/><i>e.g.</i>, <code>/usr/lib32</code> | Alternative format libraries. |
| &emsp;`/usr/local` | *Tertiary hierarchy* for local data, specific to this host. |
| &emsp;`/usr/sbin` | Non-essential system binaries. |
| &emsp;`/usr/src` | Source code |


<span style="font-size: 70%">from [Wikipedia-Filesystem Hierachy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)</span>

---

### Filesystem Hierarchy Standard (cont'd)

<style scoped>
table * {
  font-size: 90%;
}
</style>

| Directory (cont'd) | Description (cont'd) |
| :--- | :--- |
| `/var` | Variable files—files whose content is expected to continually change during normal operation of the system—such as logs, spool files, and temporary e-mail files. |
| &emsp;`/var/cache` | Application cache data. Could be deleted without loss of data. |
| &emsp;`/var/lib` | State information. Persistent data modified by programs as they run. |
| &emsp;`/var/lock` | Lock files. Files keeping track of resources currently in use. |
| &emsp;`/var/log` | Log files. Various logs. |
| &emsp;`/var/mail` | Mailbox files. |
| &emsp;`/var/run` | Run-time variable data. Replaced by `/run` in FHS 3.0. |
| &emsp;`/var/spool` | Spool for tasks waiting to be processed. |
| &emsp;`/var/tmp` | Temporary files to be preserved between reboots. |

<span style="font-size: 70%">from [Wikipedia-Filesystem Hierachy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard)</span>

---

### Swap Partition

- Space for swapping.
- RAM is divided into *pages* in Linux.
- A page in the memory(RAM) is copied to the swap file/partition to free up memory.
- When the specific page stored in the swap space is required, the page is copied to the memory.
- Also used for hibernation (storing RAM contents).
- You could use a swap file instead of the swap partition.

---

<style scoped>
table {
  padding-top: 0.5em;
}
table td tr th {
  font-size: smaller;
}
</style>

### Swap Partition (cont'd)

- So, how much space you will need?
    - 2&times;RAM Size **WAS** recommanded in the past(when the RAM was small).

    | Amount of RAM | Recommanded swap space | Recommanded swap space w/ hibernation |
    | :---: | :---: | :---: |
    | &lt;2GiB | 2&times; | 3&times; |
    | 2 - 8GiB | 1&times; | 2&times; |
    | 8 - 64GiB | 4GiB - 0.5&times; | 1.5&times; |
    | &ge;64GiB | &ge;4GiB | Hibernation not recommanded |

    <small>[RedHat Partition Scheme Document](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-disk-partitioning-setup-x86#sect-recommended-partitioning-scheme-x86)</small>

---

<style scoped>
p.note, p.warn {
  font-size: 70%;
  margin-top: 0.2em;
}
</style>

### Partitioning (cont'd)

- You can use `parted`(CLI), `fdisk`(CLI) or `cfdisk`(TUI) from the liveUSB.
- If your disk is empty(*i.e.*, no partitions present), you may have to create partition table.

  <p class="note">
  <b><i>NOTE:</i></b><br>
  To shrink existing partition, it is worth using <code>gParted</code>(GUI) with liveboot USB that supports graphical enviroment to avoid mistakes that might lead to the data loss.
  </p>
  <p class="warn">
  <b>WARNING</b><br>
  Resizing, partitioning and formatting the disk might cause DATA LOSS.<br>
  Backup your data if necessary.<br>
  Do at YOUR OWN risk (I warned you!).<br>
  </p>
  
  <p class="warn" style="margin-top:0.5e">
  <b>WARNING</b><br>
  Deleting and rewriting partition table might REMOVE ALL existing PARTITIONS.<br>
  Use conversion utilities such as <code>gdisk</code>, <code>gptfdisk</code> to convert MBT to/from GPT.<br>
  </p>

---

### Partitioning (cont'd)

- If you are using UEFI, create EFI system partition first(if it does not exists).
    Select `EFI System` partition type.
- Then, create required partitions (*e.g.*, `/`, `/home`).
    Select appropirate partition type (*e.g.*, `Linux Root`, `Linux /home`).
- Finally, create swap partition.
    Select `Linux Swap` partition type.

---

### Formatting

- After creating partitions, each partitions must be formatted.
- As you know, it will remove all existing data.
- Use <code>mkfs.<i>filesystem_type /path/to/partition</i></code> to format.
    - ext4 is recommanded for the modern Linux systems.
- For swap partition, use <code>mkswap <i>/path/to/swap</i></code> to initialize swap.
- Run <code>swapon <i>/path/to/swap</i></code> to enable swap.

---

## Base System Installation

---

## System Setup

- Mount all the necessary partitions
    <pre>mount <i>/path/to/partition /path/to/mount/position</i></pre>
    Usually root to `/mnt`, EFI system to `/mnt/efi` or `/mnt/boot/efi`
- Edit mirror list file (`/etc/pacman.d/mirrorlist`).
    - You can [sort mirrors](https://wiki.archlinux.org/index.php/Mirrors#Sorting_mirrors) by speed.
- Install `base` package group.
    ```text
    pacstrap /mnt base
    ```

---

### `/etc/fstab`

- `/etc/fstab` file defines how the filesystems should be mounted.
- `systemd` will read this file and automatically manages the mounting of the filesystems.
- You could use volume labels(`-L`) or UUID(`-U`) in the `fstab` file to specify filesystem.
- Generate `fstab` file
    ```text
    genfstab -U /mnt >> /mnt/etc/fstab
    ```
- Check generated fstab file.

---

### System Setup (cont'd)

- Chroot(change root) into the new root.
    ```text
    arch-chroot /mnt
    ```
    Root will be changed into the newly installed Linux filesystem.
- Type `exit` to exit chroot.

---

### Time and Locale - Timezone

- After chrooting, the time and the locale of the system should be set again.
- Set timezone by running:
    <pre>ln -sf /usr/share/zoneinfo/<i>Region/City</i> /etc/localtime</pre>
- Generate `/etc/adjtime`
   ```text
   hwclock --systohc
   ```
   <p class="note" style="">
   <b><i>NOTE:</i></b><br>
   This assumes that the hardware clock(usually onboard RTC) is using UTC.<br>
   Windows uses the local time (KST(=UTC+9) in Korea) for the hardware clock.<br>
   You may experience &plusmn;9h time difference(the difference between KST and UTC) when switching between OSes.<br>
   If so, adjust Windows registry settings or Linux <code>timedatectl</code> settings.
   </p>

---

### Time and Locale - Locale

- Edit `/etc/locale.gen`
    - Uncomment `en_US.UTF8 UTF8` and other needed locales.
- Generate locales
    ```text
    locale-gen
    ```
- Create/edit `/etc/locale.conf` and set language (`LANG` variable).
    <pre>LANG=<i>Language_Locale.Encoding</i></pre>
    *e.g.*, `en_US.UTF-8`
- Change keyboard layout(if necessary) by editing `/etc/vconsole.conf`.
    <pre>KEYMAP=<i>keymap</i></pre>

---

### Network

- Set the hostname first by creating `/etc/hostname` file.
    <pre>echo <i>myhostname</i> > /etc/hostname</pre>
- Add entries for the `/etc/hostis` file.
    <pre>127.0.0.1	localhost<br>::1		localhost<br>127.0.1.1	<i>myhostname.localdomain</i>	<i>myhostname</i></pre>
    If the system uses a static IP address, use it instead of `127.0.1.1`.

---

### Network (cont'd)

- List network interfaces first
    ```text
    ip link
    ```
- If your device is not listed, check that the device driver is loaded.
    - Use `lspci -v` or `lsusb -v` to list PCI or USB devices and their kernel modules.
    - Run <code>dmesg | grep <i>kernel_module_name</i></code> to check if the module is loaded.
    - Run <code>modprobe <i>module_name</i></code> to load kernel module.
    - You may have to install additional modules from the AUR (Arch User Repository).

---

### Network (cont'd)

- Install network manager
    - You could use `ConnMan`, `netctl`, `NetworkManager`, `systemd-networkd` or `Wicd`.
    - Do not run more than one network manager daemons at the same time.
    - NetworkManager provides nice TUI interface and applet (`nm-applet`).
    - Refer to the `man` page or ArchWiki for detailed usage.
    - Enable network manager services after the installation.
        <pre>systemctl enable <i>service_name</i></pre>

---

#### Wireless Network

- If you have network managers, use them to configure wireless networks.
    - For example, `nmcli`, `nmtui` for `NetworkManager`.
- Or you could follow instructions on the previous slide (slide 50-52).

---

### Initramfs Setup

- Usually not required.
- If you are need a new initramfs image, modify `mkinitcpio.conf` and run:
    ```text
    mkinitcpio -p linux
    ```

---

### Processor Microcode Installation

Provides stability and security updates.
The Linux kernel could apply microcode updates during boot.

- AMD Processors
    ```text
    pacman -S amd-ucode
    ```
- Intel Processors
    ```text
    pacman -S intel-ucode
    ```
- Early microcode updates are applied by the bootloader.
  Change bootloader settings [accordingly](https://wiki.archlinux.org/index.php/Microcode#Enabling_early_microcode_updates).
- Late microcode updates are applied by the OS.
  Follow instructions at : [ArchWiki - Microcode](https://wiki.archlinux.org/index.php/Microcode#Late_microcode_updates).

---

## Bootloader Installation

---

### What is a Bootloader?

- In the modern computers, the RAM does not contain any useful information just after the power-up.
- The OSes and programs must be loaded from the secondary storages (*e.g.*, HDD, SSD) to the RAM.
- The CPU must execute some kind of program that could read programs from the secondary storages through I/O channels and store them in the memory.
- Such program is known as a bootloader.
- Modern computers are using multistage bootloaders due to the increasing complexity.

---

### BIOS vs. EFI, MBR vs. GPT

- BIOS (Basic Input/Output System)
    - Provides basic HW abstraction layer (for keyboard, character I/Os, storage access etc.)
    - Power-On Self-Test &rarr; Call `INT 19H` to start booting &rarr; Find and execute boot loader on the boot devices.
- EFI (Extensible Firmware Interface)
    - Can verify, load and utilize device drivers instead of relying on the BIOS call.
    - Security(SEC) &rarr; Pre-EFI Init. (PEI) &rarr; Driver Exec. Env. (DXE) &rarr; Boot Dev. Sel. (BDX) &rarr; Transient Sys. Load (TSL) &rarr; Runtime (RT) &rarr; Afterlife (AL)

---

### BIOS vs. EFI, MBR vs. GPT (cont'd)

- MBR (Master Boot Record)
    - Uses the first sector of the disk(512B).
    - Max 4 (primary) partitions.
    - Small Bootloader area (~440B).
- GPT (GUID Partition Table)
    - Min. 16384B
    - Supports min. 128 max. partition entries.
    - Bootloaders are not included in the partition table.

---

### Linux Boot Process

1. Bootloader Phase
    - The bootloader loads the kernel into the memory and gives control to it.
1. Kernel Phase
    1. Kernel Loading
        - The kernel image files is loaded and decompressed into the memory.
    1. Kernel Startup
        - The kernel initializes memory mgmt., device drivers and loads the root partition.
    - Early Userspace
        - `initramfs` or `initrd` loads temp. root filesystem and prepares the system before the actual root mounting (in case of LVM, RAID, encrypted root or hibernation etc.).

---

### Linux Boot Process (cont'd)

3. Init Process
    - The first process of the system (PID=1), and the last process to terminate during shutdown.
    - Starts/stops services (daemons)
        - SysV-style
            Starts/stops services when the system enters/leaves specific runlevel.
        - Systemd
            Services have required targets (After/Before).
            Systemd starts/stops the required services.

---

### Installing the Bootloader

- Grub is the most popular bootloader.
- Grub could chainload other OSes.

1. Install `grub` package
    ```text
    pacman -S grub
    ```

1. Install the bootloader into the disk.
    - BIOS
        <pre>grub-install --target=i386-pc /dev/<i>sdX</i></pre>
    - EFI
        <pre style="font-size:75%">grub-install --target=x86_64-efi --efi-directory=<i>esp</i> --bootloader-id=GRUB</pre>

---

### Installing the Bootloader (cont'd)

3. Configuring GRUB
    1. Edit `/etc/default/grub` file.
    1. Generate `grub.cfg`
        ```text
        grub-mkconfig -o /boot/grub/grub.cfg
        ```
<p class="note"><i><b>NOTE:</b></i><br>
If you are multibooting with other OSes, you need to install <code>osprober</code> to detect and load other OSes.
</p>

---

<style scoped>
p,pre,code {
  font-size:80%;
}
</style>

## Finalizing

- Set up `root` password
    ```text
    passwd
    ```
- Adding a normal (=*non-root*) user
    <pre>useradd -m -G users,audio,storage,video,wheel -s /bin/bash <i>USERNAME</i><br>passwd <i>USERNAME</i></pre>
    Run <code>su <i>USERNAME</i></code> to change user.
    Type `exit` to return.

- Reboot
    Type `reboot` to reboot.

<p class="warn" style="font-size:70%"><b>WARNING</b><br>
Make sure that the <code>root</code> password has been set before rebooting.
</p>

---

# Linux Management

---

## User Management

--- 

### Adding a User

```text
useradd [OPTION(s)] LOGIN_NAME
```

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
<tr><td><code>-d</code>,<code>--home-dir</code> <code>PATH_TO_HOME</code></td><td>Set home directory</td></tr>
<tr><td><code>-G</code>,<code>--groups</code> <code>GROUP1[,GROUP2[,...]]</code></td><td>Supplementary groups</td></tr>
<!-- <tr><td></td><td></td></tr> -->
</table>

---

### Adding a Group

```text
groupadd [OPTION(s)] GROUP_NAME
```

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
<tr><td><code>-f</code>,<code>--force</code></td><td>Successful exit even if the group already exists.</td></tr>
</table>

---

<style scoped>
tr>td:first-child {
  width: 12em;
}
</style>

### Adding a User to the Groups

```text
usermod [OPTION(s)] LOGIN_NAME
```

<table class="smalltbl">
<caption style="font-size: larger;">Options</caption>
<tr><td><code>-a</code>,<code>--append</code></td><td>Append user to the supplemental group(s) without removing the user from other groups.</td></tr>
<tr><td><code>-g</code>,<code>--gid</code> <code>GROUP</code></td><td>Set primary group.</td></tr>
<tr><td><code>-G</code>,<code>--groups</code> <code>GROUPS</code></td><td>Supplementary groups </td></tr>
<!-- 
<tr><td> </td><td> </td></tr>
-->
</table>

---

## Service Management

---

### Linux Service

- Service: Background processes that run without user interaction
- Service = Daemon in Linux
- Started by `init` during startup

---

### `systemd`

- Includes system, service manager, event logger etc.

![](https://upload.wikimedia.org/wikipedia/commons/3/35/Systemd_components.svg)

---

### Using `systemctl` to start/stop service

```text
systemctl [OPTIONS] COMMAND [UNIT]
```

<table class="smalltbl">
<caption style="font-size: larger;">Commands</caption>
<tr><td><code>status</code></td><td>Print status</td></tr>
<tr><td><code>start</code></td><td>Start units</td></tr>
<tr><td><code>stop</code></td><td>Stop units</td></tr>
<tr><td><code>restart</code></td><td>Restart units</td></tr>
<tr><td><code>enable</code></td><td>Enable units</td></tr>
<tr><td><code>disable</code></td><td>Disable units</td></tr>
</table>

---

## Package Management

---

### How Does Linux Install Packages?

1. Configure
    - Setup build env.
1. Compile/Build
    - Compile src.
1. Install
    - Copy bin. files.

---

### Installing a Package From the Source

1. Unpack
    ```text
    tar xvzf <TARBALL NAME>.tar.gz
    ```
1. Configure
    ```text
    ./configure
    ```
1. Build
    ```text
    make
    ```
1. Install
    ```text
    make install
    ```
    <small>With root prvl.</small>

---

### Package Manager

- Automates package download/install/update/dep. resolv/uninstall.
- Most package managers downloads precompiled binary package &rarr; Faster

---

### Using `pacman`

- Install
    - `pacman -S package_name`
- Uninstall
    - `pacman -R package_name`
- Upgrade all
    - `pacman -Syu`
- Search
    - `pacman -Ss query`

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

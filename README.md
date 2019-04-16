# 2019년 1학기 SCSC 리눅스 세미나

**직무교육 관계로 연기**

## Use [Marp(Marp Next)](https://github.com/marp-team/marp) to generate pdf file from markdown file.

### Instructions

1. Install [marp-cli](https://github.com/marp-team/marp-cli).
2. Edit `MARPCMD` and `OPENCMD` for your system.
3. Run `make all` to make pdf and html.

#### Options
  * `all` : Make pdf and html
  * `pdf` : Make pdf
  * `html` : Make html
  * `viewpdf`/`viewhtml` : View pdf/html
  * `preview` : Preview
  * `clean` : Remove all pdf and html files

#### Variables
  * `MARPCMD` : Marp-cli command (default: `npx marp`)
  * `MARPOPT` : Marp-cli options (default:`--html`)
  * `OPENCMD` : Command for open files (default: `xdg-open`)

# restructuredfile-to-pdf-docx-html
Generate a pdf, docx and html from a reStructured Text (rst) by using Pandoc, MiKTeX and Windows Batch Scripting

Run `convert_rst_to_docx.bat "<filename.rst>" `

Look into the `examples`directory to find the expected generated files

* [X] ~~~generate pdf using MiKTeX2.9 using the default template~~~
* [X] ~~~generate docx using a template available on the `.pandoc` directory~~~
* [X] ~~~generate an html~~~
* [X] ~~~copy images in the `img` directory in the `output`directory to display images in the html page~~~

## Prerequisite

* reStructuredText https://docutils.readthedocs.io/en/sphinx-docs/user/rst/quickstart.html
* Pandoc https://pandoc.org
* MiKTeX 2.9 https://miktex.org
* Microsoft Windows OS https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands

## Test with an example

1. Run `run_test.bat`
2. `cd output`
3. On windows 
    1. run `start ALT-F1.BE-description.docx` 
    2. run `start ALT-F1.BE-description.html` 
    3. run `start ALT-F1.BE-description.pdf`

Copyright &copy; 2019 ALT-F1, We believe in the projects we work on&trade;
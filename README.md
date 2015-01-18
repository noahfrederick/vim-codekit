# vim-codekit

CodeKit 2 support for Vim

## Features

CodeKit.vim provides support for controlling [CodeKit 2][ck] from Vim. It uses
[CodeKit's AppleScript interface][as] to provide the following features:

* Add the current project to CodeKit
* Switch to the current file's project
* Preview the current project in a browser
* Pause and unpause CodeKit's watching of project files

See `:help codekit` for a list of the provided commands.

[ck]: http://incident57.com/codekit/
[as]: http://incident57.com/codekit/help.html#applescript

## Development

### Documentation

The documentation in `doc/` is generated from the plug-in source code via
[vimdoc][vimdoc]. Do not edit `doc/codekit.txt` directly. Refer to the
existing inline documentation as a guide for documenting new code.

The help doc can be rebuilt by running:

	rake doc

[vimdoc]: https://github.com/google/vimdoc

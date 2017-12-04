Vim Filify is a vim plugin aimed to define the content of a variable in a file.
This allows to achieve a clean config file and allows per project tunning.

__Install__
-----------

This is a simple Vim plugin, simply use your favorite Vim plugin manager of put
it in your `.vim` folder


__How to use__
--------------

The `Filify#process('filename', ...)` function will return the content of a file
as a String.

The first parameter is the name of the config file to look up.
The you can pass a dictionary with the optional following parameters:

* `default_return`: A string to return in case no file has been found
* `sep`: The character to use in the output string to join the line of the config file
* `recurse`: Either you want the config file to be searched recursively until the root or not
* `dir`: Specify another location than the current project

You can tweak the default behaviour corresponding to each entry using global variables.
See the `plugin/Filify.vim` file for more documentation.


__Copyright__
-------------

This git is maintained by **Charles Gueunet** \<charles.gueunet+vimmic@gmail.com\>

Copyright (C) 2017 Charles Gueunet

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Vim Filify is a vim plugin aimed to define the content of a variable in a file.
This allows to achieve a clean config file and allows per project tunning.

__Install__
-----------

This is a simple Vim plugin, simply use your favorite Vim plugin manager of put
it in your `.vim` folder


__How to use__
--------------

The `Filify#process()` function will return the content of a file
as a String. It takes several parameters.

The name of the config file to use. You can either use the `g:filify_filename`
or pass it as the first parameter of the `Filify#process()` function.

This function can search for the config file recursively onto the parent until
the file is found or the root is reached. You can enable/disable this behaviour
using the `g:filify_recurse` variable or the second parameter of the function.

In the resulting string, each line of the config file is separated by a character.
The default one is a space, but you can change it using either the `g:filify_sep`
variable of the third parameter of the function.

This architecture allows filify to be used for several variable if you use the arguments
of the `Filify#process()` function.

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

# Terminal Colors

This is a small set of scripts and customization for MacOS/OS X that gives each new Terminal window a new background color when opened.  You can also get a new color applied to an existing Terminal window on demand, and save and recall favorite colors.

The primary random color generation AppleScript was pulled from http://www.red-sweater.com/blog/220/random-color-terminal, and I added on some helper scripts.

Enjoy!


## Installation

### Download & Set Permissions

Download the following four files, or clone this git repo locally, and put them (or the repo) in a safe location to be referenced via scripts later.  For the purposes of this README, I will assume they are in `~/scripts/TerminalColors/`.

* `RandomColorTerminal.applescript`
* `get-current-terminal-color.sh`
* `load-terminal-color-from-favorites.sh`
* `save-terminal-color-to-favorites.sh`

Make the shell scripts executable:

~~~
$ cd ~/scripts/TerminalColors/
$ chmod 755 *.sh
~~~


### Set up the Trigger

Modify or create your user's `.profile` to invoke the new random color script each time a new window/tab is created.  It creates an alias called `newcolor` that you can invoke at any time to change your current Terminal window to a new random color.

~~~
##########################################
# TerminalColors
# set background color of terminal window via applescript, only valid for Mac OS X
# get RandomColorTerminal.applescript from http://www.red-sweater.com/blog/220/random-color-terminal

alias newcolor='osascript ~/scripts/TerminalColors/RandomColorTerminal.applescript'

# every time a new top-level shell is started, give it a new background color
if [ $SHLVL -eq 1 ]; then
   newcolor 2> /dev/null
fi
##########################################
~~~


### Preloaded/Editing Favorite Colors

To get you started with some good colors, I have included my `.fav-terminal-background-colors` file to use as a starting point.  If you'd rather create your own from scratch, just delete that file, and it will be recreated the next time you save a favorite.

If there's a color that you load and absolutely *hate* and want to delete, just find the corresponding entry based on the Terminal output and delete it from the file in a text editor.

If you want to get really fancy, you could have multiple favorites files and tweak the scripts to use different ones based on certain conditions, for example to have a set of favorite colors for "day" and "night".


### Make available on your PATH

In order to make the shell scripts executable from any directory, create some symbolic links in `/usr/local/bin/` that point to their location.  I am assuming that that directory exists and is already included on your `PATH`.  Please update the source path in the commands below if needed.

~~~
$ cd /usr/local/bin/
# sudo may not be required, depending on your specific setup
$ sudo ln -s ~/scripts/TerminalColors/get-current-terminal-color.sh get-current-terminal-color.sh
$ sudo ln -s ~/scripts/TerminalColors/save-terminal-color-to-favorites.sh save-terminal-color-to-favorites.sh
$ sudo ln -s ~/scripts/TerminalColors/load-terminal-color-from-favorites.sh load-terminal-color-from-favorites.sh
~~~ 


### Multi-User Environments / Full Path

The files `save-terminal-color-to-favorites.sh` and `load-terminal-color-from-favorites.sh` should work as is in most circumstances, but I recomment they be edited to define the location of the file used to save the favorites using an absolute, non-calculated path.  They both define a `FILE` variable that references the location of the favorite colors text file (which is `.fav-terminal-background-colors`).

Within `save-terminal-color-to-favorites.sh`, there is also a `COLORS` varable which contains the path to the `get-current-terminal-color.sh` script.

For both of these, if you intend on using in a multi-user environment, or may ever run either script with `sudo`, you should update those paths to replace `$USER` with the actual user name (i.e. from `/Users/$USER/scripts/TerminalColors/...` to `/Users/brian/scripts/TerminalColors/...`).  This is necessary because you need a static location to reference the files from, and if multiple users are sharing the same files, that location will change depemnding on who is using it, and you'll get different results.   Similarly, if run as `sudo`, the user becomes `root`, which will result in an invalid path.

Also, make sure that all the users have read and write permission to the favorites file.



## Usage

Opening a new Terminal window or tab should result in a new random color!

If you don't like that color, give it a new one with:
~~~
$ newcolor
~~~
Repeat as needed!

Once you find a color you really like, save it (don't worry, it removes duplicates):
~~~
$ save-terminal-color-to-favorites.sh
~~~

To switch to a (randomly choosen) *favorite* color:
~~~
$ load-terminal-color-from-favorites.sh
~~~

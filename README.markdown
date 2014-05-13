# Snakefire: Campfire Desktop client for Linux #

## LICENSE ##

Snakefire is released under the [MIT License] [license].

## TEAM ##

* Mariano Iglesias - [@mgiglesias] [twitter_mgiglesias] | [marianoiglesias.com.ar] [website_mgiglesias]
* Zak Zajac - [@madzak] [twitter_madzak] | [madzak.com] [website_madzak]

## INSTALLATION ##

Some operative systems have a quick install method available. If your system / distribution
is not listed here, check the MANUAL INSTALLATION section below. 

### Arch Linux ###

Snakefire is in an [AUR repository] [arch-aur-snakefire]. If you have [packer] [packer],
you can install it with (if you don't have packer, you should really [get it] [packer])

        $ packer -S snakefire

### Ubuntu

Open a terminal (`Ctrl+Alt+T`) and run:

```term
sudo apt-add-repository -y ppa:rael-gc/snakefire
sudo apt-get update
sudo apt-get install snakefire
```

If you're using **KDE** additionally install `snakefire-kde`:

```
sudo apt-get install snakefire-kde
```

## MANUAL INSTALLATION ##

### Requirements ###

### Python Setup Tools ###

For *Ubuntu/Debian based* systems, Python setup tools is in the official repositories, 
and can be installed the following way:

		$ sudo apt-get install python-setuptools

For *Fedora*, Python setup tools is in the official repositories and can be installed 
the following way:

		$ yum install python-setuptools

For *Arch Linux*, Python setup tools is in the extra repository, and can be installed 
with:

		$ pacman -S python2-distribute

Other OS should refer to the [Python setup tools page] [python-setuptools]

### Pyfire ###

[Pyfire] [pyfire] is required.

For *Ubuntu/Debian based* systems, Pyfire is in [Zakaria Zajac's PPA] [zakaria_zajac_ppa] 
repository, which must be added to install:

        $ sudo add-apt-repository ppa:zak-d/python-pyfire && sudo apt-get update
        $ sudo apt-get install python-pyfire

For *Arch Linux*, Pyfire is in an [AUR repository] [arch-aur-pyfire]. If you have [packer] [packer],
you can install it with (if you don't have packer, you should really [get it] [packer])

		$ packer -S python-pyfire

For *Fedora*, install Pyfire using Pip, which is in the official repositories

        $ yum install python-pip
        $ pip-python install pyfire

Other OS may install it through Python's [PIP] [pip]:

        $ pip install pyfire

Or also using [Easy Install] [easy_install]:

        $ easy_install pyfire

### PyQT4 ###

The python library for QT is required.

For *Ubuntu/Debian based* systems, PyQT4 is in the official repositories, and can be
installed the following way:

		$ sudo apt-get install python-qt4

For *Fedora*, PyQT4 is in the official repositories, and can be installed with:

        $ yum install PyQt

For *Arch Linux*, PyQT4 is in the extra repository, and can be installed with:

		$ pacman -S python2-pyqt

Other OS should refer to the [PyQT4 download page] [pyqt-download]

#### Keyring ####

For *Ubuntu/Debian based* systems, Keyring is in the official repositories, and can be
installed the following way:

For Ubuntu (GNOME) or Kubuntu (KDE):

		$ sudo apt-get install python-keyring

For *Fedora*, Keyring is in the official repositories, and can be installed with:

        $ yum install python-keyring

For *Arch Linux*, Keyring is in an AUR repository. Install it with packer:

		$ packer -S python-keyring

Other OS should read [Python Keyring installation docs] [keyring-install].

If you are on *GNOME* you also need to install python-gnomekeyring:

For *Ubuntu/Debian* based systems:

        $ sudo apt-get install python-gnomekeyring

For *Fedora* systems:

        $ yum install gnome-python2-gnomekeyring

For *Arch Linux* systems:

        $ pacman -S python-gnomekeyring

All *XFCE* users should install GNOME keyring.

#### Notifications ####

For *Ubuntu/Debian based* systems, python-notify is in the official repositores, and can be
installed the following way:

        $ sudo apt-get install python-notify

For *Fedora*, python's libnotify is in the official repositories, and can be installed with:

        $ yum install notify-python

For *Arch Linux*, python-notify is in the extra repository, and can be installed with:

        $ pacman -S python-notify

#### Spell checking ####

For *Ubuntu/Debian based* systems, PyEnchant is in the official repositores, and can be
installed the following way:

        $ sudo apt-get install python-enchant

For *Fedora*, PyEnchant is in the official repositories, and can be installed with:

        $ yum install python-enchant

For *Arch Linux*, PyEnchant is in the community repository, and can be installed with:

        $ pacman -S python2-pyenchant

You now need to install a relevant dictionary.

For *Ubuntu/debian based* systems, look for the appropriate aspell dictionary. For example,
to install the english dictionary:

        $ sudo apt-get install aspell-en

For *Fedora*, search for an aspell dictionary. For example, to install the english dictionary:

        $ yum install aspell-en

For *Arch Linux*, search for an aspell dictionary. For example, to install the english
dictionary:

        $ pacman -S aspell-en

Other OS (such as Mac OSX) should look into [installing PyEnchant and appropriate dictionaries] [pyenchant]

### Installing Snakefire ###

From the path where you have downloaded Snakefire, as root user, do (if you run *Arch Linux*, change 
the python to python2):

        $ python setup.py install
        
For *Ubuntu*, better with sudo:

        $ sudo python setup.py install

#### Running the developer version ####

If you wish to run the latest version of Snakefire, without having to
explicitly install it, follow these instructions (make sure to previously
install the requirements):

1. Get the latest development version by cloning from its GIT repository:

		$ git clone git://github.com/mariano/snakefire
		$ cd snakefire

2. If you are on *KDE*, install the notify configuration to your home directory
   by running the following commands from the directory where you installed
   Snakefire:

		$ export KDE_LOCAL_PREFIX=`kde4-config --localprefix`
		$ mkdir -p $KDE_LOCAL_PREFIX/share/apps/Snakefire
		$ cp packaging/linux/*.notifyrc $KDE_LOCAL_PREFIX/share/apps/Snakefire
		$ killall knotify4

3. You are now ready to run Snakefire. Enter the directory where you installed
Snakefire, and do:

        $ PYTHONPATH=".:snakefire/" bin/snakefire

You can keep up with the latest updates by accessing the directory where
you installed Snakefire, and running:

		$ git pull --rebase

[license]: http://www.opensource.org/licenses/mit-license.php
[packer]: https://aur.archlinux.org/packages.php?ID=33378
[arch-aur-snakefire]: https://aur.archlinux.org/packages.php?ID=53683
[arch-aur-pyfire]: https://aur.archlinux.org/packages.php?ID=52996
[pyfire]: http://github.com/mariano/pyfire
[pyfire-readme]: http://github.com/mariano/pyfire#readme
[python-setuptools]: http://pypi.python.org/pypi/setuptools
[pip]: http://pypi.python.org/pypi/pip
[easy_install]: http://packages.python.org/distribute/easy_install.html
[zakaria_zajac_ppa]: https://launchpad.net/~zak-d/+archive/python-pyfire
[pyqt-download]: http://www.riverbankcomputing.co.uk/software/pyqt/download
[keyring-install]: http://pypi.python.org/pypi/keyring/#installation-instructions
[pyenchant]: http://packages.python.org/pyenchant/tutorial.html#installing-pyenchant
[twitter_mgiglesias]: http://twitter.com/mgiglesias
[website_mgiglesias]: http://marianoiglesias.com.ar
[twitter_madzak]: http://twitter.com/madzak
[website_madzak]: http://www.madzak.com


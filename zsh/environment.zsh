# environment.zsh: Sets up a working shell environment.
# P.C. Shyamshankar <sykora@lucentbeing.com>

# Various Paths
typeset -U path
path=(~/bin ~/lib/python{2.6,3.1}/bin $path /usr/local/bin)
export PATH

typeset -U fpath
fpath=($Z/functions $fpath)

# Proxy Settings.
export http_proxy=http://127.0.0.1:5865
export ftp_proxy=http://127.0.0.1:5865
export https_proxy=http://127.0.0.1:5865

# Find out how many colors the terminal is capable of putting out.
# Color-related settings _must_ use this if they don't want to blow up on less
# endowed terminals.
C=$(tput colors)

# Python per-user site-packages.
export PYTHONUSERBASE=~

# Python Virtualenvwrapper initialization
export WORKON_HOME=~/.virtualenvs
source =virtualenvwrapper_bashrc

# Important applications.
export EDITOR=vim

# History Settings
export SAVEHIST=2000
export HISTSIZE=2000
export HISTFILE=~/.zsh_history

# Zsh Reporting
export REPORTTIME=5

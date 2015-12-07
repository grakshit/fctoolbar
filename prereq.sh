# This is a simple list of installations that were found to be
# useful/necessary to build AFNI from source in Linux (64bit) Ubuntu
# machines, first of the 11.* variety and then of the 12.* kind.

# This most recent list was used on an Ubuntu 12.10 machine in early
# September, 2013.  It appears to continue working on Ubuntu 14.04.

# NB: there is an accompanying Makefile.linux_Ubuntu_64bit which was
# used in conjunction with this list.  Just copy this makefile into
# the afni_src/ directory with the simple name 'Makefile'.

# If you would like to easily enable OpenMP capabilities for speedup
# using some parallelized AFNI programs, then you can make the
# afni_src/Makefile using using 'Makefile.linux_ubuntu_12_64_OMP'.
# Please check the online documentation for system requisites
# (versions of gcc compiler, etc.). If you choose this option, you can
# set the max number of processors to use (<=the number on your
# computer), by adding the following line to your computer's ~/.bashrc
# file:
#    export OMP_NUM_THREADS=N
# where you replace 'N' with your specific number.

# This (executable) file should be executable by typing:
# $ chmod 755 OS_notes.linux_Ubuntu_64bit.txt
# $ ./OS_notes.linux_Ubuntu_64bit.txt
# in a terminal window; you could also copy/past the commands into a
# terminal window, if you wish.  You may be prompted about whether to 
# install some packages, to which methinks you should say yes (since 
# you are running this script in the first place; that is, unless you 
# are about some specific dependency problem elsewhere on the machine).

sudo apt-get -y install libnifti-dev
sudo apt-get -y install libnifti2
sudo apt-get -y install zlib1g
sudo apt-get -y install zlib1g-dev
sudo apt-get -y install libxt-dev
sudo apt-get -y install apt-file
sudo apt-get -y install libmotif4
sudo apt-get -y install libxt6
sudo apt-get -y install x11proto-print-dev
sudo apt-get -y install libmotif-dev
sudo apt-get -y install libxmu-headers
sudo apt-get -y install libglu1-mesa-dev
sudo apt-get -y install libxmu-dev
sudo apt-get -y install libexpat1-dev 
sudo apt-get -y install xmhtml1-dev
sudo apt-get -y install libxpm-dev
sudo apt-get -y install motif-clients
sudo apt-get -y install freeglut3-dev
sudo apt-get -y install libxi-dev 
sudo apt-get -y install libglw1-mesa-dev
sudo apt-get -y install libglib2.0-dev
sudo apt-get -y install libglib2.0
sudo apt-get -y install libgsl0-dev
sudo apt-get -y install libxp-dev
sudo apt-get -y install tcsh
sudo apt-get -y install libnetcdf-dev
#sudo apt-get install lua-expat
sudo apt-get -y install libgtk2.0-dev
sudo apt-get -y install libgnutls-dev
sudo apt-get -y install libsasl2-dev
sudo apt-get -y install python-gtk2-dev


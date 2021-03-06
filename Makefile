# This Makefile works on Linux.
# This is for compiling with GCC 3.3, on a 64-bit CPU.

# CPROF = -pg -g
USE_ZLIB = -DHAVE_ZLIB
LZLIB    = -lz
USE_GIFTI = -DHAVE_GIFTI
#LGIFTI    = /usr/lib64/libexpat.a
LGIFTI    = /usr/lib/x86_64-linux-gnu/libexpat.a
#/usr/lib/x86_64-linux-gnu

# default to having these off
# D_USE_ACML = -DUSE_ACML
# I_USE_ACML = -I/opt/acml3.1.0/gnu64/include
# L_USE_ACML = /opt/acml3.1.0/gnu64/lib/libacml.a

CCDEBS = -DAFNI_DEBUG -DIMSEQ_DEBUG -DDISPLAY_DEBUG -DTHD_DEBUG
CEXTRA = -Wcomment -Wformat -DUSE_TRACING -DHAVE_XDBE $(CPROF)

CC     = /usr/bin/gcc -O2 -m64 -fPIC -ffast-math -mmmx -DREAD_WRITE_64 -DLINUX2 $(CEXTRA)
CCVOL  = /usr/bin/gcc -O2 -m64 -fPIC -ffast-math -mmmx -DLINUX2 $(CEXTRA)
CCFAST = /usr/bin/gcc -O3 -m64 -fPIC -ffast-math -mmmx -DLINUX2 $(CEXTRA) $(D_USE_ACML)
CCOLD  = $(CC)


# The following line includes compiling for the SSE operations.
# However, I found that it actually makes things worse in some test code.
# Your mileage may vary.

# CCFAST = /usr/bin/gcc -O3 -march=i686 -ffast-math -mmmx -msse -mfpmath=sse -DLINUX2 $(CEXTRA)

CCMIN  = /usr/bin/gcc -m64 $(CPROF)
CCD    = $(CC) $(CCDEBS)
IFLAGS = -I. -I/usr/X11R6/include $(I_USE_ACML)
LFLAGS = -L. -L/usr/X11R6/lib64 $(L_USE_ACML)

# maybe 

CCSVD  = /usr/bin/gcc -O0 -m64 -fPIC

PLUGIN_SUFFIX = so
PLUGIN_LFLAGS = -shared -fPIC
PLUGIN_CC     = $(CC)
# PLFLAGS       = -rdynamic -L. -L/usr/X11R6/lib
PLFLAGS       = -rdynamic -L. -L/usr/X11R6/lib64

SHOWOFF = -DSHOWOFF=linux_gcc33_64

AR     = /usr/bin/ar
RANLIB = /usr/bin/ranlib
TAR    = /bin/tar
MKDIR  = /bin/mkdir
GZIP   = /bin/gzip
LD     = /usr/bin/gcc $(CPROF)

RM = /bin/rm -f
MV = /bin/mv -f
CP = /bin/cp -f

LINT = /usr/bin/lint -a -b -u -v -x $(IFLAGS) $(CCDEFS)

INSTALLDIR = ./linux_gcc33_64
LIBDIR = $(INSTALLDIR)

#INSTALL_PREREQ = suma
INSTALL_PREREQ = suma_gts
# uncomment if the Gnu Scientific Library is installed (libgsl, libgslcblas)
# GSLPROGS = balloon
#EXPROGS = gifti_tool $(GSLPROGS)

EXPROGS = $(GSLPROGS)

# for dynamic linking

# LLIBS  = -lmri -lf2c -lXm -lXp -lXpm -lXext -lXmu -lXt -lX11 $(LZLIB) $(LGIFTI) -lm  -ldl -lc

# for static linking to Motif, dynamic to all else

#LLIBS  = -lmri -lf2c /usr/X11R6/lib64/libXm.a -lXp -lXpm -lXext -lXmu -lXt -lSM -lICE -lX11 $(LZLIB) $(LGIFTI) -lm  -ldl -lc

#LLIBS  = -lmri -lf2c /usr/lib/x86_64-linux-gnu/libXm.a -lXp -lXpm -lXext -lXmu -lXt -lSM -lICE -lX11 $(LZLIB) $(LGIFTI) -lm  -ldl -lc -lXft /usr/lib/libnetcdf.so.6.0.0

LLIBS  = -lmri -lf2c /usr/lib/libXm.a -lXp -lXpm -lXext -lXmu -lXt -lSM -lICE -lX11 $(LZLIB) $(LGIFTI) -lm  -ldl -lc -lXft /usr/lib/libnetcdf.so.6.0.0

#LLIBS  = -lmri -lf2c /usr/lib/x86_64-linux-gnu/libXm.a -lXp -lXpm -lXext -lXmu -lXt -lSM -lICE  -lX11 -lxcb $(LZLIB) $(LGIFTI) -lm  -ldl -lc
#/usr/lib/x86_64-linux-gnu

# for static linking, as far as possible

# LLIBS = -lmri -lf2c -ldl               \
#         /usr/X11R6/lib/libXm.a   \
#        /usr/X11R6/lib/libXpm.a  \
#        /usr/X11R6/lib/libXext.a \
#        /usr/X11R6/lib/libXmu.a  \
#        /usr/X11R6/lib/libXt.a   \
#        /usr/X11R6/lib/libSM.a   \
#        /usr/X11R6/lib/libICE.a  \
#        /usr/X11R6/lib/libX11.a  \
#        /usr/lib/libm.a          \
#        /usr/lib/libc.a

# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
# For suma (NO STATIC LINKING OF GL libs)
SUMA_GLIB_VER = -2.0
SUMA_INCLUDE_PATH = -I/usr/X11R6/include -I./ -I../ -I../niml/ -Igts/src -I/usr/include/glib-1.2 -I/usr/include/glib-2.0 -I/usr/lib64/glib/include -I/usr/lib64/glib-2.0/include `pkg-config --cflags --libs gtk+-2.0` 
SUMA_LINK_PATH = -L/usr/lib64 -L/usr/X11R6/lib64 -L../ -L/usr/lib/x86_64-linux-gnu/libfontconfig.so
#use -lGLw if you have libGLw.a or libGLw.so* or 
#  -lMesaGLw if you have Mesa's version (libMesaGLw*) of libGLw
#SUMA_LINK_LIB = /usr/X11R6/lib64/libXm.a -lGLw -lGLU -lGL -lXmu -lXp -lXt -lXext -lX11 $(LZLIB) $(LGIFTI) -lm 
#SUMA_LINK_LIB = /usr/lib/x86_64-linux-gnu/libXm.a -lGLw -lGLU -lGL -lXmu -lXp -lXt -lXext -lX11 $(LZLIB) $(LGIFTI) -lm -lXft /usr/lib/libnetcdf.so.6.0.0 
SUMA_LINK_LIB = /usr/lib/libXm.a -lGLw -lGLU -lGL -lXmu -lXp -lXt -lXext -lX11 $(LZLIB) $(LGIFTI) -lm -lXft /usr/lib/libnetcdf.so.6.0.0
#SUMA_LINK_LIB = /usr/lib/x86_64-linux-gnu/libXm.a -lGLw -lGLU -lGL -lXmu -lXp -lXt -lXext -lX11 -lxcb $(LZLIB) $(LGIFTI) -lm 
#/usr/lib/x86_64-linux-gnu
#-lxcb

SUMA_MAKEFILE_NAME = SUMA_Makefile
SUMA_BIN_ARCHIVE = SUMA_Linux.tar
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

###############################################################

MAKE = make
include Makefile.INCLUDE

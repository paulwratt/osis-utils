dnl aclocal.m4 generated automatically by aclocal 1.3

dnl Copyright (C) 1994, 1995, 1996, 1997, 1998 Free Software Foundation, Inc.
dnl This Makefile.in is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY, to the extent permitted by law; without
dnl even the implied warranty of MERCHANTABILITY or FITNESS FOR A
dnl PARTICULAR PURPOSE.

# Do all the work for Automake.  This macro actually does too much --
# some checks are only needed if your package does certain things.
# But this isn't really a big deal.

# serial 1

dnl Usage:
dnl AM_INIT_AUTOMAKE(package,version, [no-define])

AC_DEFUN(AM_INIT_AUTOMAKE,
[AC_REQUIRE([AM_PROG_INSTALL])
PACKAGE=[$1]
AC_SUBST(PACKAGE)
VERSION=[$2]
AC_SUBST(VERSION)
dnl test to see if srcdir already configured
if test "`cd $srcdir && pwd`" != "`pwd`" && test -f $srcdir/config.status; then
  AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
fi
ifelse([$3],,
AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE")
AC_DEFINE_UNQUOTED(VERSION, "$VERSION"))
AC_REQUIRE([AM_SANITY_CHECK])
AC_REQUIRE([AC_ARG_PROGRAM])
dnl FIXME This is truly gross.
missing_dir=`cd $ac_aux_dir && pwd`
AM_MISSING_PROG(ACLOCAL, aclocal, $missing_dir)
AM_MISSING_PROG(AUTOCONF, autoconf, $missing_dir)
AM_MISSING_PROG(AUTOMAKE, automake, $missing_dir)
AM_MISSING_PROG(AUTOHEADER, autoheader, $missing_dir)
AM_MISSING_PROG(MAKEINFO, makeinfo, $missing_dir)
AC_REQUIRE([AC_PROG_MAKE_SET])])


# serial 1

AC_DEFUN(AM_PROG_INSTALL,
[AC_REQUIRE([AC_PROG_INSTALL])
test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT='${INSTALL_PROGRAM}'
AC_SUBST(INSTALL_SCRIPT)dnl
])

#
# Check to make sure that the build environment is sane.
#

AC_DEFUN(AM_SANITY_CHECK,
[AC_MSG_CHECKING([whether build environment is sane])
# Just in case
sleep 1
echo timestamp > conftestfile
# Do `set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   set X `ls -Lt $srcdir/configure conftestfile 2> /dev/null`
   if test "[$]*" = "X"; then
      # -L didn't work.
      set X `ls -t $srcdir/configure conftestfile`
   fi
   if test "[$]*" != "X $srcdir/configure conftestfile" \
      && test "[$]*" != "X conftestfile $srcdir/configure"; then

      # If neither matched, then we have a broken ls.  This can happen
      # if, for instance, CONFIG_SHELL is bash and it inherits a
      # broken ls alias from the environment.  This has actually
      # happened.  Such a system could not be considered "sane".
      AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
alias in your environment])
   fi

   test "[$]2" = conftestfile
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
rm -f conftest*
AC_MSG_RESULT(yes)])

dnl AM_MISSING_PROG(NAME, PROGRAM, DIRECTORY)
dnl The program must properly implement --version.
AC_DEFUN(AM_MISSING_PROG,
[AC_MSG_CHECKING(for working $2)
# Run test in a subshell; some versions of sh will print an error if
# an executable is not found, even if stderr is redirected.
# Redirect stdin to placate older versions of autoconf.  Sigh.
if ($2 --version) < /dev/null > /dev/null 2>&1; then
   $1=$2
   AC_MSG_RESULT(found)
else
   $1="$3/missing $2"
   AC_MSG_RESULT(missing)
fi
AC_SUBST($1)])

# Like AC_CONFIG_HEADER, but automatically create stamp file.

AC_DEFUN(AM_CONFIG_HEADER,
[AC_PREREQ([2.12])
AC_CONFIG_HEADER([$1])
dnl When config.status generates a header, we must update the stamp-h file.
dnl This file resides in the same directory as the config header
dnl that is generated.  We must strip everything past the first ":",
dnl and everything past the last "/".
AC_OUTPUT_COMMANDS(changequote(<<,>>)dnl
ifelse(patsubst(<<$1>>, <<[^ ]>>, <<>>), <<>>,
<<test -z "<<$>>CONFIG_HEADERS" || echo timestamp > patsubst(<<$1>>, <<^\([^:]*/\)?.*>>, <<\1>>)stamp-h<<>>dnl>>,
<<am_indx=1
for am_file in <<$1>>; do
  case " <<$>>CONFIG_HEADERS " in
  *" <<$>>am_file "*<<)>>
    echo timestamp > `echo <<$>>am_file | sed -e 's%:.*%%' -e 's%[^/]*$%%'`stamp-h$am_indx
    ;;
  esac
  am_indx=`expr "<<$>>am_indx" + 1`
done<<>>dnl>>)
changequote([,]))])

# Configure paths for ogemlibis
# Christer Gustavsson 98-09-20

dnl AM_PATH_OGEMLIBIS([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND [, MODULES]]]])
dnl Test for ogemlibis, and define OGEMLIBIS_CFLAGS and OGEMLIBIS_LIBS

AC_DEFUN(AM_PATH_OGEMLIBIS,
[dnl 
dnl Get the cflags and libraries from the ogemlibis-config script
dnl
AC_ARG_WITH(ogemlibis-prefix,[  --with-ogemlibis-prefix=PFX   Prefix where oogemlibis is installed (optional)],
            ogemlibis_config_prefix="$withval", ogemlibis_config_prefix="")
AC_ARG_WITH(ogemlibis-exec-prefix,[  --with-ogemlibis-exec-prefix=PFX Exec prefix where ogemlibis is installed (optional)],
            ogemlibis_config_exec_prefix="$withval", ogemlibis_config_exec_prefix="")
AC_ARG_ENABLE(ogemlibistest, [  --disable-ogemlibistest       Do not try to compile and run a test ogemlibis program],
		    , enable_ogemlibistest=yes)

  if test x$ogemlibis_config_exec_prefix != x ; then
     ogemlibis_config_args="$ogemlibis_config_args --exec-prefix=$ogemlibis_config_exec_prefix"
     if test x${OGEMLIBIS_CONFIG+set} != xset ; then
        OGEMLIBIS_CONFIG=$ogemlibis_config_exec_prefix/bin/ogemlibis-config
     fi
  fi
  if test x$ogemlibis_config_prefix != x ; then
     ogemlibis_config_args="$ogemlibis_config_args --prefix=$ogemlibis_config_prefix"
     if test x${OGEMLIBIS_CONFIG+set} != xset ; then
        OGEMLIBIS_CONFIG=$ogemlibis_config_prefix/bin/ogemlibis-config
     fi
  fi

  AC_PATH_PROG(OGEMLIBIS_CONFIG, ogemlibis-config, no)
  min_ogemlibis_version=ifelse([$1], ,0.0.6,$1)
  AC_MSG_CHECKING(for ogemlibis - version >= $min_ogemlibis_version)
  no_ogemlibis=""
  if test "$OGEMLIBIS_CONFIG" = "no" ; then
    no_ogemlibis=yes
  else
    OGEMLIBIS_CFLAGS=`$OGEMLIBIS_CONFIG $ogemlibis_config_args --cflags`
    OGEMLIBIS_LIBS=`$OGEMLIBIS_CONFIG $ogemlibis_config_args --libs`
    ogemlibis_config_major_version=`$OGEMLIBIS_CONFIG $ogemlibis_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    ogemlibis_config_minor_version=`$OGEMLIBIS_CONFIG $ogemlibis_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    ogemlibis_config_micro_version=`$OGEMLIBIS_CONFIG $ogemlibis_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_ogemlibistest" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $OGEMLIBIS_CFLAGS"
      LIBS="$LIBS $OGEMLIBIS_LIBS"
     fi
  fi
  if test "x$no_ogemlibis" = x ; then
     AC_MSG_RESULT(yes)
     ifelse([$2], , :, [$2])     
  else
     AC_MSG_RESULT(no)
     if test "$OGEMLIBIS_CONFIG" = "no" ; then
       echo "*** The ogemlibis-config script installed by ogemlibis could not be found"
       echo "*** If ogemlibis was installed in PREFIX, make sure PREFIX/bin is in"
       echo "*** your path, or set the OGEMLIBIS_CONFIG environment variable to the"
       echo "*** full path to ogemlibis-config."
     else
        :
     fi
     OGEMLIBIS_CFLAGS=""
     OGEMLIBIS_LIBS=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(OGEMLIBIS_CFLAGS)
  AC_SUBST(OGEMLIBIS_LIBS)
])


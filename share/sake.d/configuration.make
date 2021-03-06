########################################################################
# configuration.make -- Global GMake configuration.
#
# Debugging variables:
# 	VERBOSE
# 	TRACE

export TRACE ?=
export VERBOSE ?=

########################################################################
# Prerequisites.
########################################################################

# We are using some of the newest GNU Make features... so require GNU
# Make version >= 3.82.
version_test := $(filter 3.82,$(firstword $(sort $(MAKE_VERSION) 3.82)))
ifndef version_test
$(error GNU Make version $(MAKE_VERSION); version >= 3.82 is needed)
endif

# Only one target at the same time.
MAKECMDGOALS ?= build

########################################################################
# Make configuration.
########################################################################

#!# Use renamed makefile
#!MAKE += --makefile=Sakefile

# Disable builtins.
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables

# Warn when an undefined variable is referenced.
MAKEFLAGS += --warn-undefined-variables

# Make will not print the recipe used to remake files.
$(VERBOSE).SILENT:

# Eliminate use of the built-in implicit rules. Also clear out the
# default list of suffixes for suffix rules.
.SUFFIXES:

# Sets the default goal to be used if no targets were specified on the
# command line.
.PHONY: build
.DEFAULT_GOAL := build

# Default shell: if we require GNU Make, why not require Bash?
SHELL := /bin/bash

# The argument(s) passed to the shell are taken from the variable
# .SHELLFLAGS.
.SHELLFLAGS := -o errexit -o pipefail -o nounset -c

# Make will delete the target of a rule if it has changed and its recipe
# exits with a nonzero exit status.
.DELETE_ON_ERROR:

# Enable a second expansion of the prerequisites.
.SECONDEXPANSION:

########################################################################
# Common macros
########################################################################

# Hacks for string manipulation.
#!comma := ,
#!empty :=
#!space := $(empty) $(empty)
#!tab := $(empty)	$(empty)

# Hack for list manipulation.
#!define rest =
#!$(wordlist 2,2147483648,$1)
#!endef

# File name without extension nor directory.
#!define filename
#!$(basename $(notdir $1))
#!endef

# vim:ai:sw=8:ts=8:noet:fileencoding=utf8:syntax=make

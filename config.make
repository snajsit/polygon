### Commands

CP                             := cp -rv

# The `dpkg-deb` path and its flags
DPKG-DEB                       ?= dpkg-deb
DPKG-DEB_FLAGS                 ?= -v

# The `lintian` path and its flags
LINTIAN                        ?= lintian
LINTIAN_FLAGS                  ?= \
  --profile debian \
  --verbose

MKDIR                          := mkdir -pv

RM                             := rm -rvf

### Locations

SRC                             = src
STAGE                           = stage

### Misc.

# The architecture
ARCH                           ?= all

# The name of the final .deb file
DEB                            ?= $(NAME)_$(VERSION)_$(ARCH).deb

# The package name
NAME                           ?= polygon

# The package version
VERSION                        := $(shell git describe | cut -c 2-)

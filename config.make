# The architecture
ARCH                           ?= all

# The name of the final .deb file
DEB                             = $(NAME)_$(VERSION)_$(ARCH).deb

# The `dpkg-deb` path and its flags
DPKG-DEB                       ?= dpkg-deb
DPKG-DEB_FLAGS                 ?= -v

# The `lintian` path and its flags
LINTIAN                        ?= lintian
LINTIAN_FLAGS                  ?= \
  --profile debian \
  --verbose

# The package name
NAME                           ?= polygon

# The source directory
SRC                            ?= src

# The package version
VERSION                        ?= $(shell git describe | cut -c 2-)

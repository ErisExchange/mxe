# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtdeclarative
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := fd13dd3059d20694a857ed30ee56a2ade908c0cb93246f9804a65f7a2d775d56
$(PKG)_SUBDIR    = $(subst qtbase,qtdeclarative,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtdeclarative,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtdeclarative,$(qtbase_URL))
$(PKG)_DEPS     := gcc qtbase qtsvg qtxmlpatterns

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef

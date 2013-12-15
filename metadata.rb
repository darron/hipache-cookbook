# encoding: utf-8
name             'hipache'
maintainer       'Darron Froese'
maintainer_email 'darron@froese.org'
license          'Apache 2.0'
description      'Installs/configures hipache'
version          '0.1.0'
recipe           'hipache::default', 'Installs/configures hipache'

depends 'nodejs'

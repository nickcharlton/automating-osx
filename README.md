# Automating OS X

This is a set of scripts to help automate the configuration of OS X boxes. It's
targeted at VMs which might be configured for Jenkins, or as standardised
boxes.

## Scripts

* `bootstrap.sh`: Configures Xcode Command Line Tools, Homebrew and
  dependencies.
* `defaults.sh`: Configures OS X UI defaults and settings.
* `dock.sh`: Configures the Dock with a default contents.
* `jenkins.sh`: Installs and configures [Jenkins][].

## Author

Copyright (c) 2016 Nick Charlton <nick@nickcharlton.net>.

[Jenkins]: https://nickcharlton.net/posts/installing-jenkins-osx-yosemite.html

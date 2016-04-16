# Automating OS X

This is a set of scripts to automate the configuration of OS X boxes. It's
targeted at VMs which might be configured for Jenkins, or as standardised
testing boxes.

## Scripts

* `bootstrap.sh`: Configures Xcode Command Line Tools, Homebrew and
  dependencies.
* `defaults.sh`: Configures OS X UI defaults and settings.
* `dock.sh`: Configures the Dock with a default contents.
* `jenkins.sh`: Installs and configures [Jenkins][].

[Jenkins]: https://nickcharlton.net/posts/installing-jenkins-osx-yosemite.html

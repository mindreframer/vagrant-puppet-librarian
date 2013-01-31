# Vagrant-puppet-librarian
- this repository combines in a simple and effective way [Librarian-Puppet] + [Puppet] for [Vagrant]

## Problem
I assume you know, what pain points [Librarian-puppet] solves, [Librarian-puppet] can help by managing the [Puppet] modules used by your [Vagrant] box. But you can not use puppet provisioner like intended, because modules are not all installed your first run (it's [Librarian-Puppet]'s responsibility).


## Solution

I have looked at similar solutions:

  - https://github.com/aggressivex/vagrant-startup-environment
  - https://github.com/purple52/librarian-puppet-vagrant
  - https://github.com/garethr/riemann-vagrant

I did not quite like them, because they force me to install librarian-puppet on **my system**.
So I took the example from `purple52` and changed it a bit (from _two_ provisioners (shell + puppet) to just one)

The simple solution implemented here uses a shell provisioner in your Vagrant
configuration to install and run Librarian-puppet and also **run puppet**.

Like this:

    `puppet apply -vv  --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/main.pp`

It also installs two scripts for you:
- `runpuppet`
- `runlibrarian`

So, you don't have to `vagrant reload`, which restarts your VM.... (duh???)

## How to use

This repository is really just a template; copy the relevant files into your
own project. Here's a breakdown of what's required:

* `Vagrantfile` with simple shell provisioner definition
* `shell/bootstrap.sh` - a simple shell provisioner to install and run Librarian-puppet and also Puppet
* `puppet/Puppetfile` - configuration describing what Puppet modules to install. See the
[Librarian-puppet](https://github.com/rodjek/librarian-puppet) project for details.
* `puppet/manifests/main.pp` - your main Puppet manifest.
* `puppet/.gitignore` - configured to ignore temporary directories and files created by Librarian-puppet.

## Contribute

Patches and suggestions welcome.

## Issues

Please raise issues via the github issue tracker.

## License

Please see the [LICENSE](https://github.com/mindreframer/vagrant-puppet-librarian/blob/master/LICENSE)
file.


[Vagrant]: http://vagrantup.com
[Puppet]: http://puppetlabs.com
[Librarian-Puppet]: https://github.com/rodjek/librarian-puppet

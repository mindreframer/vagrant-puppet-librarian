class basic{
  # run apt-get update before anything else runs
  class {'basic::update_aptget': stage => first} ->
  class {"basic::users":} ->
  class {"basic::packages":} ->
  class {"basic::helpers":}
}

class basic::users{
  group { "puppet":
    ensure => "present",
  }
}

# just some packages
class basic::packages{
  package{"tmux": ensure => installed}
  package{"curl": ensure => installed}
  package{"vim":  ensure => installed}
}


class basic::helpers{
  $puppet_dir = "/vagrant/puppet"
  # script to run puppet
  file{"/usr/local/bin/runpuppet":
    content => " \
    sudo puppet apply -vv  --modulepath=$puppet_dir/modules/ $puppet_dir/manifests/main.pp\n",
    mode    => 0755
  }

  # script to run librarian-puppet
  file{"/usr/local/bin/runlibrarian":
    content => "cd $puppet_dir &&  sudo librarian-puppet update \n",
    mode    => 0755
  }
}

# brings the system up-to-date after importing it with Vagrant
# runs only once after booting (checks /tmp/apt-get-update existence)
class basic::update_aptget{
  exec{"apt-get update && touch /tmp/apt-get-updated":
    unless => "test -e /tmp/apt-get-updated"
  }
}
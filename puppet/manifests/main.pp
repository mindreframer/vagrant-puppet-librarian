
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
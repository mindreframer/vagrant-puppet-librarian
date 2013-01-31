node default {
  class{"rvm": }
  ->
  exec{"rvm::mount::ruby-1.9.3-p374-turbo":
    command => "rvm mount -r http://master.dl.sourceforge.net/project/rvmbinaries/ubuntu/12.04/x86_64/ruby-1.9.3-p374-turbo.tar.bz2 --verify-downloads 1"
  }

  # http://master.dl.sourceforge.net/project/rvmbinaries/ubuntu/12.04/x86_64/ruby-1.9.3-p374-turbo.tar.bz2
  # rvm_system_ruby {
  #   'ruby-1.9.3-p374-turbo':
  #     ensure      => present,
  #     default_use => false;
  #   'ree-1.8.7-2012.02':
  #     ensure      => present,
  #     default_use => false;
  # }
}



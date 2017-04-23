node 'development-python3.6.vm' {

  # Configure mysql
  class { '::mysql::server':
    root_password           => 'mysql',
  }
 
  include php

  # Configure apache
  include apache
  include apache::mod::php
  apache::vhost { $::fqdn:
    port    => '80',
    docroot => '/var/www/html',
    require => File['/var/www/html'],
  }

  # Configure Docroot and index.html
  file { ['/var/www', '/var/www/html']:
    ensure => directory
  }

  file { '/var/www/html/index.php':
    ensure  => file,
    content => '<?php echo \'<p>Hello World</p>\'; ?> ',
  }

  # Create Symlink to /usr/local/bin/python3.6 & pip3.6
  file { '/usr/local/bin/python':
    ensure => 'link',
    target => '/usr/local/bin/python3.6',
  }

  file { '/usr/local/bin/pip':
    ensure => 'link',
    target => '/usr/local/bin/pip3.6',
  }

}


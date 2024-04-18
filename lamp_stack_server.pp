package { 'apache2':
  ensure => installed,
}

package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

package { 'libapache2-mod-php':
  ensure => installed,
  require => Package['apache2'],
}

package { 'php-cli':
  ensure => installed,
  require => Package['apache2'],
}

package { 'php-mysql':
  ensure => installed,
  require => [Package['apache2'], Package['php']],
}

file { '/var/www/html/phpinfo.php':
  source => '/home/trenzingesar/TG_inet4031_puppet_lab9/phpinfo.php',
  notify  => Service['apache2'],
  require => [Package['apache2']]

}

service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']]
}

package { 'mariadb-server':
  ensure => installed,
}

service { 'mysql':
  ensure => running,
  enable => true,
  require => Package['mariadb-server'],
}

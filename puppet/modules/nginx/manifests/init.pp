# Class: nginx::nginx
#
# Install Nginx.
#
# Parameters:
# 
# Actions:
#   Install nginx and make sure it's running.
# 
# Requires:
#   -
#
# Sample Usage:
#     include nginx::nginx
#
class nginx {
  include nginx::repo
  
  #
  # Install nginx and get it from the Offical nginx Repo
  #
  package { 'nginx':
    ensure  => present,
    require => Class['nginx::repo']
  }
  
  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package["nginx"],
    restart    => '/etc/init.d/nginx restart'
  }
  
  #
  # Add our nginx.conf file
  #
  file { '/etc/nginx/nginx.conf':
    source  => "puppet:///modules/nginx/nginx.conf",
	ensure  => "present",
	require => Package['nginx'],
    notify  => Service['nginx'],
  }

  #
  # Disable default configuration if it exists...
  # Probably won't be there on CentOS
  #
  file { 'default-nginx-disable':
    path    => '/etc/nginx/sites-enabled/default',
    ensure  => absent,
    notify  => Service['nginx'],
    require => Package['nginx']
  }
  
  file { '/etc/nginx/conf.d/default.conf':
    ensure  => absent,
    notify  => Service['nginx'],
    require => Package['nginx']
  }
  
  #
  # Lets the Debian style sites-enabled and sites-available dirs!
  #
  file { "/etc/nginx/sites-enabled/":
	ensure  => directory,
	path    => "/etc/nginx/sites-enabled/",
	owner   => "root",
	group   => "root",
	mode    => "0664",
	require => Package["nginx"],
  }
  
  file { "/etc/nginx/sites-available/":
	ensure  => directory,
	path    => "/etc/nginx/sites-available/",
	owner   => "root",
	group   => "root",
	mode    => "0664",
	require => Package["nginx"],
  }
}
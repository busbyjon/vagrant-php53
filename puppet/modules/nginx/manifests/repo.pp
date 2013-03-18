# Add the Official Red Hat/CentOS repo for Nginx from nginx.org
class nginx::repo {
    
  yumrepo { 'nginx':
    baseurl    => "http://nginx.org/packages/centos/\$releasever/\$basearch/",
    descr      => "Nginx Offical Repo",
    enabled    => '1',
    gpgcheck   => '0',
    priority   => '20',
    require    => Package['yum-plugin-priorities'],
  }

}
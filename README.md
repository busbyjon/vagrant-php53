Vagrant/Puppet PHP 5.3
======================

PHP5.3 CentOS development server provisioned using Vagrant and Puppet. Puppet installs:

* PHP5.3 
 * PHP-FPM
 * XDebug on port 9000
 * Suhosin
 * MySQL PDO drivers
* MySQL 5.1
* Nginx
* Memcache

Requirements:
-------------

* A CentOS 6.x Vagrant box

How to use:
-----------

Clone this repository with:

```shell
git clone https://github.com/partnermarketing/vagrant-php53.git
```

In the vagrant-php53 directory run:

```shell
vagrant up
```

Visit http://localhost:8000/ in a web browser

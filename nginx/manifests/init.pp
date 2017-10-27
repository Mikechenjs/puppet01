
#cat /etc/puppet/modules/nginx/manifests/init.pp
# Class: nginx
#
#Install nginx.
#
#Parameters:
# * $nginx_user. Defaults to 'nginx'.
# * worker_processes. Defaults to <%= processorcount %>.
#
#Create config directories :
# * /etc/nginx/conf.d for sites includes
#
#Templates:
# - nginx.conf.erb => /etc/nginx/nginx.conf
#
  
class nginx {
$real_nginx_user = $nginx_user ? { '' => 'nginx', default => $nginx_user }
$nginx_conf      = "/etc/nginx/conf.d"
$nginx_logrote   = "/etc/nginx/conf.d/nginx_logrote.sh"
yumrepo { "nginx":
descr    => "nginx repo",
baseurl  => "http://nginx.org/packages/centos/\$releasever/\$basearch/",
gpgcheck => "0",
enabled  => "1";
}
package { "nginx":
ensure        => installed,
require       => Yumrepo["nginx"],
allow_virtual => false;
}
service { 'nginx':
ensure     => running,
enable     => true,
hasrestart => true,
hasstatus  => true,
}
}

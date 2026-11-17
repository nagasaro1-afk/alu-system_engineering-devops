# Raises the Nginx open-file limit so it can handle more concurrent requests
exec { 'fix--for-nginx':
  command  => "sed -i 's/^ULIMIT=.*/ULIMIT=\"-n 4096\"/' /etc/default/nginx",
  provider => 'shell',
}

exec { 'restart-nginx':
  command  => 'service nginx restart',
  provider => 'shell',
  require  => Exec['fix--for-nginx'],
}

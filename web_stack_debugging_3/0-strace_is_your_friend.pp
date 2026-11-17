# Fixes the Apache 500 error: WordPress loads a .phpp file instead of .php
exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/',
}

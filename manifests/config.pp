class uwsgi::config {
  $require = Class["uwsgi::install"]

  File {
    owner   => "root",
    group   => "root",
    mode    => "0644",
    require => $require,
  }

  file { "/etc/init/uwsgi.conf":
    ensure  => file,
    mode    => "0755",
    source  => "puppet:///modules/uwsgi/etc/init/uwsgi.conf",
  }

  file { "/etc/uwsgi":
    ensure  => directory,
  }

  file { "/etc/uwsgi/apps-available":
    ensure  => directory,
    require => File["/etc/uwsgi"],
  }

  file { "/etc/uwsgi/apps-enabled":
    ensure  => directory,
    require => File["/etc/uwsgi"],
  }

  file { "/var/run/uwsgi":
    ensure  => directory,
    owner   => "www-data",
    group   => "www-data",
  }

  file { "/var/log/uwsgi":
    ensure  => directory,
  }
}
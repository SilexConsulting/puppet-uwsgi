define uwsgi::resource::app(
  $ensure = "present",
  $options = {},
) {
  $require = Class["uwsgi::config"]

  if !($ensure in ["present", "absent"]) {
    fail("[uwsgi::resource::app] invalid ensure value '${ensure}'")
  }

  File {
    owner => "root",
    group => "root",
    mode  => "0644",
  }

  file { "/etc/uwsgi/apps-available/${name}.ini":
    ensure  => $ensure,
    content => template("uwsgi/app.ini.erb"),
    notify  => Class["uwsgi::service"],
    require => $require,
  }

  file { "/etc/uwsgi/apps-enabled/${name}.ini":
    ensure  => $ensure ? {
      "present" => link,
      "absent"  => absent,
    },
    target  => "/etc/uwsgi/apps-available/${name}.ini",
    notify  => Class["uwsgi::service"],
    require => File["/etc/uwsgi/apps-available/${name}.ini"],
  }

  file { "/var/log/uwsgi/${name}.log":
    ensure => $ensure,
    owner  => "www-data",
    group  => "www-data",
    notify => Class["uwsgi::service"],
  }
}
class uwsgi::install {
  if ! defined(Package["python-dev"]) {
    package { "python-dev":
      ensure => present,
    }
  }

  if ! defined(Package["python-pip"]) {
    package { "python-pip":
      ensure => present,
    }
  }

  if ! defined(Package["uwsgi"]) {
    package { "uwsgi":
      ensure   => present,
      provider => pip,
      require  => [ Package["python-dev"], Package["python-pip"] ],
    }
  }
}
class influxdb::install {
  $ensure = $::ensure
  $version = $::version

  Exec {
    path => '/usr/bin:/bin',
  }

  if $influxdb::manage_repos {
    class { 'influxdb::repo': }
  }

  if $influxdb::manage_install {
    if $ensure == 'absent' {
      $_ensure = $ensure
    } else {
        $_ensure = $version
    }

    package { 'influxdb':
      ensure => $_ensure,
      tag    => 'influxdb',
    }
  }
}

class datadog_agent::integrations::carabiner inherits datadog_agent::params {
  include datadog_agent

  file { "${datadog_agent::conf6_dir}/carabiner.yaml":
    ensure  => file,
    owner   => $datadog_agent::params::dd_user,
    group   => $datadog_agent::params::dd_group,
    mode    => '0600',
    content => template('datadog_agent/agent-conf.d/carabiner.yaml.erb'),
    require => Package[$datadog_agent::params::package_name],
    notify  => Service[$datadog_agent::params::service_name]
  }
}

#
# == Class: localbackups
#
# Ensure a local backup directory exists. Other modules will configure the local 
# backup scripts (e.g. mysqldump-based) to put stuff under that directory, 
# simplifying configuration of the actual backup tool (e.g. bacula).
#
# == Parameters
#
# [*backup_dir*]
#   Path to the backup directory. Defaults to /var/backups/local.
#
# == Examples
#
# class { 'localbackups': }
#
# == Authors
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-lisence
# See file LICENSE for details
#
class localbackups(
    $backup_dir = '/var/backups/local'
)
{

    file { 'localbackups-local':
        name => "$backup_dir",
        ensure => directory,
        owner => root,
        group => root,
        mode => 750,
    }

}

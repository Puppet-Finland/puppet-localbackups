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
    include localbackups::params

    # On RedHat/CentOS the /var/backups directory does not exist. Puppet 
    # can't recursively create missing parent directories as discussed here:
    #
    # <http://projects.puppetlabs.com/issues/2952>
    #
    # So, we have to create /var/backups manually, unfortunately regardless of 
    # what the value of $backup_dir parameter is. If we chose to create the 
    # '/var/backups' directory only if $backup_dir has it's default value we 
    # couldn't add a dependency relation to it from the '/var/backups/local' 
    # file, because if $backup_dir had non-default value the '/var/backups' File 
    # resource would not be there, and the Puppet run would fail. If we didn't 
    # add a dependency relation then we might get occasional a Puppet run 
    # failures due to a missing parent directory. By always creating 
    # /var/backups we avoid all this mess at the cost of having one (possibly) 
    # redundant directory.

    file { 'localbackups-backups':
        name => '/var/backups',
        ensure => directory,
        owner => root,
        group => "${::localbackups::params::admingroup}",
        mode => 755,
    }

    file { 'localbackups-local':
        name => "$backup_dir",
        ensure => directory,
        owner => root,
        group => "${::localbackups::params::admingroup}",
        mode => 750,
        require => File['localbackups-backups'],
    }

}

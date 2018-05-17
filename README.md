# localbackups

A Puppet module for creating a directory for local backups (e.g. database, LDAP 
or SVN dumps).

# Module usage

Ensure that the default backup directory (/var/backups/local) is present and has 
correct permissions:

    include ::localbackups

Manage a custom backup directory instead:

    class { '::localbackups':
      backup_dir => '/data/backups',
    }

For details see [init.pp](manifests/init.pp).

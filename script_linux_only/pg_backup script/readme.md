## pg_backup script
Daily backup with rotation for your postgresql database

Designed for Linux only.

### Requirements

- python 2.7
- rotate_backups module

### Configuration
Open the script and change variables in proper their section.
The default policy keeps the following backups:

* 0 hourly
* 5 daily
* 2 weekly
* 2 monthly
* 2 yearly

You can change it as you like.

### Before installation...
If you want custom configuration, it's better you do this now.

Note that this script assumes you:

- have already set up .pgpass file for root user,
- have already created the 'mirror' db and set up its permissions!

### Installation
Download the script wherever you want, then open a terminal in that dir. Then run 

```
$ sudo cp pg_backup.sh /usr/local/bin/pg_backup
$ sudo chmod +x /usr/local/bin/pg_backup
```

### Usage

Put the crontab in cron using ```crontab -e```. You can customize it, if you want to.

### License

Please check the main repo, CLI_utils.

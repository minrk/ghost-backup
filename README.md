# ghost-backup

Backup [ghost](https://ghost.org/) blog data.

This does two things:

1. Download the JSON export of the ghost post database
2. Make a copy of the ghost content directory (image assets, etc.)

Part 2 is only run

## Install

    gem install ghost-backup

## Usage

### Config

The first step is to generate `ghost-backup.yml`:

    $> ghost-backup config
    Writing config to ghost-backup.yml

The edit this file:

```yaml
---
username: 
backup_dir: ghost-backup/%Y-%m-%d-%H%M%S
ghost_dir: /var/www/ghost
refresh_token: 
base_url: https://localhost
```

- **username:** the username you use to login to the ghost server (optional)
- **backup_dir:** where backups should go. This passed to `strftime` at expor time
- **ghost_dir:** where on the local filesystem ghost is installed. If this location does not exist,
  local assets will not be backed up, only the post database.
- **refresh_token:** ignore; this will be populated by the program when you login.
- **base_url:** the base URL of your ghost instance, e.g. `https://myblog.plumbing`

### Login

Once you have your `ghost-backup.yml`, you can login to ghost:

    $> ghost-backup login
    Logging in to https://my.blog/ghost/api/v0.1/authentication/token
    Need username, password to generate new token (only used once, not stored).
    Username: |you@email.com| 
    Password (not stored): *****
    Writing config to ghost-backup.yml

Ghost tokens expire after a week, so to keep them alive you have to login at least once a week:

    $> ghost-backup login
    Logging in to https://my.blog/ghost/api/v0.1/authentication/token

Unless your token expires, logins after the first will not require a username or password.

### Backup

Now you can run a backup:

    $> ghost-backup
    Backing up 'https://my.blog' to '/backup/ghost-backup-2015-09-15-1306'
    Copying /var/www/ghost/content → /backup/ghost-backup-2015-09-15-1306/content
    Downloading ghost database https://blog.jupyter.org/ghost/api/v0.1/db/
    Backing up database to '/backup/ghost-backup-2015-09-15-1306/ghost-db.json'

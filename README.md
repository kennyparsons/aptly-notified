# Aptly Notified
Aptly Notified is a simple bash script to send email notifications of apt package updates.

## Usage
```bash
git pull https://github.com/kennyparsons/aptly-notified.git
chmod +x aptly-notified/aptly-notified.sh
```
Run the script via cron or systemd timers. 
e.g. every day at 8AM.
```bash
0 8 * * * /opt/ptly-notified/aptly-notified.sh >/dev/null 2>&1
```

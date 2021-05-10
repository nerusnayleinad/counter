# Counter

Counter with state

1.- set the days, hours and minutes left for the event
2.- add a cronjob to the crontab to e executed every minute.
$ sudo crontab -e
$ * * * * * /var/www/script-state.sh

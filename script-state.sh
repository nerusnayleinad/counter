#! /bin/bash

PATH='/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games'

value_days=`grep 'let days' /var/www/html/script.js | awk -F '= ' '{print $2}' | sed 's/.$//'`
value_hours=`grep 'let hours' /var/www/html/script.js | awk -F '= ' '{print $2}' | sed 's/.$//'`
value_minutes=`grep 'let minutes' /var/www/html/script.js | awk -F '= ' '{print $2}' | sed 's/.$//'`

old_value_days=$value_days
old_value_hours=$value_hours
old_value_minutes=$value_minutes

if [[ $value_minutes -eq 0 ]] && [[ $value_hours -eq 0 ]]
then
    ((value_days=value_days-1))
    sudo /usr/bin/sed -i "s/let days = $old_value_days/let days = $value_days/g" /var/www/html/script.js
    sudo /usr/bin/sed -i "s/let hours = 0/let hours = 23/g" /var/www/html/script.js
    sudo /usr/bin/sed -i "s/let minutes = 0/let minutes = 59/g" /var/www/html/script.js
elif [[ $value_minutes -eq 0 ]] && [[ $value_hours -gt 0 ]]
then
    ((value_hours=value_hours-1))
    sudo /usr/bin/sed -i "s/let hours = $old_value_hours/let hours = $value_hours/g" /var/www/html/script.js
    sudo /usr/bin/sed -i "s/let minutes = 0/let minutes = 59/g" /var/www/html/script.js 
else
    ((value_minutes=value_minutes-1))
    sudo /usr/bin/sed -i "s/let minutes = $old_value_minutes/let minutes = $value_minutes/g" /var/www/html/script.js
fi

echo $value_days
echo $value_hours
echo $value_minutes

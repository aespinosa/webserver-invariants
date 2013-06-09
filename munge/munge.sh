zcat NASA_access_log_*.gz  | ruby -n -e 'puts $_.encode("UTF-8", "UTF-8", invalid: :replace).match(/\[(.*):\d\d \-0400\]/)[1]'  | sort | uniq -c > traffic-per-minute.log

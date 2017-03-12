# Release Schedule: testing

Repo for tracking qTox release schedule.



*Use [`switch.sh`] script to alter the current state `merging | testing`.*

To get release date of the next qTox version:

```bash
next_date() { date -d @$(( $(date -d "$@" '+%s') + $(( 3600 * 24 * 7 * 6 )) )) '+%Y-%m-%d'; }

# supply date of the last release, e.g. 2016-12-25
next_date 2016-12-25
```


[`switch.sh`]: /switch.sh

Ruby wrapper for the [unofficial Jawbone UP API](http://eric-blue.com/projects/up-api/). 

Work in progress. 

Find out your token:

    s = Jawbone::Session.new "you@youremail.com", "yourpassword"
    s.token # puts your Jawbone UP token

Your feed in JSON format:		

    s = Jawbone::Session.new "you@youremail.com", "yourpassword"
    s.feed

Average time it takes you to fall asleep: 

    s.average_time_to_sleep
    => 650.7692307692307

Daily Summary:

    summary = s.daily_summary "2011-12-29"

    $> summary.steps
    => 13007

    $> summary.sleep_quality
    => 83

    $> summary.kilometers
    => 16.314
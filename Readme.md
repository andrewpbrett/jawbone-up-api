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
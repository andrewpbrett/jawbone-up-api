Ruby wrapper for the [unofficial Jawbone UP API](http://eric-blue.com/projects/up-api/). 

Work in progress. 

Find out your token:

    s = Jawbone::Session.new "you@youremail.com", "yourpassword"
		s.token # puts your Jawbone UP token
		
		
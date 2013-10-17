Ruby wrapper for the [Jawbone UP API](https://jawbone.com/up/developer/). 

Install with

    gem install jawbone

Once you've set up your app and have a token for your user:

    client = Jawbone::Client.new "your_token"

Then you can do things like:

```ruby
> client.user
=> {
    "meta" => {
        "user_xid" => "bacseY7NGC0",
         "message" => "OK",
            "code" => 200,
            "time" => 1379626539
    },
    "data" => {
          "xid" => "jd7m17NGC0",
        "image" => "",
         "last" => "Brett",
        "first" => "Andy"
    }
}
```

There are three instance methods on `client` directly related to the user and nothing else: `user`, `friends`, and `trends`. 

In addition, Jawbone makes the following object types available: 

`"move", "body_event", "workout", "sleep", "meal", "cardiac_event", "generic_event", "mood"`

This gem takes each of those types and provides methods for:

- getting all of the objects, e.g `client.workouts`
- getting a single object, e.g. `client.workout("xid")` where the xid is the xid returned by `client.workouts`. 
- getting a graph for that object, e.g. `client.workout_graph("xid")`
- getting a detailed report on that object, e.g. `client.workout_intensity("xid")`
- creating a new object, e.g. `client.create_workout(params)`

Jawbone does not necessarily support all of these methods on all objects. For example, there's no endpoint to create a new "move" object. Calling these methods will return an error message. 

See [https://jawbone.com/up/developer/endpoints](https://jawbone.com/up/developer/endpoints) for the full documentation.

By default, an application only gets `basic_read` permission from Jawbone. You have to specify additional scopes when you send the user to Jawbone to grant your app permissions to read their account. 

I've also got an [omniauth strategy for Jawbone](https://github.com/andrewpbrett/omniauth-jawbone) right here, special price for special friends of Rick. 
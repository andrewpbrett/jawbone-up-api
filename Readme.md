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

See [https://jawbone.com/up/developer/endpoints](https://jawbone.com/up/developer/endpoints) for the full list.

By default, an application only gets `basic_read` permission from Jawbone. You have to specify additional scopes when you send the user to Jawbone to grant your app permissions to read their account. 

I've also got an [omniauth strategy for Jawbone](https://github.com/andrewpbrett/omniauth-jawbone) right here, special price for special friends of Rick. 
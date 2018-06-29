# README

This is a demo of the [lograge_rails_request_queuing](https://github.com/rud/lograge_rails_request_queuing) gem.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Once deployed, you can see the logs by tailing:

``` shell-interaction
heroku logs --source=app -t
2018-06-29T17:17:18.218922+00:00 app[web.1]: I, [2018-06-29T17:17:18.218788 #4]  INFO -- : [03a9647d-8068-4fe3-8734-79ae02c63480] method=GET path=/echo format=html controller=EchoController action=index status=200 duration=0.46 view=0.26 rq=2.43ms
```

Notice the `rq=2.43ms` at the end of the line. Success!

## Exception output

Exceptions logged look like this, with a few newlines added for readability here:

```
I, [2018-06-29T18:44:26.267292 #4]  INFO -- : [29f3a9f6-1848-4858-93be-6ad76a6b9389] 
method=GET path=/ format=html controller=EchoController action=index status=500 
error='ArgumentError: Insufficient mittens' duration=0.27 view=0.00 rq=4.12ms 
exception=["ArgumentError", "Insufficient mittens"] 
backtrace=["/app/app/controllers/echo_controller.rb:4:in `index'", "/app/vendor/bundle/ruby/2.5.0/gems/actionpack-5.2.0/lib/action_controller/metal/basic_implicit_render.rb:6:in `send_action'", ...SNIP...]
```

You can demonstrate this output by visiting `https://your-deploy.herokuapp.com?demo_raise=1`. 
This raises an uncaught exception which you can then see in the logged output. 

# README

This is a demo of the [lograge_rails_request_queuing](https://github.com/rud/lograge_rails_request_queuing) gem.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Once deployed, you can see the logs by tailing:

``` shell-interaction
heroku logs --source=app -t
2018-06-29T17:17:18.218922+00:00 app[web.1]: I, [2018-06-29T17:17:18.218788 #4]  INFO -- : [03a9647d-8068-4fe3-8734-79ae02c63480] method=GET path=/echo format=html controller=EchoController action=index status=200 duration=0.46 view=0.26 rq=2.43ms
```

Notice the `rq=2.43ms` at the end of the line. Success!

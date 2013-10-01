[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/hubot/

# Quick Start

NB: This Hubot is for IRC.

To start your own hubot (requiring a `redis-server`):

```
$ docker pull thoughtpolice/hubot
$ docker pull thoughtpolice/redis-server
$ REDIS_SERVER=$(docker run -d thoughtpolice/redis-server)
$ REDIS_SERVER_IP=$(docker inspect $REDIS_SERVER | grep IPAddress | awk '{ print $2 }' | tr -d ',"')
$ docker run -d -e HUBOT_AUTH_ADMIN="thoughtpolice" -e REDISCLOUD_URL=redis://$REDIS_SERVER_IP:6379 -e HUBOT_IRC_SERVER="irc.freenode.net" -e HUBOT_IRC_ROOMS="##hubot-test" -e HUBOT_IRC_NICK="hubot-test1234" -e HUBOT_IRC_UNFLOOD="true" thoughtpolice/hubot
```

See the homepage of the [hubot-irc] plugin for more enironment options.

[hubot-irc]: https://github.com/nandub/hubot-irc

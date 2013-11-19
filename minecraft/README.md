[Official repository][repo].

[repo]: https://index.docker.io/u/thoughtpolice/minecraft

Start a server and generate some world data. Once it's done, `^C` it
to stop:

```
$ sudo docker pull thoughtpolice/minecraft
$ sudo docker run -name minecraftmap thoughtpolice/minecraft
^C
```

Now start the server again, and mount the volumes from the old
container. This will preserve the map data. When upgrading the server,
just mount the volumes from `minecraftmap` again:

```
$ sudo docker run -name minecraft -volumes-from minecraftmap -d thoughtpolice/minecraft
```

You can inspect the `minecraft` container to locate the `/minecraft`
volume, which contains all the map data.

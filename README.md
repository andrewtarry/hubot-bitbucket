Hubot Bitbucket Listener
========================

The Hubot Bitbucket listener allows custom Bitbucket Post hooks be set up that will inform Hubot when events occur. The hook data will then be parsed and an event will be fired that custom scripts can listen for.

Installation

Install the package with `npm install hubot-bitbucket --save` and add it to your `external-scripts.json`.

```json
["hubot-bitbucket"]
```

Configuration

There are two optional environment variables that can be set to customise the listener.

Variable | Default | Effect
---------|---------|-------
`HUBOT_BITBUCKET_PUSH_URL` | /bitbucket/push | The route bitbucket should post to
`HUBOT_BITBUCKET_PUSH_EVENT` | bitbucketPushReceived | The event that will emitted when the push is received

Use

The Hubot Bitbucket Listener will not do anything with the data by default so there will be nothing added to a room. The listener will only parse the request and emit and event that you can listen for. If you want to have `Hubot` notify a room then you can easily do that. 

```coffeescript

robot.on "bitbucketPushReceived", (pushEvent) ->
    push = pushEvent.push
    
    # Do things
```

The `push` variable is an object that will with data from the Bitbucket hook.

```coffeescript
repository = push.repo
repository_url = repository.url # e.g. https://bitbucket.org/marcus/project-x/
repository_name = repository.name # e.g. Project X
repository_slug = repository.slug # e.g. project-x

for commit in push.commits
	author = commit.author # bitbucket username
	branch = commit.master # e.g. master
	message = commit.message # A really clear message
	
	for file in commit.files
		file = file.filename # e.g. somefile.py
		type = file.type # i.e. modified, added etc

```
You can listen for the event and use as much of the data as you want.
# Daily's

An app to notify your daily in a specific hipchat room.

## Considerations

1. The daily will use the date of the day.
2. Only can add two messages for day for app_key, this purpose is avoid spam

## Setup

To use this tool is necesary that you set inside the folder config/ a app_config.yml file. An example file is provided, you need set:

database : base
room     : hipchat room name
roomname : room title description
username : foo
password : bar

### Using the API

To use any of the next calls is necesary that you get your app_key from Hipchat.

#### Adding a message

To add a new message is necesary that set two variables:

1. app_key
2. text

```
curl -X PUT -d "app_key=hipchatappkey&text=My daily today" http://hostname/daily/add -v -ufoo:bar
```

#### Getting the messages that will be published today

```
curl -vXGET http://hostname/daily/list/hipchatappkey -ufoo:bar
```

#### Sending the messages

```
curl -vXGET http://hostname/send -ufoo:bar
```

## Integration usage

We use a jenkins that publish a notification in a hipchat room to remeber all team to put the daily. So after that notification Jenkins launch the send method an notify in the room all the registered tasks

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

The source code is released under Apache 2 License.

Check LICENSE file for more information.
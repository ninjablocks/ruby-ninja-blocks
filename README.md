Ruby Ninja Blocks
===
A simple library to help interacting with the Ninja Blocks Platform.


## API Overview

### User
```ruby
# Fetch a user's profile anyformation
user.info 

# Fetch a user's activity stream
user.stream

# Fetch a user's pusher channel
user.pusher_channel
```

### Device
```ruby
# Fetch a user's devices, a hash map of guid => metadata
device.list

# Send `command` to device `guid`
device.actuate(guid, command)

# Subscribe to a device's data feed. Ninja Blocks will POST the requested
# device's data to the `url` provided here.
# Optionally `overwrite`s an existing callback `url`
device.subscribe(guid, url)

# Unubscribe from a device's data feed.
device.unubscribe(guid)

# Fetch any historical data about this device. Optionally specify the period's `start` and `end` timestamp.
device.data(guid, start, end)

# Fetch the last heartbeat received by this device.
device.last_heartbeat(guid)
```
This is by no means exhaustive, and more functionality will be forthcoming.
#!/usr/bin/env ruby

require 'rubygems'
require 'faraday'
require 'rest-client'
require 'json'
require 'ninja_blocks'
require 'chronic'

TOKEN = 'YOURTOKEN'

device = Device.new
user = User.new

# Fetch a user's devices
puts device.list()

# Send `command` to device `guid`
puts device.actuate("2712BB000674_0_0_1000", "000000").inspect

# Subscribe to a device's data feed. Optionally `overwrite`s an existing callback `url`
puts device.subscribe("2712BB000674_0_0_1000",'http://requestb.in/13ozq1w1')

# Unubscribe from a device's data feed.
puts device.unsubscribe("2712BB000674_0_0_1000")

# Return the historical data for the specified device.
puts device.data("2712BB000674_2_0_8", Chronic.parse('yesterday').to_i, Chronic.parse('today').to_i)

# Fetch any historical data about this device. Optionally specify the period's `start` and `end` timestamp.
puts device.last_heartbeat("2712BB000674_2_0_8")


#Fetch a user's profile anyformation
puts user.info()

# Fetch a user's activity stream
puts user.stream()

# Fetch a user's pusher channel
puts user.pusher_channel

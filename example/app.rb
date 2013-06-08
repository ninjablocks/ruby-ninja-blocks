#!/usr/bin/env ruby

lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubygems'
require 'ninja_blocks'
require 'pp'

NinjaBlocks::token = '3BW1CL9gphdZweBTlLVKSGP3AiYfSkkaDTyywZnnM'

# ============
# = EXAMPLES =
# ============

# Get the most recent temperature reading from all temperature sensors.
temps = NinjaBlocks::Device.list(:device_type => 'temperature')
temps.each do |d|
  puts "#{d.short_name} is #{d.last_heartbeat['DA']}C"
end

# Execute an RF command by name - turn a "Lamp Off."
rfs = NinjaBlocks::Device.list(:device_type => 'rf433')
rfs.each do |rf|
  lamp = rf.find_sub_device(:short_name => "Lamp Off")
  next unless lamp
  rf.actuate(lamp.data)
end

# =============
# = REFERENCE =
# =============


# DEVICES
# =======

# List all devices.
devices = NinjaBlocks::Device.list

# Get all devices matching a particular type.
light_devices = NinjaBlocks::Device.list(:device_type => 'rgbled8')
temp_devices  = NinjaBlocks::Device.list(:device_type => 'temperature')

# Or a particular tag.
led_devices = NinjaBlocks::Device.list(:tag => 'led')

# Or just get the first device that meets the criteria.
eyes = NinjaBlocks::Device.find(:device_type => 'rgbled')
temp = NinjaBlocks::Device.find(:device_type => 'temperature')

# You can also instantiate a device by its GUID.
some_device = NinjaBlocks::Device.new("2712BB000674_0_0_1000")

# Send `command` to a device.
eyes.actuate('FFFFFF')

# Subscribe to a device's data feed.
temp.subscribe('http://requestb.in/1ksfmej1')

# Unsubscribe from a device's data feed.
temp.unsubscribe

# Return the historical data for the device.
pp device.data(:from => '2 hours ago', :to => 'now', :interval => '1min')

# Fetch the most recent data for the device.
pp device.last_heartbeat


# USERS
# =====

user = NinjaBlocks::User.new

# Fetch a user's profile anyformation.
user.info

# Fetch a user's activity stream.
user.stream

# Fetch a user's pusher channel.
user.pusher_channel



module NinjaBlocks
  class Device < Base

    def list(filter_by)
      
      hash_of_response = get("https://api.ninja.is/rest/v0/devices")

      devices = []
      
      unless filter_by.nil?

        hash_of_response["data"].each do |d|
          device_hash = {}
          device_hash["guid"] = d[0]
          device_hash = device_hash.merge(d[1]) 
          devices << device_hash
          devices = devices.reject { |d| d['device_type'] != filter_by[:device_type] }
        end
      
      else
        hash_of_response["data"].each do |d|
          device_hash = {}
          device_hash["guid"] = d[0]
          device_hash = device_hash.merge(d[1]) 
          devices << device_hash
        end
        
      end
        
      devices
    end

    def available_types
      hash_of_response = get("https://api.ninja.is/rest/v0/devices")

      devices_types = []
      
      hash_of_response["data"].each do |d|
        device_hash = {}
        device_hash["guid"] = d[0]
        device_hash = device_hash.merge(d[1]) 
        devices_types << device_hash['device_type'] unless device_hash['device_type'].nil?
        devices_types = devices_types.uniq
      end
      
      devices_types.each do |t|
        puts t
      end
    end

    def actuate(guid, da)
      json = JSON.dump('DA'=> dsa)
      put("https://api.ninja.is/rest/v0/device/#{guid}", json)
    end

    def subscribe(guid, url)
      json = JSON.dump('url'=> url)
      post("https://api.ninja.is/rest/v0/device/#{guid}/callback", json)
    end

    def unsubscribe(guid)
      delete("https://api.ninja.is/rest/v0/device/#{guid}/callback")
    end

    def data(guid, from, to)
      get("https://api.ninja.is/rest/v0/device/#{guid}/data?from=#{from}&to=#{to}")
    end

    def last_heartbeat(guid)
      get("https://api.ninja.is/rest/v0/device/#{guid}/heartbeat")
    end

  end
end


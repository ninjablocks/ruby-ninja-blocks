module NinjaBlocks
  class Device < Base

    def list(*filter_by)
      
      hash_of_response = get("https://api.ninja.is/rest/v0/devices")

      devices = []
      unless filter_by.nil?
        filter_by = filter_by[0] if filter_by.kind_of?(Array)
      end
      unless filter_by.nil? || filter_by[:device_type].empty?

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
          devices = devices.reject { |d| d['device_type'] == nil }
          devices = devices.sort_by { |k| k["device_type"] }
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
    
    def available_devices
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
      json = JSON.dump('DA'=> da)
      put_json("https://api.ninja.is/rest/v0/device/#{guid}", json)
    end

    def subscribe(guid, url)
      json = JSON.dump('url'=> url)
      post("https://api.ninja.is/rest/v0/device/#{guid}/callback", json)
    end

    def unsubscribe(guid)
      delete("https://api.ninja.is/rest/v0/device/#{guid}/callback")
    end

    def data(guid, from, to)
      
      from = (Chronic.parse(from).utc.to_i) *1000
      to = (Chronic.parse(to).utc.to_i) *1000 
      
      get("https://api.ninja.is/rest/v0/device/#{guid}/data", "from=#{from}&to=#{to}")
    end

    def last_heartbeat(guid)
      get("https://api.ninja.is/rest/v0/device/#{guid}/heartbeat")
    end

  end
end


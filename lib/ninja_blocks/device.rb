module NinjaBlocks
  class Device < Base

    def list(*filter_by)
      
      hash_of_response = get("/devices")
      devices = []

      unless filter_by.nil?
        filter_by = filter_by[0] if filter_by.kind_of?(Array)
      end
      
      devices = []
      hash_of_response['data'].each do |d|
        device_hash = {}
        device_hash['guid'] = d[0]
        device_hash.merge!(d[1])
        next if (filter_by && d['device_type'] != filter_by[:device_type])
        devices << device_hash
      end

      devices
    end


    def available_types
      hash_of_response = get("/devices")

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
      hash_of_response = get("/devices")

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
      put("/device/#{guid}", json)
    end

    def actuate_local(local_ip, guid, da)
      json = JSON.dump('DA'=> "#{da}")
      put("http://#{local_ip}:8000/rest/v0/device/#{guid}", json)
    end

    def subscribe(guid, url)
      json = JSON.dump('url'=> url)
      post("/device/#{guid}/callback", json)
    end

    def unsubscribe(guid)
      delete("/device/#{guid}/callback")
    end

    def data(guid, from, to, params={})
      params.merge({
        :from => interpret_date(from),
        :to   => interpret_date(to)
      })
      
      get("/device/#{guid}/data", params)
    end

    def last_heartbeat(guid)
      get("/device/#{guid}/heartbeat")
    end

  end
end


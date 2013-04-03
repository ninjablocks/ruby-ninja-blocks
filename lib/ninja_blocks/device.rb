module NinjaBlocks
  class Device < Base

    def list
      hash_of_response = get("https://api.ninja.is/rest/v0/devices")

      devices = []

      hash_of_response["data"].each do |d|
        device_hash = {}
        device_hash["guid"] = d[0]
        device_hash = device_hash.merge(d[1]) 
        devices << device_hash
      end

      devices
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


class User
  def info()
    con = Faraday.new(:url => 'https://a.ninja.is')
    
    con.headers['accepts'] = 'application/json'
    con.headers['Content-Type'] = 'application/json'
        
    response = con.get("https://api.ninja.is/rest/v0/user?user_access_token=#{TOKEN}")
    
    hash_of_response = JSON.parse(response.body)
    
    return hash_of_response
  end
  
  def stream()
    con = Faraday.new(:url => 'https://a.ninja.is')
    
    con.headers['accepts'] = 'application/json'
    con.headers['Content-Type'] = 'application/json'
        
    response = con.get("https://api.ninja.is/rest/v0/user/stream?user_access_token=#{TOKEN}")
    
    hash_of_response = JSON.parse(response.body)
    
    return hash_of_response
  end
  
  def pusher_channel()
    
    con = Faraday.new(:url => 'https://a.ninja.is')
    
    con.headers['accepts'] = 'application/json'
    con.headers['Content-Type'] = 'application/json'
        
    response = con.get("https://api.ninja.is/rest/v0/user/pusherchannel?user_access_token=#{TOKEN}")
    
    hash_of_response = JSON.parse(response.body)
    
    return hash_of_response
    
  end
end

class Device
  
  def list()
    
    con = Faraday.new(:url => 'https://a.ninja.is')
    
    con.headers['accepts'] = 'application/json'
    con.headers['Content-Type'] = 'application/json'
    
    response = con.get("/rest/v0/devices?user_access_token=#{TOKEN}")
    
    hash_of_response = JSON.parse(response.body)
                
    devices = []
    
    hash_of_response["data"].each do |d|
      device_hash = {}
      device_hash["guid"] = d[0]
      device_hash = device_hash.merge(d[1]) 
      devices << device_hash
    end
    
    return devices
  end
  
  def actuate(guid, da)
    con = Faraday.new(:url => 'https://a.ninja.is')
    
    con.headers['accepts'] = 'application/json'
    con.headers['Content-Type'] = 'application/json'
        
    response = con.put("/rest/v0/device/#{guid}?user_access_token=#{TOKEN}", "{\"DA\": \"#{da}\"}")
    
    hash_of_response = JSON.parse(response.body)
    
    return hash_of_response
    
    
  end
  
  def subscribe(guid, url)
    con = Faraday.new(:url => 'https://a.ninja.is')
    
    con.headers['accepts'] = 'application/json'
    con.headers['Content-Type'] = 'application/json'
        
    response = con.post("https://api.ninja.is/rest/v0/device/#{guid}/callback?user_access_token=#{TOKEN}", "{\"url\": \"#{url}\"}")
    
    hash_of_response = JSON.parse(response.body)
    
    return hash_of_response
    
  end
  
  def unsubscribe(guid)
    con = Faraday.new(:url => 'https://a.ninja.is')
    
    con.headers['accepts'] = 'application/json'
    con.headers['Content-Type'] = 'application/json'
        
    response = con.delete("https://api.ninja.is/rest/v0/device/#{guid}/callback?user_access_token=#{TOKEN}")
    
    hash_of_response = JSON.parse(response.body)
    
    return hash_of_response
    
  end
  
  def data(guid, from, to)
    con = Faraday.new(:url => 'https://a.ninja.is')
    
    con.headers['accepts'] = 'application/json'
    con.headers['Content-Type'] = 'application/json'
        
    response = con.get("https://api.ninja.is/rest/v0/device/#{guid}/data?user_access_token=#{TOKEN}&from=#{from}&to=#{to}")
    
    hash_of_response = JSON.parse(response.body)
    
    return hash_of_response
    
  end
  
  def last_heartbeat(guid)
    con = Faraday.new(:url => 'https://a.ninja.is')
    
    con.headers['accepts'] = 'application/json'
    con.headers['Content-Type'] = 'application/json'
        
    response = con.get("https://api.ninja.is/rest/v0/device/#{guid}/heartbeat?user_access_token=#{TOKEN}")
    
    hash_of_response = JSON.parse(response.body)
    
    return hash_of_response
    
  end
  
end
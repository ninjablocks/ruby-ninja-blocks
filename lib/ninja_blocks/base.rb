module NinjaBlocks 
  class Base
    def get(url,options={})
      execute(:get,url,options)
    end
    def put(url,options={})
      execute(url, json)
    end
    def post(url,options={})
      execute(:post,url,options)
    end

    def delete(url,options={})
      execute(:delete,url,options)
    end

    def connection
      @connection = Faraday.new(:url => 'https://api.ninja.is')
      @connection.headers['accept'] = 'application/json'
      @connection.headers['Content-Type'] = 'application/json'
      @connection
    end

    def token
      @token || NinjaBlocks.token
    end
    
    def execute(method,url,options={})

      unless options.empty?
        response = connection.send(method,"#{url}?#{options}&user_access_token=#{self.token}")
      else
        response = connection.send(method,"#{url}?user_access_token=#{self.token}")
      end
      JSON.parse(response.body)
    end
    #ugly hack, but I'm too tired to think
    def put_json(url, json)
       response = connection.send(:put, "#{url}?user_access_token=#{self.token}", json)
    end
    
  end
end


module NinjaBlocks 
  class Base
    def get(url,options={})
      execute(:get,url,options)
    end
    def put(url)
      execute(:put,url)
    end
    def post(url)
      execute(:post,url)
    end

    def delete(url)
      execute(:delete,url)
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
    
  end
end


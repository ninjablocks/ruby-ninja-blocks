module NinjaBlocks 
  class Base
    def get(url)
      execute(:get,url)
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
      @connection = Faraday.new(:url => 'https://a.ninja.is')
      @connection.headers['accepts'] = 'application/json'
      @connection.headers['Content-Type'] = 'application/json'
      @connection
    end

    def token
      @token || NinjaBlocks.token
    end
    
    def execute(method,url)
      response = connection.send(method,"#{url}?user_access_token=#{self.token}")
      JSON.parse(response.body)
    end
  end
end


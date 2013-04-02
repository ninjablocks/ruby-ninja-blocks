module NinjaBlocks
  class User < Abstruct
    def info
      get('https://api.ninja.is/rest/v0/user')
    end

    def stream
      get('https://api.ninja.is/rest/v0/user/stream')
    end

    def pusher_channel
      get('https://api.ninja.is/rest/v0/user/pusherchannel')
    end
  end
end



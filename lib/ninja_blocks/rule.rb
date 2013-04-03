module NinjaBlocks
  class Rule < Abstruct
    
    def list
      get('https://api.ninja.is/rest/v0/rule')
    end


    def create(json)
      # create rule
      post("https://api.ninja.is/rest/v0/rule", json)
    end
    
    def get(rid)
      # get rule
      get("https://api.ninja.is/rest/v0/rule/#{rid}")
    end
    
    def update(rid, json)
      # update a rule
      put("https://api.ninja.is/rest/v0/rule/#{rid}", json)
    end
    
    def delete
      # delete a rule
      delete("https://api.ninja.is/rest/v0/rule/#{rid}")
    end
    
    def suspend
      # suspend a rule
    end
    
    def unsuspend
      # unsuspend a rule
    end

  end
end



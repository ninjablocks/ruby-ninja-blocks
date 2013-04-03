module NinjaBlocks
  class Rule < Abstruct
    
    def list
      get('https://api.ninja.is/rest/v0/rule')
    end

    def create(rule, json)
      # create rule
      post("https://api.ninja.is/rest/v0/rule", json)
    end
    
    def fetch(rid)
      get("https://api.ninja.is/rest/v0/rule/#{rid}")
    end
    
    def update(rid, json)
      # update a rule
      put("https://api.ninja.is/rest/v0/rule/#{rid}")
    end
    
    def destroy(rid)
      # delete a rule
      delete("https://api.ninja.is/rest/v0/rule/#{rid}")
    end
    
    def suspend(rid)
      # suspend a rule
      post("https://api.ninja.is/rest/v0/rule/#{rid}/suspend")
      
    end
    
    def unsuspend(rid)
      # unsuspend a rule
      delete("https://api.ninja.is/rest/v0/rule/#{rid}/suspend")
    end

  end
end



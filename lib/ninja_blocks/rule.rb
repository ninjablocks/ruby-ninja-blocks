module NinjaBlocks
  class Rule < Abstruct
    
    def list
      get('https://api.ninja.is/rest/v0/rule')
    end


    def create
      # create rule
    end
    
    def get
      # get rule
    end
    
    def update
      # update a rule
    end
    
    def delete
      # delete a rule
    end
    
    def suspend
      # suspend a rule
    end
    
    def unsuspend
      # unsuspend a rule
    end

  end
end



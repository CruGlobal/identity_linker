module IdentityLinker
  class Error < StandardError
    def initialize(e)
      super
    end

    def message
      super.sub('(S:Server) ','')
    end

    def to_s
      super.sub('(S:Server) ','')
    end
  end
end

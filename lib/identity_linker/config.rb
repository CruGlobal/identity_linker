module IdentityLinker
  Config = Struct.new(:server_id, :server_secret, :wsdl) do

    def self.default
      config = new
      config.wsdl = 'https://signin.ccci.org/ws-identity-linking/idlinking?wsdl'
      config
    end

  end
end

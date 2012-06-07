module IdentityLinker
  Config = Struct.new(:server_id, :server_secret) do

    def self.default
      config = new
      config
    end

  end
end

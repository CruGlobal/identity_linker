require 'savon'
require 'identity_linker/error'

module IdentityLinker
  class Linker
    extend Savon::Model

    #endpoint "https://signin.ccci.org/ws-identity-linking/idlinking"
    #namespace "http://webservice.linking.idm.ccci.org/"

    attr_reader :server_id, :server_secret

    def self.client
      @client ||= Savon.client(wsdl: IdentityLinker.config.wsdl)
    end

    def initialize(server_id = nil, server_secret = nil)
      @server_id = server_id || IdentityLinker.config.server_id
      @server_secret = server_secret || IdentityLinker.config.server_secret
    end

    def find_linked_identity(id_type, id_value, target)
      response = client.call(:find_linked_identity, message: {
        server_id: server_id,
        server_secret: server_secret,
        identity: {
          id_type: id_type,
          id_value: id_value
        },
        target: target
      })

      if response.success?
        return response.to_hash[:find_linked_identity_response][:linked_identity]
      end

      nil
    end

    def self.find_linked_identity(id_type, id_value, target)
      new.find_linked_identity(id_type, id_value, target)
    end

    def find_linked_identity_with_details(id_type, id_value, target)
      response = client.call(:find_linked_identity_with_details, message: {
        server_id: server_id,
        server_secret: server_secret,
        identity: {
          id_type: id_type,
          id_value: id_value
        },
        target: target
      })

      if response.success?
        return response.to_hash[:find_linked_identity_with_details_response][:linked_identity]
      end

      nil
    end

    def self.find_linked_identity_with_details(id_type, id_value, target)
      new.find_linked_identity_with_details(id_type, id_value, target)
    end

    def find_all_linked_identities(id_type, id_value)
      response = client.call(:find_all_linked_identities, message: {
        server_id: server_id,
        server_secret: server_secret,
        identity: {
          id_type: id_type,
          id_value: id_value
        }
      })

      if response.success?
        return response.to_hash[:find_all_linked_identities_response][:linked_identity]
      end

      nil
    end

    def self.find_all_linked_identities(id_type, id_value)
      new.find_all_linked_identities(id_type, id_value)
    end

    def find_all_linked_identities_with_details(id_type, id_value)
      response = client.call(:find_all_linked_identities_with_details, message: {
        server_id: server_id,
        server_secret: server_secret,
        identity: {
          id_type: id_type,
          id_value: id_value
        }
      })

      if response.success?
        return response.to_hash[:find_all_linked_identities_with_details_response][:linked_identity]
      end

      nil
    end

    def self.find_all_linked_identities_with_details(id_type, id_value)
      new.find_all_linked_identities_with_details(id_type, id_value)
    end

    def find_linked_identities_of_type(id_type, id_value, target)
      response = client.call(:find_linked_identities_of_type, message: {
        server_id: server_id,
        server_secret: server_secret,
        identity: {
          id_type: id_type,
          id_value: id_value
        },
        target: target
      })

      if response.success?
        return [response.to_hash[:find_linked_identities_of_type_response][:linked_identity]].flatten.compact
      end

      nil
    end

    def self.find_linked_identities_of_type(id_type, id_value, target)
      new.find_linked_identities_of_type(id_type, id_value, target)
    end

  end
end

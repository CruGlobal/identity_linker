require 'savon'
require 'identity_linker/error'

module IdentityLinker
  class Linker
    extend Savon::Model

    endpoint "https://signin.ccci.org/ws-identity-linking/idlinking"
    namespace "http://webservice.linking.idm.ccci.org/"

    attr_reader :server_id, :server_secret

    def initialize(server_id = nil, server_secret = nil)
      @server_id = server_id || IdentityLinker.config.server_id
      @server_secret = server_secret || IdentityLinker.config.server_secret
    end

    def find_linked_identity(id_type, id_value, target)
      begin
        response = client.request(:wsdl, :find_linked_identity) do
          xml = <<-END
             <serverId>#{server_id}</serverId>
             <serverSecret>#{server_secret}</serverSecret>
             <identity>
                <idType>#{id_type}</idType>
                <idValue>#{id_value}</idValue>
             </identity>
             <target>#{target}</target>
          END
          soap.body = xml
        end

        if response.success?
          return response.to_hash[:find_linked_identity_response][:linked_identity]
        end
      rescue Savon::SOAP::Fault => e
        raise Error.new(e)
      end

      nil
    end

    def self.find_linked_identity(id_type, id_value, target)
      new.find_linked_identity(id_type, id_value, target)
    end

    def find_linked_identity_with_details(id_type, id_value, target)
      begin
        response = client.request(:wsdl, :find_linked_identity_with_details) do
          xml = <<-END
               <serverId>#{server_id}</serverId>
               <serverSecret>#{server_secret}</serverSecret>
               <identity>
                  <idType>#{id_type}</idType>
                  <idValue>#{id_value}</idValue>
               </identity>
               <target>#{target}</target>
          END
          soap.body = xml
        end

        if response.success?
          return response.to_hash[:find_linked_identity_with_details_response][:linked_identity]
        end
      rescue Savon::SOAP::Fault => e
        raise Error.new(e)
      end
      nil
    end

    def self.find_linked_identity_with_details(id_type, id_value, target)
      new.find_linked_identity_with_details(id_type, id_value, target)
    end

    def find_all_linked_identities(id_type, id_value)
      begin
        response = client.request(:wsdl, :find_all_linked_identities) do
          xml = <<-END
           <serverId>#{server_id}</serverId>
           <serverSecret>#{server_secret}</serverSecret>
           <identity>
              <idType>#{id_type}</idType>
              <idValue>#{id_value}</idValue>
           </identity>
          END
          soap.body = xml
        end

        if response.success?
          return response.to_hash[:find_all_linked_identities_response][:linked_identity]
        end
      rescue Savon::SOAP::Fault => e
        raise Error.new(e)
      end

      nil
    end

    def self.find_all_linked_identities(id_type, id_value)
      new.find_all_linked_identities(id_type, id_value)
    end

    def find_all_linked_identities_with_details(id_type, id_value)
      begin
        response = client.request(:wsdl, :find_all_linked_identities_with_details) do
          xml = <<-END
           <serverId>#{server_id}</serverId>
           <serverSecret>#{server_secret}</serverSecret>
           <identity>
              <idType>#{id_type}</idType>
              <idValue>#{id_value}</idValue>
           </identity>
          END
          soap.body = xml
        end

        if response.success?
          return response.to_hash[:find_all_linked_identities_with_details_response][:linked_identity]
        end
      rescue Savon::SOAP::Fault => e
        raise Error.new(e)
      end

      nil
    end

    def self.find_all_linked_identities_with_details(id_type, id_value)
      new.find_all_linked_identities_with_details(id_type, id_value)
    end

    def find_linked_identities_of_type(id_type, id_value, target)
      begin
        response = client.request(:wsdl, :find_linked_identities_of_type) do
          xml = <<-END
           <serverId>#{server_id}</serverId>
           <serverSecret>#{server_secret}</serverSecret>
           <identity>
              <idType>#{id_type}</idType>
              <idValue>#{id_value}</idValue>
           </identity>
           <target>#{target}</target>
          END
          soap.body = xml
        end

        if response.success?
          return [response.to_hash[:find_linked_identities_of_type_response][:linked_identity]].flatten.compact
        end
      rescue Savon::SOAP::Fault => e
        raise Error.new(e)
      end

      nil
    end

    def self.find_linked_identities_of_type(id_type, id_value, target)
      new.find_linked_identities_of_type(id_type, id_value, target)
    end

  end
end

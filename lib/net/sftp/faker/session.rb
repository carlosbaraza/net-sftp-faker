module Net; module SFTP
  class Session
    def initialize(session, &block)
      @session    = session
      @input      = Net::SSH::Buffer.new
      self.logger = session.logger
      @state      = :closed

      connect(&block)

      faker_setup

      self
    end

    def send_packet(type, *args)
      types = ::Net::SFTP::Constants::PacketTypes.constants
      types_map = types.inject({}) do |types, type_name|
        types.merge( eval(type_name) => type_name )
      end
      method_name = types_map[type].gsub('FXP_', 'faker_').underscore.to_sym
      send(method_name)
    end

    private

    def faker_setup
      @protocol = Protocol.load(self, 4)
      @pending_requests = {}

      @state = :open
    end

    def faker_mkdir
      # fake the dispatch_request method to delete the request from the
      # pending requests

      pending_requests[id]
    end
  end
end; end;
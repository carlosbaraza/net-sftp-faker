module Net; module SFTP
  class Request
    def respond_to(packet)
      # data = create the data

      @response = Response.new(self, data)

      callback.call(@response) if callback
    end
  end
end; end;
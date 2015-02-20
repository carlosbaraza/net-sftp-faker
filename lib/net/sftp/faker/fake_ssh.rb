module Net; module SFTP; module Faker
  # Null test double to fake the SSH Session object, so we could issolate and
  # control the net-sftp library.
  class FakeSSH
    # Answer always with nil to any class method
    def self.method_missing(method_sym, *args, &block)
      return nil
    end

    def logger
      return Rails.logger if Object.const_defined?('Rails')
      Logger.new('log/net_sftp_faker.log')
    end

    # Answer always with nil to any method
    def method_missing(method_sym, *args, &block)
      return nil
    end
  end
end; end; end
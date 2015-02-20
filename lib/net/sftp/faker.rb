require "net/sftp/faker/version"

# SSH Session object double
require "net/sftp/faker/fake_ssh"

# Monkey patch net-sftp classes
require "net/sftp/faker/session"
require "net/sftp/faker/request"

module Net; module SFTP

  # Monkey patch the SFTP initializer method
  def self.start(host, user, options={}, &block)
    session = Faker::FakeSSH.new

    sftp = Net::SFTP::Session.new(session, &block).connect!

    if block_given?
      sftp.loop
      session.close
      return nil
    end

    sftp
  rescue Object => anything
    begin
      session.shutdown!
    rescue ::Exception
      # swallow exceptions that occur while trying to shutdown
    end

    raise anything
  end

end; end
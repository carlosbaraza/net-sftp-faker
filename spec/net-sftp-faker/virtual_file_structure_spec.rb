require 'spec_helper'
require 'net/sftp/faker'

describe Net::SFTP do
  before(:all) do
    host = 'fakehost'
    port = 'fakeport'
    username = 'fakeuser'
    password = 'fakepassword'
    opts = [host, username, { :password => password, :port => port }]

    # ssh_session = double().as_null_object
    # ssh_session.stub(:logger).and_return(Rails.logger) # session.rb:81
    # ssh_session.stub(:open_channel) # session.rb:772
    # ssh_session.stub(:loop) # session.rb:802
    # Net::SSH.stub(:start).with(*opts).and_return(ssh_session)

    @sftp = Net::SFTP.start(*opts)

  end

  it 'creates folders' do
    @sftp.mkdir!('./test')
    true
  end

  it 'has a default file structure' do
  end
end
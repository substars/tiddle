class FakeRequest

  def initialize(opts={})
    opts = {remote_ip:  "23.12.54.111",
            user_agent: "I am not a bot",
            headers:    {}}.merge(opts)
    self.remote_ip = opts[:remote_ip]
    self.user_agent = opts[:user_agent]
    self.headers = opts[:headers]
  end

  attr_accessor :remote_ip
  attr_accessor :user_agent
  attr_accessor :headers
end

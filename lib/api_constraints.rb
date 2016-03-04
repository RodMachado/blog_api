class ApiConstraints

  def initialize(options)
    @version = options.fetch(:version)
    @default = options.fetch(:default, false)
  end

  def matches?(req)
    default || req.headers['Accept'].include?("application/vnd.blog_api.v#{version}")
  end

  private

  attr_reader :default, :version

end

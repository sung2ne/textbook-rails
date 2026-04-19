if Rails.env.staging?
  Rack::MiniProfiler.config.authorization_mode = :allow_authorized

  Rack::MiniProfiler.config.pre_authorize_cb = lambda do |env|
    request = Rack::Request.new(env)
    # 관리자만 접근 허용
    request.cookies["admin_session"].present?
  end
end
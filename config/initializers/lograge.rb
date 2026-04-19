Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new

  # 로그에 추가 정보 포함
  config.lograge.custom_options = lambda do |event|
    {
      user_id: event.payload[:user_id],
      request_id: event.payload[:request_id],
      host: event.payload[:host]
    }
  end
end
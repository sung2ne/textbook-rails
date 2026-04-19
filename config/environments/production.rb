Rails.application.configure do
  # 구조화 로깅 활성화
  config.log_formatter = ActiveSupport::Logger::Formatter.new

  # JSON 형식으로 변경
  config.logger = ActiveSupport::Logger.new($stdout)
  config.log_level = :info

  # Tagged Logging: 요청 ID를 모든 로그 줄에 포함
  config.log_tags = [:request_id]
end
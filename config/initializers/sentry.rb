Sentry.init do |config|
  config.dsn = ENV["SENTRY_DSN"]

  # 성능 추적 (트랜잭션의 20% 샘플링)
  config.traces_sample_rate = 0.2

  # 프로파일링 (traces 중 10% 샘플링)
  config.profiles_sample_rate = 0.1

  # 브레드크럼 (에러 직전 이벤트 기록)
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # 민감한 파라미터 필터링
  config.send_default_pii = false
end
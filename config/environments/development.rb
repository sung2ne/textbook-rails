Rails.application.configure do
  config.after_initialize do
    Bullet.enable        = true
    Bullet.alert         = true       # 브라우저 알림
    Bullet.rails_logger  = true       # 로그 출력
    Bullet.add_footer    = true       # 페이지 하단에 표시
  end
end
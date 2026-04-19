Rails.application.routes.draw do
  # 헬스 체크 엔드포인트 (Rails 8 기본 제공)
  get "up" => "rails/health#show", as: :rails_health_check
end
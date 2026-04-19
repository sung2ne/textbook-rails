config.active_job.queue_adapter = :async  # 개발 환경: 인메모리 비동기

# config/environments/production.rb
config.active_job.queue_adapter = :solid_queue  # 프로덕션: DB 기반
# 프로덕션에서는 필수 데이터만 삽입
Role.find_or_create_by(name: "admin")
Role.find_or_create_by(name: "editor")
Role.find_or_create_by(name: "viewer")

puts "운영 시드 데이터 설정 완료"
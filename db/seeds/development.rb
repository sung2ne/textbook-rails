require "faker"

# 개발 시 기존 데이터 초기화 후 재생성
puts "기존 데이터 삭제 중..."
[Post, Comment, User].each(&:delete_all)

# 관리자 계정 (고정 이메일로 로그인 테스트 용이)
admin = User.create!(
  name:     "관리자",
  email:    "admin@example.com",
  password: "password",
  role:     "admin"
)

# 일반 사용자 20명
users = 20.times.map do
  User.create!(
    name:     Faker::Name.full_name,
    email:    Faker::Internet.unique.email,
    password: "password"
  )
end

all_users = [admin] + users

# 각 사용자의 게시글
all_users.each do |user|
  rand(2..10).times do
    post = user.posts.create!(
      title:      Faker::Lorem.sentence(word_count: 5),
      content:    Faker::Lorem.paragraphs(number: 3).join("\n\n"),
      view_count: rand(0..500),
      published:  [true, true, true, false].sample
    )

    # 댓글
    rand(0..5).times do
      post.comments.create!(
        content: Faker::Lorem.sentence,
        user:    all_users.sample
      )
    end
  end
end

puts "생성 완료: 사용자 #{User.count}명, 게시글 #{Post.count}개, 댓글 #{Comment.count}개"
# 실전 루비온레일즈 — 실습 코드

> 이 저장소는 **[실전 루비온레일즈](https://text.ibetter.kr/rails)** 교재의 실습 코드를 담고 있습니다.

## 기술 스택

Ruby on Rails 8.x, Ruby 3.4+, PostgreSQL, Kamal 2.0

## 브랜치 구조

각 브랜치는 해당 챕터까지 누적된 전체 프로젝트 코드를 담고 있습니다.

| 브랜치 | 내용 |
|--------|------|
| `main` | 최종 완성 코드 |
| `part01/chapter-01` | PART 01 Ch.01까지의 코드 |
| `part01/chapter-02` | PART 01 Ch.02까지의 코드 |
| `part02/chapter-01` | PART 02 Ch.01까지의 코드 |
| `partNN/chapter-MM` | 해당 챕터까지 누적된 전체 코드 |

원하는 챕터의 브랜치를 클론하면 해당 시점의 프로젝트를 바로 실행할 수 있습니다.

```bash
git clone -b part03/chapter-02 https://github.com/sung2ne/textbook-rails.git
```

## 개발 환경 설정

```bash
# Ruby 3.4 설치 (rbenv 권장)
rbenv install 3.4.0
rbenv local 3.4.0

# 의존성 설치
bundle install

# 데이터베이스 생성
rails db:create db:migrate

# 서버 실행
rails server
```

## 교재 바로가기

[text.ibetter.kr/rails](https://text.ibetter.kr/rails)

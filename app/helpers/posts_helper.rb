module PostsHelper
  def status_badge(post)
    if post.published?
      content_tag :span, "공개", class: "badge badge-green"
    else
      content_tag :span, "임시저장", class: "badge badge-gray"
    end
  end

  def formatted_date(datetime)
    datetime.strftime("%Y년 %m월 %d일")
  end
end
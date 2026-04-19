module ApplicationHelper
  # 플래시 메시지 CSS 클래스
  def flash_class(level)
    case level.to_sym
    when :notice then "bg-green-100 text-green-800 border-green-400"
    when :alert  then "bg-red-100 text-red-800 border-red-400"
    when :info   then "bg-blue-100 text-blue-800 border-blue-400"
    else              "bg-gray-100 text-gray-800 border-gray-400"
    end
  end

  # 게시글 상태 배지
  def post_status_badge(post)
    if post.published?
      content_tag(:span, "공개", class: "badge badge-green")
    else
      content_tag(:span, "비공개", class: "badge badge-gray")
    end
  end

  # 페이지 제목 설정
  def page_title(title = nil)
    base_title = "Rails 게시판"
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
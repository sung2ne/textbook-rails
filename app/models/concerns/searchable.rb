module Searchable
  extend ActiveSupport::Concern

  included do
    scope :search_by_title, ->(query) {
      where("title LIKE ?", "%#{query}%") if query.present?
    }
  end

  def highlight(query)
    title.gsub(query, "<mark>#{query}</mark>").html_safe
  end
end
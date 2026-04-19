def self.popular_tags
  Rails.cache.fetch("popular_tags", expires_in: 1.hour) do
    joins(:tags).group("tags.name").order("count(*) DESC").limit(10).pluck("tags.name")
  end
end
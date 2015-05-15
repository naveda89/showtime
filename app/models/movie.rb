class Movie < Content
  # Slug
  include FriendlyId
  friendly_id :title, use: :slugged

end

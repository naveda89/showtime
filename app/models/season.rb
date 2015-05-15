class Season < Content
  # Slug
  include FriendlyId
  friendly_id :title, use: :slugged

  # Associations
  has_many :episodes
end

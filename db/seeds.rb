# Contents (Movie/Season)
50.times {
  # Movies
  movie = Movie.create(title: FFaker::Name.name, plot: FFaker::Lorem.paragraph(4))
  # Seasons
  season = Season.create(title: FFaker::Name.name, plot: FFaker::Lorem.paragraph(4))
  10.times { |n| season.episodes.create(num: n) }
}
# Purchase Options
movie_hd_po = PurchaseOption.create(quality: 'hd', price: FFaker::numerify('#.##'))
movie_sd_po = PurchaseOption.create(quality: 'sd', price: FFaker::numerify('#.##'))

season_hd_po = PurchaseOption.create(quality: 'hd', price: FFaker::numerify('#.##'))
season_sd_po = PurchaseOption.create(quality: 'sd', price: FFaker::numerify('#.##'))

# Contents (Movie/Season)
5.times {
  # Movies
  movie = Movie.create(title: FFaker::Name.name, plot: FFaker::Lorem.paragraph(4))
  movie.content_purchase_options.create(purchase_option_id: movie_hd_po.id, active: true)
  movie.content_purchase_options.create(purchase_option_id: movie_sd_po.id, active: true)

  # Seasons
  season = Season.create(title: FFaker::Name.name, plot: FFaker::Lorem.paragraph(4))
  10.times { |n| season.episodes.create(num: n) }
  season.content_purchase_options.create(purchase_option_id: season_hd_po.id, active: true)
  season.content_purchase_options.create(purchase_option_id: season_sd_po.id, active: true)
}

# Users
user = User.create(email: 'alvaro@naveda.me', password: 'password', password_confirmation: 'password')
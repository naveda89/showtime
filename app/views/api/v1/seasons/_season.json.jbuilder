json.extract! season, :slug, :type, :title, :plot
json.url api_v1_season_url(season)
json.episodes season.episodes do |episode|
  json.partial! episode
end

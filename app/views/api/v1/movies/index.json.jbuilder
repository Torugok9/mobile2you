# frozen_string_literal: true
 
json.array! @movies do |filme|
  json.id filme.id
  json.title filme.title
  json.genre filme.genre
  json.year filme.release_year
  json.country filme.country
  json.published_at filme.date_added
  json.description filme.description
end
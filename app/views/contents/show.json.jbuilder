json.movies do
   json.array! @movies do |movie|
      json.(movie, :id, :title, :plot)
   end
end
json.seasons do
   json.array! @seasons do |season|
  	  json.(season, :id, :title, :plot)
  	  json.episodes season.episodes.order(:episode_num), partial: 'episodes/episode', as: :episode
   end
end


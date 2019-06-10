json.(season, :id, :title, :plot)
json.episodes season.episodes.order(:episode_num), partial: 'episodes/episode', as: :episode
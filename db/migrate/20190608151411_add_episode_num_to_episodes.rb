class AddEpisodeNumToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :episode_num, :integer
  end
end

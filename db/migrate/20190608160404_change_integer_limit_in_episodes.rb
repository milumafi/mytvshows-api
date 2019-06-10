class ChangeIntegerLimitInEpisodes < ActiveRecord::Migration[5.2]
  def change
    change_column :episodes, :episode_num, :integer, limit: 8
  end
end

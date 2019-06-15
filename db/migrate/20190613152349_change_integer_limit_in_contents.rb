class ChangeIntegerLimitInContents < ActiveRecord::Migration[5.2]
  def change
    change_column :contents, :content_id, :integer, limit: 8
  end
end

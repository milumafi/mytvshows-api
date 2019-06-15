class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :content_type
      t.integer :content_id
      t.string :video_quality
      t.float :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 20
      t.text :body, limit: 500
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :all_day

      t.timestamps
    end
  end
end

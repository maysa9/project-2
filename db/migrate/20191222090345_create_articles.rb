class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :cityname
      t.string :article

      t.timestamps
    end
  end
end

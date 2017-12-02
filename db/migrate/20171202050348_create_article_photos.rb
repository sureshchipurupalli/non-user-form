class CreateArticlePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :article_photos do |t|
      t.references :articles, foreign_key: true

      t.timestamps
    end
  end
end

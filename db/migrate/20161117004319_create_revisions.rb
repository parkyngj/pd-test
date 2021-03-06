class CreateRevisions < ActiveRecord::Migration[5.0]
  def change
    create_table :revisions do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.integer :original_article_id
    end
  end
end

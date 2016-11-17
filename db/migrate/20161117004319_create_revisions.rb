class CreateRevisions < ActiveRecord::Migration[5.0]
  def change
    create_table :revisions do |t|
      t.integer :editor_id
      t.references :article, foreign_key: true
    end
  end
end

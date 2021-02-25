class CreateChangelogs < ActiveRecord::Migration[6.1]
  def change
    create_table :changelogs do |t|
      t.string :name
      t.text :body
      t.string :pull_request_id
      t.timestamps
    end
  end
end

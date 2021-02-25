class AddStateToChangelogs < ActiveRecord::Migration[6.1]
  def change
    create_table :mailings do |t|
      t.timestamps
    end

    add_column :changelogs, :published_at, :datetime
    add_column :changelogs, :mailing_id, :integer

    add_index :changelogs, :published_at
    add_index :changelogs, :pull_request_id
  end
end

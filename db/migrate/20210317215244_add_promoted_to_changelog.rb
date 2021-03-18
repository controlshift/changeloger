class AddPromotedToChangelog < ActiveRecord::Migration[6.1]
  def change
    add_column :changelogs, :promoted, :boolean
  end
end

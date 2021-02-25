class AddKindToLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :changelogs, :kind, :string
  end
end

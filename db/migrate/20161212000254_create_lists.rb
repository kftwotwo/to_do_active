class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table(:lists) do |l|
      l.column(:name, :string)
      l.column(:done, :boolean)
      l.timestamps()
    end
  end
end

class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :name
      t.string :party
      t.references :vote, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_column :voters, :security_key, :string
  end
end

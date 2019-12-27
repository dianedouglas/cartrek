class CreateOwnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :ownerships do |t|
      t.references :car, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end

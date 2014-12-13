class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :gender
      t.string :age
      t.string :mytown
      t.string :myschools
      t.string :myjob
      t.string :facts

      t.timestamps
    end
    
    add_index :profiles, [:user_id]

  end
end

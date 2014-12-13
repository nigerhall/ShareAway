class CreateRelationships < ActiveRecord::Migration
    def change
        create_table :relationships do |t|
            t.integer :contacts_id
            t.integer :watching_id
            
            t.timestamps
        end
        
        add_index :relationships, :contacts_id
        add_index :relationships, :watching_id
        add_index :relationships, [:contacts_id, :watching_id], unique: true
        
    end
end
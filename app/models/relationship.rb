class Relationship < ActiveRecord::Base
    belongs_to :contacts, class_name: "User"
    belongs_to :watching, class_name: "User"
    validates :contacts_id, presence: true
    validates :watching_id, presence: true
end

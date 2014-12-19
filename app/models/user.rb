class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :relationships, foreign_key: "contacts_id", dependent: :destroy
  has_many :watched_users, through: :relationships, source: :watching
  has_many :reverse_relationships, foreign_key: "watching_id",
  class_name: "Relationship", dependent:  :destroy
  has_many :contacts, through: :reverse_relationships, source: :contacts
  
  def watching?(other_user)
      relationships.find_by(watching_id: other_user.id)
  end
  
  def connect!(other_user)
      relationships.create!(watching_id: other_user.id)
  end
  
  def remove!(other_user)
      relationships.find_by(watching_id: other_user.id).destroy
  end


end

class Profile < ActiveRecord::Base
    belongs_to :user
    has_attached_file :avatar, :styles => { :medium => "300x300>"}, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    validates :user_id, presence: true
    #  validates :name, presence: true
    #  validates :gender, presence: true


def age
    unless birthdate.nil?
        years = Date.today.year- birthdate.year
        if Date.today.month < birthdate.month
            years = years + 1
    end
    if (Date.today.month == birthdate.month &&
        Date.today.day < birthdate.day)
        years = years -1
    end
    return years
    end
    
  end
end

class Brand < ActiveRecord::Base
    has_many :electronics

    validates :name, presence: true, uniqueness: true
end
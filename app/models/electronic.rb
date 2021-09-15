class Electronic < ActiveRecord::Base
    belongs_to :brand

    validates :name, presence: true

    # def greet
    #     "Hello, my name is #{self.name}"
    # end
end
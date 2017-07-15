class Category < ActiveRecord::Base
validates :name, presence: true,length: { minimum: 3,maximum: 25}
validates :name, uniqueness: true, case_sensitive: false
# validates_uniqueness_of :name ,case_sensitive: false
end

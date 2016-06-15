class Suggestion < ActiveRecord::Base
  validates :content, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with =>  /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end

class Suggestion < ActiveRecord::Base
  validates :content, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with =>  /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  paginates_per 20

  has_many :comments

  def approve
    self.approved = true
    return self.update_approval
  end

  def decline
    self.approved = false
    return self.update_approval
  end
  
  def update_approval
    return self.update({name: self.name, email: self.email,
      content: self.content, approved: self.approved})
    end
  end

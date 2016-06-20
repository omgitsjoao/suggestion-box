class Suggestion < ActiveRecord::Base
  validates :content, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with =>  /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  paginates_per 20

  has_many :comments

  def approve
    return self.update({approved: true})
  end

  def decline
    return self.update({approved: false})
  end

  def update_approval
    return self.update({name: self.name, email: self.email,
      content: self.content, approved: self.approved})
    end
  end

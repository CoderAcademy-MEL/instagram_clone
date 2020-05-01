class Post < ApplicationRecord
  belongs_to :user

  validates :description, length: { in: 5..250 }

  def author
    self.user.username
  end
end

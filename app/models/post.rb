class Post < ApplicationRecord
  validates :description, length: { in: 5..250 }
end

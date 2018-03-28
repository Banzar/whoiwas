class Comment < ApplicationRecord
  belongs_to :legacy
  belongs_to :user
end

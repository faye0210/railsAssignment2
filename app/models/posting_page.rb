class PostingPage < ApplicationRecord
  validates :content, presence: true
end

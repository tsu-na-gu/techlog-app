class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true, length: { minimum: 10 }

  scope :ordered, -> { order(created_at: :desc) }
  broadcasts_to ->(comment){"comments"}, inserts_by: :prepend

end

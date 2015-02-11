class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 6}
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged,:finders]
  private
  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end

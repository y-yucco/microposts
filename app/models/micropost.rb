class Micropost < ActiveRecord::Base
  belongs_to :user #れぞれの投稿は特定の1人のユーザーのものである
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end

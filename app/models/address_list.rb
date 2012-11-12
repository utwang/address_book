# coding: utf-8

class AddressList < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  attr_accessible :description, :title

  validates :title, presence: true, length: 6..40
  validate :counts_within_limits

  private
  def counts_within_limits
    if self.class.where(user_id: self.user_id).count == 3
      errors.add(:lists_counts, "アドレス帳の登録は3つまでとなります。")
    end
  end
end

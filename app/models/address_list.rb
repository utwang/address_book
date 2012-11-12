# coding: utf-8

class AddressList < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  attr_accessible :description, :title

  validates :title, presence: true, length: 6..40
  validate :counts_within_limits, if: -> { new_record? }

  private
  def counts_within_limits
    if self.class.all.count == 3
      errors.add(:lists_counts, "アドレス帳の登録は3つまでとなります。")
    end
  end
end

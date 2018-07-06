class Price < ApplicationRecord
  belongs_to :article
  enum rate: { free: 0, low: 1, middle: 2, high: 3 }
  validate :price_validation

  validates :min, presence: true, inclusion: { in: 0..1000}, exclusion: { in: 1..99 }
  validates :max, presence: true, inclusion: { in: 0..5000}, exclusion: { in: 1..99 }
  validates :rate, presence: true

  def price_validation
    if min.nil?
      errors.add(:min, " : 開始価格を入力してください")
    elsif max.nil?
      errors.add(:max, " : 最大価格を入力してください")
    elsif rate.nil?
      errors.add(:rate, " : レートを入力してください")
    elsif min>max 
      errors.add(:min, " : 開始価格を最高価格より小さく設定してください")
    elsif min==0 && (max!=0 || rate != "free")
      errors.add(:min, " : 開始価格が0の時最高価格・レートを0に設定してください")
    end
  end

end

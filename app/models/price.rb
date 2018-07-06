class Price < ApplicationRecord
  belongs_to :article
  enum min: { min_plan_0: 0, min_plan_1: 10, min_plan_2: 100, min_plan_3: 500, min_plan_4: 1000 }
  enum max: { max_plan_0: 0, max_plan_1: 500, max_plan_2: 1000 ,max_plan_3: 2000, max_plan_4: 5000 }
  enum rate: { free: 0, high: 1, normal: 2, low: 3 }

  validates :min, presence: true
  validates :max, presence: true
  validates :rate, presence: true
  validate :price_validation

  def price_validation
    if min_before_type_cast.to_i > max_before_type_cast.to_i
      errors.add(:min, "min price should be smaller than max price.")
    elsif min_before_type_cast.to_i ==0 && max_before_type_cast.to_i != 0 || rate_before_type_cast.to_i != 0
      errors.add(:max, "if min is 0, max and rate should be 0.")
    end
  end

end

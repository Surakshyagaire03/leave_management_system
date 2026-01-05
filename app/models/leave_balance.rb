class LeaveBalance < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_type

  validates :balance_days, numericality: { greater_than_or_equal_to: 0 }

  # Instance method
  def deduct(days)
    update(balance_days: balance_days - days)
  end
end


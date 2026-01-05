class LeaveRequest < ApplicationRecord
  belongs_to :employee
  belongs_to :leave_type

  STATUSES = %w[pending approved rejected]

  validates :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUSES }

  validate :end_date_after_start_date

  scope :pending, -> { where(status: "pending") }
  scope :approved, -> { where(status: "approved") }

  #  its a instance method
  def total_days
    (end_date - start_date).to_i + 1
  end

  private

  def end_date_after_start_date
    return if start_date.nil? || end_date.nil?

    if end_date < start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end


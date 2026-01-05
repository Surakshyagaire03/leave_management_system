class Employee < ApplicationRecord
  belongs_to :department
  has_many :leave_balances, dependent: :destroy
  has_many :leave_requests, dependent: :destroy
  has_many :leave_types, through: :leave_balances

  validates :name, :email, :employee_code, :join_date, :status, presence: true
  validates :email, :employee_code, uniqueness: true

  after_create :initialize_leave_balances

  scope :active, -> { where(status: "active") }

  # its a instance method
  def active?
    status == "active"
  end

  private

  def initialize_leave_balances
    LeaveType.find_each do |leave_type|
      leave_balances.create!(
        leave_type: leave_type,
        balance_days: 0
      )
    end
  end
end

class Classroom < ActiveRecord::Base
  belongs_to :school
  has_many :students, dependent: :destroy
  has_many :book_bags, dependent: :destroy
  has_many :assignments, -> { joins(:student) }, through: :plans
  has_many :returned_assignments, -> { joins(:book_bag) }, through: :inventory_states, source: :assignments

  has_many :periods
  has_many :inventory_states, through: :periods
  has_many :plans, through: :periods, dependent: :destroy

  # All assignments that are out on loan
  # This can likely be rewritten in SQL
  def loaned_assignments
    assignments - returned_assignments
  end

  def available_book_bags
    book_bags.active - loaned_assignments.map(&:book_bag)
  end

  def eligible_for_new_plan?
    !!!current_plan.try(:active?)
  end

  def current_plan
    current_period.try(:plan)
  end

  def current_period
    periods.last
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def active_students
    students.name_sorted.active
  end

  def display_plans
    plans.order("id DESC")
  end

  def eligible_students
    active_students - loaned_assignments.map(&:student)
  end

  def presenter
    @presenter ||= ClassroomPresenter.new(self)
  end
end

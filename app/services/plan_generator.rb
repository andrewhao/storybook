# Generates a set of assignments that satisfy the constraint that
# all students receive a unique bag assignment.
#
# Implemented as a CSP.
class PlanGenerator

  attr_accessor :students, :bags, :bag_history_lookup

  # @param [Array] students An array of Students
  # @param [Array] bags An array of BookBags
  def initialize(students, bags)
    @students = students
    @bags = bags
    @bag_history_lookup = {}
    @students.each do |s|
      history = s.past_assignments.map(&:book_bag_id)
      @bag_history_lookup[s.id] = history
    end
  end

  # Generates a set of Assignments for a given set of students and bags.
  def generate
    # To simplify algorithm and reduce memory usage, reduce all objects to 
    # low level data types.
    student_ids = students.map(&:id)
    bag_ids = bags.map(&:id)

    # Generate uniqes
    spaces = student_ids.product(bag_ids)

    # Now generate combinations of those uniques
    full_solution_space = spaces.permutation(students.count).to_a

    # Assign those to the CSP
    plan = solver.choose(*full_solution_space)

    solver.assert plan_assigns_uniques(plan)
    solver.assert plan_accounts_for_history(plan)

    plan.map do |sid, bid|
      Assignment.new(student: Student.find(sid), book_bag: BookBag.find(bid))
    end
  rescue Amb::ExhaustedError => e
    raise NoPlanFound.new("Unable to generate a plan. Please add a bag.")
  end

  private

  def plan_assigns_uniques(plan)
    unique_students = plan.map(&:first).uniq.count == students.count
    unique_plans = plan.map(&:last).uniq.count == bags.count
    unique_students && unique_plans
  end

  def plan_accounts_for_history(plan)
    plan.none? do |assignment|
      student_id, bag_id = assignment
      history = @bag_history_lookup[student_id]
      history.include?(bag_id)
    end
  end

  class Solver
    include Amb
  end

  # Raised when it's impossible to find a plan, and the user needs
  # to be prompted about it.
  class NoPlanFound < StandardError; end

  def solver
    @solver ||= Solver.new
  end
end
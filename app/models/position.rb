class Position
  include ActiveGraph::Node
  include ActiveGraph::Timestamps
  property :title, type: String
  property :historical_index, type: Integer
  property :active, type: Boolean
  has_one :out, :employee, type: :position
  has_one :out, :department, type: :department

  scope :current, ->(bool) {
    clause = { historical_index: 1 }
    bool ? where(clause) : where.not(clause)
  }

  def self.reorder!(employee_id)
    scope = Position.where(employee_id: employee_id).order(created_at: :desc)
    scope.each_with_index do |p, index|
      p.update_attribute(:historical_index, index + 1)
    end
  end
end

class Task
  include ActiveGraph::Node
  include ActiveGraph::Timestamps
  property :title, type: String
  TYPES = %w(Bug Feature Epic)

  has_one :out, :team, type: :task
  has_one :out, :employee, type: :task
end

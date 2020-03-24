class Milestone
  include ActiveGraph::Node
  include ActiveGraph::Timestamps
  include ActiveGraph::UndeclaredProperties
  property :name, type: String

  has_one :out, :epic, type: :epic
end

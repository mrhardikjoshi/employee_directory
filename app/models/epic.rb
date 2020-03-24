class Epic < Task
  include ActiveGraph::Node
  include ActiveGraph::Timestamps
  include ActiveGraph::UndeclaredProperties
  property :type, type: String
  property :title, type: String

  has_many :in, :milestones, type: :milestone
end

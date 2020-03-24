class Team
  include ActiveGraph::Node
  include ActiveGraph::Timestamps
  property :name, type: String
  has_one :out, :department, type: :department
  has_many :out, :employee, type: :team

  has_many :in, :notes, type: :note
  has_many :in, :tasks, type: :task
end

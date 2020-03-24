class Department
  include ActiveGraph::Node
  include ActiveGraph::Timestamps
  include ActiveGraph::UndeclaredProperties
  property :name, type: String

  has_many :in, :positions, type: :department
  has_many :in, :teams, type: :team
  has_many :in, :notes, type: :note
end

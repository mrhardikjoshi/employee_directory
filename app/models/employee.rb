class Employee
  include ActiveGraph::Node
  include ActiveGraph::Timestamps

  property :title, type: String
  property :first_name, type: String
  property :last_name, type: String
  property :age, type: Integer

  has_many :in, :positions, type: :position
  has_many :in, :team, type: :team
  has_many :in, :notes, type: :note
  has_many :in, :tasks, type: :task
  has_many :in, :bugs, type: :bug
  has_many :in, :features, type: :feature
  has_many :in, :epics, type: :epic
end

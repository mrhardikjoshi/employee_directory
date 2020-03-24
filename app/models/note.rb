class Note
  include ActiveGraph::Node
  include ActiveGraph::Timestamps
  has_one :out, :employee, type: :note
  has_one :out, :department, type: :note
end

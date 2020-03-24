class DepartmentResource < ApplicationResource
  attribute :name, :string

  has_many :positions
  has_many :teams
  has_many :notes
end

class EmployeeResource < ApplicationResource
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :age, :integer
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string, only: [:filterable, :sortable]

  has_many :positions
  has_many :tasks
  has_many :teams
  has_many :notes
end

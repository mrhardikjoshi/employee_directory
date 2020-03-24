class TeamResource < ApplicationResource
  attribute :department_id, :integer, only: [:filterable]
  attribute :name, :string

  has_one :department
  has_many :employees
  has_many :tasks
  has_many :notes
end

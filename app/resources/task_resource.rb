class TaskResource < ApplicationResource
  self.polymorphic = %w(FeatureResource BugResource EpicResource)

  attribute :employee_id, :integer, only: [:filterable]
  attribute :team_id, :integer, only: [:filterable]
  attribute :title, :string

  has_one :employee
  has_one :team
end

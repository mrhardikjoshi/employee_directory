class PositionResource < ApplicationResource
  attribute :employee_id, :integer, readable: false
  attribute :department_id, :integer, readable: false
  attribute :title, :string
  attribute :historical_index, :integer, only: [:sortable]
  attribute :active, :boolean

  has_one :employee
  has_one :department

  before_commit only: [:create, :destroy] do |position|
    Position.reorder!(position.employee_id)
  end
end

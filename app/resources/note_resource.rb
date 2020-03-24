class NoteResource < ApplicationResource
  attribute :notable_id, :integer, only: [:filterable]
  attribute :body, :string

  has_one :employee
  has_one :department
  has_one :team
end

class Quote < ApplicationRecord
  belongs_to :company
  # No Async method
  #after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  #after_create_commit -> { broadcast_prepend_to "quotes" }
  #after_update_commit -> { broadcast_replace_to "quotes" }
  #after_destroy_commit -> { broadcast_remove_to "quotes" }
  #
  # Async method
  #after_create_commit -> { broadcast_prepend_later_to "quotes" }
  #after_update_commit -> { broadcast_replace_later_to "quotes" }
  #after_destroy_commit -> { broadcast_remove_to "quotes" }

  # Compact Async method
  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
end

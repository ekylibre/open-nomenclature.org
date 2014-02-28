module Checkable
  extend ActiveSupport::Concern

  included do
    extend Enumerize
    enumerize :state, in: [:draft, :deliberating, :approved, :deprecated, :removed], default: :draft, predicates: true
  end

end

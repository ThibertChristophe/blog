class Picture < ApplicationRecord
  to_belongs :imageable, polymorphic: true
end

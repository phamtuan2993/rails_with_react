class Idea < ActiveRecord::Base

	has_many :pictures, foreign_key: :idea_id, dependent: :destroy
end

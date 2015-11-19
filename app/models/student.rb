class Student < ActiveRecord::Base
  belongs_to :teacher

  def self.needs_help
    self.all.sort_by do |student|
      student.current_score
    end.first(5)
  end
end

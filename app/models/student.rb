class Student < ApplicationRecord

  validates :s_firstname, :s_lastname, :s_department, presence: true
  validates :s_department, inclusion: { in: %w(IT CE),message: "Department can't be the %{value}" }
  validates :s_terms, acceptance: true
  validate :birthdate_cannot_be_in_future

  before_validation :check_validation 
  before_validation :check_dob
  after_validation :complete_validation
  after_save :complete_save
  before_update :updating
  after_update :updated
  after_destroy :deleted, if: Proc.new { |student| student.s_department == "CE" }

  after_initialize do |student|
    puts "----You have initialized a student!----"
  end

  after_find do |student|
    puts "----You have found a student!----"
  end

  after_touch do
    puts '----An Employee was touched----'
  end

  private

    def check_validation
      puts "----checking for validation.----"
    end

    def check_dob
      puts "----studen's birthdate is being validated----"
    end

    def complete_validation
      puts "----validation completed!!----"
    end

    def complete_save
      puts "----student saved successfully!!----"
    end

    def updating
      puts "----student is being edited----"
    end

    def updated
      puts "----student is updated successfully!!---- "
    end

    def deleted
      puts "----student has been deleted!!----"
    end

  def birthdate_cannot_be_in_future
    if s_dob.present? && s_dob > Date.today
      errors.add(:s_dob, "----can't be in the future----")
    end
  end 
end

class Faculty < ApplicationRecord

  # validated faculties' fields.
  validates :f_firstname, :f_lastname, :f_phone, :f_email, :f_dob, :f_designation, presence: true
  validates :f_phone, length: { is: 10 }, numericality: { only_integer: true } 
  validates :f_email, uniqueness: true
  validates :f_designation, exclusion: { in: %w(HOD Sr.Prof),
    message: "Faculty can not be %{value}" }, inclusion: { in: %w(Ass.Prof. Prof.), message: "Invalid faculty designation" }
  validate :birthdate_cannot_be_in_future

  # implemented callbacks 
  before_validation :check_validation
  after_validation :complete_validation, :check_dob
  after_save :complete_save, :check_email
  before_update :updating
  after_update :updated
  after_destroy :deleted 
  
  after_initialize do |faculty|
    puts "----You have initialized a faculty!----"
  end

  after_find do |faculty|
    puts "----You have found a faculty!----"
  end

  after_touch do
    puts '----An Employee was touched----'
  end

  # Methods for callbacks
  private

    # calling before validation
    def check_validation
      puts "----checking for validation.----"
    end

    # calling after validation
    def complete_validation
      puts "----validation completed!!----"
    end

    # calling after object is saved.
    def complete_save
      puts "----faculty saved successfully!!----"
    end

    # calling after faculty's birthdate validation.
    def check_dob
      puts "----faculty's Birthdate validated.----"
    end

    # calling after faculty's email validated.
    def check_email
      puts "----faculty's email validated.----"
    end

    # calling before object update.
    def updating
      puts "----faculty is being edited----"
    end

    # calling after object is updated.
    def updated
      puts "----faculty is updated successfully!! ----"
    end

    # calling after object is deleted.
    def deleted
      puts "----faculty has been deleted!!----"
    end

  # custom method for validating birthdate.
  def birthdate_cannot_be_in_future
    if f_dob.present? && f_dob >= Date.today
      errors.add(:f_dob, "can't be in the future.")
    end
  end  
end

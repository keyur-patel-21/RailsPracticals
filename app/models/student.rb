class Student < ApplicationRecord

  #validated students' field
  validates :s_firstname, :s_lastname, :s_department, presence: true
  validates :s_department, inclusion: { in: %w(IT CE),message: "Department can't be the %{value}" }
  validates :s_terms, acceptance: true
  validate :birthdate_cannot_be_in_future

  # implemented callbacks 
  before_validation :check_validation, :check_dob  
  after_validation :complete_validation
  after_save :complete_save
  before_update :updating
  after_update :updated
  after_destroy :deleted , if: :delete_count?

  # Method that called after initializing
  after_initialize do |student|
    puts "----You have initialized a student!----"
  end

  # Method that called after finding object
  after_find do |student|
    puts "----You have found a student!----"
  end

  # Method taht called when object is touched.
  after_touch do
    puts '----An Student was touched----'
  end

  private

    # calling before validation
    def check_validation
      puts "----checking for validation.----"
    end

    # calling before validation of Birth date.
    def check_dob
      puts "----studen's birthdate is being validated----"
    end

    # Calling before after validation gets completed.
    def complete_validation
      puts "----validation completed!!----"
    end

    # Calling after object saved.
    def complete_save
      puts "----student saved successfully!!----"
    end

    # calling before object is updated.
    def updating
      puts "----student is being edited----"
    end

    # calling after object is updated.
    def updated
      puts "----student is updated successfully!!---- "
    end

    # calling after object is deleted
    def deleted
      puts "----student has been deleted!!----"
    end
    
    # conditional method for checking condition.
    def delete_count?
      Student.count >= 2 ? true : false
    end

    # custom method for validating birthdate
  def birthdate_cannot_be_in_future
    if s_dob.present? && s_dob > Date.today
      errors.add(:s_dob, "----can't be in the future----")
    end
  end 
end

class Faculty < ApplicationRecord

  validates :f_firstname, :f_lastname, :f_phone, :f_email, :f_dob, :f_designation, presence: true
  validates :f_phone, length: { minimum: 10 }, numericality: { only_integer: true } 
  validates :f_email, uniqueness: true
  validates :f_designation, exclusion: { in: %w(HOD Sr.Prof),
    message: "Faculty can not be %{value}" }, inclusion: { in: %w(Ass.Prof. Prof.), message: "Invalid faculty designation" }
  validate :birthdate_cannot_be_in_future

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

  private

    def check_validation
      puts "----checking for validation.----"
    end

    def complete_validation
      puts "----validation completed!!----"
    end

    def complete_save
      puts "----faculty saved successfully!!----"
    end

    def check_dob
      puts "----faculty's Birthdate validated.----"
    end

    def check_email
      puts "----faculty's email validated.----"
    end

    def updating
      puts "----faculty is being edited----"
    end

    def updated
      puts "----faculty is updated successfully!! ----"
    end

    def deleted
      puts "----faculty has been deleted!!----"
    end

  def birthdate_cannot_be_in_future
    if f_dob.present? && f_dob >= Date.today
      errors.add(:f_dob, "can't be in the future")
    end
  end  
end

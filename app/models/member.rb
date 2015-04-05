class Member < ActiveRecord::Base
    
   validates :Last_Name, presence: true, length: { maximum: 50 }
   validates :First_Name, presence: true, length: { maximum: 50 }
    
   #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   #validates :Main_Email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    
   VALID_ZIP_REGEX=/\A[0-9]+\z/
   validates :Zip, length: { minimum: 5 },  format: { with: VALID_ZIP_REGEX }
   
   #VALID_PHONE_REGEX=/\A[0-9]+\z/
   #validates :Main_Phone, length: { maximum: 255 },  format: { with: VALID_PHONE_REGEX }
   
   require 'date'
   
   #validates :Date_Joined_TAA, :numericality => { :greater_than => 1900, :less_than_or_equal_to => Time.now.year.to_i }
   
   #def FullName
    #[First_Name, Last_Name].join " "
   #end
   
   #Import CSV forms
   def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
       Member.create! row.to_hash
     end
   end
   
end

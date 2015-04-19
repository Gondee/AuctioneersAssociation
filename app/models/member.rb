class Member < ActiveRecord::Base
    
   has_many :payments, dependent: :destroy 
   has_many :pacs, dependent: :destroy
   has_many :continueedus, dependent: :destroy
   has_secure_password
   validates :password, length: { minimum: 6 }, confirmation: true, allow_blank: true
   validates :password_confirmation, presence: true, allow_blank: true
   validates :Last_Name, presence: true, length: { maximum: 50 }
   validates :First_Name, presence: true, length: { maximum: 50 }
    
   #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   #validates :Main_Email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    
   VALID_ZIP_REGEX=/\A[0-9]+\z/
   validates :Zip, length: { minimum: 5 },  format: { with: VALID_ZIP_REGEX }, allow_blank: true
   
   #VALID_PHONE_REGEX=/\A[0-9]+\z/
   #validates :Main_Phone, length: { maximum: 255 },  format: { with: VALID_PHONE_REGEX }
   
   
   
   #validates :Date_Joined_TAA, :numericality => { :greater_than => 1900, :less_than_or_equal_to => Time.now.year.to_i }
   
   #def FullName
    #[First_Name, Last_Name].join " "
   #end
   
   #Import CSV forms
   def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
       import_hash = row.to_hash
       if import_hash["Pymt_Amt"] != nil
         import_hash["Pymt_Amt"] = import_hash["Pymt_Amt"].gsub(/\D/,'').to_i
       end
       if import_hash["PAC_Contribution"] != nil
         import_hash["PAC_Contribution"] = import_hash["PAC_Contribution"].gsub(/\D/,'').to_i
       end
       if import_hash["Added_to_WebBase"] != nil
         if import_hash["Added_to_WebBase"] == "Y"
           import_hash["Added_to_WebBase"] = true
         else
           import_hash["Added_to_WebBase"] = false
         end
       end
       
       if import_hash["password_digest"] == nil
        my_inital_password = BCrypt::Password.create("123456")
        password_hash={:password_digest=>my_inital_password}
        import_hash=import_hash.merge(password_hash)
       end
       
       member_hash = Hash.new()
       member_hash = import_hash
       Member.create! member_hash
       
       payment_hash = Hash.new()
       payment_hash["member"] = Member.last
       payment_hash["Pymt_Type"] = import_hash["Pymt_Type"]
       payment_hash["Pymt_Amt"] = import_hash["Pymt_Amt"]
       payment_hash["Pymt_Date"] = import_hash["Pymt_Date"]
       Payment.create! payment_hash
       
       pac_hash = Hash.new()
       pac_hash["member"] = Member.last
       pac_hash["PAC_Contribution"] = import_hash["PAC_Contribution"]
       Pac.create! pac_hash

       ce_hash = Hash.new()
       ce_hash["member"] = Member.last
       ce_hash["Annual_Convention_CE_Hours"] = import_hash["Annual_Convention_CE_Hours"]
       ce_hash["Online_CE_Hours"] = import_hash["Online_CE_Hours"]
       Continueedu.create! ce_hash
     end
   end
   
   def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |member|
          csv << member.attributes.values_at(*column_names)
        end
      end
   end


end

#user data model
# name:string, email: string, created_at: datetime, updated_at:datetime, password_digest: string, remember_digest: string, 
# id:integer, admin: boolean, activation_digest:string, activated:bool, activated_at:datetime, reset_digest:string, reset_sent_at:datetime

class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token, :validate_email
  self.per_page = 15
  
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name, presence: true, length:{maximum: 50}
  VALID_EMAIL_REGEX = /osi\.ca\.gov|berkeley\.edu|buttecounty\.net|dss\.gov\.ca|co\.siskiyou\.ca\.us|co\.amador\.ca\.us|mono\.ca\.gov|cosb\.us|co\.calaveras\.ca\.us|karuk\.us|prob\.cccounty\.us|ssa\.ocgov\.com|solanocounty\.com|us\.ibm\.com|co\.kings\.ca\.us|co\.sanmateo\.ca\.us|inyocounty\.us|prob\.sbcounty\.gov|co\.modoc\.ca\.us|madera-county\.com|tcprobation\.org|dss\.co\.lake\.ca\.us|edcgov\.us|co\.santa-cruz\.ca\.us|co\.fresno\.ca\.us|probation\.lacounty\.gov|hra\.co\.santa-cruz\.ca\.us|ventura\.org|pro\.sccgov\.org|sbcsocialserv\.org|Co\.Kings\.Ca\.Us|co\.sutter\.ca\.us|co\.lassen\.ca\.us|trinitycounty\.org|placer\.ca\.gov|comendocino\.ca\.us|co\.nevada\.ca\.us|co\.slo\.ca\.us|sfgov\.org|kerndhs\.com|tcdss\.org|ehsd\.cccounty\.us|amadorgov\.org|yuroktribe\.nsn\.us|co\.san-joaquin\.ca\.us|cwda\.org|co\.tuolumne\.ca\.us|co\.santa-barbara\.ca\.us|sierracounty\.ca\.gov|rcprob\.us|glenncountyhealth\.net|CWS\.state\.ca\.us|co\.shasta\.ca\.us|acgov\.org|colusadhhs\.org|tularehhsa\.org|mcdoss\.net|countyofcolusa\.com|lakecountyca\.gov|co\.sisqjustice\.ca\.us|ucb\.edu|dhcs\.ca\.gov|DSS\.ca\.gov|alpineso\.com|co\.mendocino\.ca\.us|hra\.co\.glenn\.ca\.us|co\.madera\.ca\.us|hss\.sbvounty\.gov|SSA\.OCGOV\.COM|alpinecountyca\.gov|ucdavis\.edu|co\.kern\.ca\.us|SBCSocialServ\.org|stancounty\.com|countyofplumas\.com|co\.stanislaus\.ca\.us|SolanoCounty\.com|doit\.cccounty\.us|sierracounty\.ws|SacCounty\.Net|riversidedpss\.org|hsd\.co\.santa-cruz\.ca\.us|dcfs\.lacounty\.gov|cws\.ca\.us|co\.tulare\.ca\.us|csufresno\.edu|dnco\.org|dss\.ca\.gov|hss\.sbcounty\.gov|co\.napa\.ca\.us|prob\.ocgov\.com|SFGOV\.ORG|co\.del-norte\.ca\.us|sonoma-county\.org|co\.yuba\.ca\.us|countyofnapa\.org|ssa\.sccgov\.org|cws\.state\.ca\.us|cws\.sccgov\.org|cw\.nevada\.ca|santacruzcounty\.us|smchsa\.org|yolocounty\.org|sjgov\.org|saccounty\.net|rivco\.org|marincounty\.org|mariposahsc\.org|co\.humboldt\.ca\.us|sdcounty\.ca\.gov|isd\.lacounty\.gov|hsa\.co\.merced\.ca\.us|co\.monterey\.ca\.us|co\.merced\.ca\.us|co\.imperial\.ca\.us|schsd\.org|jps\.net|countyofglenn\.net|mariposacounty\.org/
  validates :email, presence: true, length:{maximum: 255}, format:{with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}, if: :validate_email?
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_many :assignments, dependent: :destroy 
  has_many :roles, through: :assignments
  accepts_nested_attributes_for :roles
  
  
  
  
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
  digest = send("#{attribute}_digest")
  return false if digest.nil?
  BCrypt::Password.new(digest).is_password?(token)
  end
  
  #forgets a user make remember_digest attribute nil
  def forgets
    update_attribute(:remember_digest, nil)
  end
  
  # Activates an account.
  def activate
    #update_attribute(:activated,    true)
    #update_attribute(:activated_at, Time.zone.now)
    #using update_columns, you can update mulitple fields with one hit to the database
    update_columns(activated: true, activated_at: Time.zone.now)
    self.roles << Role.new(name: "Registered User")
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  
  
  #Create  a password reset digest and save it to DB
  def create_reset_digest
    self.reset_token = User.new_token
    
    #refactor code to one line using update_column
    #update_attribute(:reset_digest,  User.digest(reset_token))
    #update_attribute(:reset_sent_at, Time.zone.now)
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
    
  end
  
   # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
   # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  def validate_email?
      puts validate_email.to_s
      validate_email == 'true' || validate_email == true
  end
  
  
  
  
  
  
  private
    #convert emails to all lower-case
    def downcase_email
      self.email = email.downcase
    end
    
    #Create and assigns the activation token and digest
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    
    
    
  
end

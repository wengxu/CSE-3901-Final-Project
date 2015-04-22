class User < ActiveRecord::Base
	
	belongs_to :groups
	has_many :free_times, dependent: :destroy
	before_save {self.email = self.email.downcase}
	EMAIL_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length:{maximum: 30}
	validates_uniqueness_of :name
	validates :email, presence: true, length: {maximum: 255}, format: {with: EMAIL_EXPRESSION }, uniqueness: { case_sensitive: false}
	has_secure_password
	validates :password, length: { minimum: 6 }, allow_blank: true
	validates :major, length: {minimum: 3}
	validate :name_should_exist


	def name_should_exist
	 agent = Mechanize.new { |agent| agent.user_agent_alias = "Windows Chrome" }
    searchPage = agent.get('http://www.lolking.net/')
	#search for player with the user name keyword
	searchBox = searchPage.forms.first
	searchBox['name'] = name
	resultPage = searchBox.submit
	resultBody = resultPage.body
	result_doc = Nokogiri::HTML(resultBody)

	rank = result_doc.xpath("//li[contains(@class, 'featured')]/div[3]/div[1]").text.strip
   	 if rank.length == 0
    	  errors.add(:name, "Error: We could not find a North America summoner with the name #{name}")
   	 end
        end

	def self.search(query)
	# where(:title, query) -> This would return an exact match of the query
	where("name like ?", "%#{query}%")
	end

end

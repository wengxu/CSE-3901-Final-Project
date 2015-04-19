# this file defines the scrapeInfo method that scrapes user info from the website

require "mechanize"

def scrapeInfo (userName)
  url = 'http://www.lolking.net/summoner/na/23441088#profile'
#text file for output information

agent = Mechanize.new { |agent| agent.user_agent_alias = "Windows Chrome" }

#get search page
searchPage = agent.get(url)
#search for player with the user name keyword
searchBox = searchPage.forms.first
searchBox['name'] = userName
resultPage = searchBox.submit

resultPage=resultPage.body

result_doc = Nokogiri::HTML(resultPage)

# get the rank
rank = result_doc.xpath("//li[contains(@class, 'featured')]/div[3]/div[1]").text.strip

puts rank

end 

scrapeInfo 'Lark Vistahl'

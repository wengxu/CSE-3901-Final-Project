# this file defines the scrapeInfo method that scrapes user info from the website

require "mechanize"

def scrapeInfo (userName)
  url = 'http://www.lolking.net/'
#text file for output information

agent = Mechanize.new { |agent| agent.user_agent_alias = "Windows Chrome" }

#get search page
searchPage = agent.get(url)
#search for player with the user name keyword
searchBox = searchPage.forms.first
searchBox['name'] = userName
resultPage = searchBox.submit

resultBody = resultPage.body

result_doc = Nokogiri::HTML(resultBody)

# get the rank
rank = result_doc.xpath("//li[contains(@class, 'featured')]/div[3]/div[1]").text.strip

pic_url= result_doc.css("div#summoner-titlebar-icon")[0]['style']
pic_url.slice!(0, 24)
pic_url.slice!(-2,3)

wins = result_doc.css("td.lifetime_stats_val")[0].text
kills = result_doc.css("td.lifetime_stats_val")[1].text
assists = result_doc.css("td.lifetime_stats_val")[2].text

puts "URL : #{resultPage.uri}"
puts "Rank: #{rank}"
puts "Picture URL: #{pic_url}"
puts "Wins: #{wins}"
puts "Kills: #{kills}"
puts "Assists: #{assists}"

end 

scrapeInfo 'Lark Vistahl'
scrapeInfo 'PseudoSwag'


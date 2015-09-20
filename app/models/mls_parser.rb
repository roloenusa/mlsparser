module MlsParser
  require 'open-uri'

  @base_url = 'http://maxebrdi.paragonrels.com/publink/'

  def self.parse(url)
    uri = URI(url)
    gui = CGI::parse(uri.query)['GUID'].first
    left_url = nil;

    doc = Nokogiri::HTML(open(url))
    doc.xpath("//frame").each do |frame|
        if frame['name'] == 'left'
            left_url = frame['src']
        end
    end

    listings = []
    doc = Nokogiri::HTML(open("#{@base_url}#{left_url}"))
    doc.xpath("//td/a").each do |link|
        target = link["onclick"].split("'")[1]

        mls = {
          gui: gui,
          target: target,
          mls: link.text
        }
        mls.merge!(self.parse_house(self.link(mls)));
        listings << mls
    end

    return listings
  end

  def self.parse_house(url)
    doc = Nokogiri::HTML(open(url)).xpath("//div")
    # doc.each_with_index do |v, i|
    #   puts "#{i}: #{v.text}"
    # end


    data = {
      address: "#{doc[98].text}, #{doc[99].text}, #{doc[100].text}",
      price: doc[102].text.gsub(/[\D]/, '').to_i,
      sqft: doc[134].text.to_i
    }
    return data
  end

  def self.link(info)
    return "#{@base_url}Report.aspx?outputtype=HTML&GUID=#{info[:gui]}&ListingID=#{info[:target]}&Report=Yes&view=29&layout_id=1910"
  end
end

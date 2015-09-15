module MlsParser
  require 'open-uri'

  def self.parse(url)
    uri = URI(url)
    gui = CGI::parse(uri.query)['GUID'].first
    base_url = 'http://maxebrdi.paragonrels.com/publink/'
    left_url = nil;

    doc = Nokogiri::HTML(open(url))
    doc.xpath("//frame").each do |frame|
        if frame['name'] == 'left'
            left_url = frame['src']
        end
    end

    listings = {}
    doc = Nokogiri::HTML(open("#{base_url}#{left_url}"))
    doc.xpath("//td/a").each do |link|
        target = link["onclick"].split("'")[1]

        listings[link.text] = "#{base_url}Report.aspx?outputtype=HTML&GUID=#{gui}&ListingID=#{target}&Report=Yes&view=29&layout_id=1910"
    end

    return listings
  end
end

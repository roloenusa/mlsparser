class WelcomeController < ApplicationController

  def index
    render "index"
  end

  def parse
    @listings = MlsParser::parse(params["url"])
    render "parse"
  end
end

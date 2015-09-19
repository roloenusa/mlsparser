class Piti < ActiveRecord::Base
  belongs_to :listing

  INTEREST = 4.57
  MATURITY = 360
  INSURANCE = 800
  TAX = 1.25

  before_create do
    self.interest  = INTEREST if self.interest.blank?
    self.maturity  = MATURITY if self.maturity.blank?
    self.insurance = INSURANCE if self.insurance.blank?
    self.tax = TAX if self.tax.blank?
  end

  def self.build
    piti = self.new
    piti.interest  = INTEREST
    piti.maturity  = MATURITY
    piti.insurance = INSURANCE
    piti.tax = TAX

    return piti
  end
end

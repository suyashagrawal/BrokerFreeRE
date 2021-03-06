module ApplicationHelper
  def options_for_bed_and_bath
    (1..12).map{ |i| ["#{i}+", i] }
  end

  def countries
    ISO3166::Country.all
  end
end
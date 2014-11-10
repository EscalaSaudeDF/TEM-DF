# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Date::MONTHNAMES = [nil] + %w(Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro)  
Date::DAYNAMES = %w(Domingo Segunda-Feira Terça-Feira Quart-Feira Quinta-Feira Sexta-Feira Sábado)  
Date::ABBR_MONTHNAMES = [nil] + %w(Jan Fev Mar Abr Mai Jun Jul Aug Sep Out Nov Dez)  
Date::ABBR_DAYNAMES = %w(Dom Seg Ter Qua Qui Sex Sab)
 
class Time 
  alias :strftime_nolocale :strftime 
  def strftime(format)  
    format = format.dup  
    format.gsub!(/%a/, Date::ABBR_DAYNAMES[self.wday])  
    format.gsub!(/%A/, Date::DAYNAMES[self.wday])  
    format.gsub!(/%b/, Date::ABBR_MONTHNAMES[self.mon])  
    format.gsub!(/%B/, Date::MONTHNAMES[self.mon])  
    self.strftime_nolocale(format)  
  end 
end
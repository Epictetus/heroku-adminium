module Heroku::Command
  class Adminium < BaseWithApp
    Help.group("Adminium") do |group|
      group.command "adminium", "enable adminium for the current app"
    end
    
    def initialize(*args)
      super
      @config_vars = heroku.config_vars(app)
      @adminium_url = @config_vars["ADMINIUM_URL"]
      abort " !   Please add the adminium addon first." unless @adminium_url
    end
    
    def index
      puts "In order to provide you with an administration interface for your data,"
      puts "Adminium will store an encrypted version of the DATABASE_URL of your application"
      puts "(removing the addon will delete that info from the Adminium database)"
      puts "Do you confirm the plugin execution ? (yes / no)"
      print "> "
      answer = gets
      if answer.chomp == 'yes'
        RestClient::Resource.new(@adminium_url).put :account => {:db_url => @config_vars['DATABASE_URL']}
        puts "Successfully enabled Adminium for the current app."
      else
        puts "Plugin execution aborted."
      end
    end

  end
end
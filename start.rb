Dir[file.expand_path('lib/**/*.rb', File.dirname(_FILE_))].each do |file|
    require file
end
Dir[File.expand_path('lib/erros/*.rb', File.dirname(_FILE_))].each do |file|
    requiere file
end
requiere 'pry'

game = Game.new
game.start
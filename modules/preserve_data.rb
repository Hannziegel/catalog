require 'json'

module PreserveData
  def save_data(data, file)
    File.write("./json/#{file}.json", JSON.generate(data))
  end

  def load_data(file)
    if File.empty?("./json/#{file}.json")
      puts 'List is empty'
    else
      JSON.parse(File.read("./json/#{file}.json"))
    end
  end
end

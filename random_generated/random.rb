#!/usr/bin/ruby
require 'optparse'

class Parser
  def self.parse(args)
    options = {}
    options['pointCount'] = 1000
    options['outputFileName'] = 'out.txt'
    options['sizeX'] = 1000
    options['sizeY'] = 1000
    options['sizeL'] = 30
    options['sizeH'] = 10
    options['maxLabelNameLength'] = 12

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: random.rb [options]"

      opts.on("-cCount", "--pointCount=Count", Integer, "Count of generated points") do |count|
        options['pointCount'] = count
      end

      opts.on("-oFileName", "--outputFileName=FileName", String, "Path to output file") do |fileName|
        options['outputFileName'] = fileName
      end

      opts.on("-xSize", "--sizeX=Size", Integer, "absolute value of the maximum x coordinate") do |sizeX|
        options['sizeX'] = sizeX
      end

      opts.on("-ySize", "--sizeY=Size", Integer, "absolute value of the maximum y coordinate") do |sizeY|
        options['sizeY'] = sizeY
      end

      opts.on("-lSize", "--sizeL=Size", Integer, "Maximum length of labels") do |sizeL|
        options['sizeL'] = sizeL
      end

      opts.on("-sSize", "--sizeH=Size", Integer, "Maximum height of labels") do |sizeH|
        options['sizeH'] = sizeH
      end

      opts.on("-nLength", "--maxLabelNameLength=Length", Integer, "Maximum length of label names") do |length|
        options['maxLabelNameLength'] = length
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(args)
    return options
  end
end
options = Parser.parse ARGV

File.open(options['outputFileName'], 'w') {
  |file|
  file.puts(options['pointCount'])
  for i in 1..options['pointCount']
    randomLabel = (0...options['maxLabelNameLength']).map { (65 + rand(26)).chr }.join
    file.puts("#{rand(-options['sizeX']..options['sizeX'])} #{rand(-options['sizeY']..options['sizeY'])} #{rand(options['sizeL'] + 1)} #{rand(options['sizeH'] + 1)} #{randomLabel} 0 0 0")
  end
}

puts "Finished writing #{options['pointCount']} to #{options['outputFileName']}"

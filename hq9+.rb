class Hq9
    def initialize(file)
        @file = file
    end

    def interpreter
        @accum = 0
        File.open(@file) do |f|
            f.each_line do |line|
                line.chomp.split("").each do |token|
                    case token
                    when "H" then
                        puts "Hello Wolrd!"
                    when "Q" then
                        File.open(@file) {|f|puts f.read()}
                    when "9" then
                        (0..100).reverse_each do |n|
                            if n == 0
                                before = "no more bottles"
                                after = "99 bottles"
                            elsif n == 1
                                before = "1 bottle"
                                after = "no more bottles"
                            else
                                before = "#{n} bottles"
                                after = "#{n-1} bottles"
                            end

                            if n == 0
                                action = "Go to the store and buy some more"
                            else
                                action = "Take one down and pass it around"
                            end
                            puts "#{before} of beer on the wall. #{before} of beer.\n"
                            puts "#{action}, #{after} of beer on the wall.\n"
                        end
                    when "+" then
                        @accum+=1
                    end
                end
            end
        end
    end
end

if ARGV.length > 0
    hq9 = Hq9.new(ARGV[0])
    hq9.interpreter
else
    puts "hq9+.rb <program file>"
end
                        


class Test
  def run(string)
    #length = gets.to_i
    #string = gets.chomp.chars

    length = string.chomp.size

    max_count = length / 4
    puts "string #{string} maxcount #{max_count}"
    replace_size = 0
    bases = 'ATCG'.chars
    counts = Hash.new
    bases.each do |b|
      counts[b.to_sym] = -max_count
    end

    path = string.chars.map do |c|
       count = counts[c.to_sym] + 1
       replace_size += 1 if count > 0
       counts[c.to_sym] = count
       counts.clone
    end

    bases.each do |b|
      counts[b.to_sym] = 0
    end
    path2 = string.chars.map do |c|
       a = counts.clone
       a[c.to_sym] = 1
       a
    end
    puts "asdf #{path2}"

    puts counts
    puts "path"
    path.each do |p|
      print p.values
      score = p.values.map(&:abs).inject(&:+)
      print " score abs: #{score}"
      score = p.values.inject(&:+)
      print " score : #{score}"
      puts
    end

    puts "path2"
    path2.each do |p|
      print p.values
      puts
    end

    min = (path.map {|p| p.values.map(&:abs).inject(&:+)})
    puts "min #{min.min}"

    puts "replace_size #{replace_size}"

    puts "minimum length"
    puts replace_size
    3.times do
      puts '#######################'
    end
  end
end

Test.new.run('AAATAAAA')
Test.new.run('GAAATAAA')
Test.new.run('AAGAACAA')
Test.new.run('ACAT')

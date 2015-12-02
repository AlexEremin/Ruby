# Practical task 0
# Pronounceable password generator.

# Arguments: >size of password  >use different registr? >use numbers?

def to_boolean(str)
  !(str == 'false' || str == '0')
end

if 0 < ARGV.size && ARGV.size < 3
  puts 'Некорректное число аргументов в командной строке(должно  быть 0 или 3)'
  exit 1
end

args = { size: 6, registr: true, num: true }
if ARGV.size == 3
  args[:size] = ARGV[0].to_i
  args[:registr] = to_boolean(ARGV[1])
  args[:num] = to_boolean(ARGV[2])
end

# Generator
class PassworsGenerator
  ALPHABET = ('a'..'z').to_a
  VOWELS = %w(a e i o u)
  CONSONANTS = ALPHABET - VOWELS

  def initialize(args)
    @password_size = args[:size]
    @password_registr = args[:registr]
    @password_num = args[:num]
  end

  def get_password
    password = ''

    vowel = [true, false].sample
    @password_size.times do
      if vowel then password << VOWELS.sample end
      unless  vowel then password << CONSONANTS.sample end
      vowel = !vowel
    end
    
    if @password_registr
      password.each_char do |i|
        to_up = [true, false].sample
        if to_up then password[i] = password[i].upcase end
      end
    end

    if @password_num
      num = rand(1..4)
      num.times do
        password << rand(0..9).to_s
      end
    end
    password
  end

  def get_password_list(list_size = 10)
    password_list = []
    list_size.times do
      password_list << get_password
    end
    password_list
  end
end

G = PassworsGenerator.new(args)
puts G.get_password_list

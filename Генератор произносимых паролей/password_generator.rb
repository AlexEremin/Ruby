# Практическое задание 0
# Простой генератор произносимых паролей

# Аргументы: >длина пароля >разные регистры >число в конце

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

# Генератор паролей.
class PassworsGenerator
  def initialize(args)
    @password_size = args[:size]
    @password_registr = args[:registr]
    @password_num = args[:num]
    
    @ALPHABET = ('a'..'z').to_a
    @VOWELS = ['a', 'e', 'i', 'o', 'u'] # Гласные бувы
    @CONSONANTS = @ALPHABET - @VOWELS # Согласные буквы
    
  end
  
  def get_password
    password = ''
      
    vowel = [true, false].sample #Первая буква - гласная?
   @password_size.times do
      if vowel then password << @VOWELS.sample end
      unless  vowel then password << @CONSONANTS.sample end
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

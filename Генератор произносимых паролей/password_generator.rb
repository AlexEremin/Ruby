# Практическое задание 0
# Простой генератор произносимых паролей.

# Аргументы: >длина пароля(его буквенной части) >разные регистры
#   >число в конце(максимум из 4 цифр, так легче запомнить).

def to_boolean(str)
  !(str == "false" || str == "0")
end

if  0 < ARGV.size && ARGV.size < 3
  puts "Некорректное число аргументов в командной строке(должно  быть 0 или 3)"
  exit 1
end 

args = {size: 6, registr: true, numInEnd: true}
if ARGV.size == 3
  args[:size] = ARGV[0].to_i
  args[:registr] = to_boolean(ARGV[1])
  args[:numInEnd] = to_boolean(ARGV[2])
end

ALPHABET = ('a'..'z').to_a
VOWELS = ['a', 'e', 'i', 'o', 'u'] # Гласные бувы.
CONSONANTS = ALPHABET - VOWELS # Согласные буквы.

listOfPasswords = []

13.times do
  password = ""
  
  vowel = [true, false].sample # Первая буква - гласная?
  args[:size].times do
    if !vowel then password << VOWELS.sample end
    if vowel then password << CONSONANTS.sample end
    vowel = !vowel
  end
  
  if args[:registr]
    password.each_char do |i|
      toUp = [true, false].sample
      if toUp then password[i] = password[i].upcase end
    end
  end
  
  if args[:numInEnd]
    num = rand(1..4)
    num.times do password << rand(0..9).to_s end
  end
  listOfPasswords << password
end

puts "Список паролей:"
puts listOfPasswords






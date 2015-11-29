# Практическое задание 0
# Простой генератор произносимых паролей

# Пока еще не очень произносимых

SIZE = 5

alphabet = ('a'..'z').to_a | ('A'..'Z').to_a

password = []
SIZE.times do
  password << alphabet[rand(alphabet.size)]
end

print password

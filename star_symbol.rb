require 'json'
require 'date'

# Открываем файл с данными
file = File.read('signs.json', encoding: "utf-8")
# Распарсиваем его в ассоциативный массив
signs = JSON.parse(file)

puts "Введите день и месяц рождения (например, 08.03)"
input_date = STDIN.gets.chomp

# Добавляем к дате пользователя 2000 год, чтобы формат был полный
user_date = Date.parse(input_date + ".2000")
# Переменная для знака пользователя
user_sign = nil

# Пробежимся по всем элементам массива (12 знаков)
signs.each do |key, sign|
	# На каждом шаге dates = массив из двух значений = [11.22, 33.44]
	dates = sign['dates'].split('..')
	# Дата пользователя больше 0-го элемента, но меньше 1-го элемента => его знак найден
	if Date.parse(dates[0] + ".2000") <= user_date &&  user_date <= Date.parse(dates[1] + ".2000") 
		user_sign = sign
	end
end

puts user_sign['dates']
puts user_sign['text']

=begin
	Особое отношение к Козерогу;)
	Создаем две записи в json-файле
=end
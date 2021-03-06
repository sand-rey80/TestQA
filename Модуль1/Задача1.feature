#language: ru

@tree

Функционал: <описание фичи>

Как Менеджер по продажам я хочу
чтобы при изменении количества и/или цены в строке Заказа сумма пересчитывалась автоматически
чтобы не забывать делать это вручную

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
// Комментарий
Сценарий: создание документа Заказ 
* Создание документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Розничная'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Пантера АО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
* Заполнение табличной части	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000002' | 'Сапоги'       |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	Тогда таблица "Товары" стала равной:
		| 'Товар'  | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Сапоги' | '2 700,00' | '1'          | '2 700,00' |
	//И 	я запоминаю значение поля 'Цена' как '$Цена$'	
	//И	я запоминаю значение поля 'Количество' как '$Количество$'
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '3 000,00'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда таблица "Товары" содержит строки:
		| 'Товар'  | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Сапоги' | '3 000,00' | '3'          | '9 000,00' |		
			 
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Запоминаем номер
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проведение документа 
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица  "Список" содержит строки:
		| 'Номер'  |
		| '$Номер$' |
#language: ru

@tree

Функционал: Создание документа Заказ на услуги

Как мжр по продажам я хочу
указывать количество услуг в заказе
чтобы было 

Сценарий: Создание заказа с услугами и их количеством

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
* Создание документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки	
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Пантера АО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
* Заполнение товаров	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000038' | 'Ремонт'       |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	//И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	//И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
	
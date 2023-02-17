﻿#Область Форма

#Область События

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ИдПользователя = Параметры.ИдПользователя;
	
	ПользовательИБ = ЭтотПользовательИнфомационнойБазы();
	
	Если ПользовательИБ = Неопределено Тогда
		Отказ = Истина;
		Возврат;
	КонецЕсли;
	
	//
	
	ДоступныеРолиРежимОтображения = "Все";
	
	ЗаполнитьЗначенияСвойств(ЭтаФорма, ПользовательИБ);
	
	ЗащитаОтОпасныхДействий = ПользовательИБ.ЗащитаОтОпасныхДействий.ПредупреждатьОбОпасныхДействиях;
	
	Если Не (ПользовательИБ.Язык = Неопределено) Тогда
		Язык = ПользовательИБ.Язык.Представление();
	КонецЕсли; 
	
	//
	
	Если ПользовательИБ.ПарольУстановлен Тогда
		Пароль = Новый УникальныйИдентификатор;
		ПодтверждениеПароля = Пароль;
	КонецЕсли;
	
	//
	
	ЗаполнитьРазделениеДанных(ПользовательИБ);
	ЗаполнитьРоли();
	
	УстановитьЗаголовокДоступныеРоли(ЭтаФорма);
	УстановитьЗаголовокДоступныеРолиУстановитьСнятьПометки(ЭтаФорма);
	
	//
	
	Заголовок = "(...) " + ПользовательИБ.Имя;
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	
	Если Источник = "Навигатор" Тогда
		
		Если ИмяСобытия = "ЗакрытьВсеОкнаРедакторов" Тогда
			
			Попытка
				Закрыть();
			Исключение
				//
			КонецПопытки;
			
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область Элементы

&НаКлиенте
Процедура АутентификацияСтандартнаяПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("АутентификацияСтандартная", АутентификацияСтандартная);
	
КонецПроцедуры

&НаКлиенте
Процедура ПарольПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("Пароль", Пароль);
	
КонецПроцедуры

&НаКлиенте
Процедура ИмяПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("Имя", Имя);
	
КонецПроцедуры

&НаКлиенте
Процедура ПолноеИмяПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("ПолноеИмя", ПолноеИмя);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗапрещеноИзменятьПарольПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("ЗапрещеноИзменятьПароль", ЗапрещеноИзменятьПароль);
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказыватьВСпискеВыбораПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("ПоказыватьВСпискеВыбора", ПоказыватьВСпискеВыбора);
	
КонецПроцедуры

&НаКлиенте
Процедура АутентификацияОСПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("АутентификацияОС", АутентификацияОС);
	
КонецПроцедуры

&НаКлиенте
Процедура ПользовательОСПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("ПользовательОС", ПользовательОС);
	
КонецПроцедуры

&НаКлиенте
Процедура АутентификацияOpenIDПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("АутентификацияOpenID", АутентификацияOpenID);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗащитаОтОпасныхДействийПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("ЗащитаОтОпасныхДействий", ЗащитаОтОпасныхДействий);
	
КонецПроцедуры

&НаКлиенте
Процедура РежимЗапускаПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("РежимЗапуска", РежимЗапуска);
	
КонецПроцедуры

&НаКлиенте
Процедура ЯзыкПриИзменении(Элемент)
	
	ПриИзмененииСвойстваПользователяИБ("Язык", Язык);
	
КонецПроцедуры

#КонецОбласти

#Область Таблицы

#Область ДоступныеРоли

&НаКлиенте
Процедура ДоступныеРолиРежимОтображенияПриИзменении(Элемент)
	
	ЗаполнитьРоли();
	
	УстановитьЗаголовокДоступныеРоли(ЭтаФорма);
	УстановитьЗаголовокДоступныеРолиУстановитьСнятьПометки(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура ДоступныеРолиПометкаПриИзменении(Элемент)
	
	#Область Предусловия
	
	ТекущиеДанные = Элементы.ДоступныеРоли.ТекущиеДанные;
	
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ИмяРоли = ТекущиеДанные.Имя;
	
	//
	
	ТипДействия = "";
	
	Если ТекущиеДанные.Пометка Тогда
		ТипДействия = "Добавить";
	Иначе
		ТипДействия = "Удалить";
	КонецЕсли;
	
	//
	
	ИзменитьРолиПользователя(ИмяРоли, ТипДействия);
	УстановитьЗаголовокДоступныеРолиУстановитьСнятьПометки(ЭтаФорма);
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область Команды

&НаКлиенте
Процедура КомандаЗаполнитьКакДляПользователя(Команда)
	
	ПользователиДляВыбора = ПользователиБазыДляВыбора();
	
	#Область КонтекстнаяПодсказка
	
	Если Ложь Тогда
		ПользователиДляВыбора = Новый СписокЗначений;
	КонецЕсли;
	
	#КонецОбласти
	
	ПользователиДляВыбора.ПоказатьВыборЭлемента(
		Новый ОписаниеОповещения("КомандаЗаполнитьКакДляПользователяЗавершение", ЭтаФорма),
		"Выберите пользователя"
	);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаЗаполнитьКакДляПользователяЗавершение(ВыбЭлемент, ДпПараметры) Экспорт
	
	#Область Предусловия
	
	Если ВыбЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ЗаполнитьРолиКакДляПользователя(ВыбЭлемент.Значение);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаДоступныеРолиУстановитьПометки(Команда)
	
	ДоступныеРолиУстановитьСнятьПометки(Истина);
	УстановитьЗаголовокДоступныеРолиУстановитьСнятьПометки(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаДоступныеРолиСнятьПометки(Команда)
	
	ДоступныеРолиУстановитьСнятьПометки(Ложь);
	УстановитьЗаголовокДоступныеРолиУстановитьСнятьПометки(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаЗапуститьОтИмениПользователя(Команда)
	
	ПараметрыФормы = Новый Структура("ИдПользователя", Новый УникальныйИдентификатор(ИдПользователя)); 
	
	ПолноеИмяФормы = ПолноеИмяФормыОбработки(ЭтаФорма.ИмяФормы, "ЗапускОтИмениПользователя");
	
	ОткрытьФорму(ПолноеИмяФормы, ПараметрыФормы, ЭтаФорма, , , , , РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область Процедуры

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьЗаголовокДоступныеРоли(Форма)
	
	Форма.Элементы.ДоступныеРоли.Заголовок = "Роли пользователя (" + Форма.ДоступныеРоли.Количество() +")";
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьЗаголовокДоступныеРолиУстановитьСнятьПометки(Форма)
	
	ПометкаЕсть = 0;
	ПометкаНет  = 0;
	
	Для каждого стр_ДоступныеРоли Из Форма.ДоступныеРоли Цикл
		
		Если стр_ДоступныеРоли.Пометка Тогда
			ПометкаЕсть = ПометкаЕсть + 1;
		Иначе
			ПометкаНет = ПометкаНет + 1;
		КонецЕсли;
		
	КонецЦикла;
	
	//
	
	Форма.Элементы.КомандаДоступныеРолиУстановитьПометки.Заголовок = ?(ПометкаЕсть > 0, ПометкаЕсть, " ");
	Форма.Элементы.КомандаДоступныеРолиСнятьПометки.Заголовок = ?(ПометкаНет > 0, ПометкаНет, " ");
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьРазделениеДанных(ПользовательИБ)
	
	#Область Предусловия
	
	Если ПользовательИБ = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ТаблицаРазделителейДанных = Тип_ТаблицаРазделителейДанных();
	
	Для каждого ОбщийРеквизит Из Метаданные.ОбщиеРеквизиты Цикл
		
		ЗначениеРеквизита = "";
		
		Попытка
			ЗначениеРеквизита = ПользовательИБ.РазделениеДанных[ОбщийРеквизит.Имя];
		Исключение
		КонецПопытки;
		
		стр_ТаблицаРазделителейДанных = ТаблицаРазделителейДанных.Добавить();
		ЗаполнитьЗначенияСвойств(стр_ТаблицаРазделителейДанных, ОбщийРеквизит);
		
		стр_ТаблицаРазделителейДанных.Значение = ЗначениеРеквизита;
		
	КонецЦикла;
	
	ДобавляемыеРеквизиты = Новый Массив;
	ДобавляемыеРеквизиты.Добавить(Новый РеквизитФормы("РазделениеДанных", Новый ОписаниеТипов("ТаблицаЗначений")));
	
	//
	//Если ДобавляемыеРеквизиты.Количество() > 0 Тогда
	//	ИзменитьРеквизиты(ДобавляемыеРеквизиты);
	//КонецЕсли;
	//
	//Для каждого ОбщийРеквизит Из Метаданные.ОбщиеРеквизиты Цикл
	//	
	//	ЭлементФормы = Элементы.Добавить(ОбщийРеквизит.Имя, Тип("ПолеФормы"), Элементы.СтраницаРазделениеДанных);
	//	ЭлементФормы.Вид            = ВидПоляФормы.ПолеВвода;
	//	ЭлементФормы.ПутьКДанным    = ОбщийРеквизит.Имя;
	//	ЭлементФормы.ТолькоПросмотр = Истина;
	//	
	//КонецЦикла;
	//
	//Для каждого ОбщийРеквизит Из Метаданные.ОбщиеРеквизиты Цикл
	//	
	//	ЭтаФорма[ОбщийРеквизит.Имя] = "";
	//	
	//	Попытка
	//		ЭтаФорма[ОбщийРеквизит.Имя] = ПользовательИБ.РазделениеДанных[ОбщийРеквизит.Имя];
	//	Исключение
	//		//
	//	КонецПопытки;
	//	
	//КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьРоли()
	
	ПользовательИБ = ЭтотПользовательИнфомационнойБазы();
	
	тз_ДоступныеРоли = РеквизитФормыВЗначение("ДоступныеРоли");
	тз_ДоступныеРоли.Очистить();
	
	Если ДоступныеРолиРежимОтображения = "НазначенныеРоли" Тогда
		Для каждого Роль Из ПользовательИБ.Роли Цикл
			стр_ДоступныеРоли = тз_ДоступныеРоли.Добавить();
			ЗаполнитьЗначенияСвойств(стр_ДоступныеРоли, Роль);
			стр_ДоступныеРоли.Пометка = Истина;
		КонецЦикла;
	Иначе
		Для каждого Роль Из Метаданные.Роли Цикл
			стр_ДоступныеРоли = тз_ДоступныеРоли.Добавить();
			ЗаполнитьЗначенияСвойств(стр_ДоступныеРоли, Роль);
		КонецЦикла;
	КонецЕсли;
	
	СтрокиДляУдаления = Новый Массив;
	
	Для каждого РольПользователя Из ПользовательИБ.Роли Цикл
		
		стр_ДоступныеРоли = тз_ДоступныеРоли.Найти(РольПользователя.Имя, "Имя");
		
		Если стр_ДоступныеРоли = Неопределено Тогда
			Продолжить;
		КонецЕсли;
		
		стр_ДоступныеРоли.Пометка = Истина;
		СтрокиДляУдаления.Добавить(стр_ДоступныеРоли);
		
	КонецЦикла;
	
	Если СтрокиДляУдаления.Количество() > 0 Тогда
		
		Если ДоступныеРолиРежимОтображения = "НеНазначенныеРоли" Тогда
			Для каждого стр_ДоступныеРоли Из СтрокиДляУдаления Цикл
				тз_ДоступныеРоли.Удалить(стр_ДоступныеРоли);
			КонецЦикла;
		КонецЕсли;
		
	КонецЕсли;
	
	тз_ДоступныеРоли.Сортировать("Имя");
	
	ЗначениеВРеквизитФормы(тз_ДоступныеРоли, "ДоступныеРоли");
	
КонецПроцедуры

&НаСервере
Процедура ИзменитьРолиПользователя(ИмяРоли, ТипДействия)
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ИмяРоли) Тогда
		Возврат;
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ТипДействия) Тогда
		Возврат;
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ИдПользователя) Тогда
		Возврат;
	КонецЕсли;
	
	//
	
	ПользовательИБ = ЭтотПользовательИнфомационнойБазы();
	
	Если ПользовательИБ = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	//
	
	РольПользователя = Неопределено;
	
	Попытка
		РольПользователя = Метаданные.Роли[ИмяРоли];
	Исключение
		Возврат;
	КонецПопытки;
	
	Если РольПользователя = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	Если ТипДействия = "Добавить" Тогда
		ПользовательИБ.Роли.Добавить(РольПользователя);
	ИначеЕсли ТипДействия = "Удалить" Тогда
		ПользовательИБ.Роли.Удалить(РольПользователя);
	ИначеЕсли ТипДействия = "Очистить" Тогда
		ПользовательИБ.Роли.Очистить();
	КонецЕсли;
	
	ПользовательИБ.Записать();
	
КонецПроцедуры

&НаСервере
Процедура ДоступныеРолиУстановитьСнятьПометки(Пометка)
	
	Для каждого стр_ДоступныеРоли Из ДоступныеРоли Цикл
		
		Если (стр_ДоступныеРоли.Пометка = Пометка) Тогда
			Продолжить;
		КонецЕсли;
		
		стр_ДоступныеРоли.Пометка = Пометка;
		
		ТипДействия = ?(Пометка, "Добавить", "Удалить");
		ИзменитьРолиПользователя(стр_ДоступныеРоли.Имя, ТипДействия);
		
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьРолиКакДляПользователя(ИмяПользователяДляЗаполнения)
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ИмяПользователяДляЗаполнения) Тогда
		Возврат;
	КонецЕсли;
	
	ПользовательДляЗаполнения = ПользователиИнформационнойБазы.НайтиПоИмени(ИмяПользователяДляЗаполнения);
	
	Если ПользовательДляЗаполнения = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ПользовательИБ = ЭтотПользовательИнфомационнойБазы();
	ПользовательИБ.Роли.Очистить();
	
	Для каждого Роль Из ПользовательДляЗаполнения.Роли Цикл
		
		ПользовательИБ.Роли.Добавить(Роль);
		
	КонецЦикла;
	
	ПользовательИБ.Записать();
	
	//
	
	ЗаполнитьРоли();
	
	УстановитьЗаголовокДоступныеРоли(ЭтаФорма);
	УстановитьЗаголовокДоступныеРолиУстановитьСнятьПометки(ЭтаФорма);
	
КонецПроцедуры

&НаСервере
Процедура ПриИзмененииСвойстваПользователяИБ(ИмяСвойства, ЗначениеСвойства)
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ИмяСвойства) Тогда
		Возврат;
	КонецЕсли;
	
	ПользовательИБ = ЭтотПользовательИнфомационнойБазы();
	
	Если ПользовательИБ = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если ИмяСвойства = "ПодтверждениеПароля" Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	Если ИмяСвойства = "ЗащитаОтОпасныхДействий" Тогда
		
		ОписаниеЗащиты = Новый ОписаниеЗащитыОтОпасныхДействий;
		ОписаниеЗащиты.ПредупреждатьОбОпасныхДействиях = ЗначениеСвойства;
		
		ПользовательИБ["ЗащитаОтОпасныхДействий"] = ОписаниеЗащиты;
		
	Иначе
		ПользовательИБ[ИмяСвойства] = ЗначениеСвойства;
	КонецЕсли;
	
	Если ИмяСвойства = "Пароль" Тогда
		ПодтверждениеПароля = ЗначениеСвойства;
	КонецЕсли;
	
	ПользовательИБ.Записать();
	
КонецПроцедуры

#КонецОбласти

#Область Функции

&НаСервере
Функция ПользователиБазыДляВыбора()
	
	Результат = Новый СписокЗначений;
	
	//
	
	СписокПользователей = Новый СписокЗначений;
	
	ПользователиБазы = ПользователиИнформационнойБазы.ПолучитьПользователей();
	
	Для каждого ПользовательБазы Из ПользователиБазы Цикл
		
		СписокПользователей.Добавить(ПользовательБазы.Имя, "[" + ПользовательБазы.Имя +"] " + ПользовательБазы.ПолноеИмя);
		
	КонецЦикла;
	
	//
	
	Результат = СписокПользователей;
	Возврат Результат;
	
КонецФункции

&НаСервере
Функция ЭтотПользовательИнфомационнойБазы()
	
	Результат = Неопределено;
	ПустойРезультат = Неопределено;
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ИдПользователя) Тогда
		Возврат ПустойРезультат;
	КонецЕсли;
	
	#КонецОбласти
	
	ПользовательИБ = ПользователиИнформационнойБазы.НайтиПоУникальномуИдентификатору(ИдПользователя);
	
	//
	
	Результат = ПользовательИБ;
	
	Возврат Результат;
	
КонецФункции

&НаСервере
Функция ЭтаОбработка()
	
	Результат = РеквизитФормыВЗначение("Объект");
	Возврат Результат;
	
КонецФункции

&НаСервере
Функция ПолноеИмяФормыОбработки(ИмяТекущейФормы, ИмяФормыОбработки)
	
	Возврат ЭтаОбработка().ПолноеИмяФормыОбработки(ИмяТекущейФормы, ИмяФормыОбработки);
	
КонецФункции

&НаСервере
Функция Тип_ТаблицаРазделителейДанных()
	
	Результат = Новый ТаблицаЗначений;
	
	//
	
	Типы = Новый Массив;
	
	Для каждого ОбщийРеквизит Из Метаданные.ОбщиеРеквизиты Цикл
		
		ТипРеквизита = ОбщийРеквизит.Тип;
		
		Если Типы.Найти(ТипРеквизита) = Неопределено Тогда
			Типы.Добавить(ТипРеквизита);
		КонецЕсли;
		
	КонецЦикла;
	
	ТипЗначений = Новый ОписаниеТипов(Типы);
	
	//
	
	ТаблицаПоРазделениюДанных = Новый ТаблицаЗначений;
	ТаблицаПоРазделениюДанных.Колонки.Добавить("Имя");
	ТаблицаПоРазделениюДанных.Колонки.Добавить("Тип");
	ТаблицаПоРазделениюДанных.Колонки.Добавить("Значение", ТипЗначений);
	ТаблицаПоРазделениюДанных.Колонки.Добавить("Синоним");
	ТаблицаПоРазделениюДанных.Колонки.Добавить("Комментарий");
	
	//
	
	Результат = ТаблицаПоРазделениюДанных;
	Возврат Результат;
	
КонецФункции

#КонецОбласти

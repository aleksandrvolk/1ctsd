   
#Если МобильноеПриложениеКлиент Тогда   
   
&НаКлиенте
Процедура ОтсканироватьШтрихкод(Команда)
	
	Если НЕ СредстваМультимедиа.ПоддерживаетсяСканированиеШтрихКодов() Тогда
		Сообщить("Ваше устройство не поддерживает сканер штрихкодов");
		Возврат;
	КонецЕсли;
	
	ОбработчикСканирования = Новый ОписаниеОповещения("ОбработчикСканированияКода", ЭтаФорма);
	ЗавершениеСканирования = Новый ОписаниеОповещения("ЗавершениеСканированияКода", ЭтаФорма);
	
	СредстваМультимедиа.ПоказатьСканированиеШтрихКодов("", ОбработчикСканирования, ЗавершениеСканирования, ТипШтрихкода.Все);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработчикСканированияКода(Штрихкод, Результат, Сообщение, ДополнительныеПараметры) Экспорт
	
	Если Результат Тогда
		ТаблицаШтрихкодов.Добавить().Штрихкод = Штрихкод;
	    СредстваМультимедиа.ЗакрытьСканированиеШтрихКодов();
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗавершениеСканированияКода(ДополнительныеПараметры) Экспорт
                                  
КонецПроцедуры 

#КонецЕсли 
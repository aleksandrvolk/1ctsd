&НаКлиенте
Перем Компонента;

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Попытка
        ПодключитьВнешнююКомпоненту("ОбщийМакет.AddIn", "LibData", ТипВнешнейКомпоненты.Native);
        Компонента = Новый("AddIn.LibData.AddInNativeBEN");
        //Компонента.StartGetScan();
		Компонента.StartMyGetScan("DATA_SCAN","com.hht.emdk.datawedge.data_string");
		
		//Компонента.StartMyGetScan("scan.rcv.message","data");
		
		//Сообщить(Компонента.IsEnabled);
		//Компонента.StartGetKeyEvent();
    Исключение
        Сообщить("драйвер сканирования не смог создать подключения-- сканирование на текущем устройстве работать не будет");
    КонецПопытки;
			
КонецПроцедуры


&НаКлиенте
Процедура ВнешнееСобытие(Источник, Событие, Данные)
		
	 Если Событие="BarcodeDecodeData" тогда 
            ШК=Данные;
			ОС = НайтиОсновноеСредствоПоШтрихкоду(ШК); 
			Если НЕ ОС.Пустая() Тогда 
				НоваяСтрока = Объект.ОсновныеСредства.Добавить();
				НоваяСтрока.ОсновноеСредство = ОС;
				НоваяСтрока.Факт = 1;
			КонецЕсли;
    КонецЕсли;
	
КонецПроцедуры


&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	
	Сообщить("ОбработкаОповещения");
	
КонецПроцедуры

&НаСервере
Функция НайтиОсновноеСредствоПоШтрихкоду(Штрихкод)
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	Штрихкоды.Объект.Ссылка КАК Ссылка
	               |ИЗ
	               |	РегистрСведений.Штрихкоды КАК Штрихкоды
	               |ГДЕ
	               |	Штрихкоды.Штрихкод ПОДОБНО &Штрихкод";
	
	Запрос.УстановитьПараметр("Штрихкод", "%"  + Строка(СокрЛП(Штрихкод)) + "%");
	
	Результат = Запрос.Выполнить().Выбрать();
	
	Если Результат.Следующий() Тогда
		ОсновноеСредство = Результат.Ссылка;
	Иначе
		ОсновноеСредство = Справочники.ОсновныеСредства.ПустаяСсылка();
	КонецЕсли;
	
	Возврат ОсновноеСредство; 
	
КонецФункции


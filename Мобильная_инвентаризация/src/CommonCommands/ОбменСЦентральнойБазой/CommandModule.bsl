
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
	ТекстОшибки = "";
	Если Обмен.ВыполнитьОбменДанными(ТекстОшибки) Тогда

		ПоказатьПредупреждение(, "Синхронизация данных завершена.",5);
		ОповеститьОбИзменении(Тип("ДокументСсылка.ИнвентаризацияДляМП"));
		ОповеститьОбИзменении(Тип("СправочникСсылка.ОсновныеСредства"));

	Иначе

		ПоказатьПредупреждение(, ТекстОшибки);

	КонецЕсли;
	
КонецПроцедуры
# VHDL_Project

* Jakub Švaříček (responsible for ...)
* Tereza Kalinová (responsible for ...)
* Vít Charvátek (responsible for ...)

## Teoretický popis

Cílem projektu bylo vytvořit audio syntezátor, který produkuje melodie za použití relé.

## Popis hardware použitého při porjektu

K vytovoření funkčního modelu byla použita deska Digilent Nexys A7-50T, dále bylo použito Arduino UNO, které sloužilo jako zdroj 5V napětí, dvoukanálový relé modul a propojovací vodiče.

* Nexys A7-50T

* Arduino UNO

Arduino UNO je připojeno k desce Nexys pomocí USB a slouží pouze jako zdroj 5V a 3.3V napětí. Na kontaktním nepájivem poli se také nachazí převodník logické úrovně 5V na 3.3V. Ten umožnuje ovládat relé modul, který požaduje pro sepnutí 5V pomocí desky Nexys, jejíž digitální výstupy mají pouze 3.3V.

![arduino_uno](images/arduino_uno.jpg)

* Relé modul

Relé modul se skládá z dvou relé spínaných pomocí 5V signálu a základního obvodu pro signalizaci sepnutí pomocí LED.
Spínací obvod i obě relé jsou osazeny na tištěném spoji. Pro ovládání a napájení slouží 4 piny. 2 pro +5V a GND a 2 pro spínání jednotlivých relé.

![rele_modul](images/rele_modul.jpg)

## Popis software

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders. 

### Simulace komponent

Write descriptive text and put simulation screenshots of your components.

## Instructions

Write an instruction manual for your application, including photos and a link to a short app video.

## References

1. Put here all references to sources and tools you used.
2. ...

				ARBEITEN MIT VIM 
				   Kurt Funke	 
			2019-11-01 18:40 CET 

	
INHALTSVERZEICHNIS:
Besonderheiten								38G
Konfiguration									55G
Verschlüsselung							  68G
Anzeigen (Zwischenablagen, Markierungen, Register, buffer)	83G  
Navigation	 	 						   171G
Tabs												 210G
Dateien											 120G
Änderungen (change)					 100g
Session											 124G
Suchen											 106G
Kopieren/Einfügen						 161G
Löschen											 185G
Makro												 145G
Fenster teilen							 151G		
Historie										 192G			
Mehrere Dateien (Buffer) 		 201G
Register (:reg)							 270G
Liste aller Abkürzungen in .vimrc (:ab)
Textbauesteine							 214G
ctags												 282G
Tags												 697G
Zwischenablage (:marks)			 700G
Speichern/Beenden						 703G
Autocmd											 758G	

:36,42 w >> tmp.txt     // Hängt die Zeilen 36-42 an die Datei tmp.txt an
=strftime("%Y-%m-%d %H:%M %Z")

vim vimtutor
vi ~/.vimrc editieren der Vim Konfigdatei

Besonderheiten
==============
:st	Strg+z			Vim in den Hintergrund stellen und zur Bash wechseln
:fg							Vim zurück von der Bash
jobs						Alle offenen Jobs anzeigen

:w !sudo tee > /dev/null %							// Speichern von schreibgeschützten Dateien
cmap w!! w !sudo tee > /dev/null %			// Eintrag in .vimrc

TOhtml		Datei in Internetseite umwandeln

:args					Welche Dateien sind geöffnet 
:n :prev			Wechseln der Dateien

sh						bash öffnen

Konfiguration
=============
:set vi=[Tabtaste drücken] und folgendes anfügen n,~/.viminfo

vim Version abfragen “vim --version”
apt get install vim-full


You can take the output of any command and send it into a vim session. From there you could format it, change stuff, and then save it to a file.
find . | vim -


Verschlüsselung
================
:setlocal cm?						Zeigt die aktuelle Methode an
:setlocal cm=zip				schwach (Voreinstellung)
:setlocal cm=blowfish		besser
:setlocal cm=blowfish2  beste:
:X 											Kennwort für Verschlüsselung setzen

Möchte man die Verschlüsselung wieder entfernen einfach
nochmal :X und das Passwort leer lassen

!gcc file.c -o file   			Kompilieren von C-Programmen in VIM
!g++ -o lising1.exe listing1.cpp 	Kompilieren von Cpp-Programmen
					Kompilieren Java-Datei ???

Anzeigen (Zwischenablagen, Markierungen, Register, buffer)
===============================================================
.				Wiederholt letzten Befehl
vim . 	Zeigt Dateimanager beim Starten von vim
:Exp		Zeigt Dateimanager
:Reg	  Liste der Zwischenablagen
:marks	Liste der Markierungen
q:  	  Historie der Komandozeilenbefehle (nach dem Setzen von :set viminfo+=n oder :set vi+=n)
q/ 			Historie der Suchbegriffe
:ab			Textbausteine anzeigen
:f			Der aktuelle Dateiname und Zeilennummer werden ausgegeben
"*p	Einfügen aus Systemzwischenablage (gvim installieren)

gx 	Internet Link öffnen 
gf	Link zu einer anderen Datei öffnen
gt	Wechseln zwischen Tabs

Navigation
===========
k	Cursur hoch
j	Cursur runter
l	Cursor rechts
h	Cursor links

H	Cursor spingt zum Anfang der Seite
M	Cursor spingt zur Mitte der Seite
L	Cursor spingt zum Ende  der Seite

0	Zeilenanfang
$	Zeilenende

w 	nächstes Wort
b		zurück Wort
e		zum Wortende
ge		zurück Wortende
(  	nächster Satz
)		zurück Satz
{  	nächster Absatz (zurück)
}		zurück Absatz

fc	 Auf das Zeichen c springen (Gilt innerhalb einer Zeile) 
fspace  spring auf das nächste Leerzeichen

Strg+F	Eine Bildschirmseite vor 
Strg+B	Eine Bildschirmseite zurück
Strg+e	Scrollt Fenster nach unten (zeilenweise)
Strg+y	Scrollt Fenster nach oben (zeilenweise)


- gg 	springe zum Dateianfang
- G	  springe zum Dateiende
nG	  In die Zeile n springen (Z.B. 7G)
nz return		Die Zeile n als erste Zeile anzeigen
zt					Aktuelle Zeile als erste Zeile anzeigen

Tabs
====
vim -p	Datei1 Datei2	öffnet Dateien in Tabs
vim -p5   		öffnet vim mit 5 leeren Tabs
:tabe 			Ein Neuer TAB öffnen
:tabe uebung.txt	Datei uebung.txt in Tab öffnen
gt			Zum nächsten Tab. Wechseln zwischen Tabs
5gt			Gehen zum 5. Tab.
gT			Zum vohergehenden Tab
:tab ball		Mehrere geöfnete Dateien in Tabs umwandeln
 
Datei:
======
:e test01.txt eine Datei öffnen

Session:
=========
Make Session (merkt sich die Fenstereinstellungen)
:mks! session.vim  (Mache ein Session-File)
starte session File vim -S session.im

F11 Vollbildmodus
!Befehl z.B. !date
!! Wiederholt den letzten Befehl
r! Kommando zeigt Ergebnis im Text 
r<Dateiname> einlesen der Datei und einfügen 
vim .       Verzeichnis anzeigen (mc-Anzeige)


- Mit u (undo) lassen sich Eingaben rückgängig machen.
- strg+r (redo) wieder herstellen der letzten Änderung
- Mit p einfügen

- :reg  Aufruf der Zwischenablage 

- Mit einem . wird der letzte Befehl wiederholt

- Im Visual Mode lässt sich Text markieren (esc -v)

- :r! [Befehl] 		Befehle ins Dokument schreiben
- :r [Dateiname] 	Fügt die Datei ins Dokument ein
- :r! lynx http://www.wikipedia.org -dump		Fügt die Internetseite ein


Suchen
=========================================================================
- /[Suchbefehl] Suche nach unten    n weiter suchen ...
- ?[Suchbefehl] Suche nach oben     n weiter suchen ... 
- Mit * findet das Wort im Dokument, auf dem der Cursor gerade steht
- Str+shift f
- q/ 		Liste der Suchbegriffe


KOPIEREN UND EINFÜGEN
========================================================================
Sie haben in vi nicht nur die Möglichkeit, 26 Markierungen zu setzen (a-z),
Sie können auch 36 Puffer (1-0 und a-z) zum Kopieren und Einfügen verwenden
Drücken Sie V um den Anfang des Bereichs zu markieren den Sie kopieren wollen.
Bewegen Sie Ihren Cursor zum Ende. Um den markierten Bereich z.B. in h zu
kopieren genügt nun ein "hy (Das Anführungszeichen steht für "Puffer", das
"y" steht für "yank", also kopieren). Einfügen könen Sie den Puffer mit 
"hy  	kopieren  ("y" für yank, kopieren) 
"hp  	einfügen  ("p" für past, einfügen)  
y    	kopieren (Standardpuffer)
p    	einfügen (Standardpuffer)
dd p 	dd löcht eine Zeile und p gibt sie wieder aus (z.B. an anderer Stelle)
"*p	Globale Zwischenablage bei Arbeiten mit mehreren Dateien 

yy	Zeile kopieren
yw	Wort kopieren


Ändern (change)
=========================================================================
cw	Ändere das Wort
c$	Änderung bis Ende der Zeile
ci"	Change in "

LÖSCHEN (delete)
=========================================================================
dd Zeile löschen
dw Wort löschen
x  löscht denn Buchstaben



MAKRO RECORDING
=========================================================================
q[Buchstabe] zeichnet alles auf bis erneut q eingegeben wird.
qa ..................... q
wieder einfügen mit
"ap

FENSTER TEILEN
========================================================================
vi -o dateiname1 dateiname2	Öffnet Dateien im Splitscreen			

:split 									Aktuelles Fenster teilen
:split dateiname				Datei wird zusätzlich geöffnet
:new										Neue Datei

:vsplit									vertikaler Splitscreen
:vsplit dateinamme
:vnew
:qall										Alle Fenster schließen

:resize 30							Fensterhöhe auf 30 Zeilen ändern
:vertical resize 80			Fensterbreite auf 80 Zeichen ändern		


Strg+W			Zum nächsten Fenster wechseln
Strg+I			Zum rechten Fenster wechseln
Strg+H			Zum linken Fenster wechseln
Strg+K			Zum oberen Fenster wechseln
Strg+J			Zum untern Fenster wechseln

Strg-W +		Horizontaler Splitscreen Fenster vergrößern
Strg-W -		Horizontaler Splitscreen Fenster verkleinern
Strg-W <    Vertikales Fenster vergrößern
Strg-W >		Vertikales Fenster verkleinern

Strg-w x		Zwei Fenster vertauschen
Strg-w R		Alle Fenster rotieren

:close			Fenster schließen
:only			  Alle Fenster schließen, bis auf das aktuelle


:q			Ausgewählte Datei schließen
:q!			Änderung in Datei verwerfen
:qa			Alle Dateien werden geschlossen
:xa			Alle Dateien speichern und schliessen
:wa			Schreibe alle Dateien, die geändert wurden

:h split		Hilfedatei zu Splitscreens

strg+w+w zwischen den Fenstern wechseln


HISTORIE / AUTO-VERVOLLSTÄNDIGEN
=========================================================================
q:  Historie der Komandozeilenbefehle (nach dem Setzen von :set viminfo+=n oder :set vi+=n)
q/ Historie der Suchbegriffe
Strg+n Wort autovervollständigen
Strg+x+l Kompletter Satz autovervollständigen
; [Pfeil hoch oder runter] um in Befehlshistorie zu navigieren
/ [Pfeil hoch oder runter] um in Suchhistorie zu navigieren



Arbeiten mit mehreren Dateien (buffer)
------------------------------------------------------
vim *.txt  öffnet alle txt-Dateien
:n   springt zur nächsten Datei
:N   zurück zur vorherigenDatei


REGISTER
=========================================================================
:reg Register(Zwischenablage) anzeigen
p Register wieder einfügen z.B. "8p
Wieder einfügen (p) von Register s
"sp
Anzeigen von Register s
reg s
"ay	In Register a abspeichern
"ap	Register a wieder ausgeben
.	Anzeigen von Register s



Markierungen setzen
------------------------------------------------------ 
mx      Markierung setzen, ,wobei x ein beliebiger Buchstabe ist
'x      springt zur markierten Stelle

Anleitung zum Setzen von Markierungen:
- Cursor auf das Wort setzen
- Markierung mx an Curserposition setzen
- Mit `x zur Markierung wechseln
- `` (Zwei Backticks) Bewegt Cursor zu der Stelle vor dem letzten Bewegung

- :marks Liste aller Markierungen 


ctags
------------------------------------------------------
In dem Verzeichnis in dem ctag angewendet werden soll,
in der bash folgendes eingeben:
	ctags -R .
es wird die Datei tags erstellt.

strg + ] 	springt zum tag unter dem Cursor
strg + g]
strg + t


Make Session (merkt sich die Fenstereinstellungen)
------------------------------------------------------
:mks!   (Mache ein Session-File)
schreibe session.vim
starte Session File vim -S

!Befehl z.B. !date
!! Wiederholt den letzten Befehl
r! Kommando zeigt Ergebnis im Text 
r<Dateiname> einlesen der Datei und einfügen 
:!sh	startet Subshell

- Mit u (undo) lassen sich Eingaben rückgängig machen.
- strg+r (redo) wieder herstellen der letzten Änderung
- Mit p einfügen

- :reg  Aufruf der Zwischenablage 

- Mit einem . wird der letzte Befehl wiederholt

- Im Visual Mode lässt sich Text markieren (esc -v)

- Befehle ins Dokument schreiben :read ![Befehl]

- /[Suchbefehl] Suche nach unten    -n weiter suchen ...
- ?[Suchbefehl] Suche nach oben     -n weiter suchen ... 
- Mit * findet das Wort im Dokument, auf dem der Cursor gerade steht

LÖSCHEN
------------------------------------------------------  
dd Zeile löschen
dw Wort löschen
x  löscht denn Buchstaben

REGISTER
===========================================================================
:reg Register(Zwischenablage) anzeigen
p Register wieder einfügen z.B. "8p
Wieder einfügen (p) von Register s
"sp

Anzeigen von Register s
reg s

MAKRO RECORDING
=========================================================================
q[Buchstabe] zeichnet alles auf bis erneut q eingegeben wird.
qa ..................... q
wieder einfügen mit
"ap

SUCHEN
=====================================================================
/  Vorwärts
?  Rückwärts
Stern * sucht nach dem Wort unter dem Cursor

 
FENSTER TEILEN
======================================================================
split Fenster teilen
:qa   schließt alle Fenster
strg+w+w zwischen den Fenstern wechseln

- vsplit

HISTORIE
========================================================================
q:  Historie der Komandozeilenbefehle
(nach dem Setzen von 
 :set viminfo+=n oder :set vi+=n)
q/ Historie der Suchbegriffe


AUTOVERVOLLSTÄNDIGEN
=======================================================================
Strg+n Wort autovervollständigen
Strg+x+l Kompletter Satz autovervollständigen


ARBEITEN MIT MEHREREN DATEIEN (BUFFER)
=======================================================================
*.txt    öffnet alle Dateien, mit der Endung txt
:ls      Alle offenen Dateien auflisten
:h ls    Hilfe zu ls
:b22     Buffer 22 anzeigen
:bd 1 3  löscht buffer 1 und 3

Textbausteine
=============
Eintrag in ~/.vimrc
:ab danach das Kürzel (hi) und der ausgeschriebene Text (Hallo!)
Damit ein Zeilenumbruch erfolgt tragen Sie ein <CR> ein (Hall0!<CR>)


SPEICHERN/BEENDEN
=======================================================================
:q  beenden ohne Speichern
:wq! speichern und beenden
:qa Alles Fenster schließen





w b	nächstes Wort (zurück)
e ge	zum Wortende  (zurück)
(  )	nächster Satz (zurück)
{  } 	nächster Absatz (zurück)

fc	Auf das Zeichen c springen (Gilt innerhalb einer Zeile) 
Strg+F	Eine Bildschirmseite vor
Strg+B	Eine Bildschirmseite zurück

- gg 	springe zum Dateianfang
- G	springe zum Dateiende
nG	In die Zeile n springen (Z.B. 7G)

k	Cursur hoch
j	Cursur runter
l	Cursor rechts
h	Cursor links




Tabs
====
vim -p	Datei1 Datei2	öffnet Dateien in Tabs
vim -p5   		öffnet vim mit 5 leeren Tabs
:tabe 			Ein Neuer TAB öffnen
:tabe uebung.txt	Datei uebung.txt in Tab öffnen
gt			Zum nächsten Tab. Wechseln zwischen Tabs
5gt			Gehen zum 5. Tab.
gT			Zum vohergehenden Tab
:tab ball		Mehrere geöfnete Dateien in Tabs umwandeln
 
Datei:
======
:e test01.txt eine Datei öffnen

Session:
=========
Make Session (merkt sich die Fenstereinstellungen)
:mks! session.vim  (Mache ein Session-File)
starte session File vim -S session.vim

F11 Vollbildmodus
!Befehl z.B. !date
!! Wiederholt den letzten Befehl
r! Kommando zeigt Ergebnis im Text 
r<Dateiname> einlesen der Datei und einfügen 
vim .       Verzeichnis anzeigen (mc-Anzeige)


- Mit u (undo) lassen sich Eingaben rückgängig machen.
- strg+r (redo) wieder herstellen der letzten Änderung
- Mit p einfügen

- :reg  Aufruf der Zwischenablage 

- Mit einem . wird der letzte Befehl wiederholt

- Im Visual Mode lässt sich Text markieren (esc -v)

- :r! [Befehl] 		Befehle ins Dokument schreiben
- :r [Dateiname] 	Fügt die Datei ins Dokument ein


SUCHEN
=========================================================================
- /[Suchbefehl] Suche nach unten    n weiter suchen ...
- ?[Suchbefehl] Suche nach oben     n weiter suchen ... 
- Mit * findet das Wort im Dokument, auf dem der Cursor gerade steht
- :find     Arbeiten_mit_*	Datei auswählen


KOPIEREN UND EINFÜGEN
========================================================================
Sie haben in vi nicht nur die Möglichkeit, 26 Markierungen zu setzen (a-z),
Sie können auch 36 Puffer (1-0 und a-z) zum Kopieren und Einfügen verwenden
Drücken Sie V um den Anfang des Bereichs zu markieren den Sie kopieren wollen.
Bewegen Sie Ihren Cursor zum Ende. Um den markierten Bereich z.B. in h zu
kopieren genügt nun ein "hy (Das Anführungszeichen steht für "Puffer", das
"y" steht für "yank", also kopieren). Einfügen könen Sie den Puffer mit 
"hy  	kopieren  ("y" für yank, kopieren) 
"hp  	einfügen  ("p" für past, einfügen)  
y    	kopieren (Standardpuffer)
p    	einfügen (Standardpuffer)
dd p 	dd löcht eine Zeile und p gibt sie wieder ein (z.B. an anderer Stelle)
	Zeile kopieren ???
	Wort kopieren  ???


LÖSCHEN
=========================================================================
dd Zeile löschen
dw Wort löschen
x  löscht denn Buchstaben




REGISTER
=========================================================================
:reg Register(Zwischenablage) anzeigen
p Register wieder einfügen z.B. "8p
Wieder einfügen (p) von Register s
"sp
Anzeigen von Register s
reg s

MAKRO RECORDING
=========================================================================
q[Buchstabe] zeichnet alles auf bis erneut q eingegeben wird.
qa ..................... q
wieder einfügen mit
"ap

FENSTER TEILEN
========================================================================
vi -o dateiname1 dateiname2	Öffnet Dateien im Splitscreen			

:split 			Aktuelles Fenster teilen
:split dateiname	Datei wird zusätzlich geöffnet
:new			Neue Datei

:vsplit			vertikaler Splitscreen
:vsplit dateinamme
:vnew

Strg+W			Zum nächsten Fenster wechseln
Strg+I			Zum rechten Fenster wechseln
Strg+H			Zum linken Fenster wechseln
Strg+K			Zum oberen Fenster wechseln
Strg+J			Zum untern Fenster wechseln

Strg-W +		Horizontaler Splitscreen Fenster vergrößern
Strg-W -		Horizontaler Splitscreen Fenster verkleinern
Strg-W <    		Vertikales Fenster vergrößern
Strg-W >		Vertikales Fenster verkleinern

Strg-w x		Zwei Fenster vertauschen
Strg-w R		Alle Fenster rotieren

:close			Fenster schließen
:only			Alle Fenster schließen, bis auf das aktuelle


:q			Ausgewählte Datei schließen
:q!			Änderung in Datei verwerfen
:qa			Alle Dateien werden geschlossen
:xa			Alle Dateien speichern und schliessen
:wa			Schreibe alle Dateien, die geändert wurden

:h split		Hilfedatei zu Splitscreens

strg+w+w zwischen den Fenstern wechseln


HISTORIE / AUTO-VERVOLLSTÄNDIGEN
=========================================================================
q:  Historie der Komandozeilenbefehle
(nach dem Setzen von 
 :set viminfo+=n oder :set vi+=n)
q/ Historie der Suchbegriffe

Autovervollständigen
=========================================================================
Strg+n Wort autovervollständigen
Strg+x+l Kompletter Satz autovervollständigen


Zwischenablage (:marks:w)
=========================================================================
Berücksichtigen Sie beim Bearbeiten der Datei die Markierungen, an denen Anfang und Ende verwendet werden sollen:    https://code.i-harness.com/de/q/468180

ma - setzt a Zeichen
mb - setzt die b Marke

Um das in eine andere Datei zu kopieren, verwenden Sie einfach den Befehl w :

:'a,'b w /name/of/output/file.txt    // Erstellt den Bereich zwischen 'a bis 'b in Datei file.txt 

:16,35 w tmp.txt				// Speichert die Zeilen 16-35 in neuer Datei tmp.txt
:36,42 w >> tmp.txt     // Hängt die Zeilen 36-42 an die Datei tmp.txt an

Alle Markierungen anzeigen :marks

mx      Markierung setzen, ,wobei x ein beliebiger Kleinbuchstabe ist
'x      springt zur markierten Stelle

Noch eine Lösung:

- Wählen Sie den Text, den Sie speichern möchten:
- Positionieren Sie den Cursor an der Stelle, an der Sie die Auswahl starten möchten
- Drücken Sie v , um Zeichen auszuwählen, oder Großbuchstaben V , um ganze Zeilen   auszuwählen
- Bewegen Sie den Cursor an das Ende dessen, was Sie auswählen möchten 
- Speichern Sie den ausgewählten Text in der neuen Datei. Geben Sie Folgendes ein
  w Leerzeichen und den Namen der neuen Datei. Ansicht:

    :'<,'>w new.txt


Arbeiten mit mehreren Dateien (buffer)
========================================================================
vim *.txt  öffnet alle txt-Dateien
:n   springt zur nächsten Datei
:N   zurück zur vorherigen Datei



  
Make Session (merkt sich die Fenstereinstellungen)
========================================================================
:mks!   (Mache ein Session-File)
schreibe session.vim
starte Session File vim -S

!Befehl z.B. !date
!! Wiederholt den letzten Befehl
r! Kommando zeigt Ergebnis im Text 
r<Dateiname> einlesen der Datei und einfügen 
:!sh	startet Subshell

- Mit u (undo) lassen sich Eingaben rückgängig machen.
- strg+r (redo) wieder herstellen der letzten Änderung
- Mit p einfügen

- :reg  Aufruf der Zwischenablage 

- Mit einem . wird der letzte Befehl wiederholt

- Im Visual Mode lässt sich Text markieren (esc -v)

- Befehle ins Dokument schreiben :read ![Befehl]

- /[Suchbefehl] Suche nach unten    -n weiter suchen ...
- ?[Suchbefehl] Suche nach oben     -n weiter suchen ... 
- Mit * findet das Wort im Dokument, auf dem der Cursor gerade steht

LÖSCHEN
==========================================================================
dd Zeile löschen
dw Wort löschen
x  löscht denn Buchstaben

REGISTER
===========================================================================
:reg Register(Zwischenablage) anzeigen
p Register wieder einfügen z.B. "8p
Wieder einfügen (p) von Register s
"sp

Anzeigen von Register s
reg s

MAKRO RECORDING
=========================================================================
q[Buchstabe] zeichnet alles auf bis erneut q eingegeben wird.
qa ..................... q
wieder einfügen mit
"ap

SUCHEN
=====================================================================
/  Vorwärts
?  Rückwärts
Stern * sucht nach dem Wort unter dem Cursor

 
FENSTER TEILEN
======================================================================
split Fenster teilen
:qa   schließt alle Fenster
strg+w+w zwischen den Fenstern wechseln

- vsplit

HISTORIE
========================================================================
q:  Historie der Komandozeilenbefehle
(nach dem Setzen von 
 :set viminfo+=n oder :set vi+=n)
q/ Historie der Suchbegriffe
Strg+n Wort autovervollständigen
Strg+x+l Kompletter Satz autovervollständigen


ARBEITEN MIT MEHREREN DATEIEN (BUFFER)
=======================================================================
*.txt    öffnet alle Dateien, mit der Endung txt
:ls      Alle offenen Dateien auflisten
:h ls    Hilfe zu ls
:b22     Buffer 22 anzeigen
:bd 1 3  löscht buffer 1 und 3

Textbausteine
=============
Eintrag in ~/.vimrc
:ab danach das Kürzel (hi) und der ausgeschriebene Text (Hallo!)
Damit ein Zeilenumbruch erfolgt tragen Sie ein <CR> ein (Hall0!<CR>)


Tags
============
Tags sind Abkürzungen (Bookmarks) für "Orte" in Dateien,
zu denen man mit dem ":tags" Befehl springen kann.
Legen wir mal eine tags-datei an:

1. Ich nehme da "~/mytags"    $ mkdir mytags
2. Im Vim macht man mit :set tags=~/mytags die Datei bekannt
3. Nun legen wir einen Tag an, dieser besteht aus drei Teilen:
	a.) tag: 	pw
	b.) file:	/etc/passwd
  c.) command:	$	


SPEICHERN/BEENDEN
=======================================================================
:q  beenden ohne Speichern
:wq! speichern und beenden
:qa Alles Fenster schließen
:125,130 w tmp.txt				Speicher den Bereich von Zeile 125-130 in Datei tmp.txt
:125,130 w >> tmp.txt			Hängt den Bereich von Zeile 125-130 an die  Datei tmp.txt
:earlier 2m		zurücksetzen auf den Status von vor zwei Minuten

Autocmd
=======================================================================
Suppose you want to replace a datestamp on the end of a file every time it is
written.  First you define a function:

	:function DateInsert()
	:  $delete
	:  read !date
	:endfunction

You want this function to be called each time, just before a file is written.
This will make that happen:

	:autocmd FileWritePre *  call DateInsert()


LINKS
======
https://iblog.ikarius.net/index.php/2009/10/02/vim-tabs/
https://www.selflinux.org/selflinux/pdf/vim.pdf
http://tnerual.eriogerg.free.fr/vimqrc-ge.pdf
http://www.guckes.net



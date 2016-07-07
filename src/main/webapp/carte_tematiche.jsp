<%@ include file="params.jsp"
%><%

int tem=1;
if (request.getParameter("tem")!=null){ 
	if (!request.getParameter("tem").equals("")) {
		try {
			tem=Integer.parseInt(request.getParameter("tem"));
		} catch (NumberFormatException nfe) {
			// catch exception if liv isn't integer
		}
	}
}

String titoloBriciole="";
if(tem==1)
	titoloBriciole="Carte delle proprietà chimico-fisiche";
if(tem==2)
	titoloBriciole="Carte applicative";

Hashtable catalogo = new Hashtable();
Hashtable macroCatTable[] = new Hashtable[2];
Integer i = 0;
for (i=0; i<macroCatTable.length; i++)
	macroCatTable[i] = new Hashtable(); // this creates object itself

Hashtable carteTable[]= new Hashtable[28];

for (i=0; i<carteTable.length; i++)
	carteTable[i] = new Hashtable(); // this creates object itself

String[] titoliMacro = {"Carte delle proprietà chimico-fisiche" , "Carte applicative"};

// PRIMA CATEGORIA
Integer app = 0;
catalogo.put(0, macroCatTable[app]);

// PRIMA CARTA
Integer liv5 = 0;
carteTable[liv5].put("dataCarta", dfm.parse("2016-01-27 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del contenuto % di carbonio organico nei suoli della pianura tra 0-30 cm. 2a edizione");
carteTable[liv5].put("titleCarta", "Contenuto % di carbonio organico nei suoli della pianura tra 0-30 cm. 2a edizione");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview6.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 6);
carteTable[liv5].put("linkMetadato", linkMetadati.get(6));
carteTable[liv5].put("descCarta", "<p>Il carbonio organico costituisce circa il 58% della materia organica, ossia quella frazione di suolo composta da qualsiasi cosa che una volta era vivente. La materia organica svolge diverse funzioni essendo in grado di influenzare positivamente le proprietà fisiche, chimiche e biologiche del suolo.<br />La diminuzione del contenuto di materia organica nei suoli è considerata una minaccia ed un elemento di degrado del suolo così come indicato nella comunicazione “Strategia tematica per le protezione del suolo” della Commissione Europea (COM2006/231).<br />La carta rappresenta la distribuzione areale nei suoli di pianura del contenuto percentuale di carbonio organico nello strato superficiale (0-30 cm). La carta è alla sua seconda edizione ed è stata elaborata a partire dai dati estrapolati dalla Banca Dati dei Suoli della Regione Emilia-Romagna relativi al periodo 1990-2013. <\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "NOTE_ILLUSTRATIVE_CO_pianura.pdf");
macroCatTable[app].put(6, carteTable[liv5]);

// NUOVA CARTA
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2010-01-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del contenuto % di carbonio organico nei suoli dell'Appennino tra 0-30 cm");
carteTable[liv5].put("titleCarta", "Contenuto % di carbonio organico nei suoli dell'Appennino tra 0-30 cm");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview7.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 7);
carteTable[liv5].put("linkMetadato", linkMetadati.get(7));
carteTable[liv5].put("descCarta", "<p>Il carbonio organico del suolo costituisce circa il 58% della materia organica, quella frazione di suolo composta da qualsiasi cosa che una volta era vivente.<br/>La materia organica svolge diverse funzioni essendo in grado di influenzare positivamente le proprietà fisiche, chimiche e biologiche del suolo.La diminuzione del contenuto di materia organica nei suoli è considerata una minaccia ed un elemento di degrado del suolo così come indicato nella comunicazione “Strategia tematica per le protezione del suolo” della Commissione Europea (COM2006/231).<br />La carta del contenuto % di carbonio organico va intesa come una prima elaborazione dei dati disponibili nella banca dati dei suoli, al fine di divulgare lo stato delle conoscenze riguardo al contenuto di carbonio organico nei suoli regionali.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "NOTE_ILLUSTRATIVE_CO_montagna.pdf");
macroCatTable[app].put(7, carteTable[liv5]);

// NUOVA CARTA: SPEGNIAMO ARGILLA (gennaio 2016)
/*
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2010-01-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del contenuto % di argilla nei suoli della pianura tra 0-30 cm");
carteTable[liv5].put("titleCarta", "Contenuto % di argilla nei suoli della pianura tra 0-30 cm");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview8.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 8);
carteTable[liv5].put("linkMetadato", linkMetadati.get(8));
carteTable[liv5].put("descCarta", "<p>La maggior parte delle proprietà chimiche e fisiche dei suoli sono legate al tipo e al contenuto di argilla. Le particelle di argilla, che hanno dimensione <2µ (Soil Survey Division Staff, 1993), sono costituite prevalentemente da minerali argillosi che, in Regione, sono in larga misura di tipo espandibile. Per questo l’argilla è la componente del suolo chimicamente e fisicamente più attiva.<br /> La presenza di argilla condiziona indirettamente la crescita delle piante influenzando una gran parte delle proprietà del suolo, come la capacità di trattenere l’acqua e gli elementi nutritivi, l’areazione, la conducibilità idraulica e lo scorrimento idrico superficiale, la penetrazione alle radici delle piante, l’erodibilità e la lavorabilità. La carta del contenuto percentuale di argilla rappresenta un’utile cartografia di base per una vasta gamma di problematiche legate all’uso agricolo; ad esempio per la formulazione dei piani di fertilizzazione.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "NOTE_ILLUSTRATIVE_CLAY_pianura.pdf");
macroCatTable[app].put(8, carteTable[liv5]);
*/


liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2016-01-27 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta della tessitura dei suoli della pianura tra 0-30 cm");
carteTable[liv5].put("titleCarta", "Carta della tessitura dei suoli della pianura tra 0-30 cm");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview31.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 31);
carteTable[liv5].put("linkMetadato", linkMetadati.get(31));
carteTable[liv5].put("descCarta", "<p>La carta della tessitura superficiale (0-30 cm) dei suoli di pianura rappresenta la distribuzione areale delle frazioni granulometriche classificate secondo la metodologia USDA.<br />I dati di base sono stati estrapolati dalla Banca Dati dei Suoli della Regione Emilia-Romagna.<br />La carta della tessitura rappresenta un’utile cartografia di base per una vasta gamma di analisi ambientali in generale e legate all’uso agricolo in particolare; ad esempio per la formulazione dei piani di fertilizzazione e l'applicazione dei Disciplinari di Produzione Integrata.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "xxxxxxxxxxxxx.pdf");
macroCatTable[app].put(8, carteTable[liv5]);



// NUOVA CARTA
liv5++;

carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale del Cromo [Cr] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale del Cromo [Cr] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview13_new.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 13);
carteTable[liv5].put("linkMetadato", linkMetadati.get(13));
carteTable[liv5].put("descCarta", "<p>La “Carta del Fondo naturale della Pianura emiliano-romagnola del Cromo in scala 1:250.000” rappresenta la distribuzione areale del contenuto naturale di Cromo nel <i>subsoil<\\/i> (90-140 cm di profondità, 60-80 nei suoli con ghiaie) nei suoli ad uso agricolo.<\\/p><p>Il contenuto di fondo naturale dei metalli nei suoli è regolato principalmente da tre fattori: 1) la provenienza del sedimento in cui si è impostato il suolo, 2) la tessitura, 3) il grado evolutivo. Per quanto riguarda il Cromo, nei suoli meno evoluti, il fattore dominante è la provenienza, in relazione alla presenza di rocce ricche in Cr e Ni (ofioliti), che affiorano nelle Alpi Occidentali e in alcuni bacini idrografici dell’Appennino. Nei suoli ad elevato grado evolutivo del margine appenninico il “segnale” della provenienza si perde e il contenuto di Cromo è omogeneo indipendentemente dal bacino.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico XRF (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale. Per questo metallo l’attacco con acqua regia e lettura ICP-MS determina valori <span>inferiori<\\/span>, con una percentuale variabile in relazione alle caratteristiche fisico-chimiche della matrice. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>40%<\\/strong> circa. Ad esempio 100 mg/kg di Cromo determinati con l’attacco in acqua regia corrispondono a 140 mg/kg totali di concentrazione.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "CARTA_PEDOGEOCHIMICA.pdf");
macroCatTable[app].put(13, carteTable[liv5]);

		
// NUOVA CARTA
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale del Nichel [Ni] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale del Nichel [Ni] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview14_new.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 14);
carteTable[liv5].put("linkMetadato", linkMetadati.get(14));
carteTable[liv5].put("descCarta", "<p>La “Carta del Fondo naturale della Pianura emiliano-romagnola del Nichel in scala 1:250.000” rappresenta la distribuzione areale del contenuto naturale di Nichel nel <i>subsoil<\\/i> (90-140 cm di profondità, 60-80 nei suoli con ghiaie) nei suoli ad uso agricolo.<\\/p><p>Il contenuto di fondo naturale dei metalli nei suoli è regolato principalmente da tre fattori: 1) la provenienza del sedimento in cui si è impostato il suolo, 2) la tessitura, 3) il grado. Per quanto riguarda il Nichel, nei suoli meno evoluti, il fattore dominante è la provenienza in relazione alla presenza di rocce ricche in Cr e Ni (ofioliti), che affiorano nelle Alpi Occidentali e in alcuni bacini idrografici dell’Appennino. Nei suoli ad elevato grado evolutivo del margine appenninico il “segnale” della provenienza si perde e il contenuto di Nichel è omogeneo indipendentemente dal bacino.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF<\\/strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale. Per questo metallo l’attacco con acqua regia e lettura ICP-MS determina valori <span>inferiori<\\/span>, con una percentuale variabile in relazione alle caratteristiche fisico-chimiche della matrice. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>20%<\\/strong> circa. Ad esempio 100 mg/kg di Nichel determinati con l’attacco in acqua regia corrispondono a 120 mg/kg totali di concentrazione.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "CARTA_PEDOGEOCHIMICA.pdf");
macroCatTable[app].put(14, carteTable[liv5]);

// NUOVA CARTA
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale del Piombo [Pb] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale del Piombo [Pb] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview15_new.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 15);
carteTable[liv5].put("linkMetadato", linkMetadati.get(15));
carteTable[liv5].put("descCarta", "<p>La “Carta del Fondo naturale della Pianura emiliano-romagnola del Piombo” in scala 1:250.000” rappresenta la distribuzione areale del contenuto naturale di Piombo nel <i>subsoil<\\/i> (90-140 cm di profondità, 60-80 nei suoli con ghiaie) nei suoli ad uso agricolo.Il contenuto di fondo naturale dei metalli nei suoli è regolato principalmente da tre fattori: 1) la provenienza del sedimento in cui si è impostato il suolo, 2) la tessitura, 3) il grado evolutivo. Per quanto riguarda il Piombo il fattore dominante è la provenienza legata alla presenza di rocce vulcaniche nel bacino idrografico e il fattore secondario è il grado evolutivo dei suoli.<\\/p><p>Nella nostra regione le rocce vulcaniche presenti non condizionano i valori di concentrazione di Piombo nei suoli, si osserva una debole variabilità coerente in maniera non staticamente significativa con il grado evolutivo dei suoli.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF<\\/strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale. Per questo metallo l’attacco con acqua regia e lettura ICP-MS determina valori <span>comparabili<\\/span> tra i due metodi.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "CARTA_PEDOGEOCHIMICA.pdf");
macroCatTable[app].put(15, carteTable[liv5]);

liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale del Rame [Cu] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale del Rame [Cu] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview16_new.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 16);
carteTable[liv5].put("linkMetadato", linkMetadati.get(16));
carteTable[liv5].put("descCarta", "<p>La “Carta del Fondo naturale della Pianura emiliano-romagnola del Rame in scala 1:250.000” rappresenta la distribuzione areale del contenuto naturale di Rame nel <i>subsoil<\\/i> (90-140 cm di profondità, 60-80 nei suoli con ghiaie) nei suoli ad uso agricolo.<\\/p><p>Il contenuto di fondo naturale dei metalli nei suoli è regolato principalmente da tre fattori: 1) la provenienza del sedimento in cui si è impostato il suolo, 2) la tessitura, 3) il grado evolutivo. Per quanto riguarda il Rame il fattore prevalente è il grado evolutivo: nei suoli molto evoluti di pertinenza delle superfici più antiche del margine appenninico questo metallo si impoverisce in modo significa mentre non si riscontrano differenze significative nei suoli in relazione alle differenti granulometrie o provenienze del sedimento in cui si è impostato il suolo.I valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF<\\/strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale.<\\/p><p>Per questo metallo l’attacco con acqua regia e lettura ICP-MS determina valori <span>comparabili<\\/span> con una percentuale variabile in relazione alle caratteristiche fisico-chimiche della matrice. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>4%<\\/strong> circa.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "CARTA_PEDOGEOCHIMICA.pdf");
macroCatTable[app].put(16, carteTable[liv5]);


liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale dello Zinco [Zn] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale dello Zinco [Zn] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview17_new.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 17);
carteTable[liv5].put("linkMetadato", linkMetadati.get(17));
carteTable[liv5].put("descCarta", "<p>La “Carta del Fondo naturale della Pianura emiliano-romagnola dello Zinco in scala 1:250.000” rappresenta la distribuzione areale del contenuto naturale di Zinco nel <i>subsoil<\\/i> (90-140 cm di profondità, 60-80 nei suoli con ghiaie) nei suoli ad uso agricolo.<\\/p><p>Il contenuto di fondo naturale dei metalli nei suoli è regolato principalmente da tre fattori: 1) la provenienza del sedimento in cui si è impostato il suolo, 2) la tessitura, 3) il grado evolutivo. Per quanto riguarda lo Zinco il fattore dominante è la granulometria dei suoli mentre quello secondario è il grado evolutivo.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF<\\/strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale.<\\/p><p>Per questo metallo l’attacco con acqua regia e lettura ICP-MS determina valori <span>comparabili<\\/span> con una percentuale variabile in relazione alle caratteristiche fisico-chimiche della matrice. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>7%<\\/strong> circa.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "CARTA_PEDOGEOCHIMICA.pdf");
macroCatTable[app].put(17, carteTable[liv5]);


liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2016-01-27 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta della salinità nei suoli di pianura tra 0-50 cm (2a approssimazione)");
carteTable[liv5].put("titleCarta", "Salinità nei suoli di pianura tra 0-50 cm. 2a approssimazione.");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview19.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 19);
carteTable[liv5].put("linkMetadato", linkMetadati.get(19));
carteTable[liv5].put("descCarta", "<p>La carta descrive la distribuzione areale dello stato di salinità dello strato superficiale (0-50 cm) nei suoli di pianura. La conoscenza dello stato di salinità dei suoli è la premessa per una corretta gestione del suolo come viene anche indicato dalla Commissione Europea attraverso la Strategia Tematica per la Protezione del Suolo COM(2006) 231.<\\/p><p>L’interesse al livello regionale è dovuto non solo alla nota presenza di suoli salini in ambienti dove in passato erano diffuse paludi e valli salmastre, ma anche dalla possibilità di attivare processi di salinizzazione in seguito all’uso di acqua irrigua di scarsa qualità oppure a una diminuzione di efficacia delle opere di deflusso delle acque con innalzamento del “franco di bonifica” o ancora per innalzamento di una falda salina superficiale.<\\/p><p>I dati di base sono stati estrapolati dalla Banca Dati dei Suoli della Regione Emilia-Romagna e la seconda approssimazione si è avvalsa di un maggior numero di dati che ne ha migliorato la qualità in termini di attendibilità dei valori stimati. <\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "salinita0_50.pdf");
macroCatTable[app].put(19, carteTable[liv5]);

liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta della salinità nei suoli di pianura tra 50-100 cm (prima approssimazione)");
carteTable[liv5].put("titleCarta", "Salinità nei suoli di pianura tra 50-100 cm. Prima approssimazione.");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview20.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 20);
carteTable[liv5].put("linkMetadato", linkMetadati.get(20));
carteTable[liv5].put("descCarta", "<p>La carta della salinità descrive l’attuale stato di salinità dei suoli di pianura della Regione Emilia-Romagna. L’interesse al livello regionale è dovuto non solo alla nota presenza di suoli salini in ambienti dove in passato erano diffuse paludi e valli salmastre, ma anche dalla possibilità di attivare processi di salinizzazione in seguito all’uso di acqua irrigua di scarsa qualità oppure a una diminuzione di efficacia delle opere di deflusso delle acque con innalzamento del “franco di bonifica” o ancora per innalzamento di una falda salina superficiale.<\\/p><p>La conoscenza dello stato dei suoli è la premessa per una corretta gestione del suolo come viene anche indicato dalla Commissione Europea attraverso la  Strategia Tematica per la Protezione del Suolo COM(2006) 231.<\\/p><p>La carta della salinità è stata elaborata a partire da dati puntuali attraverso analisi geostatistica ed è considerata di prima approssimazione nell’attesa di una maggiore disponibilità di dati che ne migliori la qualità e l’attendibilità dei valori stimati. <\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "salinita50_100.pdf");
macroCatTable[app].put(20, carteTable[liv5]);



// SECONDA CATEGORIA
app++;
catalogo.put(1, macroCatTable[app]);

// NUOVA CARTA
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2010-01-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta della capacità d'uso dei suoli di pianura");
carteTable[liv5].put("titleCarta", "Capacità d’uso dei suoli di pianura");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview5.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 5);
carteTable[liv5].put("linkMetadato", linkMetadati.get(5));
carteTable[liv5].put("descCarta", "<p>La capacità di produrre biomassa è tra le funzioni prioritarie del suolo. Questo specifico aspetto è considerato nella Carta della capacità d\'uso dei suoli, oggi più che mai uno strumento indispensabile di supporto alla pianificazione territoriale, laddove si vogliano fare scelte più attente alla tutela delle risorse naturali. La Carta di capacità d\'uso rappresenta una sintesi della Carta dei suoli di pianura in scala 1:50.000 ed. 2005. Attraverso lo schema di valutazione SINA 2000, che prende in considerazione specifiche qualità del suolo e dell’ambiente, è stato possibile assegnare a ciascuna delineazione, sulla base delle percentuali dei suoli presenti, una determinata classe di capacità d’uso specificandone anche le limitazioni.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "CAPACITA_USO.pdf");
macroCatTable[app].put(5, carteTable[liv5]);

// NUOVA CARTA
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2016-01-27 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del carbonio organico immagazzinato nei suoli di pianura tra 0-30 cm. 2a edizione");
carteTable[liv5].put("titleCarta", "Carbonio organico immagazzinato nei suoli di pianura tra 0-30 cm. 2a edizione");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview9.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 9);
carteTable[liv5].put("linkMetadato", linkMetadati.get(9));
carteTable[liv5].put("descCarta", "<p>Il suolo è il comparto ambientale che costituisce la più grande riserva di carbonio organico negli ecosistemi terrestri. Globalmente la quantità di carbonio immagazzinata nei suoli è pari a circa quattro volte quella presente nella vegetazione.<br />Il ruolo cruciale svolto dai suoli nel ciclo del carbonio è riconosciuto dalle convenzioni su desertificazione, cambiamento climatico, biodiversità. Il protocollo di Kyoto (1997) sottolinea che il suolo svolge una funzione importante per l’immagazzinamento del carbonio, che deve essere tutelata e, se possibile, anche rafforzata.<br />La carta rappresenta la distribuzione areale del carbonio organico  espresso in Mg*ha -1 immagazzinato nello strato superficiale (0-30 cm) dei suoli di pianura. La carta è alla sua seconda edizione ed è stata elaborata a partire dai dati di carbonio organico estrapolati dalla Banca Dati dei Suoli della Regione Emilia-Romagna relativi al periodo 1990-2013 e sulla base della Carta dell’uso del suolo 2008 ed.2011 elaborata secondo gli indici di suolo/non suolo di Corticelli et.al 2008.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "NOTE_ILLUSTRATIVE_stockCO30_pianura.pdf");
macroCatTable[app].put(9, carteTable[liv5]);

// NUOVA CARTA
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2010-01-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del carbonio organico immagazzinato nei suoli di pianura tra 0-100 cm");
carteTable[liv5].put("titleCarta", "Carbonio organico immagazzinato nei suoli di pianura tra 0-100 cm");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview10.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 10);
carteTable[liv5].put("linkMetadato", linkMetadati.get(10));
carteTable[liv5].put("descCarta", "<p>Il suolo è il comparto ambientale che costituisce la più grande riserva di carbonio organico negli ecosistemi terrestri. Globalmente la quantità di carbonio immagazzinata nei suoli è pari a circa quattro volte quella presente nella vegetazione. La diminuzione del contenuto di carbonio organico nei suoli è considerata una minaccia ed un elemento di degrado del suolo, così come indicato nella comunicazione “Strategia tematica per le protezione del suolo” della Commissione Europea (COM2006/231).<br />Il ruolo cruciale svolto dai suoli nel ciclo del carbonio è riconosciuto dalle convenzioni su desertificazione, cambiamento climatico, biodiversità. Il protocollo di Kyoto sottolinea che il suolo svolge una funzione importante per l’immagazzinamento del carbonio, che deve essere tutelata e, se possibile, anche rafforzata. La carta del carbonio organico va intesa come una prima elaborazione dei dati disponibili nella banca dati dei suoli al fine di divulgare lo stato delle conoscenze riguardo ai quantitativi immagazzinati nei suoli regionali; indica il valore medio di carbonio organico, espresso in Mg*ha-1, contenuto fino alla profondità di 100 cm.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "NOTE_ILLUSTRATIVE_stockCO100_pianura.pdf");
macroCatTable[app].put(10, carteTable[liv5]);

// NUOVA CARTA
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2010-01-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del carbonio organico immagazzinato nei suoli dell’Appennino tra 0-30 cm");
carteTable[liv5].put("titleCarta", "Carbonio organico immagazzinato nei suoli dell’Appennino tra 0-30 cm");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview11.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 11);
carteTable[liv5].put("linkMetadato", linkMetadati.get(11));
carteTable[liv5].put("descCarta", "<p>Il suolo è il comparto ambientale che costituisce la più grande riserva di carbonio organico negli ecosistemi terrestri. Globalmente la quantità di carbonio immagazzinata nei suoli è pari a circa quattro volte quella presente nella vegetazione. La diminuzione del contenuto di carbonio organico nei suoli è considerata una minaccia ed un elemento di degrado del suolo, così come indicato nella comunicazione “Strategia tematica per le protezione del suolo” della Commissione Europea (COM2006/231).<br />Il ruolo cruciale svolto dai suoli nel ciclo del carbonio è riconosciuto dalle convenzioni su desertificazione, cambiamento climatico, biodiversità. Il protocollo di Kyoto sottolinea che il suolo svolge una funzione importante per l’immagazzinamento del carbonio, che deve essere tutelata e, se possibile, anche rafforzata. La carta del carbonio organico va intesa come una prima elaborazione dei dati disponibili nella banca dati dei suoli al fine di divulgare lo stato delle conoscenze riguardo ai quantitativi immagazzinati nei suoli regionali; indica il valore medio di carbonio organico, espresso in Mg*ha-1, contenuto nei primi 30 cm di suolo compresi gli orizzonti organici di superficie nel caso dei suoli forestali.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "NOTE_ILLUSTRATIVE_stockCO30_montagna.pdf");
macroCatTable[app].put(11, carteTable[liv5]);

// NUOVA CARTA
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2010-01-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del carbonio organico immagazzinato nei suoli dell’Appennino tra 0-100 cm");
carteTable[liv5].put("titleCarta", "Carbonio organico immagazzinato nei suoli dell’Appennino tra 0-100 cm");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview12.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 12);
carteTable[liv5].put("linkMetadato", linkMetadati.get(12));
carteTable[liv5].put("descCarta", "<p>Il suolo è il comparto ambientale che costituisce la più grande riserva di carbonio organico negli ecosistemi terrestri. Globalmente la quantità di carbonio immagazzinata nei suoli è pari a circa quattro volte quella presente nella vegetazione. La diminuzione del contenuto di carbonio organico nei suoli è considerata una minaccia ed un elemento di degrado del suolo, così come indicato nella comunicazione “Strategia tematica per le protezione del suolo” della Commissione Europea (COM2006/231).<br />Il ruolo cruciale svolto dai suoli nel ciclo del carbonio è riconosciuto dalle convenzioni su desertificazione, cambiamento climatico, biodiversità. Il protocollo di Kyoto sottolinea che il suolo svolge una funzione importante per l’immagazzinamento del carbonio, che deve essere tutelata e, se possibile, anche rafforzata. La carta del carbonio organico va intesa come una prima elaborazione dei dati disponibili nella banca dati dei suoli al fine di divulgare lo stato delle conoscenze riguardo ai quantitativi immagazzinati nei suoli regionali; indica il valore medio di carbonio organico, espresso in Mg*ha-1, contenuto fino alla profondità di 100 cm compresi gli orizzonti organici di superficie nel caso dei suoli forestali.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "NOTE_ILLUSTRATIVE_stockCO100_montagna.pdf");
macroCatTable[app].put(12, carteTable[liv5]);


// NUOVA CARTA LIVELLO SO
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2016-01-27 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta della dotazione in sostanza organica dei suoli di pianura tra 0-30 cm (2a edizione)");
carteTable[liv5].put("titleCarta", "Dotazione in sostanza organica dei suoli di pianura tra 0-30 cm (2a edizione)");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview18.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 18);
carteTable[liv5].put("linkMetadato", linkMetadati.get(18));
carteTable[liv5].put("descCarta", "<p>La carta della dotazione in sostanza organica descrive qualitativamente il contenuto di sostanza organica nei primi 30 cm di suolo secondo lo schema di valutazione contenuto nei Disciplinari di Produzione Integrata (D.P.I. 2015) della Regione Emilia-Romagna.<br />Questa informazione è utile per applicare tecniche agricole più razionali e sostenibili al fine di ottenere prodotti di qualità garantita, nel rispetto dell’ambiente e della salute dell’uomo. La conoscenza della dotazione di sostanza organica dei terreni contribuisce al conseguimento di tale finalità, integrando così le norme e le indicazioni tecniche contenute nei D.P.I. Essa inoltre può orientare localmente l’adesione alle azioni dei Programmi di Sviluppo Rurale volte all’ incremento o alla conservazione della sostanza organica e consentire successivamente la valutazione dell’efficacia dell’applicazione di tali azioni.<\\/p>");
carteTable[liv5].put("nomeNoteIllustrative", "dotazioneSO.pdf");
macroCatTable[app].put(18, carteTable[liv5]);



// FONDO NATURALE ANTROPICO

// ALLELEMENT
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2014-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del fondo naturale-antropico di As, Cr, Cu, Ni, Pb, Sn, V, Zn");
carteTable[liv5].put("titleCarta", "Fondo naturale-antropico di As, Cr, Cu, Ni, Pb, Sn, V, Zn");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview29.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 29);
carteTable[liv5].put("linkMetadato", linkMetadati.get(29));
carteTable[liv5].put("descCarta", "<p>La “Carta del fondo naturale-antropico di As, Cr, Cu, Ni, Pb, Sn, V, Zn” rappresenta la distribuzione areale del contenuto di alcuni metalli potenzialmente tossici nel <i>topsoil<\\/i> (20-30 cm di profondità) dei suoli ad uso agricolo. La concentrazione misurata a questa profondità si considera rappresenti il contenuto naturale legato alle proprietà intrinseche dei suoli arricchito dagli apporti antropici derivanti da fonti diffuse (background content , ISO 19258, 2005).<\\/p><p>I valori proposti per ogni cella tengono conto dei dati misurati (~700) e di una loro  elaborazione geostatistica (Simulazioni Gaussiane Sequenziali) condizionata da tipo di suolo e uso del suolo. Nelle celle in cui il centroide coincide con il valore misurato questo viene mantenuto.<\\/p><p>L’attendibilità dei risultati è stata valutata tenedo conto dell’entità della dispersione dei valori simulati, a minore dispersione maggiore attendibilità.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>UNI EN 13346 (metodo C in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99)<\\/strong>, per quanto riguarda l’estrazione in acqua regia, e il metodo <strong>EPA 6020<\\/strong>, per quanto riguarda la lettura ICP-MS.<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "Carta_fondo_naturale_antropico.pdf");
macroCatTable[app].put(21, carteTable[liv5]);


// ARSENICO
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2014-02-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale-antropico dell'Arsenico [As] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale-antropico dell'Arsenico [As] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview27.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 27);
carteTable[liv5].put("linkMetadato", linkMetadati.get(27));
carteTable[liv5].put("descCarta", "<p>La “Carta del Fondo naturale-antropico dell’Arsenico della pianura emiliano-romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di  Arsenico nel <i>topsoil<\\/i> (20-30 cm di profondità) dei suoli ad uso agricolo.<\\/p><p>I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del <i>parent material<\\/i>; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.<\\/p><p>Per l’Arsenico il contenuto di sostanza organica è il fattore determinante assieme al grado evolutivo e quindi i valori più elevati sono presenti nelle aree dell’antico delta, nei suoli antichi dell’alta pianura e della bassa pianura occidentale di pertinenza del fiume Po.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico UNI EN 13346 (metodo C in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99), per quanto riguarda l’estrazione in acqua regia, e il metodo EPA 6020, per quanto riguarda la lettura ICP-MS<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "Carta_fondo_naturale_antropico.pdf");
macroCatTable[app].put(22, carteTable[liv5]);




// CROMO
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale-antropico del Cromo [Cr] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale-antropico del Cromo [Cr] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview21.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 21);
carteTable[liv5].put("linkMetadato", linkMetadati.get(21));
carteTable[liv5].put("descCarta", "<p>La “Carta del fondo naturale-antropico del Cromo della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Cromo nel <i>topsoil<\\/i> (20-30 cm di profondità) nei suoli ad uso agricolo.<\\/p><p>I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.<\\/p><p> Per il Cromo sono la provenienza del <i>parent material<\\/i> e il grado di alterazione i fattori determinanti ai fini della concentrazione (così come per il contenuto naturale) e di conseguenza la distribuzione geografica dei contenuti è molto coerente con il pattern della Carta del Fondo Naturale ma anche con quello dei comprensori che comunque sono caratterizzati da bacini idrografici con cave di prestito dei materiali differenti, da ovest verso est, in relazione alla presenza di rocce ricche in Cr e Ni (ofioliti), che affiorano nelle Alpi Occidentali, in alcuni bacini idrografici dell’Appennino e nel bacino del Po. Nei suoli ad elevato grado evolutivo del margine appenninico il “segnale” della provenienza si perde e il contenuto di Cromo è omogeneo indipendentemente dal bacino.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>UNI EN 13346 (metodo C in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99)<\\/strong>, per quanto riguarda l’estrazione in acqua regia, e il metodo <strong>EPA 6020<\\/strong>, per quanto riguarda la lettura ICP-MS.<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "Carta_fondo_naturale_antropico.pdf");
macroCatTable[app].put(23, carteTable[liv5]);




// NICHEL
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale-antropico del Nichel [Ni] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale-antropico del Nichel [Ni] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview22.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 22);
carteTable[liv5].put("linkMetadato", linkMetadati.get(22));
carteTable[liv5].put("descCarta", "<p>La “Carta del fondo naturale-antropico del Nichel della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Nichel nel <i>topsoil<\\/i>  (20-30 cm di profondità) nei suoli ad uso agricolo.<\\/p><p>I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.<\\/p><p>Per il Nichel sono la provenienza del <i>parent material<\\/i> e il grado di alterazione i fattori determinanti ai fini della concentrazione (così come per il contenuto naturale) e di conseguenza la distribuzione geografica dei contenuti è molto coerente con il pattern della Carta del Fondo Naturale ma anche con quello dei comprensori che comunque sono caratterizzati da bacini idrografici con cave di prestito dei materiali differenti da ovest verso est in relazione alla presenza di rocce ricche in Cr e Ni (ofioliti), che affiorano nelle Alpi Occidentali e in alcuni bacini idrografici dell’Appennino e nel bacino del Po. Nei suoli ad elevato grado evolutivo del margine appenninico il “segnale” della provenienza si perde e il contenuto di Nichel è omogeneo indipendentemente dal bacino.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>UNI EN 13346 (metodo C in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99)<\\/strong>, per quanto riguarda l’estrazione in acqua regia, e il metodo <strong>EPA 6020<\\/strong>, per quanto riguarda la lettura ICP-MS<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "Carta_fondo_naturale_antropico.pdf");
macroCatTable[app].put(24, carteTable[liv5]);





// PIOMBO
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale-antropico del Piombo [Pb] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale-antropico del Piombo [Pb] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview23.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 23);
carteTable[liv5].put("linkMetadato", linkMetadati.get(23));
carteTable[liv5].put("descCarta", "<p>La “Carta del fondo naturale-antropico della Pianura Emiliano-Romagnola del Piombo in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Piombo nel <i>topsoil<\\/i>  (20-30 cm di profondità) nei suoli ad uso agricolo.<\\/p><p>I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del <i>parent material<\\/i>; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.<\\/p><p>Il Piombo sembra non avere fattori determinanti, né di tipo naturale né di tipo antropico, che contribuiscano ad aumentarne la concentrazione nei suoli regionali in quanto è ininfluente il fattore provenienza e anche l’uso del suolo non sembra avere un impatto significativo. Tutti i suoli della regione hanno un contenuto minore del limite di legge previsto per i suoli delle aree a verde pubblico, privato  e residenziale.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>UNI EN 13346 (metodo C in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99)<\\/strong>, per quanto riguarda l’estrazione in acqua regia e il metodo <strong>EPA 6020<\\/strong>, per quanto riguarda la lettura ICP-MS<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "Carta_fondo_naturale_antropico.pdf");
macroCatTable[app].put(25, carteTable[liv5]);


// RAME
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale-antropico del Rame [Cu] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale-antropico del Rame [Cu] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview24.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 24);
carteTable[liv5].put("linkMetadato", linkMetadati.get(24));
carteTable[liv5].put("descCarta", "<p>La “Carta del Contenuto naturale-antropico del Rame della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Rame nel <i>topsoil<\\/i> (20-30 cm di profondità) nei suoli ad uso agricolo.<\\/p><p>I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del <i>parent material<\\/i>; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.<\\/p><p>Il contenuto di Rame sembra non avere fattori determinanti di tipo naturale: c’è invece una chiara verso relazione con l’uso e la gestione del suolo in quanto in alcuni comprensori agricoli (reggiano,  modenese e ravennate) la concentrazione aumenta in modo significativo.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>UNI EN 13346 (metodo C in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99)<\\/strong>, per quanto riguarda l’estrazione in acqua regia, e il metodo <strong>EPA 6020<\\/strong>, per quanto riguarda la lettura ICP-MS.<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "Carta_fondo_naturale_antropico.pdf");
macroCatTable[app].put(26, carteTable[liv5]);






// STAGNO
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale-antropico dello Stagno [Sn] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale-antropico del Stagno [Sn] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview26.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 26);
carteTable[liv5].put("linkMetadato", linkMetadati.get(26));
carteTable[liv5].put("descCarta", "<p>La “Carta del fondo naturale-antropico dello Stagno della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Stagno nel <i>topsoil<\\/i>  (20-30 cm di profondità) nei suoli ad uso agricolo.<\\/p><p>I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del <i>parent material<\\/i>; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.<\\/p><p>Il contenuto di Stagno nei suoli regionali, essendo irrilevante la componente della provenienza, è influenzato dal contenuto di sostanza organica, secondariamente dalla tessitura, per quanto riguarda i fattori di origine naturale, e anche dall’ uso e dalla gestione del suolo. Il comprensorio agricolo caratterizzato dal contenuto più alto è Ferrara, seguito da Ravenna, Modena, Bologna. La quasi totalità dei suoli della regione ha un contenuto maggiore del limite di legge per i suoli delle aree a verde pubblico, privato  e residenziale.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>UNI EN 13346 (metodo C in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99)<\\/strong>, per quanto riguarda l’estrazione in acqua regia e il metodo EPA 6020<\\/strong>, per quanto riguarda la lettura ICP-MS.<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "Carta_fondo_naturale_antropico.pdf");
macroCatTable[app].put(27, carteTable[liv5]);



// VANADIO
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2014-02-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale-antropico del Vanadio [V] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale-antropico del Vanadio [V] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview28.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 28);
carteTable[liv5].put("linkMetadato", linkMetadati.get(28));
carteTable[liv5].put("descCarta", "<p>La “Carta del fondo naturale-antropico del Vanadio della pianura emiliano-romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di  Vanadio nel <i>topsoil<\\/i> (20-30 cm di profondità) dei suoli ad uso agricolo.<\\/p><p>I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli sono i seguenti: 1) provenienza del <i>parent material<\\/i>; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica; 5) uso del suolo.<\\/p><p>Per il Vanadio è la tessitura il  fattore determinante  ai fini della concentrazione e di conseguenza la distribuzione geografica dei contenuti è molto coerente con il pattern della “Carta dei suoli a scala 1:50.000” della pianura emiliano – romagnola.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico UNI EN 13346 (metodo C in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99), per quanto riguarda l’estrazione in acqua regia, e il metodo EPA 6020, per quanto riguarda la lettura ICP-MS.<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "Carta_fondo_naturale_antropico.pdf");
macroCatTable[app].put(28, carteTable[liv5]);



// ZINCO
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2012-03-01 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta del Fondo naturale-antropico dello Zinco [Zn] della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Fondo naturale-antropico del Zinco [Zn] della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview25.jpg");
carteTable[liv5].put("scalaCarta", "1:250.000");
carteTable[liv5].put("codiceLivelloCarta", 25);
carteTable[liv5].put("linkMetadato", linkMetadati.get(25));
carteTable[liv5].put("descCarta", "<p>La “Carta del fondo naturale-antropico  dello Zinco della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Zinco nel <i>topsoil<\\/i> (20-30 cm di profondità) nei suoli ad uso agricolo.<\\/p><p>I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del <i>parent material<\\/i>; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.<\\/p><p>I fattori di tipo naturale che influiscono sul contenuto di Zinco sono la tessitura e secondariamente la provenienza (zinco-clorite nel bacino del Po); l’andamento delle concentrazioni suggerisce però anche una forte influenza dell’uso e della gestione del suolo in quanto anche per questo metallo le concentrazioni aumentano solo in alcuni comprensori (modenese e reggiano) caratterizzati da ordinamenti colturali peculiari.<\\/p><p>I valori di concentrazione sono ottenuti con il metodo analitico <strong>UNI EN 13346 (metodo C in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99)<\\/strong>, per quanto riguarda l’estrazione in acqua regia, e il metodo <strong>EPA 6020<\\/strong>, per quanto riguarda la lettura ICP-MS.<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "Carta_fondo_naturale_antropico.pdf");
macroCatTable[app].put(29, carteTable[liv5]);


// GRUPPI IDROLOGICI
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2015-01-27 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta dei Gruppi Idrologici dei suoli della pianura emiliano-romagnola");
carteTable[liv5].put("titleCarta", "Gruppi Idrologici dei suoli della pianura emiliano-romagnola");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview30.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 30);
carteTable[liv5].put("linkMetadato", linkMetadati.get(30));
carteTable[liv5].put("descCarta", "<p>Le proprietà idrologiche dei suoli sono parametri richiesti per fare previsioni, stime e valutazioni dei fenomeni che riguardano il movimento di acqua nel sistema suolo/falda/acque superficiali. I Gruppi Idrologici indicano il comportamento potenziale dei suoli nel generare scorrimento superficiale dell'acqua secondo la metodologia USDA-NRCS. Il metodo si basa sul presupposto che suoli all'interno di una medesima regione climatica simili per profondità, per capacità di infiltrazione, per tessitura, struttura e per profondità della falda, danno la stessa risposta come deflusso superficiale (capitolo 7 del <i>National Engineering Hand book</i>, parte 630, <strong>2009<\\/strong>).<\\/p><p>La carta descrive la distribuzione areale dei gruppi idrologici dei suoli nei poligoni della carta dei suoli di pianura in scala 1:50.000. Ogni poligono è descritto dalla percentuale di diffusione dei gruppi idrologici in esso presenti.<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "NOTE_ILLUSTRATIVE_GRUPPI_IDROLOGICI.pdf");
macroCatTable[app].put(30, carteTable[liv5]);


// PERMEABILITA
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2016-01-27 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta della conducibilità idraulica satura (Ksat) dei suoli di pianura");
carteTable[liv5].put("titleCarta", "Conducibilità idraulica satura (Ksat) dei suoli di pianura");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview32.jpg");
carteTable[liv5].put("scalaCarta", "1:50.000");
carteTable[liv5].put("codiceLivelloCarta", 32);
carteTable[liv5].put("linkMetadato", linkMetadati.get(32));
carteTable[liv5].put("descCarta", "<p>Per conducibilità idraulica satura (Ksat) s'intende la capacità del suolo di trasmettere l’acqua quando è in condizioni di saturazione. Un suolo raggiunge la condizione di saturazione quando tutti i pori sono occupati da acqua. Nei suoli emiliano-romagnoli questa condizione si raggiunge  in occasione di precipitazioni molto abbondanti, o in particolari situazioni morfologiche o ancora in presenza di falde superficiali. Le proprietà idrologiche dei suoli sono parametri richiesti per fare previsioni, stime e valutazioni dei fenomeni che riguardano il movimento di acqua nel sistema suolo/falda/acque superficiali. La conducibilità idrica satura è un parametro della facilità con cui il suolo trattiene o rilascia acqua. <br />La carta descrive la distribuzione areale della conducibilità idraulica satura nei poligoni della carta dei suoli di pianura in scala 1:50.000. Ogni poligono è descritto da una classe di Ksat (SSM,1993).<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "NOTE_ILLUSTRATIVE_CONDUCIBILITA_IDRAULICA.pdf");
macroCatTable[app].put(32, carteTable[liv5]);

// IMPERMEABILIZZAZIONE
liv5++;
carteTable[liv5].put("dataCarta", dfm.parse("2016-07-15 00:00:00").getTime());
carteTable[liv5].put("articoloTestoLinkCarta", "la");
carteTable[liv5].put("testoLinkCarta", "Carta della Superfici impermeabilizzate della pianura");
carteTable[liv5].put("titleCarta", "Superfici impermeabilizzate della pianura");
carteTable[liv5].put("imgCarta", "/gstatico/documenti/cartpedo/immagini/overview33.jpg");
carteTable[liv5].put("scalaCarta", "1:25.000");
carteTable[liv5].put("codiceLivelloCarta", 33);
carteTable[liv5].put("linkMetadato", linkMetadati.get(33));
carteTable[liv5].put("descCarta", "<p>La carta della dell’impermeabilizzazione dei suoli di pianura rappresenta, attraverso celle quadrate di 10 metri di lato, il grado di impermeabilizzazione delle superfici. <br />I dati di base sono stati estrapolati Data Base Topografico della Regione Emilia-Romagna (aggiornamento 2008-2011) unito alle informazioni sulla natura delle superfici cartografate. <br />Nella carta sono mappati tutti i manufatti come edifici, strade, marciapiedi, impianti sportivi, ecc. presenti nella pianura emiliano romagnola ed il loro grado di impermeabilizzazione. Avendo le celle un area spesso maggiore degli oggetti cartografati (es. strade strette, marciapiedi, peste ciclabili, ecc.) ad ogni cella è stato attribuito il valore di impermeabilizzazione maggioritario al suo interno.<\\/p>");

carteTable[liv5].put("nomeNoteIllustrative", "impermeabilizzazione.pdf");
macroCatTable[app].put(33, carteTable[liv5]);


%>
<% title="Elenco delle carte tematiche - I suoli della Regione Emilia-Romagna"; pageHeader="";
%>
<%@ include file="head.jsp"
%>
		<ul class="skip">
		<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
		<li><a href="#contenutopagina" title="Salta ai contenuti - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
		<li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>
		</ul>
<%@ include file="testata.jsp"
%>  
  	</div>
  <div class="briciole">
	<a name="homepage" tabindex="0"></a>
	<a accesskey="h" href="index.jsp?liv=1" title="Torna alla pagina principale">Home Page</a>
	&nbsp;&#8250;&#8250; Carte tematiche&nbsp;&#8250;&#8250; <%=titoloBriciole%>
  </div>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <div id="content_carte_tematiche">
  <h1>Elenco delle carte tematiche</h1>
  <a name="contenutopagina" tabindex="0"></a>

	 
<script type="text/javascript">
/*<![CDATA[*/
<% 
Iterator itrCat;
TreeMap treeMapCatalogo = new TreeMap(catalogo);
itrCat = treeMapCatalogo.keySet().iterator();
String cartaNovita="";
int cartaCorrente=0;
while (itrCat.hasNext()) {

	Object keyCatalogo = itrCat.next();
	Object valueCatalogo = treeMapCatalogo.get(keyCatalogo);
	cartaCorrente=Integer.parseInt(keyCatalogo.toString())+1;
	
%>

	  document.write("<div class=\"content_macro_categoria\">");
	  document.write("<a name=\"tem<%=cartaCorrente%>\" tabindex=\"<%=cartaCorrente%>\"><\/a>");
	  document.write("<h2><%=((Integer.parseInt(keyCatalogo.toString())+1)+".")%> <%=titoliMacro[Integer.parseInt(keyCatalogo.toString())]%><\/h2>");
<%	  
	Iterator itrMacr;
	TreeMap treeMapMacro = new TreeMap((Hashtable)valueCatalogo);
	itrMacr = treeMapMacro.keySet().iterator();
	int jj=1;
	while (itrMacr.hasNext()) {
		Object livCarta = itrMacr.next();
		Object valueMacro = treeMapMacro.get(livCarta);
		TreeMap carta = new TreeMap((Hashtable)valueMacro);

		String codiceLivelloCarta = carta.get("codiceLivelloCarta").toString();
		int liv=Integer.parseInt(livCarta.toString());

		cartaNovita="";
		long dataCarta=Long.parseLong(carta.get("dataCarta").toString());
		if(oggi-dataCarta<(giorniNovita*1000*3600*24))
			cartaNovita=immagineNovita;

		String classeApertoChiuso="cartaChiuso";
		String spazioApertoChiuso="spazio_chiuso";
		String classeApertoChiusoBox="carta_tematica_box";
		if(tem==cartaCorrente){
			classeApertoChiuso="cartaAperto";
			classeApertoChiusoBox="carta_tematica_box_aperto";
			spazioApertoChiuso="spazio_aperto";
		}


	 	
%>
		document.write("<div id=\"box_liv<%=codiceLivelloCarta%>\" class=\"<%=classeApertoChiusoBox%>\">");
			document.write("<a name=\"carta<%=codiceLivelloCarta%>\"><\/a>");
			document.write("<h3><%=((Integer.parseInt(keyCatalogo.toString())+1)+"."+jj)%> <a id=\"title<%=codiceLivelloCarta%>\" href=\"javascript:toggle('liv<%=codiceLivelloCarta%>','title<%=codiceLivelloCarta%>');\" title=\"Chiudi dettagli cartografia\"> <%=carta.get("titleCarta").toString()%><\/a><%=cartaNovita%><\/h3>");
			document.write("<div id=\"liv<%=codiceLivelloCarta%>\" class=\"<%=classeApertoChiuso%>\">");

				document.write("<div class=\"posScalaCarta\"><p><strong>Scala <%=carta.get("scalaCarta")%><\/strong><\/p><\/div>");
				document.write("<div><a href=\"ge/kml.jsp?liv=<%=codiceLivelloCarta%>\" type=\"application/vnd.google-earth.kml+xml\" title=\"Click per aprire  <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%> in Google Earth\"><img class=\"img_leg\" src=\"<%=carta.get("imgCarta")%>\" alt=\"Miniatura di '<%=carta.get("titleCarta")%>'\" title=\"Click per aprire  <%=carta.get("testoLinkCarta").toString()%> in Google Earth [deve essere installato localmente]\"width=\"200\" height=\"110\"\/><\/a><\/div>");
				document.write("<div class=\"par_leg\"><%=carta.get("descCarta")%><\/div>");
				
				document.write("<div>");
					document.write("<ul>");
					// STAMPA IL LINK A GOOGLE EARTH
					document.write("<li class=\"violet\">apri <%=carta.get("articoloTestoLinkCarta").toString()%> <a href=\"ge/kml.jsp?liv=<%=codiceLivelloCarta%>\" type=\"application/vnd.google-earth.kml+xml\" title=\"Apre la carta <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%> in Google Earth [deve essere installato localmente]\"><%=carta.get("testoLinkCarta").toString()%><\/a> in Google Earth<\/li>");
					
					// STAMPA IL LINK AL PLUGIN
					document.write("<li class=\"violet\">apri <%=carta.get("articoloTestoLinkCarta").toString()%> <a href=\"ge_map.jsp?liv=<%=codiceLivelloCarta%>\" title=\"Apre la carta <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%> con il Plugin di Google Earth [deve essere installato localmente]\"><%=carta.get("testoLinkCarta").toString()%><\/a> con il Plugin di Google Earth<\/li>");
					

					// STAMPA IL LINK ALLA LEGENDA/NOTE ILLUSTRATIVE
					<% if(liv==5){
					%>		  
							document.write("<li class=\"green\">visualizza la legenda della <a href=\"legenda.jsp?liv=<%=codiceLivelloCarta%>\" title=\"Apre la legenda della  <%=carta.get("testoLinkCarta").toString()%>\"><%=carta.get("testoLinkCarta").toString()%><\/a><\/li>");
					
					<% } else if(liv==13 || liv==14 || liv==15 || liv==16 || liv==17){
					%>		  
							document.write("<li class=\"green\">visualizza la legenda della <a href=\"legenda_pgc.jsp?liv=<%=codiceLivelloCarta%>\" title=\"Apre la legenda della <%=carta.get("testoLinkCarta").toString()%>\"><%=carta.get("testoLinkCarta").toString()%><\/a><\/li>");

					<% } else if(liv==30){
					%>		  
							document.write("<li class=\"green\">visualizza la legenda della <a href=\"legenda_grpidr.jsp?liv=<%=codiceLivelloCarta%>\" title=\"Apre la legenda della <%=carta.get("testoLinkCarta").toString()%>\"><%=carta.get("testoLinkCarta").toString()%><\/a><\/li>");
					<% 
					%>

							
					<% } //else if(liv==6 || liv==7 || liv==8 || liv==9 || liv==10 || liv==11 || liv==12 || liv==18 || liv==19 || liv==20 || liv==30){ METTIAMO PER TUTTI ANCHE IL LINK ALLE NOTE ILLUSTRATIVE 
					%>		  
							document.write("<li class=\"green\">apri le note illustrative della <a href=\"/gstatico/documenti/dati_pedol/<%=carta.get("nomeNoteIllustrative").toString()%>\" rel=\"external\" title=\"Apre le note illustrative della <%=carta.get("testoLinkCarta").toString()%>\"> <%=carta.get("testoLinkCarta")%><\/a><\/li>");
					
					<% //} %>
					
					// STAMPA IL LINK AL METADATO
					document.write("<li class=\"orange\">visualizza i <a href=\"<%=carta.get("linkMetadato").toString()%>\" title=\"Visualizza i metadati <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%> \" rel=\"external\">metadati della <%=carta.get("testoLinkCarta").toString()%><\/a><\/li>");
		
					document.write("<\/ul>");
				document.write("<\/div>");
			document.write("<\/div>");
		document.write("<\/div> <!-- chiude carta_tematica_box -->");
		document.write("<div class=\"clear_both\"><\/div>");
		document.write("<p id=\"spazio_liv<%=livCarta%>\" class=\"<%=spazioApertoChiuso%>\"><\/p>");
		
<%	
		jj++;
	}
%>		
  document.write("<\/div> <!-- chiude content_macro_categoria -->");
<%
}
%>
/*]]>*/
</script>
<noscript>
<% 
//Iterator itrCat;
treeMapCatalogo = new TreeMap(catalogo);
itrCat = treeMapCatalogo.keySet().iterator();
while (itrCat.hasNext()) {

	Object keyCatalogo = itrCat.next();
	Object valueCatalogo = treeMapCatalogo.get(keyCatalogo);
	cartaCorrente=Integer.parseInt(keyCatalogo.toString())+1;

%>
	  <div class="content_macro_categoria">
	  <a name="tem<%=cartaCorrente%>" tabindex="<%=cartaCorrente%>"></a>
	  <h2><%=((Integer.parseInt(keyCatalogo.toString())+1)+".")%> <%=titoliMacro[Integer.parseInt(keyCatalogo.toString())]%></h2>
<%	  
	Iterator itrMacr;
	TreeMap treeMapMacro = new TreeMap((Hashtable)valueCatalogo);
	itrMacr = treeMapMacro.keySet().iterator();
	int jj=1;
	while (itrMacr.hasNext()) {
		Object livCarta = itrMacr.next();
		Object valueMacro = treeMapMacro.get(livCarta);
		TreeMap carta = new TreeMap((Hashtable)valueMacro);
		int liv=Integer.parseInt(livCarta.toString());
		cartaNovita="";
		long dataCarta=Long.parseLong(carta.get("dataCarta").toString());
		if(oggi-dataCarta<(giorniNovita*1000*3600*24))
			cartaNovita=immagineNovita;

		String classeApertoChiuso="cartaChiuso";
		String spazioApertoChiuso="spazio_chiuso";
		String classeApertoChiusoBox="carta_tematica_box";
		if(tem==cartaCorrente){
			classeApertoChiuso="cartaAperto";
			classeApertoChiusoBox="carta_tematica_box_aperto";
			spazioApertoChiuso="spazio_aperto";
		}	 	
%>
		<div id="box_liv<%=livCarta%>" class="<%=classeApertoChiusoBox%>">
			<a name="carta<%=livCarta%>"></a>
			<h3><%=((Integer.parseInt(keyCatalogo.toString())+1)+"."+jj)%> <%=carta.get("titleCarta").toString()%><%=cartaNovita%></h3>
			<div id="liv<%=livCarta%>" class="<%=classeApertoChiuso%>">
				
				<div class="posScalaCarta"><p><strong>Scala <%=carta.get("scalaCarta")%></strong></p></div>
				<div><img class="img_leg" src="<%=carta.get("imgCarta")%>" alt="<%=carta.get("titleCarta")%>" width="200" height="110"/></div>
				<div class="par_leg"><%=carta.get("descCarta").toString().replaceAll("\\\\/","/")%></div>
				<div>
					<ul>
					<!-- STAMPA IL LINK A GOOGLE EARTH -->
					<li class="violet">apri <%=carta.get("articoloTestoLinkCarta").toString()%> <a href="ge/kml.jsp?liv=<%=livCarta%>" type="application/vnd.google-earth.kml+xml" title="Apre la carta <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%> in Google Earth"><%=carta.get("testoLinkCarta").toString()%></a> in Google Earth</li>
					
					<!-- STAMPA IL LINK AL PLUGIN LO TOGLIAMO PERCHE' SENZA JAVASCRIPT ABILITATO IL PLUGIN NON VA -->
					<!-- <li class="violet">apri la carta <%=carta.get("articoloTestoLinkCarta").toString()%> <a href="ge_map.jsp?liv=<%=livCarta%>" title="Apre la carta <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%> con il Plugin di Google Earth"><%=carta.get("testoLinkCarta").toString()%> con il Plugin di Google Earth</a></li> -->

					<!-- STAMPA IL LINK ALLA LEGENDA/NOTE ILLUSTRATIVE -->
					<% if(liv==5){
					%>		  
							<li class="green">visualizza la legenda della carta <%=carta.get("articoloTestoLinkCarta").toString()%> <a href="legenda.jsp?liv=<%=livCarta%>" title="Apre la legenda della carta <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%>"><%=carta.get("testoLinkCarta").toString()%></a></li>
					<% } %>
					
					<% if(liv==13 || liv==14 || liv==15 || liv==16 || liv==17){
					%>		  
							<li class="green">visualizza la legenda della carta <%=carta.get("articoloTestoLinkCarta").toString()%> <a href="legenda_pgc.jsp?liv=<%=livCarta%>" title="Apre la legenda della carta <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%>"> <%=carta.get("titleCarta").toString()%></a></li>
					<% } %>
					
					<% if(liv==30){
					%>		  
							<li class="green">visualizza la legenda della carta <%=carta.get("articoloTestoLinkCarta").toString()%> <a href="legenda_grpidr.jsp?liv=<%=livCarta%>" title="Apre la legenda della carta <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%>"> <%=carta.get("titleCarta").toString()%></a></li>
					<% } %>	

					<!-- METTIAMO PER TUTTI ANCHE IL LINK ALLE NOTE ILLUSTRATIVE -->
							<li class="green">apri le note illustrative della carta <%=carta.get("articoloTestoLinkCarta").toString()%> <a href="/gstatico/documenti/dati_pedol/<%=carta.get("nomeNoteIllustrative").toString()%>" rel="external" title="Apre le note illustrative della carta <%=carta.get("articoloTestoLinkCarta").toString()%> <%=carta.get("testoLinkCarta").toString()%>"> <%=carta.get("testoLinkCarta")%></a></li>

					
					</ul>
				</div>
			</div>
		</div> <!-- chiude carta_tematica_box -->
		<div class="clear_both"></div>
		<p id="spazio_liv<%=livCarta%>" class="<%=spazioApertoChiuso%>"></p>		
<%			
		jj++;
	}
%>		
  </div> <!-- chiude content_macro_categoria -->
<%
}
%>

</noscript>

</div>

<script type="text/javascript">
	if(document.referrer.indexOf("legenda")>-1 || document.referrer.indexOf("ge_map")>-1)
		if(document.getElementById(document.referrer.split("?")[1].replace("=",""))){
			document.getElementById(document.referrer.split("?")[1].replace("=","")).className="cartaAperto";
			document.getElementById("box_"+document.referrer.split("?")[1].replace("=","")).className='carta_tematica_box_aperto';
			document.getElementById("spazio_"+document.referrer.split("?")[1].replace("=","")).className='spazio_aperto';
		}
	

</script>
<%@ include file="footer.htm"
%>

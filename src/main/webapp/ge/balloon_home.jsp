<% 
	String scala = "";
	String descUc = "";
	String titoloUc = "";
	
	int liv=0;
	if (request.getParameter("liv")!=null){ 
		if (!request.getParameter("liv").equals("")) {
			try {
				liv=Integer.parseInt(request.getParameter("liv"));
			} catch (NumberFormatException nfe) {
				// catch exception if liv isn't integer
			}
		}
	}
	
	if (request.getParameter("scala")!=null){ 
		if (!request.getParameter("scala").equals("")) {
				scala = request.getParameter("scala");
		}
	}

	switch (liv) {
		
		case 1:
			scala = "Livello di dettaglio 1:1.000.000";
			descUc = "I suoli";
			titoloUc = "Livello più generale della cartografia dei suoli emiliano-romagnoli. La carta dei suoli alla scala 1:1.000.000 è stata realizzata sintetizzando le informazioni provenienti dai rilevamenti effettuati per la Carta dei suoli dell'Emilia-Romagna in scala 1:250.000 (<strong>1994</strong>), con aggiornamenti successivi (2000). A questo livello di dettaglio vengono individuate e descritte 7 Unità cartografiche identificate da un numero (ad esempio Unità cartografica 3).";
		break;
		
		case 2:
			scala = "Livello di dettaglio 1:500.000";
		descUc = "I suoli";
		titoloUc = "I sette gruppi di suoli corrispondenti a grandi ambienti della regione, descritti nella carta alla scala 1:1.000.000, sono qui suddivisi in 27 sottogruppi (Unità Cartografiche), che entrano in maggiore dettaglio rispetto al rapporto suolo ambiente. Le 27 Unità cartografiche sono identificate da un numero seguito da una lettera maiuscola (ad esempio Unità cartografica 3A).";
		break;
		
		case 3:
			scala = "Livello di dettaglio 1:250.000";
			descUc = "I suoli";
			titoloUc = "In questa rappresentazione cartografica sono sintetizzate le informazioni sui suoli della Regione con un dettaglio informativo tale che ha permesso di distinguere 91 Unità Cartografiche, identificate da un numero seguito da una lettera maiuscola e una lettera minuscola (ad esempio Unità cartografica 3Aa)";
		break;
		
		case 4: 
			scala = "Livello di dettaglio 1:50.000";
			descUc = "I suoli";
			titoloUc = "	Livello di \"semi-dettaglio\" dei suoli della pianura e di parte della collina emiliano romagnola. La carta dei suoli alla scala 1:50.000 è stata realizzata utilizzando le informazioni provenienti dai rilevamenti effettuati dalla metà degli anni settanta fino al 2015. (ed. <strong>2015</strong>). La descrizione dei suoli è qui effettuata attraverso 396 diversi tipi di suolo (UTS: Unità Tipologiche di Suolo), distribuiti in 7209 delineazioni identificate da un codice numerico.";
		break;
	
		case 5:
			scala = "Livello di dettaglio 1:50.000";
			descUc = "Carta della capacità d’uso della pianura";
			titoloUc = "La carta di capacità d’uso è stata realizzata usando come base la carta dei suoli di pianura 1:50.000 ed. 2005. Si è utilizzato lo schema di valutazione SINA, 2000 e la classe con le relative limitazioni è stata assegnata per ciascuna delineazione sulla base delle percentuali dei suoli presenti.Non è stato preso in considerazione il rischio di deficit idrico, assumendo l’irrigazione disponibile su tutto il territorio di pianura.";
		break;
		
		case 6:
			scala = "Livello di dettaglio 1:50.000";
			descUc = "Carta del contenuto % di carbonio organico nei suoli di pianura tra 0-30 cm. 2a edizione";
			titoloUc = "La carta del contenuto percentuale di carbonio organico nei suoli di pianura è il risultato di elaborazioni statistiche e geostatistiche che, a partire da valori puntuali di carbonio organico, tengono conto della distribuzione dei suoli nel paesaggio e dell’influenza che la gestione agronomica esercita sull’accumulo della materia organica.<br />La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 500 m. Ad ogni cella è attribuito un valore percentuale stimato di carbonio organico e la valutazione di attendibilità del valore stimato.";
		break;
		
		case 7:
			scala = "Livello di dettaglio 1:250.000";
			descUc = "Carta del contenuto % di carbonio organico nei suoli dell’Appennino emiliano-romagnolo tra 0-30 cm";
			titoloUc = "La carta del contenuto percentuale di carbonio organico dei suoli dell’Appennino, è il risultato di un’elaborazione che spazializza il dato relativo al contenuto di carbonio organico tipico di ciascun tipo di suolo o gruppo di suoli attraverso l’uso della carta dei suoli in scala1:250.000.La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 1Km e fornisce il valore percentuale di carbonio organico attribuito alla cella con riferimento ai primi 30 cm di suolo.";
		break;

		case 8:
			scala = "Livello di dettaglio 1:50.000";
			descUc = "Carta del contenuto % di argilla nei suoli di pianura tra 0-30 cm";
			titoloUc = "La carta del contenuto percentuale di argilla nei suoli della pianura emiliano-romagnola, è il risultato di una elaborazione geostatistica che, a partire da valori puntuali di argilla, tiene conto della distribuzione dei suoli a cui questi valori si riferiscono. La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 1Km e fornisce il valore percentuale medio attribuito alla cella dall’analisi geostatistica.";
		break;

		case 9:
			scala = "Livello di dettaglio 1:50.000";
			descUc = "Carta del carbonio organico immagazzinato nei suoli di pianura tra 0-30 cm. 2a edizione";
			titoloUc = "La carta del carbonio organico immagazzinato nei suoli di pianura è il risultato di elaborazioni statistiche e geostatistiche che, a partire da valori puntuali di carbonio organico percentuale, tessitura e scheletro, tengono conto della distribuzione dei suoli nel paesaggio e del contributo nullo delle superfici considerate prive di suolo.<br />La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 500 m. Ad ogni cella è attribuito un valore stimato del contenuto di carbonio organico espresso in Mg*ha-1 nei primi 30 cm di suolo. Vengono anche forniti i valori stimati di densità apparente, carbonio organico, scheletro e percentuale di aree prive di suolo.";
		break;

		case 10:
			scala = "Livello di dettaglio 1:250.000";
			descUc = "Carta del carbonio organico immagazzinato nei suoli dell’Appennino emiliano-romagnolo tra 0-30 cm";
			titoloUc = "La carta del carbonio organico immagazzinato nei suoli dell’Appennino è il risultato di un’elaborazione che a partire dalla Carta dei suoli della Regione Emilia-Romagna in scala 1:250.000, spazializza il dato relativo al contenuto di carbonio organico tipico di ciascun tipo di suolo o gruppo di suoli.La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 1Km; fornisce il valore medio del contenuto di carbonio organico espresso in Mg*ha-1 immagazzinato nei primi 30 cm di suolo compresi gli orizzonti organici di superficie nel caso dei suoli forestali, considerando anche il contributo nullo delle superfici considerate prive di suolo. ";
		break;

		case 11:
			scala = "Livello di dettaglio 1:50.000";
			descUc = "Carta del carbonio organico immagazzinato nei suoli di pianura tra 0-100 cm";
			titoloUc = "La carta del carbonio organico immagazzinato nei suoli di pianura è il risultato di una elaborazione geostatistica che a partire da valori puntuali di carbonio organico, tessitura e scheletro tiene conto della distribuzione dei diversi tipi di suolo, a cui questi valori si riferiscono, in ragione anche dei diversi distretti agricoli regionali e quindi dei diversi usi del suolo e ordinamenti colturali che caratterizzano ciascun distretto. La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 1Km; fornisce il valore medio del contenuto di carbonio organico espresso in Mg*ha-1 immagazzinato nei primi 100 cm di suolo considerando anche il contributo nullo delle superfici considerate prive di suolo.";
		break;

		case 12:
			scala = "Livello di dettaglio 1:250.000";
			descUc = "Carta del carbonio organico immagazzinato nei suoli dell’Appennino emiliano-romagnolo tra 0-100 cm";
			titoloUc = "La carta del carbonio organico immagazzinato nei suoli dell’Appennino è il risultato di un’elaborazione che a partire dalla Carta dei suoli della Regione Emilia-Romagna in scala 1:250.000, spazializza il dato relativo al contenuto di carbonio organico tipico di ciascun tipo di suolo o gruppo di suoli.La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 1Km; fornisce il valore medio del contenuto di carbonio organico espresso in Mg*ha-1 immagazzinato nei primi 100 cm di suolo compresi gli orizzonti organici di superficie nel caso dei suoli forestali, considerando anche il contributo nullo delle superfici considerate prive di suolo.";
		break;

		case 13:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale del Cromo [Cr] della pianura emiliano-romagnola. 2a edizione";
			titoloUc = "Rappresenta la distribuzione areale del contenuto naturale di Cromo nei suoli ad uso agricolo a circa un metro di profondità; tale profondità è ritenuta rappresentativa del contenuto naturale (<i>pedo-geochemical content</i> secondo la norma ISO/DIS 19258, 2005) in quanto non influenzata da contributo antropico. I valori di concentrazione, espressi in mg/kg, sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale dei metalli.";
		break;

		case 14:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale del Nichel [Ni] della pianura emiliano-romagnola. 2a edizione";
			titoloUc = "Rappresenta la distribuzione areale del contenuto naturale di Nichel nei suoli ad uso agricolo a circa un metro di profondità; tale profondità è ritenuta rappresentativa del contenuto naturale (<i>pedo-geochemical content</i> secondo la norma ISO/DIS 19258, 2005) in quanto non influenzata da contributo antropico. I valori di concentrazione, espressi in mg/kg, sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale dei metalli.";
		break;

		case 15:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale del Piombo [Pb] della pianura emiliano-romagnola. 2a edizione";
			titoloUc = "Rappresenta la distribuzione areale del contenuto naturale di Piombo nei suoli ad uso agricolo a circa un metro di profondità; tale profondità è ritenuta rappresentativa del contenuto naturale (<i>pedo-geochemical content</i> secondo la norma ISO/DIS 19258, 2005) in quanto non influenzata da contributo antropico. I valori di concentrazione, espressi in mg/kg, sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale dei metalli.";
		break;

		case 16:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale del Rame [Cu] della pianura emiliano-romagnola. 2a edizione";
			titoloUc = "Rappresenta la distribuzione areale del contenuto naturale di Rame nei suoli ad uso agricolo a circa un metro di profondità; tale profondità è ritenuta rappresentativa del contenuto naturale (<i>pedo-geochemical content</i> secondo la norma ISO/DIS 19258, 2005) in quanto non influenzata da contributo antropico. I valori di concentrazione, espressi in mg/kg, sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale dei metalli.";
		break;

		case 17:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale dello Zinco [Zn] della pianura emiliano-romagnola. 2a edizione";
			titoloUc = "Rappresenta la distribuzione areale del contenuto naturale di Zinco nei suoli ad uso agricolo a circa un metro di profondità; tale profondità è ritenuta rappresentativa del contenuto naturale (<i>pedo-geochemical content</i> secondo la norma ISO/DIS 19258, 2005) in quanto non influenzata da contributo antropico. I valori di concentrazione, espressi in mg/kg, sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale dei metalli.";
		break;

		case 18:
			scala = "Scala 1:50.000";
			descUc = "Carta della dotazione in sostanza organica dei suoli di pianura tra 0-30 cm . 2a edizione";
			titoloUc = "La carta della dotazione in sostanza organica descrive qualitativamente il contenuto di sostanza organica nei primi 30 cm di suolo in funzione della classe tessiturale del suolo stesso, secondo lo schema di valutazione contenuto nei Disciplinari di Produzione Integrata (2015) della Regione Emilia-Romagna.<br />La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 500 m. Ad ogni cella è attribuita la classe di dotazione di sostanza organica.";
		break;

		case 19:
			scala = "Scala 1:250.000";
			descUc = "Carta della salinità nei suoli di pianura tra 0-50 cm. Seconda approssimazione";
			titoloUc = "La carta della salinità è il risultato di elaborazioni statistiche e geostatistiche a partire da dati puntuali elaborati per Unità pedo-ambientali definite sulla carta dei suoli di pianura a scala 1:50.000.<br />La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 500 m. Ad ogni cella è attribuito il contenuto stimato in sali espresso come conducibilità elettrica dell’estratto in pasta satura (ECe) in dSm<sup>-1</sup>, la classe di salinità e la valutazione di attendibilità del valore stimato.";
		break;

		case 20:
			scala = "Scala 1:250.000";
			descUc = "Carta della salinità nei suoli di pianura tra 50-100 cm. Prima approssimazione";
			titoloUc = "La carta della salinità indica il contenuto in sali dei suoli espresso come Conducibilità Elettrica dell’estratto in pasta satura, ECe, in dSm<sup>-1</sup>. Il dato deriva da stima geostatistica a partire da dati puntuali elaborati per Unità pedo-ambientali, definite attraverso la carta dei suoli di pianura a scala 1:50.000, e per distretti agricoli. La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 1Km.<br />I valori forniti sono: classe di salinità; valore di conducibilità elettrica (ECe in dSm<sup>-1</sup>) stimato; attendibilità della stima, ovvero il grado di affidabilità del valore fornito, informazione questa molto importante per una corretta interpretazione della carta.";
		break;

		case 21:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale-antropico del Cromo [Cr] della pianura emiliano-romagnola";
			titoloUc = "La “Carta del Fondo naturale-antropico del Cromo della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Cromo nel <i>topsoil</i> (20-30 cm di profondità) nei suoli ad uso agricolo. <br />I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.";
		break;

		case 22:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale-antropico del Nichel [Ni] della pianura emiliano-romagnola";
			titoloUc = "La “Carta del Fondo naturale-antropico del Nichel della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Nichel nel <i>topsoil</i> (20-30 cm di profondità) nei suoli ad uso agricolo. <br />I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.";
		break;

		case 23:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale-antropico del Piombo [Pb] della pianura emiliano-romagnola";
			titoloUc = "La “Carta del Fondo naturale-antropico della Pianura Emiliano-Romagnola del Piombo in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Piombo nel <i>topsoil</i> (20-30 cm di profondità) nei suoli ad uso agricolo.<br /> I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.";
		break;

		case 24:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale-antropico del Rame [Cu] della pianura emiliano-romagnola";
			titoloUc = "La “Carta del Contenuto naturale-antropico del Rame della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Rame nel <i>topsoil</i> (20-30 cm di profondità) nei suoli ad uso agricolo.<br />I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.";
		break;
		

		case 25:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale-antropico dello Zinco [Zn] della pianura emiliano-romagnola";
			titoloUc = "La “Carta del Fondo naturale-antropico  dello Zinco della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Zinco nel <i>topsoil</i> (20-30 cm di profondità) nei suoli ad uso agricolo.<br />I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.";
		break;
		
		case 26:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale-antropico dello Stagno [Sn] della pianura emiliano-romagnola";
			titoloUc = "La “Carta del Fondo naturale-antropico dello Stagno della Pianura Emiliano-Romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di Stagno nel <i>topsoil</i> (20-30 cm di profondità) nei suoli ad uso agricolo.<br />I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.";
		break;
		case 27:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale-antropico dell'Arsenico [As] della pianura emiliano-romagnola";
			titoloUc = "La “Carta del Fondo naturale-antropico dell’Arsenico della pianura emiliano-romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di  Arsenico nel <i>topsoil</i>  (20-30 cm di profondità) dei suoli ad uso agricolo.<br />I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli della pianura emiliano-romagnola sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica;  5) uso del suolo.";
		break;		
		case 28:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale-antropico del Vanadio [V] della pianura emiliano-romagnola";
			titoloUc = "La “Carta del fondo naturale-antropico del Vanadio della pianura emiliano-romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto di  Vanadio nel <i>topsoil</i>  (20-30 cm di profondità) dei suoli ad uso agricolo.<br />I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica; 5) uso del suolo.";
		break;
		case 29:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale-antropico di As, Cr, Cu, Ni, Pb, Sn, V, Zn della pianura emiliano-romagnola";
			titoloUc = "La “Carta del fondo naturale-antropico di As, Cr, Cu, Ni, Pb, Sn, V, Zn della pianura emiliano-romagnola in scala 1:250.000” rappresenta la distribuzione areale del contenuto dei metalli nel <i>topsoil</i>  (20-30 cm di profondità) dei suoli ad uso agricolo.<br />I fattori che determinano il contenuto naturale-antropico dei metalli degli orizzonti superficiali dei suoli sono i seguenti: 1) provenienza del parent material; 2) tessitura; 3) grado evolutivo; 4) contenuto di sostanza organica; 5) uso del suolo.";
		break;

		case 30:
			scala = "Scala 1:50.000";
			descUc = "Carta dei Gruppi Idrologici dei suoli della pianura emiliano-romagnola";
			titoloUc = "La carta descrive la distribuzione areale dei gruppi idrologici nei poligoni della carta dei suoli di pianura in scala 1:50.000. Ogni poligono è descritto dalla percentuale di diffusione dei gruppi idrologici in esso presenti. La metodologia prevede quattro gruppi principali in funzione della conducibilità idrica a saturazione del suolo: A, B, C e D a deflusso superficiale potenziale crescente. La presenza temporanea di una falda entro 60 cm determina l'appartenenza a gruppi duali A/D, B/D, C/D.<br />La legenda indica il Gruppo Idrologico prevalente nel poligono. Nel caso di coesistenza di due gruppi prevalenti, le lettere sono separate dal \"trattino\", es. A-D.";
		break;
		case 31:
			scala = "Scala 1:50.000";
			descUc = "Carta della tessitura dei suoli della pianura tra 0-30 cm";
			titoloUc = "La carta della tessitura dei suoli di pianura è il risultato di elaborazioni statistiche e geostatistiche che, a partire da valori puntuali di granulometria, tengono conto della distribuzione dei suoli nel paesaggio e l’appartenenza a diversi bacini idrografici.<br />La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 500 m. Ad ogni cella è attribuito un valore % di sabbia, limo, argilla, scheletro e la classe tessiturale USDA. Ogni parametro è accompagnato da una valutazione di attendibilità del valore stimato.";
		break;
		case 32:
			scala = "Scala 1:50.000";
			descUc = "Carta della Conducibilità idraulica satura (Ksat) dei suoli di pianura";
			titoloUc = "La carta descrive la distribuzione areale della Conducibilità idraulica satura (Ksat) secondo le classi del <em>Soil Survey Manual</em>, 1993 e in riferimento ai poligoni della carta dei suoli di pianura in scala 1:50.000. Per ogni poligono è stato calcolato il valore medio ponderato di <strong>Ksat</strong> sulla base della percentuale di diffusione dei suoli in esso presenti. Tale valore è stato poi classato ai fini della rappresentazione. Viene indicata anche la valutazione di attendibilità del valore stimato.";
		break;
		case 33:
			scala = "Scala 1:25.000";
			descUc = "Carta delle Superfici impermeabilizzate di pianura";
			titoloUc = "La carta superfici impermeabilizzate della pianura è stata costruita partendo dal Data Base Topografico  della Regione Emilia Romagna, attribuendo ad ogni oggetto cartografato un valore di impermeabilizzazione classato.<br />La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 10 m. All’interno delle celle possono essere presenti più oggetti, come ad esempio una strada e parte di un prato, il valore di impermeabilità attribuito della cella sarà quello dell’oggetto arealmente più esteso al suo interno. <br />Ad ogni cella sono associate le informazioni relative al comune di appartenenza (Area del comune; Area del comune che ricade in pianura; Percentuale aree permeabili antropizzate o corpi idrici; Percentuale aree con una impermeabilità del 25%; Percentuale aree con una impermeabilità del 50%; Percentuale aree con una impermeabilità del 75%; Percentuale aree con una impermeabilità del 90%; Percentuale aree completamente impermeabili.)";
		break;
		case 34:
			scala = "Livello di dettaglio 1:50.000";
			descUc = "Carta del contenuto % di carbonio organico nei suoli di pianura tra 0-100 cm.";
			titoloUc = "La carta del contenuto percentuale di carbonio organico nei suoli di pianura è il risultato di elaborazioni statistiche e geostatistiche che, a partire da valori puntuali di carbonio organico, tengono conto della distribuzione dei suoli nel paesaggio e dell’influenza che la gestione agronomica esercita sull’accumulo della materia organica.<br />La carta è rappresentata attraverso una struttura a maglia costituita da celle con lato di 500 m. Ad ogni cella è attribuito un valore percentuale stimato di carbonio organico e la valutazione di attendibilità del valore stimato.";
		break;
		case 35:
			scala = "Scala 1:250.000";
			descUc = "Carta del Fondo naturale del Vanadio [V] della pianura emiliano-romagnola";
			titoloUc = "Rappresenta la distribuzione areale del contenuto naturale di Vanadio nei suoli ad uso agricolo a circa un metro di profondità; tale profondità è ritenuta rappresentativa del contenuto naturale (<i>pedo-geochemical content</i> secondo la norma ISO/DIS 19258, 2005) in quanto non influenzata da contributo antropico. I valori di concentrazione, espressi in mg/kg, sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X) al fine di determinare il contenuto totale dei metalli.";
		break;                
	}
%>
<%@ include file="head_balloon.jsp"
%><%@ include file="testata_balloon.htm"
%>
<%	
if (liv > 0 && liv <=35) {
%>
    <p class="scala"><%=scala%></p><br />
  <div class="uc">
     <%=descUc%>
  </div>
  <div class="titolo_uc_bal"><%=titoloUc%>
  <br />
  </div>
  <div class="uc">
     Come si naviga nella Carta dei Suoli
  </div>
  <div class="titolo_uc_bal">
    <p>Per la navigazione nella carta utilizzare i normali strumenti di Google Earth.<br />Per visualizzare le informazioni associate ad un elemento cartografico, avvicinare la mappa (con la rotellina del mouse) e quando il puntatore è una freccia fare un click all'interno di un poligono.</p>
	
	<div class="link_dettaglio">
		Per ulteriori informazioni consultare la <a href="/gstatico/documenti/cartpedo/guida/guidautente.pdf" title="Apri la Guida alla navigazione" rel="external">guida alla navigazione</a>
	</div>


	<p class="center"><strong>Buona visita !</strong></p>
  </div>
<%
} else {
%>
	<p>Per visualizzare correttamente la Carta dei Suoli è necessario aver selezionato un livello di dettaglio corretto.</p>
	<p class="center"><a title="Torna alla pagina principale" href="../index.jsp">Torna alla Home Page</a></p>
<%
}
%>  
<%@ include file="footer_balloon.htm"
%>


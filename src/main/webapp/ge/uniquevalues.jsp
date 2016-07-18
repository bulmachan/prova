<%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%>
  
<%
int alphaLine=255;
int redLine=255;
int greenLine=0;
int blueLine=0;

int alphaPoly=190;

String tempVar;
String layer, scala;

tempVar = request.getParameter("layer");
if (tempVar == null || tempVar.equals(""))
	throw new Exception("Missing LAYER argument");
else 
	layer=tempVar;


//tempVar = request.getParameter("scala");
//if (tempVar == null || tempVar.equals(""))
//	throw new Exception("Missing SCALA argument");
//else 
//	scala=tempVar;

//try { // accesso al DB
	
	String textXml="";
	
	
	String pathXml = application.getRealPath("ge/styles/"+layer.toLowerCase()+"_nuovo.kml");
	
	String sqlString = "";	
	//String sqlString = "select distinct id_unita, color from "+layer+" order by id_unita";
	
	//sqlString="select distinct etichetta as classe, '' as colore from ped_user.ped_vf_suoli50_ge_pol order by etichetta";

	//sqlString="select distinct id_comune as classe, '' as colore from ped_user.ped_vf_imperm_comuni_ge_pol order by id_comune";
	
	//if (scala=="500")
		//sqlString="select distinct "+layer+".etichetta, colore from "+layer+", ped_sottosistemi where "+layer+".id_sottosistema=ped_sottosistemi.id_sottosistema order by "+layer+".etichetta";

		//sqlString="select distinct "+layer+".etichetta, colore from "+layer+", ped_sistemi where "+layer+".id_sistema=ped_sistemi.id_sistema order by "+layer+".etichetta";

		
		//sqlString="select distinct "+layer+".etichetta, colore from "+layer+", ped_province where "+layer+".id_provincia=ped_province.id_provincia order by "+layer+".etichetta";
		
		//capacitauso
		//sqlString="select distinct "+layer+".classe, colore from ped_user."+layer+", ped_user.PED_LEGENDE_GE_PEDOCHIMICHE where "+layer+".classe=PED_LEGENDE_GE_PEDOCHIMICHE.id and liv="+request.getParameter("liv")+" order by "+layer+".classe";

		sqlString="select id as classe,colore from ped_user.PED_LEGENDE_GE_PEDOCHIMICHE where liv="+request.getParameter("liv")+" order by id";

		// livello SO:
		//sqlString="select ID_LIVELLO_SO as classe, colore from ped_user.ped_t_livello_so where ordine > 0 order by ordine";
		
		// salinita:
		/*	sqlString="SELECT classe, " +
			"  colore, " +
			"  descrizione " +
			"FROM " +
			"  (SELECT " +
			"    CASE " +
			"      WHEN PED_SALINITA.ECE > 0 " +
			"      AND PED_SALINITA.ECE  < 2 " +
			"      THEN 'Non salino' " +
			"      WHEN PED_SALINITA.ECE >= 2 " +
			"      AND PED_SALINITA.ECE   < 4 " +
			"      THEN 'Molto debolmente salino' " +
			"      WHEN PED_SALINITA.ECE >= 4 " +
			"      AND PED_SALINITA.ECE   < 8 " +
			"      THEN 'Debolmente salino' " +
			"      WHEN PED_SALINITA.ECE >= 8 " +
			"      AND PED_SALINITA.ECE   < 16 " +
			"      THEN 'Moderatamente salino' " +
			"      WHEN PED_SALINITA.ECE >= 16 " +
			"      THEN 'Fortemente salino' " +
			"      ELSE NULL " +
			"    END AS classe, " +
			"    CASE " +
			"      WHEN PED_SALINITA.ECE > 0 " +
			"      AND PED_SALINITA.ECE  < 2 " +
			"      THEN '209,255,115' " +
			"      WHEN PED_SALINITA.ECE >= 2 " +
			"      AND PED_SALINITA.ECE   < 4 " +
			"      THEN '145,222,89' " +
			"      WHEN PED_SALINITA.ECE >= 4 " +
			"      AND PED_SALINITA.ECE   < 8 " +
			"      THEN '223,115,255' " +
			"      WHEN PED_SALINITA.ECE >= 8 " +
			"      AND PED_SALINITA.ECE   < 16 " +
			"      THEN '169,0,230' " +
			"      WHEN PED_SALINITA.ECE >= 16 " +
			"      THEN '97,61,191' " +
			"      ELSE NULL " +
			"    END AS colore, " +
			"    CASE " +
			"      WHEN PED_SALINITA.ECE > 0 " +
			"      AND PED_SALINITA.ECE  < 2 " +
			"      THEN '<=2' " +
			"      WHEN PED_SALINITA.ECE >= 2 " +
			"      AND PED_SALINITA.ECE   < 4 " +
			"      THEN '2-4' " +
			"      WHEN PED_SALINITA.ECE >= 4 " +
			"      AND PED_SALINITA.ECE   < 8 " +
			"      THEN '4-8' " +
			"      WHEN PED_SALINITA.ECE >= 8 " +
			"      AND PED_SALINITA.ECE   < 16 " +
			"      THEN '8-16' " +
			"      WHEN PED_SALINITA.ECE >= 16 " +
			"      THEN '>16' " +
			"      ELSE NULL " +
			"    END              AS descrizione, " +
			"    PED_SALINITA.ECE AS ece " +
			"  FROM PED_USER.PED_SALINITA, " +
			"    PED_USER.PED_F_GRIGLIA1KM_POL " +
			"  WHERE PED_F_GRIGLIA1KM_POL.GISID = PED_SALINITA.GISID AND PED_SALINITA.ECE > 0 AND PED_SALINITA.DA=51 AND PED_SALINITA.A=100  " +
			"  ) " +
			"GROUP BY classe, " +
			"  colore, " +
			"  descrizione " +
			"ORDER BY MIN(ece)";	*/
			
			
            //sqlString="select colore, sigla as classe from ped_user.ped_t_param_suolo order by id asc nulls last,sigla";

            //sqlString="select colore, id as classe from ped_user.ped_legende_ge_proprieta_cf where liv=6 order by id";
            //sqlString="select colore, id as classe from ped_user.ped_legende_ge_proprieta_cf where liv=34 order by id";

            //sqlString="select colore, id as classe from ped_user.ped_legende_ge_proprieta_cf where liv=32 order by id";
			
	out.println("CONNESSIONE AL DB: "+dbConn.getMetaData().getURL() );		
	out.println(sqlString);
	ResultSet rs = null;
	Statement stm = dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

	rs = stm.executeQuery(sqlString);
	
	textXml+="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\n";
	textXml+="<kml xmlns=\"http://earth.google.com/kml/2.2\">"+"\n";
	textXml+="\t<Document>"+"\n";


	String aL = Integer.toHexString(alphaLine).toUpperCase();
	if(aL.length()==1)
		aL="0"+aL;
	
	String rL = Integer.toHexString(redLine).toUpperCase();
	if(rL.length()==1)
		rL="0"+rL;

	String gL = Integer.toHexString(greenLine).toUpperCase();
	if(gL.length()==1)
		gL="0"+gL;

	String bL = Integer.toHexString(blueLine).toUpperCase();
	if(bL.length()==1)
		bL="0"+bL;

	String aP = Integer.toHexString(alphaPoly).toUpperCase();
	if(aP.length()==1)
		aP="0"+aP;
	
	Random randomNum = new Random();
	String r,g,b;
	while (rs.next()) {

		
		if (rs.getString("colore")!=null){
			if(!rs.getString("colore").equals("")){
				String[] rgbColors=rs.getString("colore").split(",");
				r=Integer.toHexString(Integer.parseInt(rgbColors[0].trim())).toUpperCase();
				g=Integer.toHexString(Integer.parseInt(rgbColors[1].trim())).toUpperCase();
				b=Integer.toHexString(Integer.parseInt(rgbColors[2].trim())).toUpperCase();
			} else {
		
				r = Integer.toHexString(randomNum.nextInt(255)).toUpperCase();
				g = Integer.toHexString(randomNum.nextInt(127)).toUpperCase();
				b = Integer.toHexString(randomNum.nextInt(127)).toUpperCase();
		
			}

		} else {
		
			r = Integer.toHexString(randomNum.nextInt(255)).toUpperCase();
			g = Integer.toHexString(randomNum.nextInt(127)).toUpperCase();
			b = Integer.toHexString(randomNum.nextInt(127)).toUpperCase();
		
		}
		String color=randomNum.nextInt(255)+","+randomNum.nextInt(127)+","+randomNum.nextInt(127);

		if(r.length()==1)
			r="0"+r;
		if(g.length()==1)
			g="0"+g;
		if(b.length()==1)
			b="0"+b;
		
		textXml+="\t\t<Style id=\""+rs.getString("classe")+"\">"+"\n";
		textXml+="\t\t\t<LineStyle>"+"\n";
		textXml+="\t\t\t\t<color>"+ aL + bL + gL + rL +"</color>"+"\n";
		textXml+="\t\t\t\t<width>0</width>"+"\n";
		textXml+="\t\t\t</LineStyle>"+"\n";
		textXml+="\t\t\t<PolyStyle>"+"\n";
		textXml+="\t\t\t\t<color>"+ aP + b + g + r + "</color>"+"\n";
		textXml+="\t\t\t</PolyStyle>"+"\n";
		textXml+="\t\t\t<BalloonStyle>"+"\n";
		textXml+="\t\t\t\t<text>$[description]</text>"+"\n";
		textXml+="\t\t\t\t<bgColor>ffB1CBE3</bgColor>"+"\n";
		textXml+="\t\t\t</BalloonStyle>"+"\n";
		textXml+="\t\t</Style>"+"\n";
		
		
		//textXml+="update ped_unita set color='"+color+"' where id_unita='"+rs.getString("id_unita")+"' and scala='"+scala+"';"+"\n";
		
	}

	
	textXml+="\t</Document>"+"\n";
	textXml+="</kml>";

	
	rs.close();
	stm.close();
	
	dbConn.close();

	PrintWriter pw = new PrintWriter(new FileWriter(new File(pathXml), false));
	pw.println(textXml);
	pw.close();
	out.println(pathXml);
	out.println("file salvato: "+"styles/"+layer.toLowerCase()+"_nuovo.kml");
	
//} catch(Exception e) { // accesso al DB
//	out.println("db: FAIL ("+e.getMessage()+");");
//}	




%>
<%
//key=ABQIAAAA-Hm1XQFSsC6C7BnH5y1Z1RTmhrm0U29VSJkVr6FvK--PdvWSWhTq1Vsm3VZmtyOQ4li4qIWURLz_3A
String key = "";

String keySviluppo="ABQIAAAA-Hm1XQFSsC6C7BnH5y1Z1RQOY8Kqy5LNDuVJrMzHdfknwJeVaRTZBL4eQn_bQ8gHa6sPKBh1QoJ-6g";
String ipSviluppo = "10.10.80.193";

String keyTest="ABQIAAAA-Hm1XQFSsC6C7BnH5y1Z1RSYzbZuI757j2wJGA5W6X-mJpMBhhRnwu6Ao4Rl8gAFprLymiWSNABzgw";
String ipTest = "10.10.80.125";

String keyProd="ABQIAAAAdGTgyYWYUVT6qOWuopcz4BTdJxEouNukbXTaT-3IyULz5o62QhQnmHRHP02cOOPz8Ec6p9dmmLp-bg";
String ipProd = "geo.regione.emilia-romagna.it";

//String ip = request.getLocalAddr().toString();
if (ip.equals(ipSviluppo))  {
	key = keySviluppo;
} else {
	if (ip.equals(ipTest))  {
		key = keyTest;
	} else {
		if (ip.equals(ipProd))  {
			key = keyProd;
		}
	}
}

%>
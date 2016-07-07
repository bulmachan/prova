<%@ include file="params.jsp"
%><%
int liv=1;
if (request.getParameter("liv")!=null){ 
	if (!request.getParameter("liv").equals("")) {
		try {
			liv=Integer.parseInt(request.getParameter("liv"));
		} catch (NumberFormatException nfe) {
			// catch exception if liv isn't integer
		}
	}
}
%>

	google.load("earth", "1");
	var ge = null;
	function init() {  
		google.earth.createInstance("map3d", initCallback, failureCallback);
	}
	function initCallback(pluginInstance) {  
		ge = pluginInstance;  
		ge.getWindow().setVisibility(true);	// required!
		
		// add a navigation control
		ge.getNavigationControl().setVisibility(ge.VISIBILITY_AUTO);
		ge.getOptions().setStatusBarVisibility(true);
		ge.getOptions().setScaleLegendVisibility(true);
		ge.getOptions().setFlyToSpeed(0.2);
		// add some layers
		ge.getLayerRoot().enableLayerById(ge.LAYER_BORDERS, true);
		//ge.getLayerRoot().enableLayerById(ge.LAYER_ROADS, true);

		createNetworkLink();
	}
	
	function failureCallback(errorCode) {
		alert("Failure loading the Google Earth Plugin: " + errorCode);
	}
	
	function createNetworkLink() {
	
		var networkLink = ge.createNetworkLink("");
		networkLink.setDescription("NetworkLink open to fetched content");
		networkLink.setName("Open NetworkLink");
		networkLink.setFlyToView(true);  

		// create a Link object
		var link = ge.createLink("");
		link.setHref('<%=path+"ge/kml.jsp?liv="+liv%>&client=plugin');

		// attach the Link to the NetworkLink
		networkLink.setLink(link);

		// add the NetworkLink feature to Earth
		ge.getFeatures().appendChild(networkLink);
		
		//var kmlObject = ge.parseKml(networkLink.getKml());
		google.earth.fetchKml(ge, '<%=path+"ge/kml.jsp?liv="+liv%>&client=plugin', kmlFinishedLoading);                 
		
		// funzione per far funzionare il balloon:
		google.earth.addEventListener(ge.getGlobe(), 'mousedown', function(event) {
			dragUser=false;
		});
		google.earth.addEventListener(ge.getGlobe(), 'mousemove', function(event) {
			dragUser=true;
		});
	  
		google.earth.addEventListener(networkLink, 'mouseup', function(event) {
			if (!dragUser) { 
				// prevent the default balloon from popping up
				event.preventDefault();

				var currentPlaceMark=event.getTarget();
				var balloon = ge.createHtmlStringBalloon('');
				balloon.setFeature(currentPlaceMark); // optional

				ge.parseKml(currentPlaceMark.getKml());

				//balloon.setMaxWidth(400);
				balloon.setBackgroundColor("#E3CBB1");
				balloon.setContentString(currentPlaceMark.getDescription());

				ge.setBalloon(balloon);
			}
		});

	    document.getElementById('installed-plugin-version').innerHTML=ge.getPluginVersion().toString();

	}
	function kmlFinishedLoading(kmlObject) {  
		if (kmlObject) {
			// check if the object is a KmlContainer (folder or document)
			if ('getFeatures' in kmlObject) { 
				var childNodes = kmlObject.getFeatures().getChildNodes(); 
				if (childNodes !== null) { 
					var numNodes = childNodes.getLength()-1; 
					var childNode; 
					for (var x = 0; x<=numNodes; x++) { 
						childNode = childNodes.item(x);
						
						var balloon = ge.createHtmlStringBalloon('');
						balloon.setBackgroundColor("#E3CBB1");
						balloon.setContentString(childNode.getDescription());

						ge.setBalloon(balloon);

					} 

				}
			}
		}
	}
	

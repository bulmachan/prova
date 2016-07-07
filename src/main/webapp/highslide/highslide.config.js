/**
*	Site-specific configuration settings for Highslide JS
*/
hs.graphicsDir = 'highslide/graphics/';
hs.showCredits = false;
hs.outlineType = null;

hs.marginTop = -115;
hs.marginRight = 0;
hs.marginBottom = 0;
hs.marginLeft = 0;

hs.align = 'center';
hs.allowSizeReduction = true;
hs.maxWidth = 772;

hs.fullExpandButton = false;
hs.enableDrag = false;

// Italian language strings
hs.lang = {
	cssDirection: 'ltr',
	loadingText: 'Caricamento in corso',
	loadingTitle: 'Fare clic per annullare',
	focusTitle: 'Fare clic per portare in avanti',
	fullExpandTitle: 'Visualizza dimensioni originali',
	creditsText: 'Powered by <i>Highslide JS</i>',
	creditsTitle: 'Vai al sito Web di Highslide JS',
	previousText: 'Precedente',
	nextText: 'Successiva',
	moveText: 'Sposta',
	closeText: 'Chiudi',
	closeTitle: 'Chiudi (Esc)',
	resizeTitle: 'Ridimensiona',
	playText: 'Play',
	playTitle: 'Play slideshow (Barra spaziatrice)',
	pauseText: 'Pausa',
	pauseTitle: 'Pausa slideshow (Barra spaziatrice)',
	previousTitle: 'Precedente (Freccia sinistra)',
	nextTitle: 'Successiva (Freccia destra)',
	moveTitle: 'Sposta',
	fullExpandText: 'Dimensione massima',
	number: 'Immagine %1 di %2',
	restoreTitle: 'Fare clic per chiudere l\'immagine (Esc). Usa le frecce per andare avanti e indietro.'
};

if (hs.addEventListener && hs.Outline) hs.addEventListener(window, 'load', function () {
	new hs.Outline('rounded-white');
	new hs.Outline('glossy-dark');
});

var galleryOptions = {
	slideshowGroup: 'gallery',
	dimmingOpacity: 0.75,
	align: 'center',
	transitions: ['expand', 'crossfade'],
	fadeInOut: true,
	wrapperClassName: 'borderless floating-caption no-move no-full-expand',
	numberPosition: 'caption'
};

if (hs.addSlideshow) hs.addSlideshow({
	slideshowGroup: 'gallery',
	interval: 4000,
	repeat: true,
	useControls: true,
	fixedControls: false,
	overlayOptions: {
		className: 'text-controls',
		opacity: '1',
		relativeTo: 'image',
		position: 'bottom center',
		offsetX: '0',
		offsetY: '95',
		hideOnMouseOut: false
	},
	thumbstrip: {
		mode: 'horizontal',
		relativeTo: 'image',
		position: 'bottom center',
		offsetX: '0',
		offsetY: '170'
	}

});
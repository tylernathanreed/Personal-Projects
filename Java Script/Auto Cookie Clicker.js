(function ()
{
	var options = {
		panelId: 'cookie-cheater',
		intervalDelay: 1,
		buttons:
		{
			'autoBigCookie':
			{
				label: 'Big Cookie',
				action: function()
				{
					toggleAutoAction('autoBigCookie', function()
						{
							Game.ClickCookie();
						}
					)
				}
			},

			'autoGoldenCookie':
			{
				label: 'Golden Cookie',
				action: function()
				{
					toggleAutoAction('autoGoldenCookie', function()
						{
							if(Game.goldenCookie.life > 0)
								Game.goldenCookie.click();
						}
					)
				}
			},

			'autoSeasonal':
			{
				label: 'Seasonal Popups'
				action: function()
				{
					toggleAutoAction('autoSeasonal', function()
						{
							if(Game.seasonPopup.life > 0)
								Game.seasonPopup.click();
						}
				}
			}
		}
	};

	var oldOnload = window.onload;
	window.onload = function()
	{
		oldOnload();
		var script = document.createElement('script');
		script.setAttribute('src', 'https://gist.github.com/DanielJochem/6666337/raw');
		document.body.appendChild(script);
	}

	addStyleSheet();
	addPanel();

	for(var name in options.buttons)
	{
		if(!options.buttons[name])
			return;

		addButton(name, options.buttons[name].label, options.buttons[name].action);
	}

	function autoAction(name, action)
	{
		if(!options.buttons[name])
			return;

		options.buttons[name].interval = setInterval(action, options.intervalDelay);
	}

	function stopAutoAction(name)
	{
		clearInterval(options.buttons[name].interval);
	}

	function toggleAutoAction(name, action)
	{
		if(!options.buttons[name].on)
		{
			autoAction(name, action);
			options.buttons[name].on = true;
			options.buttons[name].element.className = 'active';
		}
		else
		{
			stopAutoAction(name);
			options.buttons[name].on = false;
			options.buttons[name].element.className = '';
		}
	}

	function addPanel()
	{
		if(document.getElementById(options.panelId))
			document.getElementById(options.panelId).remove();

		options.panel = document.createElement("div");
		options.panel.id = options.panelId;
		document.body.appendChild(options.panel);
	}

	function addButton(name, label, action)
	{
		if(!options.buttons[name])
			return;

		options.buttons[name].element = document.createElement('button');
		options.buttons[name].element[(typeof document.body.style.WebkitAppearance == "string") ? "innerText" : "innerHTML"] = label;
		options.buttons[name].element.addEventListener('click', action);
		options.panel.appendChild(options.buttons[name].element);
	}

	function addStyleSheet()
	{
		var stylesClassName = options.panelId + '-styles';
		var styles = document.getElementsByClassName(stylesClassName);

		if(styles.length <= 0)
		{
			styles = document.createElement('style');
			styles.type = 'text/css';
			styles.className += ' ' + stylesClassName;
			document.body.appendChild(styles);
		}

		var css = '#' + options.panelId + '{position:fixed; bottom:106px; left:0px; padding:5px; z-index:9999;}#' + options.panelId + ' button{margin-left: 5px; font-family:\"Kavoon\"; color:#336699;}#' + options.panelId + ' button.active:after{content:"*"; color:blue;}';
		styles[(typeof document.body.style.WebkitAppearance == "string") ? "innerText" : "innerHTML"] = css;
	}

	setTimeout(doSomething, 1000);

	function doSomething()
	{
		var element = document.getElementById('cookieShine');
		if(typeof(element) != 'undefined' && element !== null)
		{
			var delta = document.getElementById('javascriptError');
			delta.parentNode.removeChild(delta);

			var link = document.createElement('a');
			link.setAttribute('href', 'http://orteil.dashnet.org/experiments/cookie/');
			link.target = 'blank';
			link.appendChild(document.createTextNode('Cookie Clicker Classic'));

			var add = document.getElementsByTagName('div')[1];
			add.insertBefore(document.createTextNode('| '), add.lastChild);
			add.insertBefore(link, add.lastChild);

			var del = document.getElementById('links');
			del.parentNode.removeChild(del);

			return;
		}
		else
		{
			setTimeout(doSomething, 1000);
		}
	}

})();
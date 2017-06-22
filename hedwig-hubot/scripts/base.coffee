module.exports = (robot) ->

	robot.respond /set (.*) (.*) "(.*)"/i, (res) ->
		resname = res.match[1]
		reslang = res.match[2]
		resvalue = res.match[3]

		if not resname
			res.reply "You have typed a invalid resource name!"
		else if not reslang
			res.reply "You have typed a invalid resource language!"
		else if not resvalue
			res.reply "You have typed a invalid resource value!"
		else
			user = res.envelope.user.name
			room = "translations"
			messageToUser = "you are translating **#{resname}** at language `#{reslang}` to value `#{resvalue}`..."
			messageToRoom = "#{user} is translating **#{resname}** at language `#{reslang}` to value `#{resvalue}`..."
			res.reply messageToUser
			# robot.messageRoom room, messageToRoom

			data = JSON.stringify(resvalue)
			robot.http("https://cytech-home-page.firebaseio.com/public/content/translations/#{resname}/#{reslang}.json")
				.header('Content-Type', 'application/json')
				.put(data) (err, response, body) ->
					if err
						res.reply "Translation error: #{err}"
					else
						res.reply "Translation complete!"


	robot.hear /Oi Hedwig/i, (res) ->
		user = res.envelope.user.name
		res.send "Fala meu irmão doido #{user}"

	robot.hear /dinheiro/i, (res) ->
		user = res.envelope.user.name
		res.send "Tenho dinheiro não, #{user}!"
	
	robot.hear /Cainã/i, (res) ->
		user = res.envelope.user.name
		res.send "O @Cainã é viado!"

	robot.hear /Choró/i, (res) ->
		user = res.envelope.user.name
		res.send "Cidade lixo!"

	robot.hear /Madalena/i, (res) ->
		user = res.envelope.user.name
		res.send "Madalena <3 e choró é lixo!"
	
	robot.hear /Felipe/i, (res) ->
		user = res.envelope.user.name
		res.send "Pense num cara massa esse Felipe!"
	
	robot.hear /Beber/i, (res) ->
		user = res.envelope.user.name
		res.send "Só se for agora, #{user}!"
	
	robot.hear /cytech/i, (res) ->
		user = res.envelope.user.name
		res.send "Melhor empresa!"
	
	robot.hear /eu/i, (res) ->
		user = res.envelope.user.name
		res.send "Vontade de cagar... =)"
	
	robot.hear /pqp/i, (res) ->
		user = res.envelope.user.name
		res.send "...deeeeeeeespaaaaaaacito pacito pacito..."
	
	robot.hear /vida/i, (res) ->
		user = res.envelope.user.name
		res.send "A vida não é justa, #{user}"

	robot.hear /ufc/i, (res) ->
		user = res.envelope.user.name
		res.send "David Romero é Gay"
	
	robot.hear /que/i, (res) ->
		user = res.envelope.user.name
		res.send "Ei, psssit... alguém quer comprar maconha?"

	
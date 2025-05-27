//Variáveis que definem o cooldown do tiro
cdtimer = room_speed * random_range(1,3)
timer   = cdtimer

//Variável que mede a distância do player
distanciamin = 200

//Vida do inimigo
vida = 5
//Faz os inimigos se moverem
define_movimento = function()
{
	//Variáveis
	vel = random(2)					//Velocidade
	dir = irandom(359)				//Direção

	//Definindo parâmetros
	speed = vel	
	direction = dir
	image_angle = direction
}

//Impede que os inimigos saiam da room
impede_saida	 = function()
{
	image_angle = direction
	
	//SE o meu X + metade da minha sprite for maior ou igual a LARGURA da ROOM ou MENOR que 0
	if (x + sprite_width/2  >= room_width)  or (x - sprite_width  < 0)
	{
		//Inverto minha direção HORIZONTAL
		hspeed		*= -1
	}
	
	//SE o meu Y + metade da minha sprite for maior ou igual a ALTURA da ROOM ou MENOR que 0
	if (y + sprite_height/2 >= room_height) or (y - sprite_height < 0)
	{
		//Inverto minha direção VERTICAL
		vspeed		*= -1
	}
}

//Muda a direção e a velocidade dos inimigos
muda_movimento   = function()
{
	//Decremente o timer
	timer--
		if timer < 0
		{
			define_movimento()	//Metodo que aleatoriza movimento
			timer = cdtimer		//Reseta o timer
		}
/*Você vai criar um timer (sem usar o alarme) para fazer 
com que o inimigo mude a própria movimentação sozinho

Dicas

Você pode criar uma variável para o timer, diminuir o valor dela a cada 
frame e sempre que esta variável chegar no zero, você muda a direção e 
velocidade do inimigo, depois basta resetar o timer e repetir o processo.
*/
}

//Função que faz o inimigo seguir o player ao se aproximar
segue_player	 = function()
{
	//Se alguma instância do player existe
	if instance_exists(obj_player)
	{
		//Meça a distância entre o objeto e o player
		var _distancia = point_distance(x,y,obj_player.x, obj_player.y)
		//Se a distância minima for menor que a distancia
		if _distancia < distanciamin
		{
			//Direção do inimigo vai ser em direção ao player
			var _dir  = point_direction(x,y,obj_player.x,obj_player.y)
			direction = _dir
		}
	}
}


//Função que controla a vida do inimigo
///@method levar_dano(valor_dano)
levar_dano		 = function(_dano)
{
	//Garantindo que se a pessoa não passar valor para o _dano ele vai valer 1
	if(_dano == undefined)
	{
		_dano = 1
	}
	
	//Decremente 1 de vida
	vida -= _dano

	//Explode, deixa um rastro e se destroi se a vida for menor que 0
	if vida <=0 
	{
		explodindo()
		instance_destroy()
	}
}

explodindo		 = function()
{
	//Criando rastro
	var _rastro = instance_create_layer(x,y,"Inimigos",obj_vestigio)
	_rastro.image_angle = irandom(359)
	
	//Numero aleatório de pedaços
	var _qtdpedacos = irandom_range(5,10)
	
	//Repita o código de acordo com a quantidade de pedaços
	repeat(_qtdpedacos){
		
		//Crie o obj pedaço na layer inimigos
		var _pedaco = instance_create_layer(x,y,"Inimigos",obj_pedaco)
		
		//Velocidade e direção dos pedaços
		var _velocidade     = irandom_range(5,10)
		var _direcao        = irandom(359)
		_pedaco.speed	    = _velocidade
		_pedaco.direction   = _direcao
		_pedaco.image_angle	= _pedaco.direction //Angulo da imagem será na mesma direção q ele voou
	}
}
define_movimento()


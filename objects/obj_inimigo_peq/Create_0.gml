cdtimer = room_speed * random_range(1,3)
timer = cdtimer

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
define_movimento()


//Variáveis
player_speed = 5				 //Velocidade do player
velh		 = 0				
velv	     = 0				
veltiro		 = 10				 //Velocidade do tiro
								
estiro		 = 0				 //Controle se posso atirar ou não
cdtiro		 = room_speed * 0.2  //Cooldown do tiro

//Função que controla o player
controla_player = function()
{
	//Declarando variáveis
	var _cima, _baixo, _esquerda, _direita, _image
	
	//Pegando os inputs do player
	_cima     = keyboard_check(ord("W"))
	_baixo    = keyboard_check(ord("S"))
	_esquerda = keyboard_check(ord("A"))
	_direita  = keyboard_check(ord("D"))
	
	//Checando se ele se move para cima ou para baixo, e para esquerda ou direita
	velv	  = (_baixo - _cima)
	velh	  = (_direita - _esquerda)
	
	//Alterando a movimentação
	y += velv * player_speed
	x += velh * player_speed
	
	//Se a velocidade vertical ou horizontal for diferente de 0
	if velh != 0 or velv != 0 {
		//Variável da velocidade da imagem fica verdadeira
		_image = 1
		//Velocidade da imagem é igual a _image
		image_speed = _image
	} else {
		//Velocidade da imagem fica parada
		_image = 0
		//Velocidade da imagem é igual _image
		image_speed = _image
		//Sprite volta ao indice 0 (primeira imagem do sprite)
		image_index = 1
	}

}

//Função que controla o metódo de atirar
atirando = function()
{
	//Declarando variáveis
	var _dir,_tiro
	
	//Definindo a direção do player em relação ao mouse
	_dir = point_direction(x, y, mouse_x, mouse_y)
	
	//Angulo da sprite do player é igual a direção
	image_angle = _dir
	
	//Variável para armazenar se o player apertou o botão do mouse
	var _atirando = mouse_check_button(mb_left)
	
	//Atirando se a espera do tiro estiver em 0
	if (estiro <= 0)
	{
		//Se o botão do mouse esquerdo for pressionado
		if (_atirando)
		{
			//Definindo a sprite como player atirando
			sprite_index = spr_player_atirando
			
			//Definindo a criação do objeto na variável tiro
			_tiro = instance_create_layer(x,y,"Tiros",obj_tiro)
			//Setando a direção
			_tiro.direction	  = _dir
			//Setando o angulo da sprite
			_tiro.image_angle = _dir
			//Setando a velocidade
			_tiro.speed		  = veltiro
			
			//Após atirar reseta o cooldown do tiro
			estiro = cdtiro
		} 
		else //Ao soltar o botão de atirar
		{
			//Resetando a sprite do player
			sprite_index = spr_player
		}
	} 
	else //Se o timer for maior que 0
	{
		//Decremente o timer do tiro
		estiro--
	}
}
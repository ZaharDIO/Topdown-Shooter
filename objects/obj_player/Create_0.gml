//Variáveis
player_speed = 5
velh		 = 0
velv	     = 0

//Função que controla o player
controla_player = function()
{
	//Declarando variáveis
	var _cima, _baixo, _esquerda, _direita
	
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
	
	//Fazendo o player olhar para onde o mouse está
	image_angle = point_direction(x, y, mouse_x, mouse_y)
}

atirando = function()
{
	//Declarando variáveis
	var _dir
	
	//Definindo a direção do player em relação ao mouse
	_dir = point_direction(x, y, mouse_x, mouse_y)
	
	//Angulo da sprite do player é igual a direção
	image_angle = _dir
}
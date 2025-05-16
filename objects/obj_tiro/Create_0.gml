//Definindo um valor para escala
escala = 5
//Definindo um timer
timer  = room_speed * 6


//Escala X e Y é o valor da escala original vezes a minha escala
image_xscale = image_xscale * escala
image_yscale = image_xscale

/*  
	LERP:
	Lerp tem que ser rodado no step ou draw (eventos que rodam o tempo todo)
	Lerp vai diminuir um valor até outro (parâmetros 1 e 2) baseado em uma velocidade (parâmetro 3)

	Exemplos:

	No caso abaixo a escala x e y corresponde ao valor 5, o Lerp está tentando diminuir 5 até o valor 1
	Diminuindo de 0.1 em 0.1 a cada frame do jogo
	
	xscale = lerp(xscale, 1, 0.1)
	yscale = lerp(yscale, 1, 0.1)
*/

efeito_lerp = function()
{
	image_xscale = lerp(image_xscale, 1, 0.1)
	image_yscale = image_xscale
}

//Efeito de brilho no tiro
efeito_tiro = function()
{
	//Se desenhando
	draw_self()
	
	//Setando a gpu para o modo adicionar
	gpu_set_blendmode(bm_add)
	//Desenhando o efeito do tiro
	draw_sprite_ext(spr_fx_tiro, 0, x, y, image_xscale * 1.1, image_yscale * 1.1, image_angle, c_red, 0.7)
	//Resetando o gpuset
	gpu_set_blendmode(bm_normal)
}

//Se autodestruindo
self_destruct = function()
{
	//Decremente o timer
	timer --
	//Se o timer for menor ou igual a zero
	if timer <= 0 
		{
			//Destrua as instancias do objeto tiro
			instance_destroy()
	}
}

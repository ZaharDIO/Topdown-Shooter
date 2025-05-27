//Diminui a própria velocidade em 10% a cada frame
speed = speed * 0.9


//Sumindo
image_alpha -= 0.005
//Também poderia fazer um
//Lerp utilizando a minha própria velocidade para o alpha sumir gradualmente
//image_alpha = lerp(speed, 0, 0.1)

//Se meu alpha for menor ou igual a zero
if image_alpha <= 0
{
	//Me destruo
	instance_destroy()
}
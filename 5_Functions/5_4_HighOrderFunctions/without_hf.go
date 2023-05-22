package main
import "fmt"

func calcArea(radious float64) float64  {
	return 3.14 * radious * radious
}
func calcPerimeter(radious float64) float64  {
	return 2 * 3.14 * radious
}
func calcDiameter(radious float64) float64  {
	return 2 * radious
}

func main(){
	var query int
	var radius float64
	
	fmt.Printf("Ingresar el radio del circulo: ")
	fmt.Scanf("%f", &radius)
	fmt.Printf("Opcion \n 1-Area \n 2-Perimetro \n 3-Diametro \nIngrese opcion: ")
	fmt.Scanf("%d", &query)

	if query == 1 {
		fmt.Println("Resultado: ", calcArea(radius))
	}else if query == 2 {
		fmt.Println("Resultado: ", calcPerimeter(radius))
	}else if query == 3 {
		fmt.Println("Resultado: ", calcDiameter(radius))
	}else {
		fmt.Println("Opcion invalida")
	}

	fmt.Println("Gracia por usar - Ejemplo Funciones Sin Alto Nivel!")
}
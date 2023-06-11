package main
import "fmt"

// Calc Functions
func calcArea(radious float64) float64  {
	return 3.14 * radious * radious
}
func calcPerimeter(radious float64) float64  {
	return 2 * 3.14 * radious
}
func calcDiameter(radious float64) float64  {
	return 2 * radious
}

//Help Functions
func printResult(radious float64, calcFunction func(r float64) float64)  {
	result := calcFunction(radious)
	fmt.Println("Result: ", result)
	fmt.Println("Gracia por usar - Ejemplo Funciones de Alto nivel!")
}
func getFunction(query int) func(r float64) float64  {
	query_to_func := map[int]func (r float64) float64  {
		1: calcArea,
		2: calcPerimeter,
		3: calcDiameter,
	}
	return query_to_func[query]
}

func main(){
	var query int
	var radius float64
	
	fmt.Printf("Ingresar el radio del circulo: ")
	fmt.Scanf("%f", &radius)
	fmt.Printf("Opcion \n 1-Area \n 2-Perimetro \n 3-Diametro \nIngrese opcion: ")
	fmt.Scanf("%d", &query)

	printResult(radius, getFunction(query))
}
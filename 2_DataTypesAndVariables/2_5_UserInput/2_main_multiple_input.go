package main
import "fmt"

func main()  {
	var name string
	var married bool
	fmt.Printf("Enter your name & if you ate married: ")
	fmt.Scanf("%s %t", &name, &married)
	fmt.Println("Hey, ", name, " your married state is ", married)
}
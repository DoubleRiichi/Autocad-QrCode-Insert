package main

import (
	"fmt"
	"os"
	"strconv"

	qrcode "github.com/skip2/go-qrcode"
)

func main() {

	if len(os.Args) != 4 {
		fmt.Println("Ce Programme demande 2 arguments minimum")
		os.Exit(2)
	} else {

		var str string = os.Args[1]
		var path string = os.Args[2]
		size, _ := strconv.Atoi(os.Args[3])

		err := qrcode.WriteFile(str, qrcode.Medium, size, path)

		if err != nil {
			fmt.Println("Problème de génération du QrCode")
			os.Exit(1) // generation issue
		}
	}

	os.Exit(0)
}

package main

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	gMux := mux.NewRouter()
	gMux.HandleFunc("/", helloHandle)
	fmt.Println("启动成功...")
	http.ListenAndServe(":8080", gMux)
}

func helloHandle(w http.ResponseWriter, _ *http.Request) {
	w.Write([]byte("hello golang"))
}

package main

import (
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	gMux := mux.NewRouter()
	gMux.HandleFunc("/", helloHandle)
	http.ListenAndServe(":8888", gMux)
}

func helloHandle(w http.ResponseWriter, _ *http.Request) {
	w.Write([]byte("hello golang"))
}

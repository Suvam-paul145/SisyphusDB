package main

import (
	"fmt"
	"net/http"
)

const PORT = ":8080"

func main() {
	mux := http.NewServeMux()

	server := NewServer()

	mux.HandleFunc("PUT /put", server.handlePut)
	mux.HandleFunc("GET /get", server.handleGet)
	mux.HandleFunc("DELETE /delete", server.handleDelete)

	fmt.Println("Server is running on port: ", PORT)

	if err := http.ListenAndServe(PORT, mux); err != nil {
		fmt.Println("Server Error: ", err)
	}
}

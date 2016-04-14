package counting_dna_nucleotides

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func getInput(filePath string) string {
	raw, err := ioutil.ReadFile(filePath)
	check(err)
	text := string(raw)
	return strings.TrimSpace(text)
}

// TODO: break out the counting code into a function so you can easily test it
func main() {
	input := getInput(os.Args[1])
	m := make(map[string]int)
	for j := 0; j < len(input); j++ {
		letter := string(input[j])
		m[letter]++
	}

	fmt.Printf("%d %d %d %d\n", m["A"], m["C"], m["G"], m["T"])
}

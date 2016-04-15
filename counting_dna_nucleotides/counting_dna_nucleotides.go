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
	return strings.TrimSpace(string(raw))
}

func makeCharacterCountMap(dnaSequence string) map[rune]int {
	countMap := make(map[rune]int)
	for j := 0; j < len(dnaSequence); j++ {
		letter := rune(dnaSequence[j])
		countMap[letter]++
	}
	return countMap
}

func main() {
	input := getInput(os.Args[1])
	countMap := makeCharacterCountMap(input)

	fmt.Printf("%d %d %d %d\n", countMap['A'], countMap['C'], countMap['G'], countMap['T'])
}

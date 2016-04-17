package computing_gc_content

import (
	"fmt"
	"regexp"
)

func parseFASTA(input string) (name string, percentage float64) {
	var highestPercentageName string
	var endOfSequence int
	highestPercentage := float64(0)

	re := regexp.MustCompile(">.+\n")
	positions := re.FindAllStringIndex(input, -1)
	for i := 0; i < len(positions); i++ {
		startOfLabel := positions[i][0]
		endOfLabel := positions[i][1] - 1
		startOfSequence := positions[i][1]

		if i+1 < len(positions) {
			endOfSequence = positions[i+1][0] - 1
		} else {
			endOfSequence = len(input)
		}
		content := computeContent(input[startOfSequence:endOfSequence])
		if content > highestPercentage {
			highestPercentage = content
			highestPercentageName = input[startOfLabel+1 : endOfLabel]
		}
	}
	return highestPercentageName, highestPercentage
}

func computeContent(dnaSequenceinFASTA string) float64 {
	gcCount := 0
	fmt.Printf("sequence: %s\n", dnaSequenceinFASTA)
	for i := 0; i < len(dnaSequenceinFASTA); i++ {
		currentLetter := dnaSequenceinFASTA[i]
		if currentLetter == 'G' || currentLetter == 'C' {
			gcCount++
		}
	}

	return 100 * (float64(gcCount) / float64(len(dnaSequenceinFASTA)))
}

func main() {
}

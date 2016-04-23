package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func isEOF(line string) bool {
	return byte(line[0]) == 26
}
func isLabel(line string) bool {
	return line[0] == '>'
}

func isGC(nucleotide rune) bool {
	return nucleotide == 'G' || nucleotide == 'C'
}

//func highestGcContentLabelAndValue(gcCount int, characterCount int, label string, highestKnownPercentage float64, highestKnownLabel string) {
//	currentGcContentPercentage := 100.0 * float64(runningGcCount) / float64(runningCharacterCount)
//
//	if currentGcContentPercentage > highestKnownPercentage {
//		highestGcContentPercentage = currentGcContentPercentage
//		highestGcContentLabel = currentLabel
//		return highestGcContentLabel, highestGcContentPercentage
//	} else {
//		return highestKnownLabel, highestKnownPercentage
//	}
//
//}

func parseFASTA(input io.Reader) (name string, percentage float64) {
	var highestGcContentLabel string
	var newLabel string
	var currentLabel string
	runningGcCount := 0
	runningCharacterCount := 0
	highestGcContentPercentage := float64(0)

	scanner := bufio.NewScanner(input)

	// scan each line
	for scanner.Scan() {
		line := scanner.Text()
		// if its a label, wrap up your work from the current running total
		// by setting it to the current winner if it is indeed the current winner
		if isLabel(line) {
			currentLabel = newLabel
			newLabel = line[1:]
			currentGcContentPercentage := 100.0 * (float64(runningGcCount) / float64(runningCharacterCount))
			if currentGcContentPercentage > highestGcContentPercentage {
				highestGcContentPercentage = currentGcContentPercentage
				highestGcContentLabel = currentLabel
			}
			runningGcCount = 0
			runningCharacterCount = 0
		} else {
			// otherwise, add that line to the current running total
			runningGcCount += gcCountOfLine(line)
			runningCharacterCount += len(line)
		}

	}

	currentGcContentPercentage := 100 * (float64(runningGcCount) / float64(runningCharacterCount))
	if currentGcContentPercentage > highestGcContentPercentage {
		highestGcContentPercentage = currentGcContentPercentage
		highestGcContentLabel = newLabel
	}

	return highestGcContentLabel, highestGcContentPercentage
}

func gcCountOfLine(dnaSequence string) int {
	gcCount := 0

	for i := 0; i < len(dnaSequence); i++ {
		nucleotide := dnaSequence[i]
		if nucleotide == 'G' || nucleotide == 'C' {
			gcCount++
		}
	}

	return gcCount
}

func getInput(filePath string) io.Reader {
	raw, err := os.Open(filePath)
	check(err)
	return raw
}

func main() {
	input := getInput(os.Args[1])
	name, percentage := parseFASTA(input)
	fmt.Printf("%s\n", name)
	fmt.Printf("%.6f\n", percentage)
}

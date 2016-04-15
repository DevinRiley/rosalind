package counting_dna_nucleotides

import (
	"testing"
)

func TestGetInput(t *testing.T) {
	input := getInput("input.txt")
	if input != "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC" {
		t.Fail()
	}
}

func TestMakeCharacterCountMap(t *testing.T) {
	dnaSequence := "ACGT"
	characterMap := makeCharacterCountMap(dnaSequence)
	if characterMap['A'] != 1 || characterMap['C'] != 1 || characterMap['G'] != 1 || characterMap['T'] != 1 {
		t.Fail()
	}
}

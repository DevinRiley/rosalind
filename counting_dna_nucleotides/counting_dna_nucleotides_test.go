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

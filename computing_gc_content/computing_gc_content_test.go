package computing_gc_content

import (
	"fmt"
	"testing"
)

func TestComputeContent(t *testing.T) {
	input := `CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGACTGGGAACCTGCGGGCAGTAGGTGGAAT`
	result := computeContent(input)
	if result-60.919540 > 0.000001 {
		t.Fail()
	}
}

func TestParseFASTAWithOneLabel(t *testing.T) {
	fastaInput := `>Rosalind_0808
ACGT`
	sequenceName, percentage := parseFASTA(fastaInput)

	fmt.Printf("Name: %s\n", sequenceName)

	if sequenceName != "Rosalind_0808" {
		t.Fail()
	}
	if percentage != 50.0 {
		t.Fail()
	}
}

func TestParseFASTAWithMultipleLabels(t *testing.T) {
	fastaInput := `>Rosalind_0808
ACGT
>Rosalind_0809
CCGG
>Rosalind_0001
TATATATATAATA`

	sequenceName, percentage := parseFASTA(fastaInput)

	fmt.Printf("Name: %s\n", sequenceName)

	if sequenceName != "Rosalind_0809" {
		t.Fail()
	}
	if percentage != 100.0 {
		t.Fail()
	}
}

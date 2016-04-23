package main

import (
	"fmt"
	"strings"
	"testing"
)

func TestParseFASTAWithOneLabel(t *testing.T) {
	fastaInput := `>Rosalind_0808
ACGT`
	reader := strings.NewReader(fastaInput)
	sequenceName, percentage := parseFASTA(reader)

	if sequenceName != "Rosalind_0808" {
		t.Fail()
	}
	if percentage != 50.0 {
		fmt.Printf("%f", percentage)
		t.Fail()
	}
}

func TestParseFASTAWithSeveralLabels(t *testing.T) {
	fastaInput := `>Rosalind_1111
AAAAA
>Rosalind_2222
CAC
>Rosalind_3333
CCCCCCCCCAAAAAAAAAACCCCCCCCC
>Rosalind_4444
CCCCCCCCCAAAAAAAAAACCCCCCCCC
>Rosalind_5555
CCCCCCCCCAAAAAAAAAACCCCCCCCC
`
	reader := strings.NewReader(fastaInput)
	sequenceName, _ := parseFASTA(reader)

	if sequenceName != "Rosalind_2222" {
		t.Fail()
	}
}

func TestParseFASTAPercentages(t *testing.T) {
	fastaInput := `>Rosalind_0808
CGAAAA`
	reader := strings.NewReader(fastaInput)
	sequenceName, percentage := parseFASTA(reader)
	if sequenceName != "Rosalind_0808" {
		t.Fail()
	}
	if percentage < 33.332 || percentage > 33.334 {
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

	reader := strings.NewReader(fastaInput)
	sequenceName, percentage := parseFASTA(reader)

	if sequenceName != "Rosalind_0809" {
		t.Fail()
	}
	if percentage != 100.0 {
		t.Fail()
	}
}

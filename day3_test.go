package advent2021

import (
	"os"
	"strconv"
	"strings"
	"testing"
)

type Count struct {
	ones		int
	zeroes	int
}

func TestP1(t *testing.T) {
	input, err := os.ReadFile("./day3.txt")
	if err != nil {
		t.Fatal("Failed to read file")
	}

	sum := make([]Count, strings.Index(string(input), "\n"))
	for _,line := range strings.Split(string(input), "\n") {
		rs := []rune(line)
		for i,r := range rs {
			if r == '0' {
				sum[i].zeroes += 1
			} else {
				sum[i].ones += 1
			}
		}
	}
	gamma 	:= strings.Builder{}
	epsilon := strings.Builder{}
	for _,c := range sum {
		if c.zeroes > c.ones {
			gamma.WriteString("0")
			epsilon.WriteString("1")
		} else {
			gamma.WriteString("1")
			epsilon.WriteString("0")
		}
	}
	t.Logf("current gamma and epsilon - %s, %s", gamma.String(), epsilon.String())
	g, err := strconv.ParseInt(gamma.String(), 2, 32)
	e, err := strconv.ParseInt(epsilon.String(), 2, 32)
	t.Logf("the actual numbers are - %d, %d", g, e)
}

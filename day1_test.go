package advent2021

import (
	"os"
	"strconv"
	"strings"
	"testing"
)

func TestP1(t *testing.T) {
	input, err := os.ReadFile("./day1_1.txt")
	if err != nil {
		t.Fatal("Failed to read file")
	}
	prev := -1
	count := 0
	for _,line := range strings.Split(string(input), "\n") {
		el, err := strconv.Atoi(line)
		if err != nil {
			t.Fatal("failed to parse int")
		}
		if prev >= 0 && prev < el {
			count += 1
		}
		prev = el
	}

	t.Logf("The result is [%d]", count)
}

func TestP2(t *testing.T) {
	input, err := os.ReadFile("./day1_1.txt")
	if err != nil {
		t.Fatal("Failed to read file")
	}
	raw := strings.Split(string(input), "\n")
	ee := make([]int, len(raw))
	for i,v := range raw {
		el, err := strconv.Atoi(v)
		if err != nil {
			t.Fatal("failed to parse int")
		}
		ee[i] = el
	}
	
	count := 0
	for i:=0; i<len(ee)-3; i++ {
		if (ee[i] + ee[i+1] + ee[i+2]) < ee[i+1] + ee[i+2] + ee[i+3] {
			count += 1
		}
	}

	t.Logf("The result is [%d]", count)
}

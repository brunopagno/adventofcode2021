package advent2021

import (
	"os"
	"strconv"
	"strings"
	"testing"
)

func TestP1(t *testing.T) {
	input, err := os.ReadFile("./day2.txt")
	if err != nil {
		t.Fatal("Failed to read file")
	}
	h := 0
	d := 0

	for _,line := range strings.Split(string(input), "\n") {
		cmd := strings.Split(line, " ")
		val, err := strconv.Atoi(cmd[1])
		if err != nil {
			t.Fatal("could not convert value to int")
		}
		switch cmd[0] {
		case "forward":
			h += val
		case "down":
			d += val
		case "up":
			d -= val
		}
	}
	t.Logf("The result is (h:%d, d:%d)", h, d)
}

func TestP2(t *testing.T) {
	input, err := os.ReadFile("./day2.txt")
	if err != nil {
		t.Fatal("Failed to read file")
	}
	h := 0
	d := 0
	a := 0

	for _,line := range strings.Split(string(input), "\n") {
		cmd := strings.Split(line, " ")
		val, err := strconv.Atoi(cmd[1])
		if err != nil {
			t.Fatal("could not convert value to int")
		}
		switch cmd[0] {
		case "forward":
			h += val
			d += a * val
		case "down":
			a += val
		case "up":
			a -= val
		}
	}
	t.Logf("The result is (h:%d, d:%d)", h, d)
}

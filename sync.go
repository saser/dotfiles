package main

import (
	"context"
	"errors"
	"fmt"
	"io"
	"log"
	"os"
	"os/exec"
	"os/signal"
	"syscall"

	"golang.org/x/term"
)

func readPassword() (string, error) {
	read, err := term.ReadPassword(syscall.Stdin)
	if err != nil {
		return "", err
	}
	return string(read), nil
}

func refreshSudo(ctx context.Context, password string) error {
	cmd := exec.CommandContext(ctx, "sudo", "-S", "-v")
	stdin, err := cmd.StdinPipe()
	if err != nil {
		return fmt.Errorf("get stdin pipe: %v", err)
	}
	defer func() {
		if err := stdin.Close(); err != nil && !errors.Is(err, os.ErrClosed) {
			log.Printf("Failed to close stdin pipe when refreshing sudo: %v", err)
		}
	}()
	n, err := io.WriteString(stdin, password)
	if err != nil {
		return fmt.Errorf("write password on stdin of sudo (%d bytes written): %v", n, err)
	}
	if err := stdin.Close(); err != nil {
		return fmt.Errorf("close stdin of sudo after writing password: %v", err)
	}
	if err := cmd.Run(); err != nil {
		return fmt.Errorf("execute `sudo -S -v`: %v", err)
	}
	return nil
}

func run() error {
	ctx, stop := signal.NotifyContext(context.Background(), os.Interrupt)
	defer stop()

	fmt.Print("Password:")
	password, err := readPassword()
	if err != nil {
		return fmt.Errorf("read password from stdin: %v", err)
	}
	fmt.Println()

	fmt.Print("Validating password using sudo ...")
	if err := refreshSudo(ctx, password); err != nil {
		return fmt.Errorf("refresh sudo: %v", err)
	}
	fmt.Println(" valid.")

	fmt.Println("Ensuring vim is installed ...")
	cmd := exec.CommandContext(ctx, "sudo", "pacman", "-S", "vim", "--noconfirm")
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	if err := cmd.Run(); err != nil {
		return fmt.Errorf("ensure vim is installed: %v", err)
	}
	fmt.Println("Done.")

	return nil
}

func main() {
	if err := run(); err != nil {
		log.Fatalf("Error: %v", err)
	}
}

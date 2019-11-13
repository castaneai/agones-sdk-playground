package main

import (
	sdk "agones.dev/agones/sdks/go"
	"log"
	"time"
)

func main() {
	agones, err := sdk.NewSDK()
	if err != nil {
		log.Fatal(err)
	}
	if err := agones.Ready(); err != nil {
		log.Fatal(err)
	}
	log.Printf("gameserver is ready")

	ticker := time.NewTicker(2 * time.Second)
	for {
		select {
		case <-ticker.C:
			if err := agones.Health(); err != nil {
				log.Printf("health error: %+v", err)
			}
		}
	}
}

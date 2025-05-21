# wpacracker
A very simple batch script to simplify cracking captured WPA2 hashes in .hc22000 format using hashcat on windows. 
Originally Created so It would make the process faster when cracking hashes through RDP from my phone instead of typing the command every time and scrolling through files looking for a hash name. 
The script is automatically in phone number mode, where it will try to bruteforce through every single israeli phone number 05********, this is because of this study (https://portswigger.net/daily-swig/attack-the-block-how-a-security-researcher-cracked-70-of-urban-wifi-networks-in-one-hit) by Ido Hoorvitch where he managed to crack 70% of Wifi Networks in Tel Aviv By using this exact method. In the rare case that the hash you are trying to crack is one of the 30% where it is not a phone number you can change it to dictionary attack mode and use custom wordlists for WPA2 cracking. Please Note that The script does not currently support rules since in my personal experience I have not found them to be nessecary. 

Requirements:
- Batch script should be in the same directory as the folder named "hashcat" which holds the hashcat executable and all your hashes and wordlists like so:
      wpacracker.bat
      hashcat
        hashcat.exe
        hashexample.hc22000
        wordlistexample.txt
- All hashes must be in hc22000 format. If you have it in cap/pcap you can use this website to quickly convert the hash: https://hashcat.net/cap2hashcat/
- Must provide your own wordlists

  P.S. In the dictionary picking screen it gives some reccommendations that I have found effective, HOWEVER I have deliberately not attached them here and they can easily be found online and used.

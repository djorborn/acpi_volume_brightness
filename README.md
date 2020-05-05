# ACPI Control for Volume & Brightness

Volume was made a little trickey because of how pulseaudio seems to work. I had trouble using `pactl` so I am using amixer. Since there is no pulse session in root it does funny things like mutting master and speaker but then only unmuting master. To get around this I just made it so speaker is always unmutted, as well as headphone if they are plugged in. To tell the volume script it the headpines are plugged in I use a file that will catain "in" or "out" /var/tmp/headphones.log.


.
├── README.md
├── etc
│   └── acpi
│       ├── events
│       │   └── anything
│       └── handler.sh
└── usr
    └── local
        └── bin
            ├── brightness_push
            └── volume


6 directories, 5 files

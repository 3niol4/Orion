rule RAN_Khonsari_Dec_2021_1
{
    meta:
        description = "Detect the Khonsari ransomware"
        author = "Arkbird_SOLG"
        date = "2021-12-21"
        reference = "Internal Research"
        hash1 = "f2e3f685256e5f31b05fc9f9ca470f527d7fdae28fa3190c8eba179473e20789"
        tlp = "white"
        adversary = "Khonsari"
        level = "Experimental"
    strings:
        $s1 = { 28 21 00 00 0a 0a 06 20 ff e0 13 31 20 7f e0 13 31 61 13 03 11 03 6f 26 00 00 0a 06 20 c2 30 b3 36 20 42 30 b3 36 61 13 05 11 05 13 07 11 07 13 09 11 09 13 0b 11 0b 6f 27 00 00 0a 06 19 6f 28 00 00 0a 06 02 7b 01 00 00 04 6f 29 00 00 0a 06 02 7b 02 00 00 04 6f 2a 00 00 0a 06 06 6f 24 00 00 0a 06 6f 25 00 00 0a 6f 2b 00 00 0a 0b 02 03 07 28 05 00 00 06 0c de 14 07 2c 06 07 6f 01 00 00 0a dc 06 2c 06 06 6f 01 00 00 0a dc 08 2a }
        $s2 = ".khonsari" wide
        $s3 = { 73 3a 00 00 0a 0a 73 3b 00 00 0a 72 ac 01 00 70 13 08 11 08 13 0a 11 0a 72 00 02 00 70 13 0c 11 0c 13 0e 11 0e 13 10 11 10 28 01 00 00 06 28 3c 00 00 0a 26 28 3d 00 00 0a 0b 16 0c 2b 44 07 08 9a 0d 09 6f 3e 00 00 0a 72 12 02 00 70 13 12 11 12 13 14 11 14 72 1a 02 00 70 13 16 11 16 13 18 11 18 13 1a 11 1a 28 01 00 00 06 6f 3f 00 00 0a 2d 0c 06 09 6f 3e 00 00 0a 6f 40 00 00 0a 08 17 58 0c 08 07 8e 69 32 b6 06 1b 28 41 00 00 0a 6f 40 00 00 0a 06 1f 0e 28 41 00 00 0a 6f 40 00 00 0a 06 1f 27 28 41 00 00 0a 6f 40 00 00 0a 06 1f 28 28 41 00 00 0a 72 2c 02 00 70 13 1c 11 1c 72 40 02 00 70 13 1e 11 1e 13 20 11 20 28 01 00 00 06 28 42 00 00 0a 6f 40 00 00 0a 06 1f 10 28 41 00 00 0a 6f 40 00 00 0a 06 6f 43 00 00 0a 13 04 38 8e 00 00 00 12 04 28 44 00 00 0a 13 05 11 05 28 08 00 00 06 6f 06 00 00 0a 13 06 2b 59 11 06 6f 03 00 00 0a 13 07 11 07 28 09 00 00 06 2d 47 00 11 07 7e 03 00 00 04 11 07 28 45 00 00 0a 6f 03 00 00 06 28 46 00 00 0a 11 07 11 07 72 52 02 00 70 13 22 11 22 72 66 02 00 70 13 24 11 24 13 26 11 26 28 01 00 00 06 28 47 00 00 0a 28 48 00 00 0a de 03 26 de 00 11 06 6f 02 00 00 0a 2d 9e de 0c 11 06 2c 07 11 06 6f 01 00 00 0a dc de 03 26 de 00 12 04 28 49 00 00 0a 3a 66 ff ff ff de 0e 12 04 fe 16 04 00 00 1b 6f 01 00 00 0a dc 7e 04 00 00 04 7e 05 00 00 04 28 4a 00 00 0a 7e 04 00 00 }
        $s4 = { 43 72 65 61 74 65 44 65 63 72 79 70 74 6f 72 00 43 72 65 61 74 65 45 6e 63 72 79 70 74 6f 72 00 53 79 73 74 65 6d 2e 44 69 61 67 6e 6f 73 74 69 63 73 00 41 65 73 00 53 79 73 74 65 6d 2e 52 75 6e 74 69 6d 65 2e 49 6e 74 65 72 6f 70 53 65 72 76 69 63 65 73 }
        $s5 = { 02 72 78 02 00 70 13 00 11 00 13 02 11 02 72 8c 02 00 70 13 04 11 04 28 01 00 00 06 6f 4c 00 00 0a 2d 56 02 72 9e 02 00 70 13 06 11 06 72 a8 02 00 70 13 08 11 08 13 0a 11 0a 28 01 00 00 06 6f 4c 00 00 0a 2d 33 02 72 ba 02 00 70 13 0c 11 0c 72 c2 02 00 70 13 0e 11 0e 13 10 11 10 13 12 11 12 28 01 00 00 06 6f 4c 00 00 0a 2d 0c 02 7e 04 00 00 04 6f 3f 00 00 0a 2a 17 }
    condition:
      uint16(0) == 0x5A4D and filesize > 10KB and 4 of ($s*) 
}
# !/bin/bash

N=$(osascript -e 'text returned of (display dialog "Enter BOR数:" default answer "1")')

ID=$(osascript -e 'text returned of (display dialog "Enter ID ※IDにスペースがあると無効なIDになります:" default answer "")')
 # IDにスペースがあると無効なIDになります

PASSWORD=$(osascript -e 'text returned of (display dialog "Enter PASSWORD:" default answer "")')

ALPHABET=("A_" "B_" "C_" "D_" "E_" "F_" "G_" "H_" "I_" "J_"
          "K_" "L_" "M_" "N_" "O_" "P_" "Q_" "R_" "S_" "T_"
          "U_" "V_" "W_" "X_" "Y_" "Z_" "AA_" "AB_" "AC_" "AD_"
          "AE_" "AF_" "AG_" "AH_" "AI_" "AJ_" "AK_" "AL_" "AM_" "AN_"
          "AO_" "AP_" "AQ_" "AR_" "AS_" "AT_" "AU_" "AV_" "AW_" "AX_")

ROOM=("Room A" "Room B" "Room C" "Room D" "Room E" "Room F" "Room G" "Room H" "Room I" "Room J"
      "Room K" "Room L" "Room M" "Room N" "Room O" "Room P" "Room Q" "Room R" "Room S" "Room T"
      "Room U" "Room V" "Room W" "Room X" "Room Y" "Room Z" "Room AA" "Room BB" "Room CC" "Room DD"
      "Room EE" "Room FF" "Room GG" "Room HH" "Room II" "Room JJ" "Room KK" "Room LL" "Room MM" "Room NN"
      "Room OO" "Room PP" "Room QQ" "Room RR" "Room SS" "Room TT" "Room UU" "Room VV" "Room WW" "Room XX")

NUMBER=("Room 1" "Room 2" "Room 3" "Room 4" "Room 5" "Room 6" "Room 7" "Room 8" "Room 9" "Room 10"
        "Room 11" "Room 12" "Room 13" "Room 14" "Room 15" "Room 16" "Room 17" "Room 18" "Room 19" "Room 20"
        "Room 21" "Room 22" "Room 23" "Room 24" "Room 25" "Room 26" "Room 27" "Room 28" "Room 29" "Room 30"
        "Room 31" "Room 32" "Room 33" "Room 34" "Room 35" "Room 36" "Room 37" "Room 38" "Room 39" "Room 40"
        "Room 41" "Room 42" "Room 43" "Room 44" "Room 45" "Room 46" "Room 47" "Room 48" "Room 49" "Room 50")

HAISHIN_NO=("配信 1" "配信 2" "配信 3" "配信 4" "配信 5" "配信 6" "配信 7" "配信 8" "配信 9" "配信 10"
            "配信 11" "配信 12" "配信 13" "配信 14" "配信 15" "配信 16" "配信 17" "配信 18" "配信 19" "配信 20"
            "配信 21" "配信 22" "配信 23" "配信 24" "配信 25" "配信 26" "配信 27" "配信 28" "配信 29" "配信 30"
            "配信 31" "配信 32" "配信 33" "配信 34" "配信 35" "配信 36" "配信 37" "配信 38" "配信 39" "配信 40"
            "配信 41" "配信 42" "配信 43" "配信 44" "配信 45" "配信 46" "配信 47" "配信 48" "配信 49" "配信 50")

HAISHIN_ALPHABET=("配信 A" "配信 B" "配信 C" "配信 D" "配信 E" "配信 F" "配信 G" "配信 H" "配信 I" "配信 J"
                  "配信 K" "配信 L" "配信 M" "配信 N" "配信 O" "配信 P" "配信 Q" "配信 R" "配信 S" "配信 T"
                  "配信 U" "配信 V" "配信 W" "配信 X" "配信 Y" "配信 Z" "配信 AA" "配信 BB" "配信 CC" "配信 DD"
                  "配信 EE" "配信 FF" "配信 GG" "配信 HH" "配信 II" "配信 JJ" "配信 KK" "配信 LL" "配信 MM" "配信 NN"
                  "配信 OO" "配信 PP" "配信 QQ" "配信 RR" "配信 SS" "配信 TT" "配信 UU" "配信 VV" "配信 WW" "配信 XX")


PATTERN=$(osascript -e 'choose from list {"ALPHABET", "ROOM ALPHABET", "NUMBER", "HAISHIN-No", "HAISHIN-Alphabet"} with prompt "Select pattern (A_ or Room A or Room 1 or 配信 1 or 配信 A) :"')

case $PATTERN in
  "ALPHABET")
    NAME_ARRAY=("${ALPHABET[@]}")
    ;;
  "ROOM ALPHABET")
    NAME_ARRAY=("${ROOM[@]}")
    ;;
  "NUMBER")
    NAME_ARRAY=("${NUMBER[@]}")
    ;;
  "HAISHIN-No")
    NAME_ARRAY=("${HAISHIN_NO[@]}")
    ;;
  "HAISHIN-Alphabet")
    NAME_ARRAY=("${HAISHIN_ALPHABET[@]}")
    ;;
  *)
    echo "Invalid pattern selected."
    exit 1
    ;;
esac

USER_INDEX=$(osascript -e 'text returned of (display dialog "Enter USER_INDEX ※1にすると「A_」から、2にすると「B_」から頭に名前がつきます:" default answer "1")')
 # USER_INDEXを1にするとAから、2にするとBから名前がつきます

for (( i = 1; i <= $N; i++ )); do
  USER_NAME=${NAME_ARRAY[$USER_INDEX]}
  open -n "zoommtg://zoom.us/join?confno=$ID&pwd=$PASSWORD&uname=$USER_NAME&zc=0"

  USER_INDEX=$(( (USER_INDEX+1) % ${#NAME_ARRAY[@]} ))
done

exit 0
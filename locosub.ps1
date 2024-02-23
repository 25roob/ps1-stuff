function LongestCommonSubsequence($text1,$text2) {
    #param($text1,$text2);
    echo $text1
    echo $text2

    $n = $text1.Length
    $m = $text2.Length

    #echo $text1 'len1' $m $text2 'len2' $n

    $L = [int[,]]::new(($n+2),($m+2))

    for ($i = 1; $i -le ($n + 1); $i++) {
        for ($j = 1; $j -le ($m + 1); $j++) {
            #echo ('text1: '+ $text1) ('i: '+ $i) ('text2: '+ $text2) ('j: ' + $j)
            if ($text1[$i-1] -eq $text2[$j-1]) {
                $L[$i,$j] = 1 + $L[($i-1),($j-1)]
            }
            else {
                $L[$i,$j] = ($L[($i-1),$j], $L[$i,($j-1)] | Measure -Max).Maximum
            }
        }
    }
    Echo $L[$n,$m]

    $s = ''
    $i = $n +1
    $j = $m +1
    while ($i -ge -1 -and $j -ge -1) {
        if ($text1[$i] -eq $text2[$j]) {
            $s = $text2[$i] + $s
            $i--
            $j--
        }
        elseif ($L[($i-1),$j] -le $L[$i,($j-1)]) {
            $j--
        }
        else {
            $i--
        }
    }
    echo $s
    echo '------------'
}

LongestCommonSubsequence "abcde" "ace"

LongestCommonSubsequence "abc" "def"

LongestCommonSubsequence "iitt" "tttttttttt"

#LongestCommonSubsequence "MSDSLNHPSSSTVHADDGFEPPTSPEDNNKKPSLEQIKQEREALFTDLFADRRRSARSVIEEAFQNELMSAEPVQPNVPNPHSIPIRFRHQPVAGPAHDVFGDAVHSIFQKIMSRGVNADYSHWMSYWIALGIDKKTQMNYHMKPFCKDTYATEGSLEAKQTFTDKIRSAVEEIIWKSAEYCDILSEKWTGIHVSADQLKGQRNKQEDRFVAYPNGQYMNRGQSDISLLAVFDGHGGHECSQYAAAHFWEAWSDAQHHHSQDMKLDELLEKALETLDERMTVRSVRESWKGGTTAVCCAVDLNTNQIAFAWLGDSPGYIMSNLEFRKFTTEHSPSDPEECRRVEEVGGQIFVIGGELRVNGVLNLTRALGDVPGRPMISNKPDTLLKTIEPADYLVLLACDGISDVFNTSDLYNLVQAFVNEYDVEDYHELARYICNQAVSAGSADNVTVVIGFLRPPEDVWRVMKTDSDDEESELEEEDDNE" "MEKVNEERDAVFEDHIGDRRRSVRSLLEEAFADEMEKTSYDVEVADTPQPHIPIRFRHPPIAGPVHDVFGDAIHDIFQKMMKRGQAVDFCHWVSHLIATEIDEKFSEVAFRDVQYNPDIYVTDSTTEAKKLFNDKIWPAIDKILQQNAETCPILSEKWSGIHVSGDQLKGQRHKQEDRFLAYPNGQYMDRGEDPISVLAVFDGHGGHECSQYAAGHLWETWLEVRKSRDPSDSLEDQLRKSLELLDERMTVRSVKECWKGGSTAVCCAIDMDQKLMALAWLGDSPGYVMSNIEFRQLTRGHSPSDEREARRVEEAGGQLFVIGGELRVNGVLNLTRALGDVPGRPMISNEPETCQVPIESSDYLVLLACDGISDVFNERDLYQLVEAFANDYPVEDYAELSRFICTKAIEAGSADNVSVVIGFLRPPQDVWKLMKHESDDEDSDVTDEE"

#LongestCommonSubsequence "jduirerawykaiwuavukhrzhrkmrrsgvhkvorntvritqrikfrsowwvqqqmhlhotjhejvsqgcdooqxddogyuknrlircvibjrvpnagltihrkporzbpcopxshjpnotcrdtwomegqvlbbwhnaxgiiyojgzcdjzapcxsdjryotvpybpyrpomtbxtjmeionxqmypkhtwklicxoahrggebhisypyjepbehretsucyjbycemhochgexmjryiehrkvjpaflpkdeqzvmlxzfddgqfzpugqxufqgsdomwtwlulyzoghcadlkizvxxkjuucycgkaaiyxbtchgkrlmgoyiybooskaimdmbgdunnaetobnvdmafxflddipayovckxclvrhvcvwkxkzcchecswecdpjhbmgyqpvhbuvjefuqjryfiemmolboenvqebszzphxxircsreeyyybvkndakdtgbzfhprcxzzpvhwsqfjxxphgxirciruvlpzirfkengtlihkftqwbxxbizgdosnkorwdctuadclrdxpbtasewryelndvpbqeovpjxfkpsieauewhvourullpeeergppcajiglrpubywcngksnltjucbaapjpphcrbhdnldhobvtpgmzulzcfcrrwmqorxobnugdrspdxlcrahlsiadousabbneeasaxpwvkwkajiliqqjjbuautnmorrmhkpbagztvhotxlwrxxwfpwbamhjogguaubvyhtthjcgybyszjsazqtodwsshxargcydrbpdqgeehzpzjeckqjvuhdnkjffhmgbywhkcvzinqvhjqqtgvzildpjlnummlxmbqsrxtpwcpgezhxmphwoxzeruogaxytsyvrafqnowsskzhpfjruykkxftbxedznpmhcabdvwutnoyvwvzdhezagvlbbzihzpvrvvwnftgleyzyjldnfdwezzjsiinzqobgwevgifliyngizlkjyoawjlcmnkalyqfc" "bcrvkxirhlayhntityxpewodsaxukgleifcyfxzroxhekjqwhiltrahuwjjtqprhsaajtojzaabgykkylnebewxjkwcchejchefbikcltdrrvfqfjdzeyqkinufmebjankixhdsvtynzheihvhceyuuwrqhoagyeihaimxuodjnkryflzqirsgoiithsrdecijeuylfudpotgvhcmixjvlwnwdmpaukzmiatzvvbilydajfvhofewpxdzynchdcimywmunjhlndfaqecawmneinwazlvuafwghxqtbmunjbppgdpoklsqetuktjglkqelxknepxmpupteauyimcrwqzdofthulkoqhmjsnstdsvbsvtunoiytycfvzaazxflusdbbylrhbvbdzayjjhuzptbfgpzhhozotgbmnhstopclzamvxstoukmqaeqryxjylubkojpyhrofcngydxcurvncwbypfbqmhtflrfwdtckfowkjyareehfvkzjyhblenbimgjdtkgewmrzeuiojkuaqwfibfsbbbqinxxfuezzhgrndzcrjqdfxjwnqsrhukncrmapdvgyjeibmmewtwysuxddrtegebwpudmukgphrlwwopsyipooljpteojxyrkigtmhhntlhggdvgujpctycbebsszpwxzzxxmlwosoeerstgjwxdhctolxrfyeatdociyymxvqajikjxqxhfaegmudedtuiqmoouifvtxwhiyvkvpaljxhnfdgeraezjjthvktdibqtteaveqeikylkdoudjxwlgmuyapghfjodmsttvlgnjgfvtcrjunqckgicztpxhpsoracexdafcwkqpeyjwxmhyjctbmngzqjfvnveruvlbpbldhgofofdkmvwgsnnzutlpjbmsoszsycvuhgoobxwiqnvwmqgcvcvyexvoxciqgwrvpdjmogqbmmoeymcbxbynljfwpjbklxszouoxuuqrgmjwmq"

LongestCommonSubsequence "gcgcgtgcgcggaaggagccaaggtgaagttgtagcagtgtgtcagaagaggtgcgtggcaccatgctgtcccccgaggcggagcgggtgctgcggtacctggtcgaagtagaggagttg" "gacttgtggaacctacttcctgaaaataaccttctgtcctccgagctctccgcacccgtggatgacctgctcccgtacacagatgttgccacctggctggatgaatgtccgaatgaagcg"

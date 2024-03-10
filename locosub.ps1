function LongestCommonSubsequence($text1,$text2,$matrix = 'y') {

#Length of the Longest Common Subsequence, obtained by DP memoization
    Write-Output ('Text 1: ' + $text1)     # Writes Text1 in the Console
    Write-Output ('Text 2: ' + $text2) ''  # Writes Text2 in the console

    $n = $text1.Length # Gets the length of Text1 and stores it as $n
    $m = $text2.Length # Gets The length of Text2 and stores it as $m

    $L = [int[,]]::new(($n+2),($m+2)) # Builds the empty matrix

    for ($i = 1; $i -le ($n + 1); $i++) {         # Moves the pointer between rows
        for ($j = 1; $j -le ($m + 1); $j++) {     # Moves the pointer between columns
            if ($text1[$i-1] -eq $text2[$j-1]) {  # Validates if the chars in the axes match
                # Adds 1 to the value at the top left if they match
                $L[$i,$j] = 1 + $L[($i-1),($j-1)] 
            }
            else {  # The instruction belows gets the biggest value betwen top and left ones
                $L[$i,$j] = ($L[($i-1),$j], $L[$i,($j-1)] | Measure-Object -Max).Maximum
            }
        }
    } 
    Write-Output ('Length of the Longest Common Subsequence: ' + $L[$n,$m].ToString())

#Actual Longest Common Sequence Subsequence printing section:
    $s = ''  # We are going to store the sequence here
    $i = $n  # This pointer is set to the bottom of the matrix
    $j = $m  # This pointer is set to rightmost part of the matrix
    
    # The process will end when the top or leftmost part of the matrix are reached
    while ($i -ge 1 -and $j -ge 1) { 
        # If the characters at the axes match...
        if ($text1[($i-1)] -eq $text2[($j-1)]) {
            $s = $text1[($i-1)] + $s  # We will add it to the fron of the result
            $i--                      # Move the pointer to the top
            $j--                      # Move the pointer to the left
            
        }
        # If the value at the top is smaller than the value at the left
        elseif ($L[($i-1),$j] -le $L[$i,($j-1)]) {
            $j-- # Move the pointer to the left
        }
        else {
            $i-- # Move the pointer to the top
        }
    }
    Write-Output ('Longest Common Subsequence: ' + $s) # Prints the sequence itself
    Write-Output ''

#Bonus
#Matrix printing section:
    if ($matrix -eq 'y') { # Conditional to avoild printing the matrix if it's not needed
    $bl1 = ' '
    $bl2 = '  '
    if ($L[$n,$m] -ge 10) {$bl = $bl2}
    $bl = '  '
    $mi = '   ' + $bl
    # Prints the Text2 at the header
    for($i = 0; $i -lt $m; $i++) { $mi += ($text2[$i] + $bl) }
    Write-Output $mi
    $mi = ''
    # Prints each row of the matrix
    for ($i = 0; $i -lt ($n+1); $i++) { 
        # Prints each value of the matrix
        for ($j = 0; $j -lt ($m+1); $j++) { 
            if ($L[($i),($j+1)] -ge 10) {$bl = $bl1} else {$bl = $bl2}
            $mi += $L[($i),($j)].ToString() + $bl
        }

        if ($i -eq 0) { $mi = '  ' + $mi}
        # Adds each char of Text1 to the start of each row
        else {$mi = $text1[($i-1)] + ' ' + $mi} 
        Write-Output $mi
        $mi = ''
        if ($L[$n,$m] -ge 10) {$bl = $bl2}
    }
    }

    Write-Output '------------'
}

LongestCommonSubsequence "abcde" "ace"

#LongestCommonSubsequence "abc" "def"

#LongestCommonSubsequence "iitt" "tttttttttt"

LongestCommonSubsequence "TCCGTAGGTGAACCTGCGG" "TCCTCCGCTTATTGATATGC" 

#LongestCommonSubsequence "MSDSLNHPSSSTVHADDGFEPPTSPEDNNKKPSLEQIKQEREALFTDLFADRRRSARSVIEEAFQNELMSAEPVQPNVPNPHSIPIRFRHQPVAGPAHDVFGDAVHSIFQKIMSRGVNADYSHWMSYWIALGIDKKTQMNYHMKPFCKDTYATEGSLEAKQTFTDKIRSAVEEIIWKSAEYCDILSEKWTGIHVSADQLKGQRNKQEDRFVAYPNGQYMNRGQSDISLLAVFDGHGGHECSQYAAAHFWEAWSDAQHHHSQDMKLDELLEKALETLDERMTVRSVRESWKGGTTAVCCAVDLNTNQIAFAWLGDSPGYIMSNLEFRKFTTEHSPSDPEECRRVEEVGGQIFVIGGELRVNGVLNLTRALGDVPGRPMISNKPDTLLKTIEPADYLVLLACDGISDVFNTSDLYNLVQAFVNEYDVEDYHELARYICNQAVSAGSADNVTVVIGFLRPPEDVWRVMKTDSDDEESELEEEDDNE" "MEKVNEERDAVFEDHIGDRRRSVRSLLEEAFADEMEKTSYDVEVADTPQPHIPIRFRHPPIAGPVHDVFGDAIHDIFQKMMKRGQAVDFCHWVSHLIATEIDEKFSEVAFRDVQYNPDIYVTDSTTEAKKLFNDKIWPAIDKILQQNAETCPILSEKWSGIHVSGDQLKGQRHKQEDRFLAYPNGQYMDRGEDPISVLAVFDGHGGHECSQYAAGHLWETWLEVRKSRDPSDSLEDQLRKSLELLDERMTVRSVKECWKGGSTAVCCAIDMDQKLMALAWLGDSPGYVMSNIEFRQLTRGHSPSDEREARRVEEAGGQLFVIGGELRVNGVLNLTRALGDVPGRPMISNEPETCQVPIESSDYLVLLACDGISDVFNERDLYQLVEAFANDYPVEDYAELSRFICTKAIEAGSADNVSVVIGFLRPPQDVWKLMKHESDDEDSDVTDEE"

#LongestCommonSubsequence "jduirerawykaiwuavukhrzhrkmrrsgvhkvorntvritqrikfrsowwvqqqmhlhotjhejvsqgcdooqxddogyuknrlircvibjrvpnagltihrkporzbpcopxshjpnotcrdtwomegqvlbbwhnaxgiiyojgzcdjzapcxsdjryotvpybpyrpomtbxtjmeionxqmypkhtwklicxoahrggebhisypyjepbehretsucyjbycemhochgexmjryiehrkvjpaflpkdeqzvmlxzfddgqfzpugqxufqgsdomwtwlulyzoghcadlkizvxxkjuucycgkaaiyxbtchgkrlmgoyiybooskaimdmbgdunnaetobnvdmafxflddipayovckxclvrhvcvwkxkzcchecswecdpjhbmgyqpvhbuvjefuqjryfiemmolboenvqebszzphxxircsreeyyybvkndakdtgbzfhprcxzzpvhwsqfjxxphgxirciruvlpzirfkengtlihkftqwbxxbizgdosnkorwdctuadclrdxpbtasewryelndvpbqeovpjxfkpsieauewhvourullpeeergppcajiglrpubywcngksnltjucbaapjpphcrbhdnldhobvtpgmzulzcfcrrwmqorxobnugdrspdxlcrahlsiadousabbneeasaxpwvkwkajiliqqjjbuautnmorrmhkpbagztvhotxlwrxxwfpwbamhjogguaubvyhtthjcgybyszjsazqtodwsshxargcydrbpdqgeehzpzjeckqjvuhdnkjffhmgbywhkcvzinqvhjqqtgvzildpjlnummlxmbqsrxtpwcpgezhxmphwoxzeruogaxytsyvrafqnowsskzhpfjruykkxftbxedznpmhcabdvwutnoyvwvzdhezagvlbbzihzpvrvvwnftgleyzyjldnfdwezzjsiinzqobgwevgifliyngizlkjyoawjlcmnkalyqfc" "bcrvkxirhlayhntityxpewodsaxukgleifcyfxzroxhekjqwhiltrahuwjjtqprhsaajtojzaabgykkylnebewxjkwcchejchefbikcltdrrvfqfjdzeyqkinufmebjankixhdsvtynzheihvhceyuuwrqhoagyeihaimxuodjnkryflzqirsgoiithsrdecijeuylfudpotgvhcmixjvlwnwdmpaukzmiatzvvbilydajfvhofewpxdzynchdcimywmunjhlndfaqecawmneinwazlvuafwghxqtbmunjbppgdpoklsqetuktjglkqelxknepxmpupteauyimcrwqzdofthulkoqhmjsnstdsvbsvtunoiytycfvzaazxflusdbbylrhbvbdzayjjhuzptbfgpzhhozotgbmnhstopclzamvxstoukmqaeqryxjylubkojpyhrofcngydxcurvncwbypfbqmhtflrfwdtckfowkjyareehfvkzjyhblenbimgjdtkgewmrzeuiojkuaqwfibfsbbbqinxxfuezzhgrndzcrjqdfxjwnqsrhukncrmapdvgyjeibmmewtwysuxddrtegebwpudmukgphrlwwopsyipooljpteojxyrkigtmhhntlhggdvgujpctycbebsszpwxzzxxmlwosoeerstgjwxdhctolxrfyeatdociyymxvqajikjxqxhfaegmudedtuiqmoouifvtxwhiyvkvpaljxhnfdgeraezjjthvktdibqtteaveqeikylkdoudjxwlgmuyapghfjodmsttvlgnjgfvtcrjunqckgicztpxhpsoracexdafcwkqpeyjwxmhyjctbmngzqjfvnveruvlbpbldhgofofdkmvwgsnnzutlpjbmsoszsycvuhgoobxwiqnvwmqgcvcvyexvoxciqgwrvpdjmogqbmmoeymcbxbynljfwpjbklxszouoxuuqrgmjwmq"

LongestCommonSubsequence "gcgcgtgcgcggaaggagccaaggtgaagttgtagcagtgtgtcagaagaggtgcgtggcaccatgctgtcccccgaggcggagcgggtgctgcggtacctggtcgaagtagaggagttg" "gacttgtggaacctacttcctgaaaataaccttctgtcctccgagctctccgcacccgtggatgacctgctcccgtacacagatgttgccacctggctggatgaatgtccgaatgaagcg" -matrix 'n'

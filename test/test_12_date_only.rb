# -*- coding: utf-8 -*-
###############################################################################
#
# A test for WriteExcel.
#
# Tests date and time handling. Tests dates in 1900 and 1904 format.
#
# reverse('©'), May 2004, John McNamara, jmcnamara@cpan.org
#
# original written in Perl by John McNamara
# converted to Ruby by Hideo Nakamura, cxn03651@msj.biglobe.ne.jp
#
############################################################################
require 'helper'
require 'stringio'

class TC_data_only < Test::Unit::TestCase

  def setup
    @workbook  = WriteExcel.new(StringIO.new)
    @worksheet = @workbook.add_worksheet
  end

  def teardown
    @workbook.close
  end

  def test_the_dates_generated_by_excel
    lines = data_generated_excel.split(/\n/)
    while !lines.empty?
      line = lines.shift.sub(/^\s*/,'')
      braak if line =~ /^\s*# stop/  # For debugging

      @worksheet.date_1904 = false if line =~ /Excel 1900/
      @worksheet.date_1904 = true  if line =~ /Excel 1904/

      next  unless line =~ /\S/      # Ignore blank lines
      next  if line =~ /^\s*#/       # Ignore comments

      count, date, result = line.split(/\s+/)
      number = @worksheet.convert_date_time(date)
      number = -1 if number.nil?
      assert_equal(result.to_i, number,
      "Testing convert_date_time: #{date} #{result}")
    end
  end

  def data_generated_excel

    return <<-__DATA_END__

    #
    # The following data was generated by Excel.
    #

    #
    # Excel 1900 date system
    #
    1      1899-12-31T    0
    2      1900-01-00T    0
    3      1900-01-01T    1
    4      1900-02-27T    58
    5      1900-02-28T    59
    6      1900-02-29T    60
    7      1900-03-01T    61
    8      1900-03-02T    62
    9      1900-03-11T    71
    10     1900-04-08T    99
    11     1900-09-12T    256
    12     1901-05-03T    489
    13     1901-10-13T    652
    14     1902-02-15T    777
    15     1902-06-06T    888
    16     1902-09-25T    999
    17     1902-09-27T    1001
    18     1903-04-26T    1212
    19     1903-08-05T    1313
    20     1903-12-31T    1461
    21     1904-01-01T    1462
    22     1904-02-28T    1520
    23     1904-02-29T    1521
    24     1904-03-01T    1522
    25     1907-02-27T    2615
    26     1907-02-28T    2616
    27     1907-03-01T    2617
    28     1907-03-02T    2618
    29     1907-03-03T    2619
    30     1907-03-04T    2620
    31     1907-03-05T    2621
    32     1907-03-06T    2622
    33     1999-01-01T    36161
    34     1999-01-31T    36191
    35     1999-02-01T    36192
    36     1999-02-28T    36219
    37     1999-03-01T    36220
    38     1999-03-31T    36250
    39     1999-04-01T    36251
    40     1999-04-30T    36280
    41     1999-05-01T    36281
    42     1999-05-31T    36311
    43     1999-06-01T    36312
    44     1999-06-30T    36341
    45     1999-07-01T    36342
    46     1999-07-31T    36372
    47     1999-08-01T    36373
    48     1999-08-31T    36403
    49     1999-09-01T    36404
    50     1999-09-30T    36433
    51     1999-10-01T    36434
    52     1999-10-31T    36464
    53     1999-11-01T    36465
    54     1999-11-30T    36494
    55     1999-12-01T    36495
    56     1999-12-31T    36525
    57     2000-01-01T    36526
    58     2000-01-31T    36556
    59     2000-02-01T    36557
    60     2000-02-29T    36585
    61     2000-03-01T    36586
    62     2000-03-31T    36616
    63     2000-04-01T    36617
    64     2000-04-30T    36646
    65     2000-05-01T    36647
    66     2000-05-31T    36677
    67     2000-06-01T    36678
    68     2000-06-30T    36707
    69     2000-07-01T    36708
    70     2000-07-31T    36738
    71     2000-08-01T    36739
    72     2000-08-31T    36769
    73     2000-09-01T    36770
    74     2000-09-30T    36799
    75     2000-10-01T    36800
    76     2000-10-31T    36830
    77     2000-11-01T    36831
    78     2000-11-30T    36860
    79     2000-12-01T    36861
    80     2000-12-31T    36891
    81     2001-01-01T    36892
    82     2001-01-31T    36922
    83     2001-02-01T    36923
    84     2001-02-28T    36950
    85     2001-03-01T    36951
    86     2001-03-31T    36981
    87     2001-04-01T    36982
    88     2001-04-30T    37011
    89     2001-05-01T    37012
    90     2001-05-31T    37042
    91     2001-06-01T    37043
    92     2001-06-30T    37072
    93     2001-07-01T    37073
    94     2001-07-31T    37103
    95     2001-08-01T    37104
    96     2001-08-31T    37134
    97     2001-09-01T    37135
    98     2001-09-30T    37164
    99     2001-10-01T    37165
    100    2001-10-31T    37195
    101    2001-11-01T    37196
    102    2001-11-30T    37225
    103    2001-12-01T    37226
    104    2001-12-31T    37256
    105    2400-01-01T    182623
    106    2400-01-31T    182653
    107    2400-02-01T    182654
    108    2400-02-29T    182682
    109    2400-03-01T    182683
    110    2400-03-31T    182713
    111    2400-04-01T    182714
    112    2400-04-30T    182743
    113    2400-05-01T    182744
    114    2400-05-31T    182774
    115    2400-06-01T    182775
    116    2400-06-30T    182804
    117    2400-07-01T    182805
    118    2400-07-31T    182835
    119    2400-08-01T    182836
    120    2400-08-31T    182866
    121    2400-09-01T    182867
    122    2400-09-30T    182896
    123    2400-10-01T    182897
    124    2400-10-31T    182927
    125    2400-11-01T    182928
    126    2400-11-30T    182957
    127    2400-12-01T    182958
    128    2400-12-31T    182988
    129    4000-01-01T    767011
    130    4000-01-31T    767041
    131    4000-02-01T    767042
    132    4000-02-29T    767070
    133    4000-03-01T    767071
    134    4000-03-31T    767101
    135    4000-04-01T    767102
    136    4000-04-30T    767131
    137    4000-05-01T    767132
    138    4000-05-31T    767162
    139    4000-06-01T    767163
    140    4000-06-30T    767192
    141    4000-07-01T    767193
    142    4000-07-31T    767223
    143    4000-08-01T    767224
    144    4000-08-31T    767254
    145    4000-09-01T    767255
    146    4000-09-30T    767284
    147    4000-10-01T    767285
    148    4000-10-31T    767315
    149    4000-11-01T    767316
    150    4000-11-30T    767345
    151    4000-12-01T    767346
    152    4000-12-31T    767376
    153    4321-01-01T    884254
    154    4321-01-31T    884284
    155    4321-02-01T    884285
    156    4321-02-28T    884312
    157    4321-03-01T    884313
    158    4321-03-31T    884343
    159    4321-04-01T    884344
    160    4321-04-30T    884373
    161    4321-05-01T    884374
    162    4321-05-31T    884404
    163    4321-06-01T    884405
    164    4321-06-30T    884434
    165    4321-07-01T    884435
    166    4321-07-31T    884465
    167    4321-08-01T    884466
    168    4321-08-31T    884496
    169    4321-09-01T    884497
    170    4321-09-30T    884526
    171    4321-10-01T    884527
    172    4321-10-31T    884557
    173    4321-11-01T    884558
    174    4321-11-30T    884587
    175    4321-12-01T    884588
    176    4321-12-31T    884618
    177    9999-01-01T    2958101
    178    9999-01-31T    2958131
    179    9999-02-01T    2958132
    180    9999-02-28T    2958159
    181    9999-03-01T    2958160
    182    9999-03-31T    2958190
    183    9999-04-01T    2958191
    184    9999-04-30T    2958220
    185    9999-05-01T    2958221
    186    9999-05-31T    2958251
    187    9999-06-01T    2958252
    188    9999-06-30T    2958281
    189    9999-07-01T    2958282
    190    9999-07-31T    2958312
    191    9999-08-01T    2958313
    192    9999-08-31T    2958343
    193    9999-09-01T    2958344
    194    9999-09-30T    2958373
    195    9999-10-01T    2958374
    196    9999-10-31T    2958404
    197    9999-11-01T    2958405
    198    9999-11-30T    2958434
    199    9999-12-01T    2958435
    200    9999-12-31T    2958465

    #
    # Excel 1904 date system
    #
    201    1904-01-01T    0
    202    1904-01-31T    30
    203    1904-02-01T    31
    204    1904-02-29T    59
    205    1904-03-01T    60
    206    1904-03-31T    90
    207    1904-04-01T    91
    208    1904-04-30T    120
    209    1904-05-01T    121
    210    1904-05-31T    151
    211    1904-06-01T    152
    212    1904-06-30T    181
    213    1904-07-01T    182
    214    1904-07-31T    212
    215    1904-08-01T    213
    216    1904-08-31T    243
    217    1904-09-01T    244
    218    1904-09-30T    273
    219    1904-10-01T    274
    220    1904-10-31T    304
    221    1904-11-01T    305
    222    1904-11-30T    334
    223    1904-12-01T    335
    224    1904-12-31T    365
    225    1907-02-27T    1153
    226    1907-02-28T    1154
    227    1907-03-01T    1155
    228    1907-03-02T    1156
    229    1907-03-03T    1157
    230    1907-03-04T    1158
    231    1907-03-05T    1159
    232    1907-03-06T    1160
    233    1999-01-01T    34699
    234    1999-01-31T    34729
    235    1999-02-01T    34730
    236    1999-02-28T    34757
    237    1999-03-01T    34758
    238    1999-03-31T    34788
    239    1999-04-01T    34789
    240    1999-04-30T    34818
    241    1999-05-01T    34819
    242    1999-05-31T    34849
    243    1999-06-01T    34850
    244    1999-06-30T    34879
    245    1999-07-01T    34880
    246    1999-07-31T    34910
    247    1999-08-01T    34911
    248    1999-08-31T    34941
    249    1999-09-01T    34942
    250    1999-09-30T    34971
    251    1999-10-01T    34972
    252    1999-10-31T    35002
    253    1999-11-01T    35003
    254    1999-11-30T    35032
    255    1999-12-01T    35033
    256    1999-12-31T    35063
    257    2000-01-01T    35064
    258    2000-01-31T    35094
    259    2000-02-01T    35095
    260    2000-02-29T    35123
    261    2000-03-01T    35124
    262    2000-03-31T    35154
    263    2000-04-01T    35155
    264    2000-04-30T    35184
    265    2000-05-01T    35185
    266    2000-05-31T    35215
    267    2000-06-01T    35216
    268    2000-06-30T    35245
    269    2000-07-01T    35246
    270    2000-07-31T    35276
    271    2000-08-01T    35277
    272    2000-08-31T    35307
    273    2000-09-01T    35308
    274    2000-09-30T    35337
    275    2000-10-01T    35338
    276    2000-10-31T    35368
    277    2000-11-01T    35369
    278    2000-11-30T    35398
    279    2000-12-01T    35399
    280    2000-12-31T    35429
    281    2001-01-01T    35430
    282    2001-01-31T    35460
    283    2001-02-01T    35461
    284    2001-02-28T    35488
    285    2001-03-01T    35489
    286    2001-03-31T    35519
    287    2001-04-01T    35520
    288    2001-04-30T    35549
    289    2001-05-01T    35550
    290    2001-05-31T    35580
    291    2001-06-01T    35581
    292    2001-06-30T    35610
    293    2001-07-01T    35611
    294    2001-07-31T    35641
    295    2001-08-01T    35642
    296    2001-08-31T    35672
    297    2001-09-01T    35673
    298    2001-09-30T    35702
    299    2001-10-01T    35703
    300    2001-10-31T    35733
    301    2001-11-01T    35734
    302    2001-11-30T    35763
    303    2001-12-01T    35764
    304    2001-12-31T    35794
    305    2400-01-01T    181161
    306    2400-01-31T    181191
    307    2400-02-01T    181192
    308    2400-02-29T    181220
    309    2400-03-01T    181221
    310    2400-03-31T    181251
    311    2400-04-01T    181252
    312    2400-04-30T    181281
    313    2400-05-01T    181282
    314    2400-05-31T    181312
    315    2400-06-01T    181313
    316    2400-06-30T    181342
    317    2400-07-01T    181343
    318    2400-07-31T    181373
    319    2400-08-01T    181374
    320    2400-08-31T    181404
    321    2400-09-01T    181405
    322    2400-09-30T    181434
    323    2400-10-01T    181435
    324    2400-10-31T    181465
    325    2400-11-01T    181466
    326    2400-11-30T    181495
    327    2400-12-01T    181496
    328    2400-12-31T    181526
    329    4000-01-01T    765549
    330    4000-01-31T    765579
    331    4000-02-01T    765580
    332    4000-02-29T    765608
    333    4000-03-01T    765609
    334    4000-03-31T    765639
    335    4000-04-01T    765640
    336    4000-04-30T    765669
    337    4000-05-01T    765670
    338    4000-05-31T    765700
    339    4000-06-01T    765701
    340    4000-06-30T    765730
    341    4000-07-01T    765731
    342    4000-07-31T    765761
    343    4000-08-01T    765762
    344    4000-08-31T    765792
    345    4000-09-01T    765793
    346    4000-09-30T    765822
    347    4000-10-01T    765823
    348    4000-10-31T    765853
    349    4000-11-01T    765854
    350    4000-11-30T    765883
    351    4000-12-01T    765884
    352    4000-12-31T    765914
    353    4321-01-01T    882792
    354    4321-01-31T    882822
    355    4321-02-01T    882823
    356    4321-02-28T    882850
    357    4321-03-01T    882851
    358    4321-03-31T    882881
    359    4321-04-01T    882882
    360    4321-04-30T    882911
    361    4321-05-01T    882912
    362    4321-05-31T    882942
    363    4321-06-01T    882943
    364    4321-06-30T    882972
    365    4321-07-01T    882973
    366    4321-07-31T    883003
    367    4321-08-01T    883004
    368    4321-08-31T    883034
    369    4321-09-01T    883035
    370    4321-09-30T    883064
    371    4321-10-01T    883065
    372    4321-10-31T    883095
    373    4321-11-01T    883096
    374    4321-11-30T    883125
    375    4321-12-01T    883126
    376    4321-12-31T    883156
    377    9999-01-01T    2956639
    378    9999-01-31T    2956669
    379    9999-02-01T    2956670
    380    9999-02-28T    2956697
    381    9999-03-01T    2956698
    382    9999-03-31T    2956728
    383    9999-04-01T    2956729
    384    9999-04-30T    2956758
    385    9999-05-01T    2956759
    386    9999-05-31T    2956789
    387    9999-06-01T    2956790
    388    9999-06-30T    2956819
    389    9999-07-01T    2956820
    390    9999-07-31T    2956850
    391    9999-08-01T    2956851
    392    9999-08-31T    2956881
    393    9999-09-01T    2956882
    394    9999-09-30T    2956911
    395    9999-10-01T    2956912
    396    9999-10-31T    2956942
    397    9999-11-01T    2956943
    398    9999-11-30T    2956972
    399    9999-12-01T    2956973
    400    9999-12-31T    2957003


    #
    # The following dates are invalid.
    #

    #
    # Excel 1900 date system
    #
    401    0000-12-30T    -1 # Below year range.
    402    1000-12-30T    -1 # Below year range.
    403    1899-12-30T    -1 # Below year range.
    404    2002-02-29T    -1 # False leap-day.
    405    2000-00-00T    -1 # No month or day.
    406    2000-01-00T    -1 # No day.
    407    2000-00-01T    -1 # No month.
    408    2000-13-01T    -1 # Month out of range.
    409    2000-12-32T    -1 # Day out of range.
    410   10000-01-01T    -1 # Year out of range.

    #
    # Excel 1904 date system
    #
    411    1899-12-31T    -1 # Below year range.
    412    1900-01-01T    -1 # Below year range.
    413    1903-12-31T    -1 # Below year range.
    414    2001-02-29T    -1 # False leap-day.
    415    2000-00-00T    -1 # No month or day.
    416    2000-01-00T    -1 # No day.
    417    2000-00-01T    -1 # No month.
    418    2000-13-01T    -1 # Month out of range.
    419    2000-12-32T    -1 # Day out of range.
    420   10000-01-01T    -1 # Year out of range.

    __DATA_END__

  end

end

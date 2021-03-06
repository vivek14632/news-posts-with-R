Using an example dataset
>sysuse auto.dta

Summarize the dataset
> summarize
. summarize

    Variable |       Obs        Mean    Std. Dev.       Min        Max
-------------+--------------------------------------------------------
        make |         0
       price |        74    6165.257    2949.496       3291      15906
         mpg |        74     21.2973    5.785503         12         41
       rep78 |        69    3.405797    .9899323          1          5
    headroom |        74    2.993243    .8459948        1.5          5
-------------+--------------------------------------------------------
       trunk |        74    13.75676    4.277404          5         23
      weight |        74    3019.459    777.1936       1760       4840
      length |        74    187.9324    22.26634        142        233
        turn |        74    39.64865    4.399354         31         51
displacement |        74    197.2973    91.83722         79        425
-------------+--------------------------------------------------------
  gear_ratio |        74    3.014865    .4562871       2.19       3.89
     foreign |        74    .2972973    .4601885          0          1

. 

get description of the variables
>describe

. describe

Contains data from \\gump.forest.usf.edu\stata13$\ado\base/a/auto.dta
  obs:            74                          1978 Automobile Data
 vars:            12                          13 Apr 2013 17:45
 size:         3,182                          (_dta has notes)
--------------------------------------------------------------------------------------------------
              storage   display    value
variable name   type    format     label      variable label
--------------------------------------------------------------------------------------------------
make            str18   %-18s                 Make and Model
price           int     %8.0gc                Price
mpg             int     %8.0g                 Mileage (mpg)
rep78           int     %8.0g                 Repair Record 1978
headroom        float   %6.1f                 Headroom (in.)
trunk           int     %8.0g                 Trunk space (cu. ft.)
weight          int     %8.0gc                Weight (lbs.)
length          int     %8.0g                 Length (in.)
turn            int     %8.0g                 Turn Circle (ft.)
displacement    int     %8.0g                 Displacement (cu. in.)
gear_ratio      float   %6.2f                 Gear Ratio
foreign         byte    %8.0g      origin     Car type
--------------------------------------------------------------------------------------------------
Sorted by:  foreign

Run Simple linear regression

. regress mpg weight

      Source |       SS       df       MS              Number of obs =      74
-------------+------------------------------           F(  1,    72) =  134.62
       Model |   1591.9902     1   1591.9902           Prob > F      =  0.0000
    Residual |  851.469256    72  11.8259619           R-squared     =  0.6515
-------------+------------------------------           Adj R-squared =  0.6467
       Total |  2443.45946    73  33.4720474           Root MSE      =  3.4389

------------------------------------------------------------------------------
         mpg |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      weight |  -.0060087   .0005179   -11.60   0.000    -.0070411   -.0049763
       _cons |   39.44028   1.614003    24.44   0.000     36.22283    42.65774
------------------------------------------------------------------------------

In the above regression, mpg is dependent variable and weight is independent variable

Findit is used to search news softwares or packages in stata.

Help is used to get help regarding any command
help regress

Increase the number of variables in stata
set matsize 300

get current details of settings
 creturn list

System values

    ----------------------------------------------------------------------------------------------
        c(current_date) = "15 Apr 2017"
        c(current_time) = "17:07:46"
           c(rmsg_time) = 0                          (seconds, from set rmsg)
    ----------------------------------------------------------------------------------------------
       c(stata_version) = 13.1
             c(version) = 13.1                       (version)
    ----------------------------------------------------------------------------------------------
           c(born_date) = "15 Jan 2014"
              c(flavor) = "IC"
                 c(bit) = 64
                  c(SE) = 1
                  c(MP) = 0
          c(processors) = 1                          (Stata/MP, set processors)
      c(processors_lic) = 1
     c(processors_mach) = 3
      c(processors_max) = 1
                c(mode) = ""
             c(console) = ""
    ----------------------------------------------------------------------------------------------
                  c(os) = "Windows"
               c(osdtl) = "64-bit"
            c(hostname) = "xa109"
        c(machine_type) = "PC (64-bit x86-64)"
           c(byteorder) = "lohi"
            c(username) = "vivek4"
    ----------------------------------------------------------------------------------------------

Directories and paths

    ----------------------------------------------------------------------------------------------
        c(sysdir_stata) = "\\gump.forest.usf.."      (sysdir)
         c(sysdir_base) = "\\gump.forest.usf.."      (sysdir)
         c(sysdir_site) = "\\gump.forest.usf.."      (sysdir)
         c(sysdir_plus) = "c:\ado\plus/"             (sysdir)
     c(sysdir_personal) = "c:\ado\personal/"         (sysdir)
     c(sysdir_oldplace) = "c:\ado/"                  (sysdir)
              c(tmpdir) = "C:\Users\vivek4\A.."
--more--

. scalar a=10

. display a
10

. 
Mata= Matrix programming language
. matrix define A=(1,2,3\4,5,6)

. A
unrecognized command:  A
r(199);

. display A
type mismatch
r(109);

. matrix list A

A[2,3]
    c1  c2  c3
r1   1   2   3
r2   4   5   6

. display A[1,2]
2

. summarize mpg

    Variable |       Obs        Mean    Std. Dev.       Min        Max
-------------+--------------------------------------------------------
         mpg |        74     21.2973    5.785503         12         41

. return list

scalars:
                  r(N) =  74
              r(sum_w) =  74
               r(mean) =  21.2972972972973
                r(Var) =  33.47204738985561
                 r(sd) =  5.785503209735141
                r(min) =  12
                r(max) =  41
                r(sum) =  1576

. display r(N)
74

. summarize mpg

    Variable |       Obs        Mean    Std. Dev.       Min        Max
-------------+--------------------------------------------------------
         mpg |        74     21.2973    5.785503         12         41

. return list

scalars:
                  r(N) =  74
              r(sum_w) =  74
               r(mean) =  21.2972972972973
                r(Var) =  33.47204738985561
                 r(sd) =  5.785503209735141
                r(min) =  12
                r(max) =  41
                r(sum) =  1576

. display r(N)
74

. display r(max)
41

. display r(min)
12

. scalar range=r(max)-r(min)

. display range
29

 regress mpg price weight

      Source |       SS       df       MS              Number of obs =      74
-------------+------------------------------           F(  2,    71) =   66.85
       Model |  1595.93249     2  797.966246           Prob > F      =  0.0000
    Residual |  847.526967    71  11.9369995           R-squared     =  0.6531
-------------+------------------------------           Adj R-squared =  0.6434
       Total |  2443.45946    73  33.4720474           Root MSE      =   3.455

------------------------------------------------------------------------------
         mpg |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
       price |  -.0000935   .0001627    -0.57   0.567     -.000418    .0002309
      weight |  -.0058175   .0006175    -9.42   0.000    -.0070489   -.0045862
       _cons |   39.43966   1.621563    24.32   0.000     36.20635    42.67296
------------------------------------------------------------------------------

. ereturn list

scalars:
                  e(N) =  74
               e(df_m) =  2
               e(df_r) =  71
                  e(F) =  66.84814256414501
                 e(r2) =  .6531446579233134
               e(rmse) =  3.454996314099513
                e(mss) =  1595.932492798133
                e(rss) =  847.5269666613265
               e(r2_a) =  .6433740849070687
                 e(ll) =  -195.2169813478502
               e(ll_0) =  -234.3943376482347
               e(rank) =  3

macros:
            e(cmdline) : "regress mpg price weight"
              e(title) : "Linear regression"
          e(marginsok) : "XB default"
                e(vce) : "ols"
             e(depvar) : "mpg"
                e(cmd) : "regress"
         e(properties) : "b V"
            e(predict) : "regres_p"
              e(model) : "ols"
          e(estat_cmd) : "regress_estat"

matrices:
                  e(b) :  1 x 3
                  e(V) :  3 x 3

functions:
             e(sample)  


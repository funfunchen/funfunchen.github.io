# The showcase for rareGWAMA

**Project description:** rareGWAMA is powerful and flexible to many tests. But meanwhile it needs different information for different test. So here we will give you some examples for the *Conditional Single Variant Tests* and the *Gene Based Tests* in real life scenarios.


## 1. the Conditional Single Variant Tests

## 2. the Gene Based Tests
Suppose we have done some meta-analyses with multi-ancesity on the server.

### 2.1 pre-request
On the server, we will have 
> * the score.stat.file:The statistics summary files, like:

`less clean-CHS_CPD.MetaScore.assoc.gz`

```
CHROM   POS     REF     ALT     N_INFORMATIVE   AF      INFORMATIVE_ALT_AC      CALL_RATE       HWE_PVALUE      N_REF   N_HET   N_ALT   U_STAT  SQRT_V_STAT     ALT_EFFSIZE     PVALUE
1       10177   A       AC      2352    0.5     2352    1       0       0       2352    0       1.67496 2.51553 0.264695        0.505508
1       10235   T       TA      2352    0       0       1       1       2352    0       0       -0.108472       0.207841        -2.51104        0.601742
1       10352   T       TA      2352    0.5     2352    1       0       0       2352    0       0.665562        2.61389 0.0974122       0.799013
1       10539   C       A       2352    0       0       1       1       2352    0       0       -0.00020902     0.0626305       -0.0532862      0.997337
```

>* imp.qual.file: The imputation quality file for each summary file, like:

`less topmed.impqual.gz`

```
CHROM   POS     REF     ALT     Rsq
1       13380   C       G       1
1       16071   G       A       1
1       16141   C       T       1
1       16280   T       C       1
1       49298   T       C       1
1       54353   C       A       1
1       54564   G       T       1
1       54591   A       G       1
```


then, we could make a list for all of them, as:

`less cpd.topmed-GSCAN1.index`

```
AACAC   /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freeze6a-Jan20-2019/clean/clean-AACAC_CPD.MetaScore.assoc.gz    /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freezeDec20/clean/topmed.impqual.gz
AMISH   /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freeze6a-Jan20-2019/clean/clean-AMISH_cpd.MetaScore.assoc.gz    /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freezeDec20/clean/topmed.impqual.gz
ARIC    /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freeze6a-Jan20-2019/clean/clean-ARIC_CPD.MetaScore.assoc.gz /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freezeDec20/clean/topmed.impqual.gz
BAGS    /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freeze6a-Jan20-2019/clean/clean-BAGS_Asthma_CPD.MetaScore.assoc.gz  /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freezeDec20/clean/topmed.impqual.gz
Boston  /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freeze6a-Jan20-2019/clean/clean-Boston_CPD.MetaScore.assoc.gz   /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freezeDec20/clean/topmed.impqual.gz
CHS /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freeze6a-Jan20-2019/clean/clean-CHS_CPD.MetaScore.assoc.gz  /gpfs/group/dxl46/default/private/dajiang/projects/GSCAN/TOPMed/freezeDec20/clean/topmed.impqual.gz
```

```
library(rareGWAMA)
```
### 2.2 


```javascript
if (isAwesome){
  return true
}
```

### 2. Assess assumptions on which statistical inference will be based

```javascript
if (isAwesome){
  return true
}
```

### 3. Support the selection of appropriate statistical tools and techniques

<img src="images/dummy_thumbnail.jpg?raw=true"/>

### 4. Provide a basis for further data collection through surveys or experiments

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. 

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

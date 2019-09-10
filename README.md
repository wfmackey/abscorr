
<!-- README.md is generated from README.Rmd. Please edit that file -->

# abscorr

<!-- badges: start -->

<!-- badges: end -->

The goal of abscorr is to provide easy access to common ABS structures,
like the Australian and New Zealand Standard Classification of
Occupations (ANZSCO) and the Australian Standard Classification of
Education (ASCED).

Installation and examples below.

I’ll be adding commonly-used structures as I use them myself. If you’d
like to request one, let me know via a Github issue or email at
<wfmackey@gmail.com>.

## Installation

You can install the current version of `abscorr` from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("wfmackey/abscorr")
```

## Example

``` r
library(tidyverse)
library(abscorr)

glimpse(anzsco)
#> Observations: 1,032
#> Variables: 16
#> $ anzsco1_code <chr> "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "…
#> $ anzsco1      <chr> "Managers", "Managers", "Managers", "Managers", "Ma…
#> $ anzsco1_f    <fct> Managers, Managers, Managers, Managers, Managers, M…
#> $ anzsco2_code <chr> "11", "11", "11", "11", "11", "11", "12", "12", "12…
#> $ anzsco2      <chr> "Chief Executives, General Managers and Legislators…
#> $ anzsco2_f    <fct> "Chief Executives, General Managers and Legislators…
#> $ anzsco3_code <chr> "111", "111", "111", "111", "111", "111", "121", "1…
#> $ anzsco3      <chr> "Chief Executives, General Managers and Legislators…
#> $ anzsco3_f    <fct> "Chief Executives, General Managers and Legislators…
#> $ anzsco4_code <chr> "1111", "1112", "1112", "1113", "1113", "1113", "12…
#> $ anzsco4      <chr> "Chief Executives and Managing Directors", "General…
#> $ anzsco4_f    <fct> Chief Executives and Managing Directors, General Ma…
#> $ anzsco5_code <chr> "111111", "111211", "111212", "111311", "111312", "…
#> $ anzsco5      <chr> "Chief Executive or Managing Director", "Corporate …
#> $ skill_level  <chr> "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "…
#> $ anzsco5_f    <fct> "Chief Executive or Managing Director", "Corporate …

glimpse(asced_foe)
#> Observations: 439
#> Variables: 9
#> $ foe2_code <chr> "01", "01", "01", "01", "01", "01", "01", "01", "01", …
#> $ foe2      <chr> "Natural and Physical Sciences", "Natural and Physical…
#> $ foe2_f    <fct> Natural and Physical Sciences, Natural and Physical Sc…
#> $ foe4_code <chr> "0100", "0101", "0101", "0101", "0101", "0103", "0103"…
#> $ foe4      <chr> "Natural and Physical Sciences, nfd", "Mathematical Sc…
#> $ foe4_f    <fct> "Natural and Physical Sciences, nfd", "Mathematical Sc…
#> $ foe6_code <chr> "010000", "010100", "010101", "010103", "010199", "010…
#> $ foe6      <chr> "Natural and Physical Sciences, nfd", "Mathematical Sc…
#> $ foe6_f    <fct> "Natural and Physical Sciences, nfd", "Mathematical Sc…
```

These tibbles can be tweaked and joined to your existing datasets. For
example, given a dataset of Australians by four-digit field of education
and age group:

``` r

data <- read_csv(data_path)
#> Parsed with column specification:
#> cols(
#>   age = col_character(),
#>   foe4 = col_character(),
#>   n = col_double()
#> )

glimpse(data)
#> Observations: 430
#> Variables: 3
#> $ age  <chr> "20-24", "20-24", "20-24", "20-24", "20-24", "20-24", "20-2…
#> $ foe4 <chr> "Accounting", "Aerospace Engineering and Technology", "Agri…
#> $ n    <dbl> 18575, 2465, 6668, 42, 3, 7527, 14174, 8704, 8286, 4038, 38…
```

We can retrieve the four-digit fields and their corresponding two-digit
fields from `abscorr::asced_foe`:

``` r
join_foe2 <- abscorr::asced_foe %>% 
  select(foe2, foe4) %>%   # just keep the variables you want
  distinct()               # only keep unique observations

join_foe2
#> # A tibble: 83 x 2
#>    foe2                          foe4                               
#>    <chr>                         <chr>                              
#>  1 Natural and Physical Sciences Natural and Physical Sciences, nfd 
#>  2 Natural and Physical Sciences Mathematical Sciences              
#>  3 Natural and Physical Sciences Physics and Astronomy              
#>  4 Natural and Physical Sciences Chemical Sciences                  
#>  5 Natural and Physical Sciences Earth Sciences                     
#>  6 Natural and Physical Sciences Biological Sciences                
#>  7 Natural and Physical Sciences Other Natural and Physical Sciences
#>  8 Information Technology        Information Technology, nfd        
#>  9 Information Technology        Computer Science                   
#> 10 Information Technology        Information Systems                
#> # … with 73 more rows
```

And join with our original dataset:

``` r

data %>% 
  left_join(join_foe2)
#> Joining, by = "foe4"
#> # A tibble: 430 x 4
#>    age   foe4                                n foe2                        
#>    <chr> <chr>                           <dbl> <chr>                       
#>  1 20-24 Accounting                      18575 Management and Commerce     
#>  2 20-24 Aerospace Engineering and Tech…  2465 Engineering and Related Tec…
#>  3 20-24 Agriculture                      6668 Agriculture, Environmental …
#>  4 20-24 Agriculture, Environmental and…    42 Agriculture, Environmental …
#>  5 20-24 Architecture and Building, nfd      3 Architecture and Building   
#>  6 20-24 Architecture and Urban Environ…  7527 Architecture and Building   
#>  7 20-24 Automotive Engineering and Tec… 14174 Engineering and Related Tec…
#>  8 20-24 Banking, Finance and Related F…  8704 Management and Commerce     
#>  9 20-24 Behavioural Science              8286 Society and Culture         
#> 10 20-24 Biological Sciences              4038 Natural and Physical Scienc…
#> # … with 420 more rows
```

Beaut.

#' ANZSCO
#'
#' Wide table containing all levels of the Australian and New Zealand Standard
#' Classification of Occupations (ANZSCO), First Edition, Revision 1, 2009. Cat. 1220.0.
#'
#' @format A \code{tibble} with 11 variables:
#' \describe{
#' \item{\code{anzsco1_code}}{Major ANZSCO group codes, e.g. "4"}
#' \item{\code{anzsco1}}{Major ANZSCO group names in title case, e.g. "Community and Personal Service Workers"}
#' \item{\code{anzsco2_code}}{Sub-major ANZSCO group codes, e.g. "45"}
#' \item{\code{anzsco2}}{Sub-major ANZSCO group names in title case, e.g. "Sports and Personal Service Workers"}
#' \item{\code{anzsco3_code}}{Minor ANZSCO group codes, e.g. "452"}
#' \item{\code{anzsco3}}{Minor ANZSCO group names in title case, e.g. "Sports and Fitness Workers"}
#' \item{\code{anzsco4_code}}{Unit ANZSCO group codes, e.g. "4523"}
#' \item{\code{anzsco4}}{Unit ANZSCO group names in title case, e.g. "Sports Coaches, Instructors and Officials"}
#' \item{\code{anzsco5_code}}{Occupation ANZSCO group codes, e.g. "452311"}
#' \item{\code{anzsco5}}{Occupation ANZSCO group names in title case, e.g. "Diving Instructor (Open Water)"}
#' \item{\code{skill_level}}{Skill level required for occupation, determined by the ABS (1 is highest, 5 is lowest).
#' See \url{https://www.abs.gov.au/ausstats/abs@.nsf/Previousproducts/C4BECE1704987586CA257089001A9181 } for details.}
#' }
"anzsco"


#' ASCED Field of Education
#'
#' Wide table containing all levels of fields of education in the Australian
#' Standard Classification of Education (ASCED), 2001. Cat. 1272.0.
#'
#' @format A \code{tibble} with 6 variables:
#' \describe{
#' \item{\code{foe2_code}}{Broad field of education two-digit code, e.g. "09"}
#' \item{\code{foe2}}{Broad field of education two-digit name in title case, e.g. "Society and Culture"}
#' \item{\code{foe4_code}}{Narrow field of education four-digit code, e.g. "0921"}
#' \item{\code{foe4}}{Narrow field of education four-digit name in title case, e.g. "Sport and Recreation"}
#' \item{\code{foe6_code}}{Detailed field of education six-digit code, e.g. "092103"}
#' \item{\code{foe6}}{Detailed field of education six-digit name in title case, e.g. "Sports Coaching, Officiating and Instruction"}
#' }
"asced_foe"


#' ASCED Level of Education
#'
#' Wide table containing all levels of qualifications in the Australian Standard
#' Classification of Education (ASCED), 2001. Cat. 1272.0.
#'
#' @format A \code{tibble} with 6 variables:
#' \describe{
#' \item{\code{qual1_code}}{Broad qualification level one-digit code, e.g. "1"}
#' \item{\code{qual1}}{Broad qualification level one-digit name in title case, e.g. "Postgraduate Degree Level"}
#' \item{\code{qual2_code}}{Narrow qualification level two-digit code, e.g. "12"}
#' \item{\code{qual2}}{Narrow qualification level two-digit name in title case, e.g. "Master Degree Level"}
#' \item{\code{qual3_code}}{Detailed qualification level three-digit code, e.g. "122"}
#' \item{\code{qual3}}{Detailed qualification level three-digit name in title case, e.g. "Master Degree by Coursework"}
#' }
"asced_qual"


#' ANZSCO
#'
#' Character-only version of \code{anzsco}. Wide table containing all levels of the Australian and New Zealand Standard
#' Classification of Occupations (ANZSCO), First Edition, Revision 1, 2009. Cat. 1220.0.
#'
#' @format A \code{tibble} with 11 variables:
#' \describe{
#' \item{\code{anzsco1_code}}{Major ANZSCO group codes, e.g. "4"}
#' \item{\code{anzsco1}}{Major ANZSCO group names in title case, e.g. "Community and Personal Service Workers"}
#' \item{\code{anzsco2_code}}{Sub-major ANZSCO group codes, e.g. "45"}
#' \item{\code{anzsco2}}{Sub-major ANZSCO group names in title case, e.g. "Sports and Personal Service Workers"}
#' \item{\code{anzsco3_code}}{Minor ANZSCO group codes, e.g. "452"}
#' \item{\code{anzsco3}}{Minor ANZSCO group names in title case, e.g. "Sports and Fitness Workers"}
#' \item{\code{anzsco4_code}}{Unit ANZSCO group codes, e.g. "4523"}
#' \item{\code{anzsco4}}{Unit ANZSCO group names in title case, e.g. "Sports Coaches, Instructors and Officials"}
#' \item{\code{anzsco5_code}}{Occupation ANZSCO group codes, e.g. "452311"}
#' \item{\code{anzsco5}}{Occupation ANZSCO group names in title case, e.g. "Diving Instructor (Open Water)"}
#' \item{\code{skill_level}}{Skill level required for occupation, determined by the ABS (1 is highest, 5 is lowest).
#' See \url{https://www.abs.gov.au/ausstats/abs@.nsf/Previousproducts/C4BECE1704987586CA257089001A9181 } for details.}
#' }
"anzsco_c"


#' ASCED Field of Education
#'
#' Character-only version of \code{asced_foe}. Wide table containing all levels of fields of education in the Australian
#' Standard Classification of Education (ASCED), 2001. Cat. 1272.0.
#'
#' @format A \code{tibble} with 6 variables:
#' \describe{
#' \item{\code{foe2_code}}{Broad field of education two-digit code, e.g. "09"}
#' \item{\code{foe2}}{Broad field of education two-digit name in title case, e.g. "Society and Culture"}
#' \item{\code{foe4_code}}{Narrow field of education four-digit code, e.g. "0921"}
#' \item{\code{foe4}}{Narrow field of education four-digit name in title case, e.g. "Sport and Recreation"}
#' \item{\code{foe6_code}}{Detailed field of education six-digit code, e.g. "092103"}
#' \item{\code{foe6}}{Detailed field of education six-digit name in title case, e.g. "Sports Coaching, Officiating and Instruction"}
#' }
"asced_foe_c"


#' ASCED Level of Education
#'
#' Character-only version of \code{asced_qual}.  Wide table containing all levels of qualifications in the Australian Standard
#' Classification of Education (ASCED), 2001. Cat. 1272.0.
#'
#' @format A \code{tibble} with 6 variables:
#' \describe{
#' \item{\code{qual1_code}}{Broad qualification level one-digit code, e.g. "1"}
#' \item{\code{qual1}}{Broad qualification level one-digit name in title case, e.g. "Postgraduate Degree Level"}
#' \item{\code{qual2_code}}{Narrow qualification level two-digit code, e.g. "12"}
#' \item{\code{qual2}}{Narrow qualification level two-digit name in title case, e.g. "Master Degree Level"}
#' \item{\code{qual3_code}}{Detailed qualification level three-digit code, e.g. "122"}
#' \item{\code{qual3}}{Detailed qualification level three-digit name in title case, e.g. "Master Degree by Coursework"}
#' }
"asced_qual_c"



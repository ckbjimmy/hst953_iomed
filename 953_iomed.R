# title: "Workshop - I/O and Medication"
# subtitle: "HST.953 Collaborative Data Science in Medicine"
# author: "Wei-Hung Weng (ckbjimmy [at] mit [dot] edu)"
# date: "September 14, 2018"

# Establishing connection
library(bigrquery)

project_id <- "hst-953-2018"
options(httr_oauth_cache=FALSE)

run_query <- function(query, max_pages=10000){
  data <- query_exec(query, project=project_id, use_legacy_sql=FALSE, max_pages=100)
  return(data)
}

# test
run_query(paste0("SELECT count(1) FROM `physionet-data.mimiciii_demo`.`patients`"))

# I/O

## MIMIC-III

### Summing up urine output using outputevents

# https://github.com/MIT-LCP/mimic-code/blob/master/concepts/fluid-balance/urine-output.sql

q <- '
select oe.icustay_id, oe.charttime
, SUM(
-- we consider input of GU irrigant as a negative volume
case when oe.itemid = 227488 then -1*value
else value end
) as value
from `physionet-data.mimiciii_demo`.`outputevents` oe
where oe.itemid in
(
  -- these are the most frequently occurring urine output observations in CareVue
  40055, -- "Urine Out Foley"
  43175, -- "Urine ."
  40069, -- "Urine Out Void"
  40094, -- "Urine Out Condom Cath"
  40715, -- "Urine Out Suprapubic"
  40473, -- "Urine Out IleoConduit"
  40085, -- "Urine Out Incontinent"
  40057, -- "Urine Out Rt Nephrostomy"
  40056, -- "Urine Out Lt Nephrostomy"
  40405, -- "Urine Out Other"
  40428, -- "Urine Out Straight Cath"
  40086, --	"Urine Out Incontinent"
  40096, -- "Urine Out Ureteral Stent #1"
  40651, -- "Urine Out Ureteral Stent #2"
  
  -- these are the most frequently occurring urine output observations in MetaVision
  226559, -- "Foley"
  226560, -- "Void"
  226561, -- "Condom Cath"
  226584, -- "Ileoconduit"
  226563, -- "Suprapubic"
  226564, -- "R Nephrostomy"
  226565, -- "L Nephrostomy"
  226567, --	Straight Cath
  226557, -- R Ureteral Stent
  226558, -- L Ureteral Stent
  227488, -- GU Irrigant Volume In
  227489  -- GU Irrigant/Urine Volume Out
)
and oe.value < 5000 -- sanity check on urine value
and oe.icustay_id is not null
group by icustay_id, charttime;
'

uo <- run_query(q)
head(uo)

## eICU

q <- "
with t2 as
(
  with t1 as
  (
  select distinct patientunitstayid, intakeoutputoffset, 
  case when cellpath like '%Intake%' then cellvaluenumeric else 0 end as input,
  case when cellpath like '%Output%' then cellvaluenumeric else 0 end as output
  from `physionet-data.eicu`.`intakeoutput`
  )
  select distinct patientunitstayid, intakeoutputoffset, floor(avg(intakeoutputoffset/1440)) as day, input, output
  from t1
  group by patientunitstayid, intakeoutputoffset, input, output
)
select patientunitstayid, day, sum(input) as input, sum(output) as output, sum(input-output) as fluid_balance
from t2
group by patientunitstayid, day
order by patientunitstayid, day
"

io <- run_query(q)
head(io)

# Medication

## MIMIC-III

q <- "
with p as
(
  select prescriptions.*
  , case
  when lower(drug_name_generic) like '%adoxa%' then 1
  when lower(drug_name_generic) like '%ala-tet%' then 1
  when lower(drug_name_generic) like '%alodox%' then 1
  when lower(drug_name_generic) like '%amikacin%' then 1
  when lower(drug_name_generic) like '%amikin%' then 1
  when lower(drug_name_generic) like '%amoxicillin%' then 1
  when lower(drug_name_generic) like '%amoxicillin%clavulanate%' then 1
  when lower(drug_name_generic) like '%clavulanate%' then 1
  when lower(drug_name_generic) like '%ampicillin%' then 1
  when lower(drug_name_generic) like '%augmentin%' then 1
  when lower(drug_name_generic) like '%avelox%' then 1
  when lower(drug_name_generic) like '%avidoxy%' then 1
  when lower(drug_name_generic) like '%azactam%' then 1
  when lower(drug_name_generic) like '%azithromycin%' then 1
  when lower(drug_name_generic) like '%aztreonam%' then 1
  when lower(drug_name_generic) like '%axetil%' then 1
  when lower(drug_name_generic) like '%bactocill%' then 1
  when lower(drug_name_generic) like '%bactrim%' then 1
  when lower(drug_name_generic) like '%bethkis%' then 1
  when lower(drug_name_generic) like '%biaxin%' then 1
  when lower(drug_name_generic) like '%bicillin l-a%' then 1
  when lower(drug_name_generic) like '%cayston%' then 1
  when lower(drug_name_generic) like '%cefazolin%' then 1
  when lower(drug_name_generic) like '%cedax%' then 1
  when lower(drug_name_generic) like '%cefoxitin%' then 1
  when lower(drug_name_generic) like '%ceftazidime%' then 1
  when lower(drug_name_generic) like '%cefaclor%' then 1
  when lower(drug_name_generic) like '%cefadroxil%' then 1
  when lower(drug_name_generic) like '%cefdinir%' then 1
  when lower(drug_name_generic) like '%cefditoren%' then 1
  when lower(drug_name_generic) like '%cefepime%' then 1
  when lower(drug_name_generic) like '%cefotetan%' then 1
  when lower(drug_name_generic) like '%cefotaxime%' then 1
  when lower(drug_name_generic) like '%cefpodoxime%' then 1
  when lower(drug_name_generic) like '%cefprozil%' then 1
  when lower(drug_name_generic) like '%ceftibuten%' then 1
  when lower(drug_name_generic) like '%ceftin%' then 1
  when lower(drug_name_generic) like '%cefuroxime %' then 1
  when lower(drug_name_generic) like '%cefuroxime%' then 1
  when lower(drug_name_generic) like '%cephalexin%' then 1
  when lower(drug_name_generic) like '%chloramphenicol%' then 1
  when lower(drug_name_generic) like '%cipro%' then 1
  when lower(drug_name_generic) like '%ciprofloxacin%' then 1
  when lower(drug_name_generic) like '%claforan%' then 1
  when lower(drug_name_generic) like '%clarithromycin%' then 1
  when lower(drug_name_generic) like '%cleocin%' then 1
  when lower(drug_name_generic) like '%clindamycin%' then 1
  when lower(drug_name_generic) like '%cubicin%' then 1
  when lower(drug_name_generic) like '%dicloxacillin%' then 1
  when lower(drug_name_generic) like '%doryx%' then 1
  when lower(drug_name_generic) like '%doxycycline%' then 1
  when lower(drug_name_generic) like '%duricef%' then 1
  when lower(drug_name_generic) like '%dynacin%' then 1
  when lower(drug_name_generic) like '%ery-tab%' then 1
  when lower(drug_name_generic) like '%eryped%' then 1
  when lower(drug_name_generic) like '%eryc%' then 1
  when lower(drug_name_generic) like '%erythrocin%' then 1
  when lower(drug_name_generic) like '%erythromycin%' then 1
  when lower(drug_name_generic) like '%factive%' then 1
  when lower(drug_name_generic) like '%flagyl%' then 1
  when lower(drug_name_generic) like '%fortaz%' then 1
  when lower(drug_name_generic) like '%furadantin%' then 1
  when lower(drug_name_generic) like '%garamycin%' then 1
  when lower(drug_name_generic) like '%gentamicin%' then 1
  when lower(drug_name_generic) like '%kanamycin%' then 1
  when lower(drug_name_generic) like '%keflex%' then 1
  when lower(drug_name_generic) like '%ketek%' then 1
  when lower(drug_name_generic) like '%levaquin%' then 1
  when lower(drug_name_generic) like '%levofloxacin%' then 1
  when lower(drug_name_generic) like '%lincocin%' then 1
  when lower(drug_name_generic) like '%macrobid%' then 1
  when lower(drug_name_generic) like '%macrodantin%' then 1
  when lower(drug_name_generic) like '%maxipime%' then 1
  when lower(drug_name_generic) like '%mefoxin%' then 1
  when lower(drug_name_generic) like '%metronidazole%' then 1
  when lower(drug_name_generic) like '%minocin%' then 1
  when lower(drug_name_generic) like '%minocycline%' then 1
  when lower(drug_name_generic) like '%monodox%' then 1
  when lower(drug_name_generic) like '%monurol%' then 1
  when lower(drug_name_generic) like '%morgidox%' then 1
  when lower(drug_name_generic) like '%moxatag%' then 1
  when lower(drug_name_generic) like '%moxifloxacin%' then 1
  when lower(drug_name_generic) like '%myrac%' then 1
  when lower(drug_name_generic) like '%nafcillin sodium%' then 1
  when lower(drug_name_generic) like '%nicazel doxy 30%' then 1
  when lower(drug_name_generic) like '%nitrofurantoin%' then 1
  when lower(drug_name_generic) like '%noroxin%' then 1
  when lower(drug_name_generic) like '%ocudox%' then 1
  when lower(drug_name_generic) like '%ofloxacin%' then 1
  when lower(drug_name_generic) like '%omnicef%' then 1
  when lower(drug_name_generic) like '%oracea%' then 1
  when lower(drug_name_generic) like '%oraxyl%' then 1
  when lower(drug_name_generic) like '%oxacillin%' then 1
  when lower(drug_name_generic) like '%pc pen vk%' then 1
  when lower(drug_name_generic) like '%pce dispertab%' then 1
  when lower(drug_name_generic) like '%panixine%' then 1
  when lower(drug_name_generic) like '%pediazole%' then 1
  when lower(drug_name_generic) like '%penicillin%' then 1
  when lower(drug_name_generic) like '%periostat%' then 1
  when lower(drug_name_generic) like '%pfizerpen%' then 1
  when lower(drug_name_generic) like '%piperacillin%' then 1
  when lower(drug_name_generic) like '%tazobactam%' then 1
  when lower(drug_name_generic) like '%primsol%' then 1
  when lower(drug_name_generic) like '%proquin%' then 1
  when lower(drug_name_generic) like '%raniclor%' then 1
  when lower(drug_name_generic) like '%rifadin%' then 1
  when lower(drug_name_generic) like '%rifampin%' then 1
  when lower(drug_name_generic) like '%rocephin%' then 1
  when lower(drug_name_generic) like '%smz-tmp%' then 1
  when lower(drug_name_generic) like '%septra%' then 1
  when lower(drug_name_generic) like '%septra ds%' then 1
  when lower(drug_name_generic) like '%septra%' then 1
  when lower(drug_name_generic) like '%solodyn%' then 1
  when lower(drug_name_generic) like '%spectracef%' then 1
  when lower(drug_name_generic) like '%streptomycin sulfate%' then 1
  when lower(drug_name_generic) like '%sulfadiazine%' then 1
  when lower(drug_name_generic) like '%sulfamethoxazole%' then 1
  when lower(drug_name_generic) like '%trimethoprim%' then 1
  when lower(drug_name_generic) like '%sulfatrim%' then 1
  when lower(drug_name_generic) like '%sulfisoxazole%' then 1
  when lower(drug_name_generic) like '%suprax%' then 1
  when lower(drug_name_generic) like '%synercid%' then 1
  when lower(drug_name_generic) like '%tazicef%' then 1
  when lower(drug_name_generic) like '%tetracycline%' then 1
  when lower(drug_name_generic) like '%timentin%' then 1
  when lower(drug_name_generic) like '%tobi%' then 1
  when lower(drug_name_generic) like '%tobramycin%' then 1
  when lower(drug_name_generic) like '%trimethoprim%' then 1
  when lower(drug_name_generic) like '%unasyn%' then 1
  when lower(drug_name_generic) like '%vancocin%' then 1
  when lower(drug_name_generic) like '%vancomycin%' then 1
  when lower(drug_name_generic) like '%vantin%' then 1
  when lower(drug_name_generic) like '%vibativ%' then 1
  when lower(drug_name_generic) like '%vibra-tabs%' then 1
  when lower(drug_name_generic) like '%vibramycin%' then 1
  when lower(drug_name_generic) like '%zinacef%' then 1
  when lower(drug_name_generic) like '%zithromax%' then 1
  when lower(drug_name_generic) like '%zmax%' then 1
  when lower(drug_name_generic) like '%zosyn%' then 1
  when lower(drug_name_generic) like '%zyvox%' then 1
  else 0
  end as abx
  from `physionet-data.mimiciii_demo`.`prescriptions`
)

, l as
(
  select hadm_id, subject_id, icustay_id
  , max(abx) as abx
  from p
  group by hadm_id, subject_id, icustay_id
) 
  
  select * from l
  order by l.hadm_id;
  "
  
med <- run_query(q)
head(med)
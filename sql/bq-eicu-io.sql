with t2 as
(
  with t1 as
  (
  select distinct patientunitstayid, intakeoutputoffset, 
  case when cellpath like '%Intake%' then cellvaluenumeric else 0 end as input,
  case when cellpath like '%Output%' then cellvaluenumeric else 0 end as output
  from `physionet-data.eicu_crd_demo`.`intakeoutput`
  )
  select distinct patientunitstayid, intakeoutputoffset, floor(avg(intakeoutputoffset/1440)) as day, input, output
  from t1
  group by patientunitstayid, intakeoutputoffset, input, output
)
select patientunitstayid, day, sum(input) as input, sum(output) as output, sum(input-output) as fluid_balance
from t2
group by patientunitstayid, day
order by patientunitstayid, day
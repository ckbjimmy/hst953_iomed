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
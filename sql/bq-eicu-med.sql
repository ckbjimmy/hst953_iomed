with p as
(
  select medication.*
  , case
  when lower(drugname) like '%adoxa%' then 1
  when lower(drugname) like '%ala-tet%' then 1
  when lower(drugname) like '%alodox%' then 1
  when lower(drugname) like '%amikacin%' then 1
  when lower(drugname) like '%amikin%' then 1
  when lower(drugname) like '%amoxicillin%' then 1
  when lower(drugname) like '%amoxicillin%clavulanate%' then 1
  when lower(drugname) like '%clavulanate%' then 1
  when lower(drugname) like '%ampicillin%' then 1
  when lower(drugname) like '%augmentin%' then 1
  when lower(drugname) like '%avelox%' then 1
  when lower(drugname) like '%avidoxy%' then 1
  when lower(drugname) like '%azactam%' then 1
  when lower(drugname) like '%azithromycin%' then 1
  when lower(drugname) like '%aztreonam%' then 1
  when lower(drugname) like '%axetil%' then 1
  when lower(drugname) like '%bactocill%' then 1
  when lower(drugname) like '%bactrim%' then 1
  when lower(drugname) like '%bethkis%' then 1
  when lower(drugname) like '%biaxin%' then 1
  when lower(drugname) like '%bicillin l-a%' then 1
  when lower(drugname) like '%cayston%' then 1
  when lower(drugname) like '%cefazolin%' then 1
  when lower(drugname) like '%cedax%' then 1
  when lower(drugname) like '%cefoxitin%' then 1
  when lower(drugname) like '%ceftazidime%' then 1
  when lower(drugname) like '%cefaclor%' then 1
  when lower(drugname) like '%cefadroxil%' then 1
  when lower(drugname) like '%cefdinir%' then 1
  when lower(drugname) like '%cefditoren%' then 1
  when lower(drugname) like '%cefepime%' then 1
  when lower(drugname) like '%cefotetan%' then 1
  when lower(drugname) like '%cefotaxime%' then 1
  when lower(drugname) like '%cefpodoxime%' then 1
  when lower(drugname) like '%cefprozil%' then 1
  when lower(drugname) like '%ceftibuten%' then 1
  when lower(drugname) like '%ceftin%' then 1
  when lower(drugname) like '%cefuroxime %' then 1
  when lower(drugname) like '%cefuroxime%' then 1
  when lower(drugname) like '%cephalexin%' then 1
  when lower(drugname) like '%chloramphenicol%' then 1
  when lower(drugname) like '%cipro%' then 1
  when lower(drugname) like '%ciprofloxacin%' then 1
  when lower(drugname) like '%claforan%' then 1
  when lower(drugname) like '%clarithromycin%' then 1
  when lower(drugname) like '%cleocin%' then 1
  when lower(drugname) like '%clindamycin%' then 1
  when lower(drugname) like '%cubicin%' then 1
  when lower(drugname) like '%dicloxacillin%' then 1
  when lower(drugname) like '%doryx%' then 1
  when lower(drugname) like '%doxycycline%' then 1
  when lower(drugname) like '%duricef%' then 1
  when lower(drugname) like '%dynacin%' then 1
  when lower(drugname) like '%ery-tab%' then 1
  when lower(drugname) like '%eryped%' then 1
  when lower(drugname) like '%eryc%' then 1
  when lower(drugname) like '%erythrocin%' then 1
  when lower(drugname) like '%erythromycin%' then 1
  when lower(drugname) like '%factive%' then 1
  when lower(drugname) like '%flagyl%' then 1
  when lower(drugname) like '%fortaz%' then 1
  when lower(drugname) like '%furadantin%' then 1
  when lower(drugname) like '%garamycin%' then 1
  when lower(drugname) like '%gentamicin%' then 1
  when lower(drugname) like '%kanamycin%' then 1
  when lower(drugname) like '%keflex%' then 1
  when lower(drugname) like '%ketek%' then 1
  when lower(drugname) like '%levaquin%' then 1
  when lower(drugname) like '%levofloxacin%' then 1
  when lower(drugname) like '%lincocin%' then 1
  when lower(drugname) like '%macrobid%' then 1
  when lower(drugname) like '%macrodantin%' then 1
  when lower(drugname) like '%maxipime%' then 1
  when lower(drugname) like '%mefoxin%' then 1
  when lower(drugname) like '%metronidazole%' then 1
  when lower(drugname) like '%minocin%' then 1
  when lower(drugname) like '%minocycline%' then 1
  when lower(drugname) like '%monodox%' then 1
  when lower(drugname) like '%monurol%' then 1
  when lower(drugname) like '%morgidox%' then 1
  when lower(drugname) like '%moxatag%' then 1
  when lower(drugname) like '%moxifloxacin%' then 1
  when lower(drugname) like '%myrac%' then 1
  when lower(drugname) like '%nafcillin sodium%' then 1
  when lower(drugname) like '%nicazel doxy 30%' then 1
  when lower(drugname) like '%nitrofurantoin%' then 1
  when lower(drugname) like '%noroxin%' then 1
  when lower(drugname) like '%ocudox%' then 1
  when lower(drugname) like '%ofloxacin%' then 1
  when lower(drugname) like '%omnicef%' then 1
  when lower(drugname) like '%oracea%' then 1
  when lower(drugname) like '%oraxyl%' then 1
  when lower(drugname) like '%oxacillin%' then 1
  when lower(drugname) like '%pc pen vk%' then 1
  when lower(drugname) like '%pce dispertab%' then 1
  when lower(drugname) like '%panixine%' then 1
  when lower(drugname) like '%pediazole%' then 1
  when lower(drugname) like '%penicillin%' then 1
  when lower(drugname) like '%periostat%' then 1
  when lower(drugname) like '%pfizerpen%' then 1
  when lower(drugname) like '%piperacillin%' then 1
  when lower(drugname) like '%tazobactam%' then 1
  when lower(drugname) like '%primsol%' then 1
  when lower(drugname) like '%proquin%' then 1
  when lower(drugname) like '%raniclor%' then 1
  when lower(drugname) like '%rifadin%' then 1
  when lower(drugname) like '%rifampin%' then 1
  when lower(drugname) like '%rocephin%' then 1
  when lower(drugname) like '%smz-tmp%' then 1
  when lower(drugname) like '%septra%' then 1
  when lower(drugname) like '%septra ds%' then 1
  when lower(drugname) like '%septra%' then 1
  when lower(drugname) like '%solodyn%' then 1
  when lower(drugname) like '%spectracef%' then 1
  when lower(drugname) like '%streptomycin sulfate%' then 1
  when lower(drugname) like '%sulfadiazine%' then 1
  when lower(drugname) like '%sulfamethoxazole%' then 1
  when lower(drugname) like '%trimethoprim%' then 1
  when lower(drugname) like '%sulfatrim%' then 1
  when lower(drugname) like '%sulfisoxazole%' then 1
  when lower(drugname) like '%suprax%' then 1
  when lower(drugname) like '%synercid%' then 1
  when lower(drugname) like '%tazicef%' then 1
  when lower(drugname) like '%tetracycline%' then 1
  when lower(drugname) like '%timentin%' then 1
  when lower(drugname) like '%tobi%' then 1
  when lower(drugname) like '%tobramycin%' then 1
  when lower(drugname) like '%trimethoprim%' then 1
  when lower(drugname) like '%unasyn%' then 1
  when lower(drugname) like '%vancocin%' then 1
  when lower(drugname) like '%vancomycin%' then 1
  when lower(drugname) like '%vantin%' then 1
  when lower(drugname) like '%vibativ%' then 1
  when lower(drugname) like '%vibra-tabs%' then 1
  when lower(drugname) like '%vibramycin%' then 1
  when lower(drugname) like '%zinacef%' then 1
  when lower(drugname) like '%zithromax%' then 1
  when lower(drugname) like '%zmax%' then 1
  when lower(drugname) like '%zosyn%' then 1
  when lower(drugname) like '%zyvox%' then 1
  else 0
  end as abx
  from `physionet-data.eicu_crd_demo`.`medication`
)

, l as
(
  select patientunitstayid
  , max(abx) as abx
  from p
  group by patientunitstayid
) 
  
  select * from l
  order by l.patientunitstayid;
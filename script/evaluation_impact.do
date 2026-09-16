

describe

table kk_attend

table oil_received

table treatment_type


--------------------------------------------------
                                      |  Frequency
--------------------------------------+-----------
Treatment Arm                         |           
  KK + Financial Literacy             |      4,508
  Incentive                           |      2,360
  KK + Financial Literacy + Incentive |      2,424
  Control                             |      4,519
  Total                               |     13,811
--------------------------------------------------

ssc install estout



drop bl_marriage_time_comfort bl_marriage_time_who bl_earliest_marry bl_earliest_marry_why_phys bl_latest_marry_why_dowry bl_latest_marry_why_groom bl_latest_marry_why_gwill bl_latest_marry_why_parent bl_latest_marry_why_child bl_latest_marry_why_earn bl_latest_marry_why_other bl_latest_marry_why_dk bl_desired_marriage_age bl_earlypreg bl_risks_earlypreg_pain bl_risks_earlypreg_pain bl_risks_earlypreg_momrisk bl_risks_earlypreg_childrisk bl_risks_earlypreg_momhealth bl_risks_earlypreg_childhealth bl_risks_earlypreg_other upcode allow_dress angry_cellphone angry_for_food angry_for_friend char_marriage_age char_marriage_character char_marriage_edu char_marriage_family char_marriage_looks char_marriage_nature char_marriage_other char_marriage_potential char_marriage_religious char_marriage_reputation char_marriage_responsible char_marriage_romantic char_marriage_wealth education_resources husband_level menstruationunable_act met_hus_pre_mar arranged_marriage ever_married marriage_age3 marriage_age1 still_in_school education majorpurchase_dec accessories_dec bed_dec bedsheet_dec cosmetics_dec phone_recharge_dec utensils_dec budget_dec loan_dec ornament_dec pregnancy_risks husband_age husband_edu hus_secondary_complete hus_formal bl_mother_schooled village_distance distance_vc_ss distance_hh_oil village_distance distance_hh_vc ml_ever_married received_oil_il bl_highest_education bl_allow_study bl_allow_dress bl_allow_makeup bl_husband_level bl_educ_goal_comfort bl_puberty_comfort bl_marriage_choice_comfort bl_marriage_dowry_comfort bl_harrassment_discuss bl_harrassment_comfort bl_latest_marry bl_dowry_amnt bl_reason_occupation_none bl_reason_occupation_emerg wives_less_educated girls_study_far education_desired age_married_desired max_marriage_age girls_washedout older_sister_miss bl_still_in_school_miss bl_education_mother_miss bl_HHsize_miss bl_public_transit_miss bl_bmi_miss bl_stunted_miss bl_income_miss g_cons_index high_g_cons survey girlID CLUSTER HHID 





*t-test:

* Comparer chaque groupe de traitement avec le groupe témoin
ttest under_18 if treatment_type == 1 | treatment_type == 4, by(treatment_type)
ttest under_18 if treatment_type == 2 | treatment_type == 4, by(treatment_type)
ttest under_18 if treatment_type == 3 | treatment_type == 4, by(treatment_type)


gen diff_T1=1 if treatment_type==4
replace  diff_T1=0 if treatment_type==1

gen diff_T2=1 if treatment_type==4
replace  diff_T2=0 if treatment_type==2

gen diff_T3=1 if treatment_type==4
replace  diff_T3=0 if treatment_type==3



 eststo T1:  estpost summarize bl_age bl_negage bl_negmar bl_earliest_marry bl_physique bl_whydowry bl_huswhy bl_reputwhy bl_parentwhy bl_childwhy bl_helpfamwhy bl_autrewhy bl_dkwhy bl_agesouhaite bl_earlypreg bl_married bl_still_in_school bl_public_transit bl_education_mother bl_educ bl_permiseduc bl_permisdress bl_permismak bl_educhus bl_negoal bl_negpuberty bl_negmar bl_negdowry bl_harrassment_discuss bl_harassment bl_agemax bl_dowryamount bl_nowork bl_stunted bl_bmi bl_income if treatment_type==1


eststo T2:  estpost summarize bl_age bl_negage bl_negmar bl_earliest_marry bl_physique bl_whydowry bl_huswhy bl_reputwhy bl_parentwhy bl_childwhy bl_helpfamwhy bl_autrewhy bl_dkwhy bl_agesouhaite bl_earlypreg bl_married bl_still_in_school bl_public_transit bl_education_mother bl_educ bl_permiseduc bl_permisdress bl_permismak bl_educhus bl_negoal bl_negpuberty bl_negmar bl_negdowry bl_harrassment_discuss bl_harassment bl_agemax bl_dowryamount bl_nowork bl_stunted bl_bmi bl_income if treatment_type==2

eststo T3:  estpost summarize bl_age bl_negage bl_negmar bl_earliest_marry bl_physique bl_whydowry bl_huswhy bl_reputwhy bl_parentwhy bl_childwhy bl_helpfamwhy bl_autrewhy bl_dkwhy bl_agesouhaite bl_earlypreg bl_married bl_still_in_school bl_public_transit bl_education_mother bl_educ bl_permiseduc bl_permisdress bl_permismak bl_educhus bl_negoal bl_negpuberty bl_negmar bl_negdowry bl_harrassment_discuss bl_harassment bl_agemax bl_dowryamount bl_nowork bl_stunted bl_bmi bl_income if treatment_type==3

eststo CG:  estpost summarize bl_age bl_negage bl_negmar bl_earliest_marry bl_physique bl_whydowry bl_huswhy bl_reputwhy bl_parentwhy bl_childwhy bl_helpfamwhy bl_autrewhy bl_dkwhy bl_agesouhaite bl_earlypreg bl_married bl_still_in_school bl_public_transit bl_education_mother bl_educ bl_permiseduc bl_permisdress bl_permismak bl_educhus bl_negoal bl_negpuberty bl_negmar bl_negdowry bl_harrassment_discuss bl_harassment bl_agemax bl_dowryamount bl_nowork bl_stunted bl_bmi bl_income if treatment_type==4

esttab T1 T2 T3 CG, label cells("mean(pattern(1) fmt(2))") mtitle("Sample1" "Sample2" "Sample3" "Sample4")

 eststo diff_T1:  estpost ttest  bl_age bl_negage bl_negmar bl_earliest_marry bl_physique bl_whydowry bl_huswhy bl_reputwhy bl_parentwhy bl_childwhy bl_helpfamwhy bl_autrewhy bl_dkwhy bl_agesouhaite bl_earlypreg bl_married bl_still_in_school bl_public_transit bl_education_mother bl_educ bl_permiseduc bl_permisdress bl_permismak bl_educhus bl_negoal bl_negpuberty bl_negmar bl_negdowry bl_harrassment_discuss bl_harassment bl_agemax bl_dowryamount bl_nowork bl_stunted bl_bmi bl_income, by(diff_T1)
 
 eststo diff_T2:  estpost ttest  bl_age bl_negage bl_negmar bl_earliest_marry bl_physique bl_whydowry bl_huswhy bl_reputwhy bl_parentwhy bl_childwhy bl_helpfamwhy bl_autrewhy bl_dkwhy bl_agesouhaite bl_earlypreg bl_married bl_still_in_school bl_public_transit bl_education_mother bl_educ bl_permiseduc bl_permisdress bl_permismak bl_educhus bl_negoal bl_negpuberty bl_negmar bl_negdowry bl_harrassment_discuss bl_harassment bl_agemax bl_dowryamount bl_nowork bl_stunted bl_bmi bl_income, by(diff_T2)
 
  eststo diff_T3:  estpost ttest  bl_age bl_negage bl_negmar bl_earliest_marry bl_physique bl_whydowry bl_huswhy bl_reputwhy bl_parentwhy bl_childwhy bl_helpfamwhy bl_autrewhy bl_dkwhy bl_agesouhaite bl_earlypreg bl_married bl_still_in_school bl_public_transit bl_education_mother bl_educ bl_permiseduc bl_permisdress bl_permismak bl_educhus bl_negoal bl_negpuberty bl_negmar bl_negdowry bl_harrassment_discuss bl_harassment bl_agemax bl_dowryamount bl_nowork bl_stunted bl_bmi bl_income, by(diff_T3)
 
 esttab T1 T2 T3 CG diff_T1 diff_T2 diff_T3, label cells("mean(pattern(1 1 1 1 0 0 0) fmt(2)) b(star pattern(0 0 0 0 1 1 1) fmt(2))") mtitle("T1" "T2" "T3" "CG" "T1 vs. CG" "T2 vs. CG" "T3 vs. CG") 
 
 esttab T1 T2 T3 CG diff_T1 diff_T2 diff_T3, ///
    varlabels(_all "") ///
    cells("mean(pattern(1 1 1 1 0 0 0) fmt(2)) b(star pattern(0 0 0 0 1 1 1) fmt(2))") ///
    mtitle("T1" "T2" "T3" "CG" "T1 vs. CG" "T2 vs. CG" "T3 vs. CG")

 



******************************

****méthode probit (par bloc)

*variabkes d'interaction (spécificité du modèle):
 gen revenuXhuile= access_cash*huile
gen educXkk=education*kk
gen workXkk=ever_worked*kk
gen distanceXhuile=distance_hh_oil*huile
gen paconsXkk=parents_cons*kk

* Bloc 1 : Traitements uniquement (modèle de regression naif)

probit under_18 i.huile##i.kk
est store modele_bloc1
display "------- Bloc 1 terminé -------"

* Bloc 2 : + Caractéristiques individuelles fille


probit under_18 i.huile##i.kk bl_age education girl_cons girlpower workXkk educXkk
est store modele_bloc2
display "------- Bloc 2 terminé -------"


* Bloc 3 : + Caractéristiques familiales

probit under_18 i.huile##i.kk bl_age education  girl_cons girlpower workXkk educXkk parents_cons older_sister paconsXkk
est store modele_bloc3
display "------- Bloc 3 terminé -------"


* Bloc 4 : + Situation financière

probit under_18 i.huile##i.kk bl_age education girl_cons girlpower workXkk educXkk parents_cons older_sister paconsXkk access_cash dowry revenuXhuile
est store modele_bloc4
display "------- Bloc 4 terminé -------"


* Bloc 5 : + Zone géographique
* (modèle complet avec tous les contrôles)


probit under_18 i.huile##i.kk bl_age education  girl_cons girlpower workXkk educXkk parents_cons older_sister paconsXkk access_cash dowry revenuXhuile distance_hh_oil distanceXhuile
est store modele_bloc5
display "------- Bloc 5 terminé -------"


* Tableau récapitulatif clair des 5 blocs


est table modele_bloc1 modele_bloc2 modele_bloc3 modele_bloc4 modele_bloc5, b(%9.3f) star(.1 .05 .01) stats(N ll)




*=====================================================
* Effets marginaux pour le modèle complet (bloc 5)
*
* Effets marginaux moyens (APE)
est restore modele_bloc5
margins, dydx(*) post



* Interaction des traitements (huile & kk),,resultats pas surs 
est restore modele_bloc5
margins huile#kk, post
marginsplot, title("Effets combinés des traitements (modèle complet)") ///
xlabel(0 "Aucun" 1 "Huile seul" 2 "KK seul" 3 "Les deux") ylabel(0(0.1)1)




*--------------------------------------------------------------
* 1. Estimation du modèle probit par maximum de vraisemblance
*   
*--------------------------------------------------------------
probit under_18 i.huile##i.kk


* Afficher la log-vraisemblance obtenue
display "Log-vraisemblance: " e(ll)

*-----------------------------------------------------------


* Mcfadden 

Measures of Fit for probit of under_18

* 2. Prédiction de la probabilité que under_18 = 1
*    Pour chaque observation, le modèle donne p_hat = Φ(x'β)
*--------------------------------------------------------------
predict p_hat, pr

* Afficher les 10 premières prédictions pour vérifier
list under_18 p_hat in 1/10

*--------------------------------------------------------------
* 3. Classification : conversion des probabilités en prédictions
*    On classe comme 1 si p_hat >= 0.5, sinon 0.
*--------------------------------------------------------------
*calculer le seuil ptimal (indice youden)
roctab under_18 p_hat, detail

gen under_18_predict_OP = (p_hat >= 0.5686)

* Comparer les valeurs observées avec les valeurs prédites
tabulate under_18 under_18_predict_OP



*imputation  (corrections)
gen huile_dummy = (huile == 1)
gen kk_dummy = (kk == 1)

gen huile_kk = huile_dummy * kk_dummy

mi set mlong
mi register imputed huile_dummy kk_dummy huile_kk
mi register regular under_18
mi impute chained (regress) huile_dummy kk_dummy huile_kk = under_18, add(20)

*--------------------------------------------------------------
mi set mlong, clear
mi unregister huile_dummy kk_dummy huile_kk


mi register regular under_18

mi estimate: probit under_18 huile_dummy kk_dummy huile_kk
probit under_18 huile_dummy kk_dummy huile_kk

display "Log-vraisemblance: " e(ll)

*--------------------------------------------------------------
* 2. Prédiction de la probabilité que under_18 = 1
*    (Calcul de p_hat = Φ(x'β) pour chaque observation)
*--------------------------------------------------------------
predict p_hat_correction, pr
list under_18 p_hat_correction in 1/10

*--------------------------------------------------------------
* 3. Classification en utilisant le seuil optimal
*    (Ici, p_hat >= 0.5686 est considéré comme prédiction de 1)
*--------------------------------------------------------------
roctab under_18 p_hat_correction, detail
gen under_18_predict_OP2 = (p_hat_correction >= 0.5686)
tabulate under_18 under_18_predict_OP2


* 4. Évaluation des performances prédictives du modèle
* ===============================================================

* Matrice de confusion (classification avec seuil à 0.5)
estat classification, cutoff(0.5686)

* Calcul explicite des indicateurs de qualité de classification
scalar Sensibilite = r(P_p1)
scalar Specificite = r(P_n0)
scalar BienClasse = r(P_corr)

display "Sensibilité : " Sensibilite
display "Spécificité : " Specificite
display "Taux de bonne classification : " BienClasse

* ===============================================================
* 5. Performance globale : Courbe ROC
* ===============================================================

lroc


*=========================================================
*6; Analyse complémentaire 
*regression avec variable continue 


reg marriage_age i.huile##i.kk
est store ols1
display "------- OLS 1 terminé -------"

reg marriage_age i.huile##i.kk bl_age education girl_cons girlpower workXkk educXkk
est store ols2
display "------- OLS 2 terminé -------"

reg marriage_age i.huile##i.kk bl_age education girl_cons girlpower workXkk educXkk ///
                 parents_cons older_sister paconsXkk
est store ols3
display "------- OLS 3 terminé -------"

reg marriage_age i.huile##i.kk bl_age education girl_cons girlpower workXkk educXkk ///
                 parents_cons older_sister paconsXkk access_cash dowry revenuXhuile
est store ols4
display "------- OLS 4 terminé -------"

reg marriage_age i.huile##i.kk bl_age education girl_cons girlpower workXkk educXkk ///
                 parents_cons older_sister paconsXkk access_cash dowry revenuXhuile ///
                 distance_hh_oil distanceXhuile
est store ols5
display "------- OLS 5 terminé -------"

est table ols1 ols2 ols3 ols4 ols5, b(%9.3f) star(.1 .05 .01) stats(N r2)









rm(list=(ls()))

##### Inputs ###############################################

runs.to.include<-c(7:9,10,14,21,22,23,24,25,31,38,47,54,59,66,70,71,72,73,75,109,112,113,114,116,122,127,132,133,134,135,186,187,193,198,199,200:206,209:213)  # the numbers corresponding to the runs to include in the MRE summary plots
runs.to.include_brian<-c(66,75,193,200,198,199)
nsim <-500
num_dir<-205
dir_num<-c(1:169,171:175,177,179:208)    #170,176, have no converged runs so do not put into figures #178 is a repeat directory just easier to skip it; others need to be added back in eventually when runs finish

quantile.upper = 0.95
quantile.lower = 0.05

####### Where to store figures ############

Figure_dir<-"D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\manuscript\\manuscript\\Fish and Fisheries\\Figures\\R output"
Table_dir<-"D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\manuscript\\manuscript\\Fish and Fisheries\\Tables\\Output"

##########################################
na_LL<-16   #number of ages for long lived life history models
na_SL<-4    #number of ages for short lived life history models
###################### Directories that want to load (must match num_dir above) ###########################

#### Self Consistency #######################################################
wd_1<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error Random Year and Age'
nm_1<-"DD_YR+AG_No_Obs_Err"

wd_2<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error Random 2YR 1 Age'
nm_2<-"DD_2YR+1AG_No_Obs_Err"

wd_3<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error climate'
nm_3<-"CLM_YR+AG_No_Obs_Err"

wd_4<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error climate year'
nm_4<-"CLM_YR_No_Obs_Err"

wd_5<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error onto'
nm_5<-"ONT_YR+AG_No_Obs_Err"

wd_6<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error onto age'
nm_6<-"ONT_AGE_No_Obs_Err"

wd_7<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\Fixed T'
nm_7<-"DD_FIX_T"

wd_8<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\Fixed T climate'
nm_8<-"CLM_FIX_T"

wd_9<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\Fixed T onto'
nm_9<-"ONT_FIX_T"

#########################################################################################################
################### Onto ##########################################################################################################################
#######################################################################################

wd_10<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Closed Pop'
nm_10<-"ONT_NO_T"

#####################No Tags####################################


wd_11<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\No Tags\\1 YR 2 Age Block'
nm_11<-"ONT_1YR_2AG_NO_TAG"

wd_12<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\No Tags\\2 YR 1 Age Block'
nm_12<-"ONT_2YR_1AG_NO_TAG"

wd_13<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\No Tags\\2 YR 2 Age Block'
nm_13<-"ONT_2YR+2AG_NO_TAG"

wd_14<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\No Tags\\age varying T'
nm_14<-"ONT_AGE_NO_TAG"

wd_15<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\No Tags\\constant T'
nm_15<-"ONT_CNST_NO_TAG"

wd_16<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\No Tags\\Time and age varying T'
nm_16<-"ONT_YR+AG_NO_TAG"

wd_17<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\No Tags\\Time varying T'
nm_17<-"ONT_YR_NO_TAG"

################Tags#############################

wd_18<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\1 YR 2 Age Block'
nm_18<-"ONT_1YR_2AG"

wd_19<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\1 YR 2 Age Block no age 1'
nm_19<-"ONT_1YR_2AG_NO_T_AG1"

wd_20<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\2 YR 1 Age Block'
nm_20<-"ONT_2YR_1AG"

wd_21<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\2 YR 2 Age Block'
nm_21<-"ONT_2YR+2AG"

wd_22<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\age varying T'
nm_22<-"ONT_AGE"

wd_23<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\constant T'
nm_23<-"ONT_CNST"

wd_24<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\Time and age varying T'
nm_24<-"ONT_YR+AG"

wd_25<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\Time varying T'
nm_25<-"ONT_YR"

wd_26<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\Yearly Tags Time and age varying T'
nm_26<-"ONT_YR+AG_TAGS_YR"

######################Life History##################################################
################Short Lived#####################################################

wd_27<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\no move'
nm_27<-"ONT_NO_T_SL"

#####################No Tags####################################


wd_28<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\no tags\\1 YR 2 Age Block'
nm_28<-"ONT_1YR_2AG_NO_TAG_SL"

wd_29<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\no tags\\2 YR 1 Age Block'
nm_29<-"ONT_2YR_1AG_NO_TAG_SL"

wd_30<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\no tags\\2 YR 2 Age Block'
nm_30<-"ONT_2YR+2AG_NO_TAG_SL"

wd_31<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\no tags\\age varying T'
nm_31<-"ONT_AGE_NO_TAG_SL"

wd_32<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\no tags\\constant T'
nm_32<-"ONT_CNST_NO_TAG_SL"

wd_33<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\no tags\\Time and age varying T'
nm_33<-"ONT_YR+AG_NO_TAG_SL"

wd_34<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\no tags\\Time varying T'
nm_34<-"ONT_YR_NO_TAG_SL"

################Tags#############################

wd_35<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\tags\\1 YR 2 Age Block'
nm_35<-"ONT_1YR_2AG_SL"

wd_36<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\tags\\2 YR 1 Age Block'
nm_36<-"ONT_2YR_1AG_SL"

wd_37<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\tags\\2 YR 2 Age Block'
nm_37<-"ONT_2YR+2AG_SL"

wd_38<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\tags\\age varying T'
nm_38<-"ONT_AGE_SL"

wd_39<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\tags\\constant T'
nm_39<-"ONT_CNST_SL"

wd_40<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\tags\\Time and age varying T'
nm_40<-"ONT_YR+AG_SL"

wd_41<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\tags\\Time varying T'
nm_41<-"ONT_YR_SL"

wd_42<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\short lived\\tags\\Yearly Tags Time and age varying T'
nm_42<-"ONT_YR+AG_TAGS_YR_SL"

##############################################################
################Long Lived#####################################################

wd_43<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\no move'
nm_43<-"ONT_NO_T_LL"

####################No Tags####################################

wd_44<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\no tags\\1 YR 2 Age Block'
nm_44<-"ONT_1YR_2AG_NO_TAG_LL"

wd_45<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\no tags\\2 YR 1 Age Block'
nm_45<-"ONT_2YR_1AG_NO_TAG_LL"

wd_46<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\no tags\\2 YR 2 Age Block'
nm_46<-"ONT_2YR+2AG_NO_TAG_LL"

wd_47<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\no tags\\age varying T'
nm_47<-"ONT_AGE_NO_TAG_LL"

wd_48<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\no tags\\constant T'
nm_48<-"ONT_CNST_NO_TAG_LL"

wd_49<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\no tags\\Time and age varying T'
nm_49<-"ONT_YR+AG_NO_TAG_LL"

wd_50<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\no tags\\Time varying T'
nm_50<-"ONT_YR_NO_TAG_LL"

################Tags#############################

wd_51<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\tags\\1 YR 2 Age Block'
nm_51<-"ONT_1YR_2AG_LL"

wd_52<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\tags\\2 YR 1 Age Block'
nm_52<-"ONT_2YR_1AG_LL"

wd_53<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\tags\\2 YR 2 Age Block'
nm_53<-"ONT_2YR+2AG_LL"

wd_54<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\tags\\age varying T'
nm_54<-"ONT_AGE_LL"

wd_55<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\tags\\constant T'
nm_55<-"ONT_CNST_LL"

wd_56<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\tags\\Time and age varying T'
nm_56<-"ONT_YR+AG_LL"

wd_57<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\tags\\Time varying T'
nm_57<-"ONT_YR_LL"

wd_58<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Life History\\Long lived\\tags\\Yearly Tags Time and age varying T'
nm_58<-"ONT_YR+AG_TAGS_YR_LL"

##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################
################### Climate MOvement #####################################################################################
##########################################################################################################################################################
##########################################################################################################################################################

wd_59<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Closed Pop'
nm_59<-"CLM_NO_T"

#####################No Tags####################################

wd_60<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\No Tags\\1 YR 2 Age Block'
nm_60<-"CLM_1YR_2AG_NO_TAG"

wd_61<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\No Tags\\2 YR 1 Age Block'
nm_61<-"CLM_2YR_1AG_NO_TAG"

wd_62<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\No Tags\\2 YR 2 Age Block'
nm_62<-"CLM_2YR+2AG_NO_TAG"

wd_63<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\No Tags\\age varying T'
nm_63<-"CLM_AGE_NO_TAG"

wd_64<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\No Tags\\constant T'
nm_64<-"CLM_CNST_NO_TAG"

wd_65<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\No Tags\\Time and age varying T'
nm_65<-"CLM_YR+AG_NO_TAG"

wd_66<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\No Tags\\Time varying T'
nm_66<-"CLM_YR_NO_TAG"

################Tags#############################

wd_67<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\1 YR 2 Age Block'
nm_67<-"CLM_1YR_2AG"

wd_68<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\2 YR 1 Age Block'
nm_68<-"CLM_2YR_1AG"

wd_69<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\2 YR 1 Age Block no age 1'
nm_69<-"CLM_2YR_1AG_NO_T_AG1"

wd_70<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\2 YR 2 Age Block'
nm_70<-"CLM_2YR+2AG"

wd_71<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\age varying T'
nm_71<-"CLM_AGE"

wd_72<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\constant T'
nm_72<-"CLM_CNST"

wd_73<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\Time and age varying T'
nm_73<-"CLM_YR+AG"

wd_74<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\Time and age varying T no age 1'
nm_74<-"CLM_YR+AG_NO_T_AG1"

wd_75<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\Time varying T'
nm_75<-"CLM_YR"

wd_76<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\Yearly Tags Time and age varying T'
nm_76<-"CLM_YR+AG_TAGS_YR"

######################Life History##################################################
################Short Lived#####################################################

wd_77<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\no move'
nm_77<-"CLM_NO_T_SL"

#####################No Tags####################################

wd_78<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\no tags\\1 YR 2 Age Block'
nm_78<-"CLM_1YR_2AG_NO_TAG_SL"

wd_79<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\no tags\\2 YR 1 Age Block'
nm_79<-"CLM_2YR_1AG_NO_TAG_SL"

wd_80<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\no tags\\2 YR 2 Age Block'
nm_80<-"CLM_2YR+2AG_NO_TAG_SL"

wd_81<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\no tags\\age varying T'
nm_81<-"CLM_AGE_NO_TAG_SL"

wd_82<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\no tags\\constant T'
nm_82<-"CLM_CNST_NO_TAG_SL"

wd_83<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\no tags\\Time and age varying T'
nm_83<-"CLM_YR+AG_NO_TAG_SL"

wd_84<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\no tags\\Time varying T'
nm_84<-"CLM_YR_NO_TAG_SL"

################Tags#############################

wd_85<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\tags\\1 YR 2 Age Block'
nm_85<-"CLM_1YR_2AG_SL"

wd_86<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\tags\\2 YR 1 Age Block'
nm_86<-"CLM_2YR_1AG_SL"

wd_87<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\tags\\2 YR 2 Age Block'
nm_87<-"CLM_2YR+2AG_SL"

wd_88<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\tags\\age varying T'
nm_88<-"CLM_AGE_SL"

wd_89<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\tags\\constant T'
nm_89<-"CLM_CNST_SL"

wd_90<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\tags\\Time and age varying T'
nm_90<-"CLM_YR+AG_SL"

wd_91<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\tags\\Time varying T'
nm_91<-"CLM_YR_SL"

wd_92<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\short lived\\tags\\Yearly Tags Time and age varying T'
nm_92<-"CLM_YR+AG_TAGS_YR_SL"

##############################################################
################Long Lived#####################################################

wd_93<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\no move'
nm_93<-"CLM_NO_T_LL"

#####################No Tags####################################

wd_94<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\no tags\\1 YR 2 Age Block'
nm_94<-"CLM_1YR_2AG_NO_TAG_LL"

wd_95<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\no tags\\2 YR 1 Age Block'
nm_95<-"CLM_2YR_1AG_NO_TAG_LL"

wd_96<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\no tags\\2 YR 2 Age Block'
nm_96<-"CLM_2YR+2AG_NO_TAG_LL"

wd_97<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\no tags\\age varying T'
nm_97<-"CLM_AGE_NO_TAG_LL"

wd_98<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\no tags\\constant T'
nm_98<-"CLM_CNST_NO_TAG_LL"

wd_99<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\no tags\\Time and age varying T'
nm_99<-"CLM_YR+AG_NO_TAG_LL"

wd_100<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\no tags\\Time varying T'
nm_100<-"CLM_YR_NO_TAG_LL"

################Tags#############################

wd_101<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\tags\\1 YR 2 Age Block'
nm_101<-"CLM_1YR_2AG_LL"

wd_102<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\tags\\2 YR 1 Age Block'
nm_102<-"CLM_2YR_1AG_LL"

wd_103<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\tags\\2 YR 2 Age Block'
nm_103<-"CLM_2YR+2AG_LL"

wd_104<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\tags\\age varying T'
nm_104<-"CLM_AGE_LL"

wd_105<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\tags\\constant T'
nm_105<-"CLM_CNST_LL"

wd_106<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\tags\\Time and age varying T'
nm_106<-"CLM_YR+AG_LL"

wd_107<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\tags\\Time varying T'
nm_107<-"CLM_YR_LL"

wd_108<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Life History\\Long lived\\tags\\Yearly Tags Time and age varying T'
nm_108<-"CLM_YR+AG_TAGS_YR_LL"

##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################
################### Climate+Onto MOvement #####################################################################################
##########################################################################################################################################################
##########################################################################################################################################################

wd_109<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Closed Pop'
nm_109<-"C+O_NO_T"

################Tags#############################

wd_110<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\1 YR 2 Age Block'
nm_110<-"C+O_1YR_2AG"

wd_111<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\2 YR 1 Age Block'
nm_111<-"C+O_2YR_1AG"

wd_112<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\Age varying T'
nm_112<-"C+O_AGE"

wd_113<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\Constant T'
nm_113<-"C+O_CNST"

wd_114<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\Time varying T'
nm_114<-"C+O_YR"

wd_115<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\Yearly Tags Time and age varying T'
nm_115<-"C+O_YR+AG_TAG_YR"

##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################
################### Random MOvement #####################################################################################
##########################################################################################################################################################
##########################################################################################################################################################

wd_116<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Closed Pop'
nm_116<-"DD_NO_T"

#####################No Tags####################################

wd_117<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\No Tags\\1 YR 2 Age Block'
nm_117<-"DD_1YR_2AG_NO_TAG"

wd_118<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\No Tags\\2 YR 1 Age Block'
nm_118<-"DD_2YR_1AG_NO_TAG"

wd_119<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\No Tags\\2 YR 2 Age Block'
nm_119<-"DD_2YR+2AG_NO_TAG"

wd_120<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\No Tags\\age varying T'
nm_120<-"DD_AGE_NO_TAG"

wd_121<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\No Tags\\constant T'
nm_121<-"DD_CNST_NO_TAG"

wd_122<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\No Tags\\Time and age varying T'
nm_122<-"DD_YR+AG_NO_TAG"

wd_123<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\No Tags\\Time varying T'
nm_123<-"DD_YR_NO_TAG"

################Tags#############################

wd_124<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\1 YR 2 Age Block'
nm_124<-"DD_1YR_2AG"

wd_125<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\1 YR 4 Age Block'
nm_125<-"DD_1YR_4AG"

wd_126<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\2 YR 1 Age Block'
nm_126<-"DD_2YR_1AG"

wd_127<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\2 YR 2 Age Block'
nm_127<-"DD_2YR+2AG"

wd_128<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\2 YR 4 Age Block'
nm_128<-"DD_2YR_4AG"

wd_129<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\4 YR 1 Age Block'
nm_129<-"DD_4YR_1AG"

wd_130<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\4 YR 2 Age Block'
nm_130<-"DD_4YR_2AG"

wd_131<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\4 YR 4 Age Block'
nm_131<-"DD_4YR_4AG"

wd_132<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\age varying T'
nm_132<-"DD_AGE"

wd_133<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\constant T'
nm_133<-"DD_CNST"

wd_134<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\Time and age varying T'
nm_134<-"DD_YR+AG"

wd_135<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\Time varying T'
nm_135<-"DD_YR"

wd_136<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\Yearly Tags Time and age varying T'
nm_136<-"DD_YR+AG_TAGS_YR"

######################Life History##################################################
################Short Lived#####################################################

wd_137<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\no move'
nm_137<-"DD_NO_T_SL"

#####################No Tags####################################

wd_138<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\no tags\\1 YR 2 Age Block'
nm_138<-"DD_1YR_2AG_NO_TAG_SL"

wd_139<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\no tags\\2 YR 1 Age Block'
nm_139<-"DD_2YR_1AG_NO_TAG_SL"

wd_140<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\no tags\\2 YR 2 Age Block'
nm_140<-"DD_2YR+2AG_NO_TAG_SL"

wd_141<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\no tags\\age varying T'
nm_141<-"DD_AGE_NO_TAG_SL"

wd_142<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\no tags\\constant T'
nm_142<-"DD_CNST_NO_TAG_SL"

wd_143<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\no tags\\Time and age varying T'
nm_143<-"DD_YR+AG_NO_TAG_SL"

wd_144<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\no tags\\Time varying T'
nm_144<-"DD_YR_NO_TAG_SL"

################Tags#############################

wd_145<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\tags\\1 YR 2 Age Block'
nm_145<-"DD_1YR_2AG_SL"

wd_146<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\tags\\2 YR 1 Age Block'
nm_146<-"DD_2YR_1AG_SL"

wd_147<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\tags\\2 YR 2 Age Block'
nm_147<-"DD_2YR+2AG_SL"

wd_148<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\tags\\age varying T'
nm_148<-"DD_AGE_SL"

wd_149<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\tags\\constant T'
nm_149<-"DD_CNST_SL"

wd_150<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\tags\\Time and age varying T'
nm_150<-"DD_YR+AG_SL"

wd_151<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\tags\\Time varying T'
nm_151<-"DD_YR_SL"

wd_152<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\short lived\\tags\\Yearly Tags Time and age varying T'
nm_152<-"DD_YR+AG_TAGS_YR_SL"

##############################################################
################Long Lived#####################################################

wd_153<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\no move'
nm_153<-"DD_NO_T_LL"

#####################No Tags####################################

wd_154<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\no tags\\1 YR 2 Age Block'
nm_154<-"DD_1YR_2AG_NO_TAG_LL"

wd_155<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\no tags\\2 YR 1 Age Block'
nm_155<-"DD_2YR_1AG_NO_TAG_LL"

wd_156<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\no tags\\2 YR 2 Age Block'
nm_156<-"DD_2YR+2AG_NO_TAG_LL"

wd_157<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\no tags\\age varying T'
nm_157<-"DD_AGE_NO_TAG_LL"

wd_158<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\no tags\\constant T'
nm_158<-"DD_CNST_NO_TAG_LL"

wd_159<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\no tags\\Time and age varying T'
nm_159<-"DD_YR+AG_NO_TAG_LL"

wd_160<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\no tags\\Time varying T'
nm_160<-"DD_YR_NO_TAG_LL"

################Tags#############################

wd_161<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\tags\\1 YR 2 Age Block'
nm_161<-"DD_1YR_2AG_LL"

wd_162<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\tags\\2 YR 1 Age Block'
nm_162<-"DD_2YR_1AG_LL"

wd_163<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\tags\\2 YR 2 Age Block'
nm_163<-"DD_2YR+2AG_LL"

wd_164<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\tags\\age varying T'
nm_164<-"DD_AGE_LL"

wd_165<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\tags\\constant T'
nm_165<-"DD_CNST_LL"

wd_166<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\tags\\Time and age varying T'
nm_166<-"DD_YR+AG_LL"

wd_167<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\tags\\Time varying T'
nm_167<-"DD_YR_LL"

wd_168<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Life History\\Long lived\\tags\\Yearly Tags Time and age varying T'
nm_168<-"DD_YR+AG_TAGS_YR_LL"

##############################################################
################Random T Sensitivity Runs#####################################################
#####################No Tags####################################

wd_169<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\No Tags\\2 YR 1 Age Block no pen'
nm_169<-"DD_2YR_1AG_NO_TAG_NO_PEN"

wd_170<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\No Tags\\Time and age varying T no pen'
nm_170<-"DD_YR+AG_NO_TAG_NO_PEN"

wd_171<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Fixed\\No Tags\\Time and age varying T'
nm_171<-"DD_YR+AG_NO_TAG_AG1_FIX_0"
################Tags#############################

wd_172<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\1 YR 2 Age Block no pen'
nm_172<-"DD_1YR_2AG_NO_PEN"

wd_173<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\2 YR 1 Age Block no pen'
nm_173<-"DD_2YR_1AG_NO_PEN"

wd_174<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\Age Varying T no pen'
nm_174<-"DD_AGE_NO_PEN"

wd_175<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\Constant T no pen'
nm_175<-"DD_CNST_NO_PEN"

wd_176<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\Time and age varying T no pen'
nm_176<-"DD_YR+AG_NO_PEN"

wd_177<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\Time varying T no pen'
nm_177<-"DD_YR_NO_PEN"

wd_179<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\1 YR 2 Age Block Age-2 w Age 3,4'
nm_179<-"DD_1YR_2AG_AG2_w_AG3+4"

wd_180<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Fixed\\Tags\\1 YR 2 Age Block'
nm_180<-"DD_1YR_2AG_AG1_FIX_0"

wd_181<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Fixed\\Tags\\1 YR 2 Age Block Actual T not 0'
nm_181<-"DD_1YR_2AG_AG1_FIX"

wd_182<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Fixed\\Tags\\Time and age varying T'
nm_182<-"DD_YR+AG_AG1_FIX_0"

wd_183<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Fixed\\Tags\\Time and age varying T Actual T not 0'
nm_183<-"DD_YR+AG_AG1_FIX"

##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################

wd_184<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error clim onto Time and age varying T'
nm_184<-"C+O_YR+AG_No_Obs_Err"

wd_185<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error clim onto age varying T'
nm_185<-"C+O_AGE_No_Obs_Err"

wd_186<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\Fixed T clim onto'
nm_186<-"C+O_FIX_T"

wd_187<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\Time and age varying T'
nm_187<-"C+O_YR+AG"

wd_188<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\Time and age varying T no age 1'
nm_188<-"ONT_YR+AG_NO_T_AG1"

wd_189<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Ontogenetic Movement\\Tags\\2 YR 1 Age Block no age 1'
nm_189<-"ONT_2YR_1AG_NO_T_AG1"

wd_190<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error clim onto Time varying T'
nm_190<-"C+O_YR_No_Obs_Err"

wd_191<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Self Consistency\\No Obs Error clim onto 2YR 1AG'
nm_191<-"C+O_2YR_1AG_No_Obs_Err"

wd_192<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\No Tags\\Time and age varying T'
nm_192<-"C+O_YR+AG_NO_TAG"

wd_193<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\Time varying T yrly tags'
nm_193<-"CLM_YR_TAG_YR"

wd_194<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\Time varying T upwt tags'
nm_194<-"CLM_YR_TAG_UPWT"

wd_195<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\Time varying T dwnwt tags'
nm_195<-"CLM_YR_TAG_DWNWT"

wd_196<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\2YR 1AG yrly tag'
nm_196<-"C+O_2YR_1AG_TAG_YR"

wd_197<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\No Tags\\2YR 1AG'
nm_197<-"C+O_2YR_1AG_NO_TAG"

wd_198<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\2YR 2AG block'
nm_198<-"C+O_2YR+2AG"

wd_199<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\Tags\\2YR 2AG yrly tag'
nm_199<-"C+O_2YR+2AG_TAG_YR"

wd_200<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate and Onto Movement\\No Tags\\2YR 2AG'
nm_200<-"C+O_2YR+2AG_NO_TAG"

wd_201<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\No Movement\\Closed Pop'
nm_201<-"No_Move_NO_T"

wd_202<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\No Movement\\Tags\\2YR 2AG Block'
nm_202<-"No_Move_2YR+2AG"

wd_203<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\No Movement\\Tags\\Constant T'
nm_203<-"No_Move_CNST"

wd_204<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\No Movement\\Tags\\Age Varying T'
nm_204<-"No_Move_AGE"

wd_205<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\No Movement\\Tags\\Time and Age Varying T'
nm_205<-"No_Move_YR+AG"

wd_206<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\No Movement\\Tags\\Time varying T'
nm_206<-"No_Move_YR"

wd_207<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\No Movement\\No Tags\\2YR 2AG Block'
nm_207<-"No_Move_2YR+2AG_NO_TAG"

wd_208<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\No Movement\\No Tags\\Constant T'
nm_208<-"No_Move_CNST_NO_TAG"

wd_209<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Estimate Report\\C+O_2YR_2AG'
nm_209<-"C+O_2YR+2AG_Est_B"

wd_210<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Estimate Report\\CLM_Time varying T'
nm_210<-"CLM_YR_Est_B"

wd_211<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Estimate Report\\DD_Time and age varying T'
nm_211<-"DD_YR+AG_Est_B"

wd_212<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Estimate Report\\ONTO_age varying T'
nm_212<-"ONT_AGE_Est_B"

wd_213<<-'D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Climate Movement\\Tags\\2 YR 2 Age Block yrly tags'
nm_213<-"CLM_2YR+2AG_TAG_YR"
##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################
##########################################################################################################################################################


#load required libraries
load_libraries<-function() {
  library(PBSmodelling)
  library(data.table)
  library(ggplot2)
  library(reshape2)
  library(reshape)
  library(gridExtra)
  library(gplots)
  library(colorspace)
  library(RColorBrewer)
  #library(plyr)
  library(dplyr)
  library(tidyr)
  library(matrixStats) 
  library(gridExtra)
  library(grid)
  library(gtools)
  library(TeachingDemos)
  library(snowfall)
  library(parallel)
  library(snow)
  library(foreach)
  library(doSNOW)
  library(spatstat)
  library(alphahull)
  library(beanplot)
  library(png)
  library(sjPlot)
  library(xtable)
  library(forcats)
  library(ggforce)
  library(ggsci)
  library(pryr)
  library(ggh4x)
  #library(cowplot)
}
load_libraries()
#if(any(grepl("package:plyr", search()))) detach("package:plyr") else message("plyr not loaded")


#pull dimensions for building data frames for plotting
out<-readList("D:\\NOAA FILES\\Outreach\\Journal Submissions\\2019\\Journal of Applied Ecology\\movement manuscript\\runs\\Random Movement\\Age 1 T Not Fixed\\Tags\\2 YR 1 Age Block\\Diagnostics\\Results_converged\\run1.rep") #read in .rep file

#pull info about the model
na<-out$nages
nyrs<-out$nyrs
npops<-out$npops
nreg<-out$nregions
years<-seq(1:out$nyrs)
ages<-seq(1:out$nages)
if(npops>1){   #for metapop
  nreg=sum(nreg)}


vio.col<-"lightskyblue3"
median.col<-"gray25"

################

for (z in runs.to.include) {
  
  #for (z in runs.to.include_brian){ # dir_num) {
  direct_master<-eval(parse(text=paste0("wd_",z)))
  ######################################
  
  ############################################################################
  ############################ NEED TO CHANGE DEPENDING ON WHERE LIFE HISTORY RUNS ARE LOCATED ##########################
  ifelse((z>42 & z<59) || (z>92 & z<109) || (z>152 & z<169) ,na<-na_LL,ifelse((z>26 & z<43) || (z>76 & z<93) || (z>136 & z<153),na<-na_SL,na<-out$nages))
  #########################################################################################
  ####################################################################################
  ########################################
  
  diag_dir<-paste0(direct_master,"\\Diagnostics",sep="")
  runs_dir<-paste0(diag_dir,"\\Results_converged",sep="")
  
  # create a data frame for the run to hold true and estimated values from OM/EM
  
  setwd(diag_dir)
  
  ###############################################################
  # Basic Plots
  ###############################################################
  
  #load results
  
  #load up the results
  Sim_Results<-readRDS('Sim_data.RData')
  Sim_Stats<-read.csv('Sim_Stats.csv')
  conv.runs<-which(Sim_Stats$Converged==1)
  
  nconv<-length(conv.runs)
  
  #Recruitment
  rec_df_sim<-matrix(NA,nyrs*nreg,nconv)
  rec_df_est<-matrix(NA,nyrs*nreg,nconv)
  
  #SSB
  ssb_df_sim<-matrix(NA,nyrs*nreg,nconv)
  ssb_df_est<-matrix(NA,nyrs*nreg,nconv)
  
  #Biomass
  bio_df_sim<-matrix(NA,nyrs*nreg,nconv)
  bio_df_est<-matrix(NA,nyrs*nreg,nconv)
  
  #fmax
  fmax_df_sim<-matrix(NA,nyrs*nreg,nconv)
  fmax_df_est<-matrix(NA,nyrs*nreg,nconv)
  
  #movement
  move_df_sim<-matrix(NA,nyrs*nreg*na*nreg,nconv)
  move_df_est<-matrix(NA,nyrs*nreg*na*nreg,nconv)
  
  
  ###########################################################
  # populate the matrices for plotting
  for(i in 1:nconv){
    rec_df_sim[,i]<-unlist(Sim_Results["rec_sim",i])
    rec_df_est[,i]<-unlist(Sim_Results["rec_est",i])
    ssb_df_sim[,i]<-unlist(Sim_Results["ssb_sim",i])
    ssb_df_est[,i]<-unlist(Sim_Results["ssb_est",i])
    bio_df_sim[,i]<-unlist(Sim_Results["bio_sim",i])
    bio_df_est[,i]<-unlist(Sim_Results["bio_est",i])
    fmax_df_sim[,i]<-unlist(Sim_Results["fmax_sim",i])
    fmax_df_est[,i]<-unlist(Sim_Results["fmax_est",i])
    move_df_sim[,i]<-unlist(Sim_Results["movement_sim",i])
    move_df_est[,i]<-unlist(Sim_Results["movement_est",i])
  }
  
  
  assign(paste0("conv.rate_",z),nconv/nsim)
  
  
  ######################################
  # Building the plots!
  ######################################
  
  #####################################
  # Recruitment plot
  #####################################
  
  #build data.frame
  rec.data<-data.frame(Dat=c(rep("SIM",nrow(rec_df_sim)),rep("EST",nrow(rec_df_est))),Years=rep(years,nreg*2),Reg=rep(1:nreg,each=nyrs))
  
  rec.data<-cbind(rec.data,rbind(rec_df_sim,rec_df_est))
  rec.long<-melt(rec.data, id=c("Dat","Years","Reg"))
  rec.long$Reg<-as.character(rec.data$Reg)
  
  #calculate the sum across areas 
  total.rec<-data.frame(rec.long %>% group_by(Dat, Years, variable) %>% summarise(value=sum(value)))
  
  
  total.rec$Reg<-rep("System",nrow(total.rec))
  rec.long<-rbind(total.rec,rec.long)
  
  #separate again for plotting
  rec.est<-rec.long[rec.long$Dat=="EST",]
  rec.sim<-rec.long[rec.long$Dat=="SIM",]
  
  #calculate the percent bias
  rec.est$val.true<-rec.sim$value
  rec.est$bias=((rec.est$value-rec.est$val.true)/rec.est$val.true)*100
  #rec.est$bias=(rec.est$val.true-rec.est$value)
  
  #calc medians table
  rec.est.med <- rec.est %>% group_by(Reg,Years) %>%
    summarise(med.est=round(median(value),digits=2),med.sim=round(median(val.true),digits=2), med.bias = round(median(bias),digits=2),
              MARE=round(median(abs(bias)),digits=2),
              mean.est=round(mean(value),digits=2),mean.sim=round(mean(val.true),digits=2), MRE = round(mean(bias),digits=2),
              max=round(max(bias),digits=2),min=round(min(bias),digits=2),
              quant_low=quantile(bias,quantile.lower,na.rm=T),
              quant_up=quantile(bias,quantile.upper,na.rm=T),quant_low_med=quantile(bias,0.25,na.rm=T),quant_up_med=quantile(bias,0.75,na.rm=T))

  name.R<-as.data.frame(rep(get(paste0("nm_",z)), times=(nreg+1)*nyrs))
  colnames(name.R)<-"Scenario"
  R_ts<-cbind(name.R,as.data.frame(rec.est.med))  # , times=(nreg+1)*nyrs)
  ######################################
  # Biomass
  
  #build data.frame
  bio.data<-data.frame(Dat=c(rep("SIM",nrow(bio_df_sim)),rep("EST",nrow(bio_df_est))),Years=rep(years,nreg*2),Reg=rep(1:nreg,each=nyrs))
  
  bio.data<-cbind(bio.data,rbind(bio_df_sim,bio_df_est))
  bio.long<-melt(bio.data, id=c("Dat","Years","Reg"))
  bio.long$Reg<-as.character(bio.data$Reg)
  
  #calculate the sum across areas 
  total.bio<-data.frame(bio.long %>% group_by(Dat, Years, variable) %>% summarise(value=sum(value)))
  
  total.bio$Reg<-rep("System",nrow(total.bio))
  bio.long<-rbind(total.bio,bio.long)
  
  
  #separate again for plotting
  bio.est<-bio.long[bio.long$Dat=="EST",]
  bio.sim<-bio.long[bio.long$Dat=="SIM",]
  
  
  #calculate the percent bias
  bio.est$val.true<-bio.sim$value
  bio.est$bias=((bio.est$value-bio.est$val.true)/bio.est$val.true)*100
  
  #calc medians table
  bio.est.med <- bio.est %>% group_by(Reg,Years) %>%
    summarise(med.est=round(median(value,na.rm=T),digits=2),med.sim=round(median(val.true,na.rm=T),digits=2), 
              med.bias = round(median(bias,na.rm=T),digits=2), MARE=round(median(abs(bias)),digits=2),
              mean.est=round(mean(value,na.rm=T),digits=2),mean.sim=round(mean(val.true,na.rm=T),digits=2), MRE = round(mean(bias,na.rm=T),digits=2),
              max=round(max(bias,na.rm=T),digits=2),min=round(min(bias,na.rm=T),digits=2),quant_low=quantile(bias,quantile.lower,na.rm=T),
              quant_up=quantile(bias,quantile.upper,na.rm=T),quant_low_med=quantile(bias,0.25,na.rm=T),quant_up_med=quantile(bias,0.75,na.rm=T))
  name.bio<-as.data.frame(rep(get(paste0("nm_",z)), times=(nreg+1)*nyrs))
  colnames(name.bio)<-"Scenario"
  bio_ts<-cbind(name.bio,as.data.frame(bio.est.med))  # , times=(nreg+1)*nyrs)
  ######################################
  # SSB
  
  #build data.frame
  ssb.data<-data.frame(Dat=c(rep("SIM",nrow(ssb_df_sim)),rep("EST",nrow(ssb_df_est))),Years=rep(years,nreg*2),Reg=rep(1:nreg,each=nyrs))
  
  ssb.data<-cbind(ssb.data,rbind(ssb_df_sim,ssb_df_est))
  ssb.long<-melt(ssb.data, id=c("Dat","Years","Reg"))
  ssb.long$Reg<-as.character(ssb.data$Reg)
  
  #calculate the sum across areas 
  total.ssb<-data.frame(ssb.long %>% group_by(Dat, Years, variable) %>% summarise(value=sum(value)))
  
  total.ssb$Reg<-rep("System",nrow(total.ssb))
  ssb.long<-rbind(total.ssb,ssb.long)
  
  
  #separate again for plotting
  ssb.est<-ssb.long[ssb.long$Dat=="EST",]
  ssb.sim<-ssb.long[ssb.long$Dat=="SIM",]
  
  
  #calculate the percent bias
  ssb.est$val.true<-ssb.sim$value
  ssb.est$bias=((ssb.est$value-ssb.est$val.true)/ssb.est$val.true)*100
  
  #calc medians table
  ssb.est.med <- ssb.est %>% group_by(Reg,Years) %>%
    summarise(med.est=round(median(value,na.rm=T),digits=2),med.sim=round(median(val.true,na.rm=T),digits=2), 
              med.bias = round(median(bias,na.rm=T),digits=2), MARE=round(median(abs(bias)),digits=2),
              mean.est=round(mean(value,na.rm=T),digits=2),mean.sim=round(mean(val.true,na.rm=T),digits=2), MRE = round(mean(bias,na.rm=T),digits=2),
              max=round(max(bias,na.rm=T),digits=2),min=round(min(bias,na.rm=T),digits=2),quant_low=quantile(bias,quantile.lower,na.rm=T),
              quant_up=quantile(bias,quantile.upper,na.rm=T),quant_low_med=quantile(bias,0.25,na.rm=T),quant_up_med=quantile(bias,0.75,na.rm=T))
  name.ssb<-as.data.frame(rep(get(paste0("nm_",z)), times=(nreg+1)*nyrs))
  colnames(name.ssb)<-"Scenario"
  ssb_ts<-cbind(name.ssb,as.data.frame(ssb.est.med))  # , times=(nreg+1)*nyrs)
  
  ##############################################################
  ###F Max
  
  #build data.frame
  fmax.data.sim<-data.frame(Dat=rep("SIM",nrow(fmax_df_sim)),Years=rep(years,nreg),Reg=rep(1:nreg,each=nyrs))
  fmax.data.est<-data.frame(Dat=rep("EST",nrow(fmax_df_est)),Years=rep(years,nreg),Reg=rep(1:nreg,each=nyrs))
  
  fmax.data<-rbind(fmax.data.sim,fmax.data.est)
  
  fmax.data<-cbind(fmax.data,rbind(fmax_df_sim,fmax_df_est))
  fmax.long<-melt(fmax.data, id=c("Dat","Years","Reg"))
  fmax.long$Reg<-as.character(fmax.data$Reg)
  
  
  #separate again for plotting
  fmax.est<-fmax.long[fmax.long$Dat=="EST",]
  fmax.sim<-fmax.long[fmax.long$Dat=="SIM",]
  
  
  #calculate the percent bias
  fmax.est$val.true<-fmax.sim$value
  fmax.est$bias=((fmax.est$value-fmax.est$val.true)/fmax.est$val.true)*100
  #fmax.est$bias=((fmax.est$val.true-fmax.est$value))
  
  #calc medians table
  fmax.est.med <- fmax.est %>% group_by(Reg,Years) %>%
    summarise(med.est=round(median(value),digits=2),med.sim=round(median(val.true),digits=2), med.bias = round(median(bias),digits=2),
              MARE=round(median(abs(bias)),digits=2),
              mean.est=round(mean(value),digits=2),mean.sim=round(mean(val.true),digits=2), MRE = round(mean(bias),digits=2),
              max=round(max(bias),digits=2),min=round(min(bias),digits=2),
              quant_low=quantile(bias,quantile.lower,na.rm=T),
              quant_up=quantile(bias,quantile.upper,na.rm=T),quant_low_med=quantile(bias,0.25,na.rm=T),quant_up_med=quantile(bias,0.75,na.rm=T))
  
  name.F<-as.data.frame(rep(get(paste0("nm_",z)), times=(nreg)*nyrs))
  colnames(name.F)<-"Scenario"
  f_ts<-cbind(name.F,as.data.frame(fmax.est.med))  # , times=(nreg+1)*nyrs)
  #Movement
  
  movement.data.sim<-data.frame(Dat=rep("SIM",nrow(move_df_sim)),Year=rep(1:nyrs,each=na*nreg, times=nreg),Reg_from=rep(1:nreg,each=nyrs*nreg*na),Reg_to=rep(1:nreg,times=nyrs*nreg*na),
                                Age=rep(1:na,each=nreg,times=nyrs*nreg))
  
  movement.data.est<-data.frame(Dat=rep("EST",nrow(move_df_est)),Year=rep(1:nyrs,each=na*nreg, times=nreg),Reg_from=rep(1:nreg,each=nyrs*nreg*na),Reg_to=rep(1:nreg,times=nyrs*nreg*na),
                                Age=rep(1:na,each=nreg,times=nyrs*nreg))
  
  movement.data<-rbind(movement.data.sim,movement.data.est)
  movement.data<-cbind(movement.data,rbind(move_df_sim,move_df_est))
  
  move.long<-melt(movement.data, id=c("Dat","Year","Reg_from","Reg_to","Age"))
  move.long$Reg_from<-as.character(move.long$Reg_from)
  move.long$Reg_to<-as.character(move.long$Reg_to)
  move.long$Age<-as.character(move.long$Age)
  
  #separate again for plotting
  move.est<-move.long[move.long$Dat=="EST",]
  move.sim<-move.long[move.long$Dat=="SIM",]
  
  #calculate the percent bias
  move.est$val.true<-move.sim$value
  move.est$bias=((move.est$value-move.est$val.true)/move.est$val.true)*100
  #move.est$bias=(move.est$val.true-move.est$value)
  
  
  #calc medians table
  move.est.med <- move.est %>% group_by(Reg_from,Reg_to,Age,Year) %>%
    summarise(med.est=round(median(value),digits=2),med.sim=round(median(val.true),digits=2), med.bias = round(median(bias),digits=2),
              MARE=round(median(abs(bias)),digits=2),
              mean.est=round(mean(value),digits=2),mean.sim=round(mean(val.true),digits=2), MRE = round(mean(bias),digits=2),
              max=round(max(bias),digits=2),min=round(min(bias),digits=2),quant_low=quantile(bias,quantile.lower,na.rm=T),
              quant_up=quantile(bias,quantile.upper,na.rm=T),quant_low_med=quantile(bias,0.25,na.rm=T),quant_up_med=quantile(bias,0.75,na.rm=T))
  

  name.T<-as.data.frame(rep(get(paste0("nm_",z)), times=(nreg*nreg)*nyrs*na))
  colnames(name.T)<-"Scenario"
  T_ts<-cbind(name.T,as.data.frame(move.est.med))  # , times=(nreg+1)*nyrs)
  
  assign(paste0("rec.est_",z),rec.est)
  assign(paste0("ssb.est_",z),ssb.est)
  assign(paste0("bio.est_",z),bio.est)
  assign(paste0("fmax.est_",z),fmax.est)
  assign(paste0("move.est_",z),move.est)
  
  assign(paste0("bio.ts_",z),bio_ts)
  assign(paste0("ssb.ts_",z),ssb_ts)
  assign(paste0("f.ts_",z),f_ts)
  assign(paste0("R.ts_",z),R_ts)
  assign(paste0("T.ts_",z),T_ts)

  
}



#################################################################################################
setwd(Table_dir)

MARE.table<-read.csv("MARE.csv")
MRE.table<-read.csv("MRE.csv")

setwd(Figure_dir)

MARE.graph<-MARE.table[,-c(1:2)]
MRE.graph<-MRE.table[,-c(1:2)]
MARE.graph<-data.frame(sapply(MARE.graph, function(x) as.numeric(as.character(x))))
MRE.graph<-data.frame(sapply(MRE.graph, function(x) as.numeric(as.character(x))))


MRE.bio.graph<-sapply(runs.to.include, function(i) list(get(paste0("bio.est_",i))))
names(MRE.bio.graph)<-sapply(runs.to.include, function(i) get(paste0("nm_",i)))
MRE.bio.graph<-rbindlist(MRE.bio.graph,idcol=TRUE)
MRE.bio.graph$parameter<-'B'

MRE.ssb.graph<-sapply(runs.to.include, function(i) list(get(paste0("ssb.est_",i))))
names(MRE.ssb.graph)<-sapply(runs.to.include, function(i) get(paste0("nm_",i)))
MRE.ssb.graph<-rbindlist(MRE.ssb.graph,idcol=TRUE)
MRE.ssb.graph$parameter<-'S'

MRE.rec.graph<-sapply(runs.to.include, function(i) list(get(paste0("rec.est_",i))))
names(MRE.rec.graph)<-sapply(runs.to.include, function(i) get(paste0("nm_",i)))
#MRE.rec.graph<-ldply(MRE.rec.graph,data.frame)
MRE.rec.graph<-rbindlist(MRE.rec.graph,idcol=TRUE)
MRE.rec.graph$parameter<-'R'

MRE.f.graph<-sapply(runs.to.include, function(i) list(get(paste0("fmax.est_",i))))
names(MRE.f.graph)<-sapply(runs.to.include, function(i) get(paste0("nm_",i)))
#MRE.f.graph<-ldply(MRE.f.graph,data.frame)
MRE.f.graph<-rbindlist(MRE.f.graph,idcol=TRUE)
MRE.f.graph$parameter<-'Z_F'

MRE.T.graph<-sapply(runs.to.include, function(i) list(get(paste0("move.est_",i))))
names(MRE.T.graph)<-sapply(runs.to.include, function(i) get(paste0("nm_",i)))
#MRE.T.graph<-ldply(MRE.T.graph,data.frame)
MRE.T.graph<-rbindlist(MRE.T.graph,idcol=TRUE)

MRE.T.graph$parameter<-'Z_T'
MRE.T.graph<-MRE.T.graph[-which(MRE.T.graph$Reg_from==MRE.T.graph$Reg_to),]
MRE.T.graph<-MRE.T.graph[,-5]
MRE.T.graph<-dplyr::rename(MRE.T.graph,"Reg"="Reg_from")
MRE.T.graph<-dplyr::rename(MRE.T.graph,"Years"="Year")
MRE.T.graph<-MRE.T.graph[,c(1:3,5:6,4,7:9)]

region.names<-c('1'="Population 1", '2'="Population 2",'System'="Metapopulation",'B'="Biomass",
                'Z_F'="Fishing Mortality",'R'="Recruitment",'Z_T'="Movement")


runs.to.include_summary<-c(116,133,132,135,127,134,59,72,71,75,70,73,10,23,22,25,21,24,109,113,112,114,198,187) 

names.keep<-c(sapply(runs.to.include_summary, function(i) get(paste0("nm_",i))))
MRE.bio.graph2<-MRE.bio.graph[MRE.bio.graph$.id %in% names.keep,]
MRE.ssb.graph2<-MRE.ssb.graph[MRE.ssb.graph$.id %in% names.keep,]

MRE.f.graph2<-MRE.f.graph[MRE.f.graph$.id %in% names.keep,]
MRE.rec.graph2<-MRE.rec.graph[MRE.rec.graph$.id %in% names.keep,]
MRE.T.graph2<-MRE.T.graph[MRE.T.graph$.id %in% names.keep,]
MRE.T.graph2$Reg[which(MRE.T.graph2$Reg=="1")]<-"Population 1"
MRE.T.graph2$Reg[which(MRE.T.graph2$Reg=="2")]<-"Population 2"

MRE.graph.final<-rbind.data.frame(MRE.bio.graph2,MRE.rec.graph2,MRE.f.graph2) #,MRE.T.graph2)
MRE.graph.final<-MRE.graph.final[-which(MRE.graph.final$Reg=='System'),]

MRE.bio.graph.term<-MRE.bio.graph2[MRE.bio.graph2$Years ==nyrs,]
MRE.f.graph.term<-MRE.f.graph2[MRE.f.graph2$Years ==nyrs,]
MRE.rec.graph.term<-MRE.rec.graph2[MRE.rec.graph2$Years ==nyrs,]
MRE.T.graph.term<-MRE.T.graph2[MRE.T.graph2$Years ==nyrs,]

MRE.graph.final.term<-rbind.data.frame(MRE.bio.graph.term,MRE.rec.graph.term,MRE.f.graph.term) #,MRE.T.graph.term)
MRE.graph.final.term<-MRE.graph.final.term[-which(MRE.graph.final.term$Reg=='System'),]

MRE.graph.final$.id<-ordered(MRE.graph.final$.id,levels=names.keep)
MRE.graph.final.term$.id<-ordered(MRE.graph.final.term$.id,levels=names.keep)

MRE.T.graph2$.id<-ordered(MRE.T.graph2$.id,levels=names.keep)
MRE.T.graph.term$.id<-ordered(MRE.T.graph.term$.id,levels=names.keep)


my_theme.K<-
  (theme_bw()+
     theme(
       panel.grid.major = element_blank(), 
       panel.grid.minor = element_blank(),
       axis.text.x = element_text(colour="grey20",size=8,angle=0,hjust=.5,vjust=0,face="plain"),
       strip.background=element_rect(fill="grey95"),
       strip.text.x=element_text(size=rel(1),face="bold"),
       strip.text.y=element_text(size=rel(1), angle=-90,face="bold") 
     ))

########################################################################################################
########################################################################################################
#######################################################################################################



########################################################################################################
########################################################################################################
######## Figure 2 SSB Bias Timeseries ################################################################################################
########################################################################################################
########################################################################################################


runs.to.include.ts<-c(22,134,75,198)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("DD_YR+AG","ONT_AGE","CLM_YR","C+O_2YR+2AG"))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("Fig 2 Timeseries ssb Final.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

tiff("Figure_2.tif",width=240,height=190, unit='mm',res=500,compression="lzw")
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()
########################################################################################################
########################################################################################################
######## Figure 3 F Bias Timeseries Min-Max Solution ################################################################################################
########################################################################################################
###########################################################################################


runs.to.include.ts<-c(22,134,75,198)
F.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("f.ts_",i))))
F.med.bias<-rbindlist(F.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
F.med.bias2<-F.med.bias[F.med.bias$Scenario %in% names.keep.ts,]
F.med.bias2$Reg[which(F.med.bias2$Reg=="1")]<-"Population 1"
F.med.bias2$Reg[which(F.med.bias2$Reg=="2")]<-"Population 2"
F.med.bias2$Scenario<-factor(F.med.bias2$Scenario,levels=c("DD_YR+AG","ONT_AGE","CLM_YR","C+O_2YR+2AG"))

#create bias plot
sp.bias.gg<-ggplot(F.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=F.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=F.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=F.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = F.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("Fig 3 Timeseries Bias F Min_Max Solutions.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

tiff("Figure_3.tif",width=240,height=190, unit='mm',res=500, compression="lzw")
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

########################################################################################################
########################################################################################################
######## Figure 4 SSB Bias Timeseries No Movement ################################################################################################
########################################################################################################
########################################################################################################


runs.to.include.ts<-c(116,10,109,59)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("DD_NO_T","ONT_NO_T","CLM_NO_T","C+O_NO_T"))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("Fig 4 SSB Timeseries No T.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

tiff("Figure_4.tif",width=240,height=190, unit='mm',res=500, compression='lzw')
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

########################################################################################################
########################################################################################################
######## Figure 5 F Bias Timeseries No Movement ################################################################################################
########################################################################################################
########################################################################################################


runs.to.include.ts<-c(116,10,109,59)
F.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("f.ts_",i))))
F.med.bias<-rbindlist(F.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
F.med.bias2<-F.med.bias[F.med.bias$Scenario %in% names.keep.ts,]
F.med.bias2$Reg[which(F.med.bias2$Reg=="1")]<-"Population 1"
F.med.bias2$Reg[which(F.med.bias2$Reg=="2")]<-"Population 2"
F.med.bias2$Scenario<-factor(F.med.bias2$Scenario,levels=c("DD_NO_T","ONT_NO_T","CLM_NO_T","C+O_NO_T"))

#create bias plot
sp.bias.gg<-ggplot(F.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=F.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=F.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=F.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = F.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("Fig 5 F Timeseries No T.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

tiff("Figure_5.tif",width=240,height=190, unit='mm',res=500,compression="lzw")
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()


########################################################################################################
########################################################################################################
######## FIGURE 6 CLIMATE No Move 2YR_2AG Comp ################################################################################################
########################################################################################################
############################################################################################

runs.to.include.ts<-c(59,70)

ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("CLM_NO_T", "CLM_2YR+2AG"))

R.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("R.ts_",i))))
R.med.bias<-rbindlist(R.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
R.med.bias2<-R.med.bias[R.med.bias$Scenario %in% names.keep.ts,]
R.med.bias2$Reg[which(R.med.bias2$Reg=="1")]<-"Population 1"
R.med.bias2$Reg[which(R.med.bias2$Reg=="2")]<-"Population 2"
R.med.bias2$Scenario<-factor(R.med.bias2$Scenario,levels=c("CLM_NO_T", "CLM_2YR+2AG"
))

R.med.bias2$Par<-"Recruitment"
ssb.med.bias2$Par<-"Spawning Biomass"
CLM.graph<-rbind(R.med.bias2,ssb.med.bias2)
CLM.graph$Par<-factor(CLM.graph$Par,levels=c("Spawning Biomass", "Recruitment"
))

sp.bias.gg3<-ggplot(CLM.graph, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  # geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  # geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=CLM.graph, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = CLM.graph, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_nested(Reg~Par+Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("Fig 6 SSB+RECR Timeseries CLM No T 2YR2AG.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg3)
dev.off()

tiff("Figure_6.tif",width=240,height=190, unit='mm',res=500, compression='lzw')
par(mar=c(6,6,6,6))
print(sp.bias.gg3)
dev.off()



sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
 # geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
 # geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("Fig 6b SSB Timeseries CLM No T 2YR2AG.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

tiff("Figure_6b.tif",width=240,height=190, unit='mm',res=500, compression='lzw')
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

sp.bias.gg2<-ggplot(R.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  #geom_ribbon(data=R.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  #geom_ribbon(data=R.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=R.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = R.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
 # scale_y_continuous(breaks=seq(-50,50,10))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K

tiff("Fig 6a CLIM RECRUITMENT ZOOM Timeseries Climate FULL.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg2)
dev.off()

tiff("Figure_6a.tif",width=240,height=190, unit='mm',res=500, compression="lzw")
par(mar=c(6,6,6,6))
print(sp.bias.gg2)
dev.off()

##########################################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################
########### SM Fig 2 Timeseries of Movement Parameters ###############################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################

names.keep.fig1<-c("CLM_YR","ONT_AGE","C+O_2YR+2AG","DD_YR+AG")
MRE.graph.final.fig1.1<-rbind.data.frame(MRE.ssb.graph2,MRE.rec.graph2,MRE.f.graph2) #,MRE.T.graph2)
#MRE.graph.final.fig1.1<-MRE.graph.final.fig1.1[-which(MRE.graph.final.fig1.1$Reg=='System'),]
MRE.graph.final.fig1.1$.id<-ordered(MRE.graph.final.fig1.1$.id,levels=names.keep.fig1)

MRE.graph2.fig1.1<-MRE.graph.final.fig1.1[MRE.graph.final.fig1.1$.id %in% names.keep.fig1,]
MRE.graph2.fig1<-MRE.graph2.fig1.1[MRE.graph2.fig1.1$variable %in% '1',]
MRE.graph2.fig1$.id<-factor(MRE.graph2.fig1$.id,levels=c("DD_YR+AG","ONT_AGE","CLM_YR","C+O_2YR+2AG"))
MRE.graph2.fig1$Reg<-factor(MRE.graph2.fig1$Reg,levels=c("1","2","System"))

levels(MRE.graph2.fig1$.id)[levels(MRE.graph2.fig1$.id)=="DD_YR+AG"] <- "Density-Dependent (DD)"
levels(MRE.graph2.fig1$.id)[levels(MRE.graph2.fig1$.id)=="ONT_AGE"] <- "Ontogenetic (ONT)"
levels(MRE.graph2.fig1$.id)[levels(MRE.graph2.fig1$.id)=="CLM_YR"] <- "Climate (CLM)"
levels(MRE.graph2.fig1$.id)[levels(MRE.graph2.fig1$.id)=="C+O_2YR+2AG"] <- "Climate and Ontogenetic (C+O)"
names(MRE.graph2.fig1)[names(MRE.graph2.fig1)==".id"]  <- "Movement"
region.names5<-c('1'="Population 1", '2'="Population 2",'System'="System",'S'="Spanwing Biomass (mt)", #'B'="Biomass (mt)"
                 'Z_F'="Fishing Mortality" ,'R'="Recruitment (1000s Fish)",'Z_T'="Movement")

MRE.graph2.fig2.1<-MRE.T.graph2[MRE.T.graph2$.id %in% names.keep.fig1,]
MRE.graph2.fig2<-MRE.graph2.fig2.1[MRE.graph2.fig2.1$variable %in% '1',]
MRE.graph2.fig2$.id<-factor(MRE.graph2.fig2$.id,levels=c("DD_YR+AG","ONT_AGE","CLM_YR","C+O_2YR+2AG"))
levels(MRE.graph2.fig2$.id)[levels(MRE.graph2.fig2$.id)=="DD_YR+AG"] <- "Density Dependent (DD)"
levels(MRE.graph2.fig2$.id)[levels(MRE.graph2.fig2$.id)=="ONT_AGE"] <- "Ontogenetic (ONT)"
levels(MRE.graph2.fig2$.id)[levels(MRE.graph2.fig2$.id)=="CLM_YR"] <- "Climate (CLM)"
levels(MRE.graph2.fig2$.id)[levels(MRE.graph2.fig2$.id)=="C+O_2YR+2AG"] <- "Climate and Ontogenetic (C+O)"
names(MRE.graph2.fig2)[names(MRE.graph2.fig2)==".id"]  <- "Movement"
region.names5<-c('1'="Population 1", '2'="Population 2",'System'="Metapopulation",'B'="Biomass (mt)",
                 'Z_F'="Fishing Mortality" ,'R'="Recruitment (1000s Fish)",'Z_T'="Movement")


age.names<-c('1'="Age-1", '2'="Age-2",'3'="Age-3", '4'="Age-4",'5'="Age-5", '6'="Age-6",'7'="Age-7", '8'="Age-8",'Population 1'="Emigration from Population 1",'Population 2'="Emigration from Population 2")


true.ts1<- ggplot(MRE.graph2.fig2, aes(x=as.factor(Years), y=val.true,group=Movement)) +    #med.bias
  geom_line(aes(x=as.factor(Years), y=val.true, linetype=Movement,color=Movement),lwd=1.)+
  scale_x_discrete(breaks=seq(0,nyrs,10))+
  ggtitle(" ")+
  ylab("")+
  xlab("Year")+
  facet_grid(Reg~Age,labeller= as_labeller(age.names))+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K+
  scale_color_grey()+
  scale_linetype_manual(values=c(4,5,6,1))+
  labs(color="",linetype="", shape="",caption="Simulated Movement Scenario")+
  theme(plot.caption=element_text(hjust=0.5,size=rel(1.2)),legend.position="bottom",legend.margin=margin(c(4,4,4,4)),legend.text=element_text(size=9),legend.key.width=unit(3,"line"),
        legend.key.size = unit(.1,"cm"),legend.spacing.x = unit(.2, 'cm'),legend.background=element_rect(color=NA))


tiff("SM Fig 2 Timeseries True Movement_B+W.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(true.ts1)
dev.off()


true.ts1<- ggplot(MRE.graph2.fig2, aes(x=as.factor(Years), y=val.true,group=Movement)) +    #med.bias
  geom_line(aes(x=as.factor(Years), y=val.true, linetype=Movement,color=Movement),lwd=1.)+
  scale_x_discrete(breaks=seq(0,nyrs,10))+
  ggtitle(" ")+
  ylab("")+
  xlab("Year")+
  facet_grid(Reg~Age,labeller= as_labeller(age.names))+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K+
  scale_color_npg()+
  scale_linetype_manual(values=c(4,5,6,1))+
  labs(color="",linetype="", shape="",caption="Simulated Movement Scenario")+
  theme(plot.caption=element_text(hjust=0.5,size=rel(1.2)),legend.position="bottom",legend.margin=margin(c(4,4,4,4)),legend.text=element_text(size=9),legend.key.width=unit(3,"line"),
        legend.key.size = unit(.1,"cm"),legend.spacing.x = unit(.2, 'cm'),legend.background=element_rect(color=NA))
#guide_legend(ncol=4)



tiff("SM Fig 2 Timeseries True Movement_color.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(true.ts1)
dev.off()

##########################################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################
########### SM Fig 3 Timeseries of True Pop Parameters ###############################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################

#create bias plot
true.ts<- ggplot(MRE.graph2.fig1, aes(x=as.factor(Years), y=val.true,group=Movement)) +    #med.bias
  geom_line(aes(x=as.factor(Years), y=val.true, linetype=Movement,color=Movement),lwd=1.)+
  scale_x_discrete(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("")+
  xlab("Year")+
  facet_grid(parameter~Reg,scales= "free",labeller= as_labeller(region.names5), drop=TRUE)+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K+
  #theme(legend.position="bottom")+
  scale_color_grey()+
  scale_linetype_manual(values=c(4,5,6,1))+
  labs(color="Simulated Movement Scenario",linetype="Simulated Movement Scenario", shape="Simulated Movement Scenario")+
  theme(legend.position=c(.838,.15),legend.margin=margin(c(4,4,4,4)),legend.text=element_text(size=10),legend.key.width=unit(3,"line"),
        legend.key.size = unit(.7,"cm"),legend.spacing.x = unit(.2, 'cm'),legend.background=element_rect(color=NA))


tiff("SM Fig 3 Timeseries True Values_B+W.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(true.ts)
dev.off()


true.ts<- ggplot(MRE.graph2.fig1, aes(x=as.factor(Years), y=val.true,group=Movement)) +    #med.bias
  geom_line(aes(x=as.factor(Years), y=val.true, linetype=Movement,color=Movement),lwd=1.)+
  scale_x_discrete(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("")+
  xlab("Year")+
  facet_grid(parameter~Reg,scales= "free",labeller= as_labeller(region.names5), drop=TRUE)+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K+
  scale_color_npg()+
  scale_linetype_manual(values=c(4,5,6,1))+
  labs(color="Simulated Movement Scenario",linetype="Simulated Movement Scenario", shape="Simulated Movement Scenario")+
  theme(legend.position=c(.838,.15),legend.margin=margin(c(4,4,4,4)),legend.text=element_text(size=10),legend.key.width=unit(3,"line"),
        legend.key.size = unit(.7,"cm"),legend.spacing.x = unit(.2, 'cm'),legend.background=element_rect(color=NA))



tiff("SM Fig 3 Timeseries True Values_color.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(true.ts)
dev.off()


########################################################################################################
########################################################################################################
######## SM Figure 4 R Bias Timeseries Min-Max Solution ################################################################################################
########################################################################################################
###########################################################################################

my_theme.K<-
  (theme_bw()+
     theme(
       panel.grid.major = element_blank(), 
       panel.grid.minor = element_blank(),
       axis.text.x = element_text(colour="grey20",size=8,angle=0,hjust=.5,vjust=0,face="plain"),
       strip.background=element_rect(fill="grey95"),
       strip.text.x=element_text(size=rel(1),face="bold"),
       strip.text.y=element_text(size=rel(1), angle=-90,face="bold") 
     ))


runs.to.include.ts<-c(22,134,75,198)
R.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("R.ts_",i))))
R.med.bias<-rbindlist(R.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
R.med.bias2<-R.med.bias[R.med.bias$Scenario %in% names.keep.ts,]
R.med.bias2$Reg[which(R.med.bias2$Reg=="1")]<-"Population 1"
R.med.bias2$Reg[which(R.med.bias2$Reg=="2")]<-"Population 2"
R.med.bias2$Scenario<-factor(R.med.bias2$Scenario,levels=c("DD_YR+AG","ONT_AGE","CLM_YR","C+O_2YR+2AG"))

#create bias plot
sp.bias.gg<-ggplot(R.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=R.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=R.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=R.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = R.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 4 Timeseries Bias Recr Min_Max Solutions.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

########################################################################################################
########################################################################################################
######## SM Figure 5 T Bias Timeseries Min-Max Age 5 ################################################################################################
########################################################################################################
########################################################################################################

runs.to.include.ts<-c(22,134,75,198)
T.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("T.ts_",i))))
T.med.bias<-rbindlist(T.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
T.med.bias2<-T.med.bias[T.med.bias$Scenario %in% names.keep.ts,]
T.med.bias2<-T.med.bias2[-which(T.med.bias2$Reg_from==T.med.bias2$Reg_to),]
T.med.bias2<-T.med.bias2[-which(T.med.bias2$Age=='1'),]
T.med.bias2<-T.med.bias2[-which(T.med.bias2$Age=='2'),]
T.med.bias2<-T.med.bias2[-which(T.med.bias2$Age=='3'),]
T.med.bias2<-T.med.bias2[-which(T.med.bias2$Age=='6'),]
T.med.bias2<-T.med.bias2[-which(T.med.bias2$Age=='7'),]
T.med.bias2<-T.med.bias2[-which(T.med.bias2$Age=='8'),]
T.med.bias2$Reg_from[which(T.med.bias2$Reg_from=="1")]<-"Emigration from Population 1"
T.med.bias2$Reg_from[which(T.med.bias2$Reg_from=="2")]<-"Emigration from Population 2"
T.med.bias2$Age[which(T.med.bias2$Age=="4")]<-"Age-4"
T.med.bias2$Age[which(T.med.bias2$Age=="5")]<-"Age-5"
T.med.bias2$Scenario<-factor(T.med.bias2$Scenario,levels=c("DD_YR+AG","ONT_AGE","CLM_YR","C+O_2YR+2AG"))

#create bias plot
sp.bias.gg<-ggplot(T.med.bias2, aes(x=as.factor(Year), y=med.bias)) +    
  geom_ribbon(data=T.med.bias2, aes(x=Year,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=T.med.bias2, aes(x=Year,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=T.med.bias2, aes(x=Year,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  geom_hline(aes(yintercept = 0, group=Reg_from), colour = 'black',size=0.5,lty=2)+
  geom_point(data = T.med.bias2, aes(x=Year,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_nested(Reg_from~Scenario+Age,scales= "free")+ 
  my_theme.K


tiff("SM Fig 5 Timeseries Bias Move Min_Max Solutions.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()


########################################################################################################
########################################################################################################
######## SM Figure 6 SSB Bias Timeseries 2YR_2AG Runs ################################################################################################
########################################################################################################
############################################################################################

runs.to.include.ts<-c(70,198,21,127)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("DD_2YR+2AG","ONT_2YR+2AG","CLM_2YR+2AG","C+O_2YR+2AG"))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 6 SSB Timeseries 2YR_2AG.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()


########################################################################################################
########################################################################################################
######## SM Figure 7 SSB Bias Timeseries Climate ################################################################################################
########################################################################################################
############################################################################################

runs.to.include.ts<-c(59,72,71,75,70,73,193)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("CLM_NO_T","CLM_CNST","CLM_AGE","CLM_YR","CLM_YR_TAG_YR",
                                                               "CLM_2YR+2AG","CLM_YR+AG"))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 7 SSB Timeseries Climate.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()


########################################################################################################
########################################################################################################
######## SM Figure 8 SSB Bias Timeseries C+O ################################################################################################
########################################################################################################
############################################################################################


runs.to.include.ts<-c(109,113,112,114,198,187)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("C+O_NO_T","C+O_CNST","C+O_AGE","C+O_YR","C+O_2YR+2AG","C+O_YR+AG"))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 8 SSB Timeseries Onto+Clim.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()


########################################################################################################
########################################################################################################
######## SM Figure 9 R Bias Timeseries No Movement ################################################################################################
########################################################################################################
########################################################################################################


runs.to.include.ts<-c(116,10,109,59)
R.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("R.ts_",i))))
R.med.bias<-rbindlist(R.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
R.med.bias2<-R.med.bias[R.med.bias$Scenario %in% names.keep.ts,]
R.med.bias2$Reg[which(R.med.bias2$Reg=="1")]<-"Population 1"
R.med.bias2$Reg[which(R.med.bias2$Reg=="2")]<-"Population 2"
R.med.bias2$Scenario<-factor(R.med.bias2$Scenario,levels=c("DD_NO_T","ONT_NO_T","CLM_NO_T","C+O_NO_T"))

#create bias plot
sp.bias.gg<-ggplot(R.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=R.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=R.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=R.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = R.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 9 R Timeseries No T.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()


########################################################################################################
########################################################################################################
######## SM Figure 10 SSB Bias Timeseries No Move OM ################################################################################################
########################################################################################################
############################################################################################

runs.to.include.ts<-c(201:206)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("No_Move_NO_T",
                                                               "No_Move_CNST",
                                                               "No_Move_AGE",
                                                               "No_Move_YR",
                                                               "No_Move_2YR+2AG",
                                                               "No_Move_YR+AG"))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 10 SSB Timeseries No Move OM.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()



########################################################################################################
########################################################################################################
######## SM Figure 11 SSB Bias Timeseries CLM and C+O w YRLY Tag Runs ################################################################################################
########################################################################################################
############################################################################################

runs.to.include.ts<-c(75,193,198,199)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("CLM_YR","CLM_YR_TAG_YR","C+O_2YR+2AG",
                                                               "C+O_2YR+2AG_TAG_YR"))

my_theme.K2<-
  (theme_bw()+
     theme(
       panel.grid.major = element_blank(), 
       panel.grid.minor = element_blank(),
       axis.text.x = element_text(colour="grey20",size=8,angle=0,hjust=.5,vjust=0,face="plain"),
       strip.background=element_rect(fill="grey95"),
       strip.text.x=element_text(size=8,face="bold"),
       strip.text.y=element_text(size=rel(1), angle=-90,face="bold") 
     ))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K2
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 11 SSB Timeseries YRLY TAG.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

########################################################################################################
########################################################################################################
######## SM Figure 12 SSB Bias Timeseries Tag No Tag ################################################################################################
########################################################################################################
############################################################################################

runs.to.include.ts<-c(122,14,66,134,75,22,200,198)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("DD_YR+AG_NO_TAG","DD_YR+AG",
                                                               "ONT_AGE_NO_TAG","ONT_AGE",
                                                               "CLM_YR_NO_TAG", "CLM_YR",
                                                               "C+O_2YR+2AG_NO_TAG","C+O_2YR+2AG"))

my_theme.K2<-
  (theme_bw()+
     theme(
       panel.grid.major = element_blank(), 
       panel.grid.minor = element_blank(),
       axis.text.x = element_text(colour="grey20",size=8,angle=0,hjust=.5,vjust=0,face="plain"),
       strip.background=element_rect(fill="grey95"),
       strip.text.x=element_text(size=5,face="bold"),
       strip.text.y=element_text(size=rel(1), angle=-90,face="bold") 
     ))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K2


tiff("SM Fig 12 SSB Timeseries No Tags.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()


########################################################################################################
########################################################################################################
######## SM Figure 13 SSB Bias Timeseries Life History ################################################################################################
########################################################################################################
############################################################################################

runs.to.include.ts<-c(31,38,14,22,47,54)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("ONT_AGE_NO_TAG_SL","ONT_AGE_SL",
                                                               "ONT_AGE_NO_TAG","ONT_AGE",
                                                               "ONT_AGE_NO_TAG_LL","ONT_AGE_LL"))

my_theme.K2<-
  (theme_bw()+
     theme(
       panel.grid.major = element_blank(), 
       panel.grid.minor = element_blank(),
       axis.text.x = element_text(colour="grey20",size=8,angle=0,hjust=.5,vjust=0,face="plain"),
       strip.background=element_rect(fill="grey95"),
       strip.text.x=element_text(size=8,face="bold"),
       strip.text.y=element_text(size=rel(1), angle=-90,face="bold") 
     ))
#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K2
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 13 SSB Timeseries LIFE HISTORY Onto.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()



########################################################################################################
########################################################################################################
######## SM Figure 14 SSB Bias Timeseries Reporting Rate Est Min-Max Solution ################################################################################################
########################################################################################################
###########################################################################################

runs.to.include.ts<-c(209:212)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("DD_YR+AG_Est_B","ONT_AGE_Est_B","CLM_YR_Est_B","C+O_2YR+2AG_Est_B"))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 14 Timeseries ssb Final Report Rate Est.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()


########################################################################################################
########################################################################################################
######## SM Figure 15 SSB Bias Timeseries Fix T ################################################################################################
########################################################################################################
############################################################################################

runs.to.include.ts<-c(7:9,186)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("DD_FIX_T",
                                                               "ONT_FIX_T",
                                                               "CLM_FIX_T",
                                                               "C+O_FIX_T"))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("SM Fig 15 SSB Timeseries FIX T.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()


########################################################################################################
########################################################################################################
########################################################################################################
####### FINAL VIOLIN PLOTS MANUSCRIPT #################################################################################################
########################################################################################################
########################################################################################################
########################################################################################################


########################################################################################################
########################################################################################################
########################################################################################################
######## SM Fig 16 Summary Violin Bias Plots All Years ################################################################################################
########################################################################################################
########################################################################################################
########################################################################################################
#############################################
MRE.graph.final2<-MRE.graph.final %>% group_by(Reg,parameter,.id) %>% 
  filter(bias<quantile(bias,.999), bias>quantile(bias,.001))  %>% as.data.frame() # 

lab<-data.frame(xpos= c(1.5,7.5,15.,19.5), ypos = c(115,115,115,115), lab1 = c("Climate+Ontogenetic","Ontogenetic","Climate", 
                                                                               "Density Dependent"),parameter='B',reg='1')
my_theme.ver.alt<-
  (#theme_bw()+
    theme(
      #panel.grid.major = element_blank(), 
      #panel.grid.minor = element_blank(),
      axis.text.x = element_text(colour="grey20",size=8,angle=0,hjust=0.45,vjust=1,face="plain"),
      axis.text.y = element_text(colour="grey20",size=8,angle=0,hjust=1,vjust=0.3,face="plain"),
      axis.title.x = element_text(size=9),
      axis.title.y = element_text(size=9),
      #strip.text.y = element_text(angle = 180),
      plot.title=element_text(hjust=0.5,size=10),
      plot.subtitle=element_text(hjust=0.5,size=8),
      strip.text.x = element_text(
        size = 10, color = "black", face = "bold"),
      strip.text.y = element_text(
        size = 10, color = "black", face = "italic"),
      strip.background = element_rect(
        fill="grey80" )
    ))
sinlge.plot<-ggplot(MRE.graph.final2, aes(x=.id, y=bias)) +
  geom_hline(yintercept = 0, colour = 'black',size=1,lty=2)+
  geom_vline(xintercept=6.5, colour = 'black',size=1,lty=2)+
  geom_vline(xintercept=12.5, colour = 'black',size=1,lty=2)+
  geom_vline(xintercept=18.5, colour = 'black',size=1,lty=2)+
  #geom_vline(xintercept=2.5, colour = 'black',size=1,lty=2)+
  geom_violin(trim=T,bw="nrd0",alpha=0.6, scale="width")+ 
  geom_boxplot(width=.35,outlier.shape=NA,coef=0)+
  stat_summary(fun.y=mean, geom="point", size=0.5, color='black')+
  xlab(NULL)+
  ylab(NULL)+
  geom_label(data=lab,mapping = aes(x = xpos, y = ypos, label = lab1),fontface = "bold", 
             label.padding =unit(0.23, "lines"),size=3.) +   
  facet_grid(Reg~parameter,scales="free_x",labeller= as_labeller(region.names))+ #, switch="y")+
  scale_x_discrete(limits=rev(levels(as.factor(MRE.graph.final$.id))))+
  geom_blank()+
  coord_flip()+
  my_theme.ver.alt

##################################
tiff("SM Fig 16 Bias Plots All Years Final.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
#plot_grid( bio.plot.vert,rec.plot.vert,f.plot.vert, align = "hv", ncol = 3) #, rel_heights = c(1/4, 1/4, 1/2))

grid.arrange(ncol = 1,top=textGrob("Aggregate Bias Across Years",gp=gpar(fontsize=15,font=3)), 
             bottom=textGrob("Percent Relative Error",gp=gpar(fontsize=12,font=1)), 
             left=textGrob("Scenario",gp=gpar(fontsize=12,font=1),rot=90),
             sinlge.plot)
dev.off()

#############################################
########################################################################################################
########################################################################################################
########################################################################################################
############ SM Fig 17 Summary Violin Bias Plots Terminal Year ########################################################################################################
########################################################################################################
########################################################################################################
#############################################
MRE.graph.final.term<-MRE.graph.final.term %>% group_by(Reg,parameter,.id) %>% 
  filter(bias<quantile(bias,.999), bias>quantile(bias,.001))  %>% as.data.frame() # 
lab2<-data.frame(xpos= c(1.5,7.5,14.75,19.5), ypos = c(140,140,140,140), lab3 = c("Climate+Ontogenetic","Ontogenetic","Climate",  "Density Dependent"),parameter='B',reg='1')


sinlge.plot.term<-ggplot(MRE.graph.final.term, aes(x=.id, y=bias)) +
  geom_hline(yintercept = 0, colour = 'black',size=0.5,lty=2)+
  geom_vline(xintercept=6.5, colour = 'black',size=1,lty=2)+
  geom_vline(xintercept=12.5, colour = 'black',size=1,lty=2)+
  geom_vline(xintercept=18.5, colour = 'black',size=1,lty=2)+
  geom_violin(trim=T,bw="nrd0",alpha=0.6,scale="width")+  #fill=vio.col,
  geom_boxplot(width=.35,outlier.shape=NA)+
  stat_summary(fun.y=mean, geom="point", size=0.5, color='black')+
  xlab(NULL)+
  ylab(NULL)+
  geom_label(data=lab2,mapping = aes(x = xpos, y = ypos, label = lab3),fontface = "bold", 
             label.padding =unit(0.23, "lines"),size=3.) +  
  facet_grid(Reg~parameter,scales="free_x",labeller= as_labeller(region.names))+ #, switch="y")+
  scale_x_discrete(limits=rev(levels(as.factor(MRE.graph.final.term$.id))))+
  #ylim(-100,100)+
  geom_blank()+
  coord_flip()+
  my_theme.ver.alt

##################################
tiff("SM Fig 17 Bias Plots Terminal Final.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
#plot_grid( bio.plot.vert,rec.plot.vert,f.plot.vert, align = "hv", ncol = 3) #, rel_heights = c(1/4, 1/4, 1/2))

grid.arrange(ncol = 1,top=textGrob("Terminal Year Bias",gp=gpar(fontsize=15,font=3)), 
             bottom=textGrob("Percent Relative Error",gp=gpar(fontsize=12,font=1)), 
             left=textGrob("Scenario",gp=gpar(fontsize=12,font=1),rot=90),
             sinlge.plot.term)
dev.off()


########################################################################################################
########################################################################################################
########################################################################################################
######## SM Fig 18 Movement Bias by Age ################################################################################################
########################################################################################################
########################################################################################################
########################################################################################################

MRE.T.graph2<-MRE.T.graph2 %>% group_by(Reg,.id,Age) %>% 
  filter(bias<quantile(bias,.999), bias>quantile(bias,.001))  %>% as.data.frame() # 

age.names<-c('1'="Age-1", '2'="Age-2",'3'="Age-3", '4'="Age-4",'5'="Age-5", '6'="Age-6",'7'="Age-7", '8'="Age-8",'Population 1'=" Emigration Population 1",'Population 2'="Emigration Population 2")
lab2<-data.frame(xpos= c(1.5,7.5,14.75,19.5), ypos = c(800,800,800,800), lab3 = c("Climate+Ontogenetic","Ontogenetic","Climate",  "Density Dependent"),parameter='B',reg='1')

sinlge.plot.age.T<-ggplot(MRE.T.graph2, aes(x=.id, y=bias)) +
  geom_hline(yintercept = 0, colour = 'black',size=1,lty=2)+
  geom_vline(xintercept=6.5, colour = 'black',size=1,lty=2)+
  geom_vline(xintercept=12.5, colour = 'black',size=1,lty=2)+
  geom_vline(xintercept=18.5, colour = 'black',size=1,lty=2)+
  geom_violin(trim=T,bw="nrd0",alpha=0.6, scale="width")+  #fill=vio.col,
  geom_boxplot(width=.35,outlier.shape=NA,coef=0)+
  stat_summary(fun.y=mean, geom="point", size=0.5, color='black')+
  xlab(NULL)+
  ylab(NULL)+
 # geom_label(data=lab2,mapping = aes(x = xpos, y = ypos, label = lab3),fontface = "bold", 
  #           label.padding =unit(0.23, "lines"),size=1.3) +  
  facet_grid(Reg~Age,scales="free_x",labeller= as_labeller(age.names))+ #, switch="y")+
  scale_x_discrete(limits=rev(levels(as.factor(MRE.T.graph2$.id))))+
  #ylim(-100,100)+
  geom_blank()+
  coord_flip()+
  my_theme.ver.alt

##################################
tiff("SM Fig 18 Bias Plots Movement by Age All Years Final.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
#plot_grid( bio.plot.vert,rec.plot.vert,f.plot.vert, align = "hv", ncol = 3) #, rel_heights = c(1/4, 1/4, 1/2))

grid.arrange(ncol = 1,top=textGrob("Aggregate Bias Across Years",gp=gpar(fontsize=15,font=3)), 
             bottom=textGrob("Percent Relative Error",gp=gpar(fontsize=12,font=1)), 
             left=textGrob("Scenario",gp=gpar(fontsize=12,font=1),rot=90),
             sinlge.plot.age.T)
dev.off()
#############################################




########################################################################################################
########################################################################################################
######## ALT FIGURE CLIMATE SSB Bias Timeseries Climate ################################################################################################
########################################################################################################
############################################################################################

runs.to.include.ts<-c(59,75,70,193,213)
ssb.med.bias<-sapply(runs.to.include.ts, function(i) list(get(paste0("ssb.ts_",i))))
ssb.med.bias<-rbindlist(ssb.med.bias)
names.keep.ts<-c(sapply(runs.to.include.ts, function(i) get(paste0("nm_",i))))
ssb.med.bias2<-ssb.med.bias[ssb.med.bias$Scenario %in% names.keep.ts,]
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="1")]<-"Population 1"
ssb.med.bias2$Reg[which(ssb.med.bias2$Reg=="2")]<-"Population 2"
ssb.med.bias2$Scenario<-factor(ssb.med.bias2$Scenario,levels=c("CLM_NO_T", "CLM_2YR+2AG","CLM_2YR+2AG_TAG_YR",
                                                               "CLM_YR","CLM_YR_TAG_YR"
                                                              ))

#create bias plot
sp.bias.gg<-ggplot(ssb.med.bias2, aes(x=as.factor(Years), y=med.bias)) +    #med.bias
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=min,ymax=max), fill="grey90")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low,ymax=quant_up), fill="grey75")+
  geom_ribbon(data=ssb.med.bias2, aes(x=Years,ymin=quant_low_med,ymax=quant_up_med), fill="grey50")+
  ########geom_point(data = pan.est, aes(x=Years,y=bias), fill="black", shape=21,size=0.5) +
  geom_hline(aes(yintercept = 0, group=Reg), colour = 'black',size=0.5,lty=2)+
  #######geom_line(data = sp_median_bias, aes(x=Years,y=med.bias),lty=1, lwd=0.5) + 
  ########geom_violin(data=pan.est,aes(x=as.factor(Years), y=bias),fill=vio.col,trim=T,draw_quantiles = c(0.25, 0.5, 0.75))+
  geom_point(data = ssb.med.bias2, aes(x=Years,y=med.bias), fill="white", shape=21,size=1.5) +
  scale_x_continuous(breaks=seq(0,nyrs,5))+
  ggtitle(" ")+
  ylab("Relative % Difference")+
  xlab("Year")+
  facet_grid(Reg~Scenario,scales= "free")+ #,labeller= as_labeller(region.names.ts))+
  my_theme.K
#scale_fill_manual(values=c("grey90", "grey75", "grey50"), 
#                 name="Quantiles",
#                labels=c("Maximum", "95%", "75%"))

tiff("Z_NOT INCL_ALT FIG CLIM SSB Timeseries Climate.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()

tiff("Z_NOT INCL_ALT FIG CLIM SSB Timeseries Climate COMP.tif",width=240,height=190, unit='mm',res=500)
par(mar=c(6,6,6,6))
print(sp.bias.gg)
dev.off()



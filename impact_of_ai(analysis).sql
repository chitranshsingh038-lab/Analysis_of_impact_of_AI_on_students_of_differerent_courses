SELECT * FROM company.impact_of_ai;

use company;
# sorting name of columns for fast typeing and avoiding typos.

alter table impact_of_ai
rename column Student_ID to s_id,
rename column Major_category to course,
rename column Year_of_study to study_year,
rename column Pre_semester_GPA to sem_gpa,
rename column Weekly_GenAI_Hours to weekly_AI_use,
rename column Primary_Use_Case to use_case,
rename column Prompt_Engineering_skill to prompt_skill,
rename column Paid_Subscription to subscription,
rename column Traditional_Study_Hours to study_hrs,
rename column Anxiety_Level_During_Exams to anxity_during_exam,
rename column Burnout_Risk_Level to burnout_risk_lev;

# stiming values of columns(to removing unnecessesory space) and casting all words to small letters

update impact_of_ai
set s_id = lower(trim(s_id)),
    course = lower(trim(course)),
    study_year=lower(trim(study_year)),
    sem_gpa=trim(sem_gpa),
    weekly_AI_use=trim(weekly_AI_use),
    use_case=lower(trim(use_case)),
    prompt_skill =lower(trim(prompt_skill)),
    Tool_Diversity=trim(Tool_Diversity),
    subscription=lower(trim(subscription)),
    study_hrs=lower(trim(study_hrs)),
    Institutional_policy=lower(trim(Institutional_policy)),
    anxity_during_exam=trim(anxity_during_exam),
    burnout_risk_lev =lower(trim(burnout_risk_lev));
    
#--------------- finding null value and '' if present in the data.

select * from impact_of_ai
where course='' or course is null
or    study_hrs='' or study_hrs is null
or    sem_gpa='' or sem_gpa is null
or    weekly_AI_use='' or weekly_AI_use is null
or    use_case='' or use_case is null
or    prompt_skill='' or prompt_skill is null
or    Tool_Diversity='' or Tool_Diversity is null;
 #--------------     setting s_id(student_id) as primary key     ---------------------
 
alter table impact_of_ai
add primary key (s_id);


# GENERATING INSIGHTES 

#--------------  
select count(*),course
from impact_of_ai where
use_case='summarizing_reading'
group by course;

#--------------
select avg(anxity_during_exam),course
from impact_of_ai where subscription = 'true'
group by course;

select avg(anxity_during_exam) as avg_anxiety_with_subscription,course
from impact_of_ai where subscription = 'false'
group by course;

#------------ difference in avg(anxity) lavel with and without sunscription
select course,
avg(case when subscription ='true'
     then anxity_during_exam end)-
     avg(case when subscription='false'
     then anxity_during_exam end) as difference_of_anxity
     from impact_of_ai
     group by course; 
     # there is no any major difference (subscription does not play any important role in anxity lavel)
     
     
# ------------------

select course,
avg(case when subscription='true'
    then Perceived_AI_Dependency end) as AI_dependency_with_subscription,
avg(case when subscription='false'
    then Perceived_AI_Dependency end) as AI_dependency_without_subscription
    from impact_of_ai
    group by course;
        
	# for medical students dependency on subscription is increased,but for other cources it is not a big dependency;

select course, avg(case when subscription='true'
                   then  Post_Semester_GPA end) as gpa_with_subscription,
                   avg(case when subscription='false'
                   then Post_Semester_GPA end) as gpa_without_subscription
                   from impact_of_ai
                   group by course;
    # there is no any major difference in SGPA with and without subscription
  
select course,avg(Perceived_AI_Dependency ) as avg_dependency,use_case
from impact_of_ai
group by course,use_case 
order by avg_dependency desc;

  
# Medical students are most dependent on ai,then stem;
#while stem students are mostly use ai for summarizing reading;
#And arts student use ai for debugging;

# --------------- Does increased weekly AI usage lead to lower traditional study hours? ---------------

select study_hrs,weekly_AI_use
from impact_of_ai
order by study_hrs desc;

#relation by skill_retention_score and AI_Dependency

select avg(skill_retention_score),Perceived_AI_Dependency,course
from impact_of_ai
where course!='' and course is not Null
group by Perceived_AI_Dependency,course
order by course asc,
          Perceived_AI_Dependency asc ;

#clearly i noticed that studesns of stem able to increase their skills on increase thr use of ai but this trend breaked when ai use increase to much(Perceived_AI_Dependency=8)
#in humanities skills are totally reduced on using ai. 
#most common trend that i noticed is that over use of ai can reduce skill_retention_score.'
#but in medical ai is not affecting skills as i noticed 

# ---------------------- Which AI use case (summarizing, coding, research, writing, etc.) is associated with the highest GPA improvement ------------------
select use_case,avg(post_semester_GPA)
from impact_of_ai
group by use_case
order by avg(post_semester_GPA) desc;

# -------------- impact of ai on sgpa(sem_gpa to post_semister GPA) ----------------

select course,avg(sem_gpa - Post_Semester_GPA) as avg_difference_in_sgpa,Perceived_AI_Dependency
from impact_of_ai
group by Perceived_AI_Dependency,course
order by avg_difference_in_sgpa asc;

select (sem_gpa-Post_semester_GPA),weekly_AI_use,study_hrs
from impact_of_ai
order by weekly_ai_use desc
limit 10;


#---------- Which year of study (1st, 2nd, 3rd, 4th year) shows the highest adoption of AI tools?

select course,study_year,avg(Tool_Diversity)
from impact_of_ai
group by course,study_year
order by avg(Tool_Diversity) asc;

#junior sudents of medical use most tools, on an average 4 tools.(student thai is noticed using most tools from this branch is using 5 tools)
#sophomore students of arts also use avg of 4 tools.
#senior students of medical use avg of 3.5 tools while most no of tools tools used by a student of this branch is 5)
#medical graduate use only avg of 2 tools
#buisness freshers use least tool avg of 1.5 tools

#---------- Does burnout risk increase with higher AI dependency?

SELECT
    burnout_risk_lev,
    AVG(Perceived_AI_Dependency) AS avg_dependency
FROM impact_of_ai
GROUP BY burnout_risk_lev
ORDER BY FIELD(burnout_risk_lev,'high','medium','low');

#according to analysis low avg_AI_dependency increase with increase highest avg_AI_depenency

commit
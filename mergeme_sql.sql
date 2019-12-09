-- Created by Ahamisi Godsfavour for team crunch

-- tables
-- Table: appl_questionnaire_answer
CREATE TABLE appl_questionnaire_answer (
    job_post_activity_id number NOT NULL,
    ques_consent_quesnnaire_map_id number NOT NULL,
    answer char(1) NOT NULL,
    CONSTRAINT appl_questionnaire_answer_pk PRIMARY KEY (job_post_activity_id,ques_consent_quesnnaire_map_id)
);

-- Table: business_stream
CREATE TABLE business_stream (
    id number NOT NULL,
    business_stream_name varchar2(100) NOT NULL,
    CONSTRAINT business_stream_pk PRIMARY KEY (id)
);

-- Table: company
CREATE TABLE company (
    id number NOT NULL,
    company_name varchar2(100) NOT NULL,
    profile_description varchar2(1000) NOT NULL,
    business_stream_id number NOT NULL,
    establishment_date date NOT NULL,
    company_website_url varchar2(500) NOT NULL,
    CONSTRAINT company_pk PRIMARY KEY (id)
);

-- Table: company_image
CREATE TABLE company_image (
    id number NOT NULL,
    company_id number NOT NULL,
    company_image blob NOT NULL,
    CONSTRAINT company_image_pk PRIMARY KEY (id)
);

-- Table: consent_questionnaire
CREATE TABLE consent_questionnaire (
    id number NOT NULL,
    questionnaire_name varchar2(50) NOT NULL,
    CONSTRAINT consent_questionnaire_pk PRIMARY KEY (id)
);

-- Table: education_detail
CREATE TABLE education_detail (
    user_account_id number NOT NULL,
    certificate_degree_name varchar2(50) NOT NULL,
    major varchar2(50) NOT NULL,
    Institute_university_name varchar2(50) NOT NULL,
    starting_date date NOT NULL,
    completion_date date NULL,
    percentage number NULL,
    cgpa number NULL,
    CONSTRAINT education_detail_pk PRIMARY KEY (user_account_id,certificate_degree_name,major)
);

-- Table: experience_detail
CREATE TABLE experience_detail (
    user_account_id number NOT NULL,
    is_current_job char(1) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    job_title varchar2(50) NOT NULL,
    company_name varchar2(100) NOT NULL,
    job_location_city varchar2(50) NOT NULL,
    job_location_state varchar2(50) NOT NULL,
    job_location_country varchar2(50) NOT NULL,
    description varchar2(4000) NOT NULL,
    CONSTRAINT experience_detail_pk PRIMARY KEY (user_account_id,start_date,end_date)
);

-- Table: job_application_status
CREATE TABLE job_application_status (
    id number NOT NULL,
    status_desc varchar2(20) NOT NULL,
    CONSTRAINT job_application_status_pk PRIMARY KEY (id)
);

-- Table: job_location
CREATE TABLE job_location (
    id number NOT NULL,
    street_address varchar2(100) NOT NULL,
    city varchar2(50) NOT NULL,
    state varchar2(50) NOT NULL,
    country varchar2(50) NOT NULL,
    zip varchar2(50) NOT NULL,
    CONSTRAINT job_location_pk PRIMARY KEY (id)
);

-- Table: job_post
CREATE TABLE job_post (
    id number NOT NULL,
    posted_by_id number NOT NULL,
    job_type_id number NOT NULL,
    company_id number NOT NULL,
    is_company_name_hidden char(1) NOT NULL,
    created_date date NOT NULL,
    job_description varchar2(500) NOT NULL,
    job_location_id number NOT NULL,
    is_active char(1) NOT NULL,
    CONSTRAINT job_post_pk PRIMARY KEY (id)
);

-- Table: job_post_action
CREATE TABLE job_post_action (
    id number NOT NULL,
    action_name varchar2(20) NOT NULL,
    CONSTRAINT job_post_action_pk PRIMARY KEY (id)
);

-- Table: job_post_activity
CREATE TABLE job_post_activity (
    id number NOT NULL,
    user_account_id number NOT NULL,
    job_post_id number NOT NULL,
    apply_date date NOT NULL,
    job_application_status_id number NOT NULL,
    UNIQUE INDEX job_post_activity_ak_1 (user_account_id,job_post_id),
    CONSTRAINT job_post_activity_pk PRIMARY KEY (id)
);

-- Table: job_post_activity_log
CREATE TABLE job_post_activity_log (
    id number NOT NULL,
    job_post_activity_id number NOT NULL,
    job_post_action_id number NOT NULL,
    action_date date NOT NULL,
    user_account_id number NOT NULL,
    CONSTRAINT job_post_activity_log_pk PRIMARY KEY (id)
);

-- Table: job_post_questionnaire
CREATE TABLE job_post_questionnaire (
    id number NOT NULL,
    job_post_id number NOT NULL,
    consent_questionnaire_id number NOT NULL,
    CONSTRAINT job_post_questionnaire_pk PRIMARY KEY (id)
);

-- Table: job_post_skill_set
CREATE TABLE job_post_skill_set (
    skill_set_id number NOT NULL,
    job_post_id number NOT NULL,
    skill_level number NOT NULL,
    CONSTRAINT job_post_skill_set_pk PRIMARY KEY (skill_set_id,job_post_id)
);

-- Table: job_type
CREATE TABLE job_type (
    id number NOT NULL,
    job_type varchar2(20) NOT NULL,
    CONSTRAINT job_type_pk PRIMARY KEY (id)
);

-- Table: product
CREATE TABLE product (
    id number NOT NULL,
    product_name varchar2(50) NOT NULL,
    product_desc varchar2(1000) NULL,
    inception_date date NOT NULL,
    is_active char(1) NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (id)
);

-- Table: product_bundle
CREATE TABLE product_bundle (
    id number NOT NULL,
    product_bundle_name varchar2(50) NOT NULL,
    inception_date date NOT NULL,
    is_active char(1) NOT NULL,
    subscription_cost number NOT NULL,
    CONSTRAINT product_bundle_pk PRIMARY KEY (id)
);

-- Table: product_bundle_map
CREATE TABLE product_bundle_map (
    product_id number NOT NULL,
    product_bundle_id number NOT NULL,
    CONSTRAINT product_bundle_map_pk PRIMARY KEY (product_id,product_bundle_id)
);

-- Table: product_offering
CREATE TABLE product_offering (
    id number NOT NULL,
    user_account_id number NOT NULL,
    product_bundle_id number NOT NULL,
    is_email_notification_sent char(1) NOT NULL,
    last_email_sent_date date NULL,
    is_call_briefing_done char(1) NOT NULL,
    last_call_date date NULL,
    CONSTRAINT product_offering_pk PRIMARY KEY (id)
);

-- Table: product_subscription
CREATE TABLE product_subscription (
    id number NOT NULL,
    user_account_id number NOT NULL,
    product_bundle_id number NOT NULL,
    purchased_on date NOT NULL,
    subscription_start_date date NOT NULL,
    subscription_end_date date NOT NULL,
    CONSTRAINT product_subscription_pk PRIMARY KEY (id)
);

-- Table: profile_visit_log
CREATE TABLE profile_visit_log (
    id number NOT NULL,
    seeker_profile_id number NOT NULL,
    visit_date date NOT NULL,
    user_account_id number NOT NULL,
    is_resume_downloaded char(1) NOT NULL,
    is_job_notification_sent char(1) NOT NULL,
    CONSTRAINT profile_visit_log_pk PRIMARY KEY (id)
);

-- Table: ques_consent_questionnaire_map
CREATE TABLE ques_consent_questionnaire_map (
    id number NOT NULL,
    consent_questionnaire_id number NOT NULL,
    question_id number NOT NULL,
    is_mandatory_optional char(1) NOT NULL,
    CONSTRAINT ques_consent_questionnaire_map_pk PRIMARY KEY (id)
);

-- Table: question
CREATE TABLE question (
    id number NOT NULL,
    question_text varchar2(2000) NOT NULL,
    question_section_id number NOT NULL,
    CONSTRAINT question_pk PRIMARY KEY (id)
);

-- Table: question_section
CREATE TABLE question_section (
    id number NOT NULL,
    section_name varchar2(50) NOT NULL,
    CONSTRAINT question_section_pk PRIMARY KEY (id)
);

-- Table: seeker_profile
CREATE TABLE seeker_profile (
    user_account_id number NOT NULL,
    first_name varchar2(50) NOT NULL,
    last_name varchar2(50) NOT NULL,
    current_salary number NULL,
    is_annually_monthly char(1) NULL,
    currency varchar2(50) NULL,
    CONSTRAINT seeker_profile_pk PRIMARY KEY (user_account_id)
);

-- Table: seeker_skill_set
CREATE TABLE seeker_skill_set (
    user_account_id number NOT NULL,
    skill_set_id number NOT NULL,
    skill_level number NOT NULL,
    CONSTRAINT seeker_skill_set_pk PRIMARY KEY (user_account_id,skill_set_id)
);

-- Table: skill_set
CREATE TABLE skill_set (
    id number NOT NULL,
    skill_set_name varchar2(50) NOT NULL,
    CONSTRAINT skill_set_pk PRIMARY KEY (id)
);

-- Table: user_account
CREATE TABLE user_account (
    id number NOT NULL,
    user_type_id number NOT NULL,
    email varchar2(255) NOT NULL,
    password varchar2(100) NOT NULL,
    date_of_birth date NOT NULL,
    gender char(1) NOT NULL,
    is_active char(1) NOT NULL,
    contact_number number(10) NOT NULL,
    sms_notification_active char(1) NOT NULL,
    email_notification_active char(1) NOT NULL,
    user_image blob NULL,
    registration_date date NOT NULL,
    CONSTRAINT user_account_pk PRIMARY KEY (id)
);

-- Table: user_log
CREATE TABLE user_log (
    user_account_id number NOT NULL,
    last_login_date date NOT NULL,
    last_job_apply_date date NULL,
    CONSTRAINT user_log_pk PRIMARY KEY (user_account_id)
);

-- Table: user_type
CREATE TABLE user_type (
    id number NOT NULL,
    user_type_name varchar2(20) NOT NULL,
    CONSTRAINT user_type_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Table_26_product (table: product_bundle_map)
ALTER TABLE product_bundle_map ADD CONSTRAINT Table_26_product FOREIGN KEY Table_26_product (product_id)
    REFERENCES product (id);

-- Reference: Table_26_product_bundle (table: product_bundle_map)
ALTER TABLE product_bundle_map ADD CONSTRAINT Table_26_product_bundle FOREIGN KEY Table_26_product_bundle (product_bundle_id)
    REFERENCES product_bundle (id);

-- Reference: Table_32_job_post_activity (table: appl_questionnaire_answer)
ALTER TABLE appl_questionnaire_answer ADD CONSTRAINT Table_32_job_post_activity FOREIGN KEY Table_32_job_post_activity (job_post_activity_id)
    REFERENCES job_post_activity (id);

-- Reference: appl_qnn_ans_q_consent_qnn_map (table: appl_questionnaire_answer)
ALTER TABLE appl_questionnaire_answer ADD CONSTRAINT appl_qnn_ans_q_consent_qnn_map FOREIGN KEY appl_qnn_ans_q_consent_qnn_map (ques_consent_quesnnaire_map_id)
    REFERENCES ques_consent_questionnaire_map (id);

-- Reference: company_business_stream (table: company)
ALTER TABLE company ADD CONSTRAINT company_business_stream FOREIGN KEY company_business_stream (business_stream_id)
    REFERENCES business_stream (id);

-- Reference: company_image_company (table: company_image)
ALTER TABLE company_image ADD CONSTRAINT company_image_company FOREIGN KEY company_image_company (company_id)
    REFERENCES company (id);

-- Reference: educ_dtl_seeker_profile (table: education_detail)
ALTER TABLE education_detail ADD CONSTRAINT educ_dtl_seeker_profile FOREIGN KEY educ_dtl_seeker_profile (user_account_id)
    REFERENCES seeker_profile (user_account_id);

-- Reference: exp_dtl_seeker_profile (table: experience_detail)
ALTER TABLE experience_detail ADD CONSTRAINT exp_dtl_seeker_profile FOREIGN KEY exp_dtl_seeker_profile (user_account_id)
    REFERENCES seeker_profile (user_account_id);

-- Reference: job_post_act_job_app_status (table: job_post_activity)
ALTER TABLE job_post_activity ADD CONSTRAINT job_post_act_job_app_status FOREIGN KEY job_post_act_job_app_status (job_application_status_id)
    REFERENCES job_application_status (id);

-- Reference: job_post_act_log_job_post_act (table: job_post_activity_log)
ALTER TABLE job_post_activity_log ADD CONSTRAINT job_post_act_log_job_post_act FOREIGN KEY job_post_act_log_job_post_act (job_post_action_id)
    REFERENCES job_post_action (id);

-- Reference: job_post_act_log_job_post_act1 (table: job_post_activity_log)
ALTER TABLE job_post_activity_log ADD CONSTRAINT job_post_act_log_job_post_act1 FOREIGN KEY job_post_act_log_job_post_act1 (job_post_activity_id)
    REFERENCES job_post_activity (id);

-- Reference: job_post_act_user_register (table: job_post_activity)
ALTER TABLE job_post_activity ADD CONSTRAINT job_post_act_user_register FOREIGN KEY job_post_act_user_register (user_account_id)
    REFERENCES user_account (id);

-- Reference: job_post_activity_job_post (table: job_post_activity)
ALTER TABLE job_post_activity ADD CONSTRAINT job_post_activity_job_post FOREIGN KEY job_post_activity_job_post (job_post_id)
    REFERENCES job_post (id);

-- Reference: job_post_company (table: job_post)
ALTER TABLE job_post ADD CONSTRAINT job_post_company FOREIGN KEY job_post_company (company_id)
    REFERENCES company (id);

-- Reference: job_post_job_location (table: job_post)
ALTER TABLE job_post ADD CONSTRAINT job_post_job_location FOREIGN KEY job_post_job_location (job_location_id)
    REFERENCES job_location (id);

-- Reference: job_post_job_type (table: job_post)
ALTER TABLE job_post ADD CONSTRAINT job_post_job_type FOREIGN KEY job_post_job_type (job_type_id)
    REFERENCES job_type (id);

-- Reference: job_post_qnnr_consent_qnnr (table: job_post_questionnaire)
ALTER TABLE job_post_questionnaire ADD CONSTRAINT job_post_qnnr_consent_qnnr FOREIGN KEY job_post_qnnr_consent_qnnr (consent_questionnaire_id)
    REFERENCES consent_questionnaire (id);

-- Reference: job_post_qnnr_job_post (table: job_post_questionnaire)
ALTER TABLE job_post_questionnaire ADD CONSTRAINT job_post_qnnr_job_post FOREIGN KEY job_post_qnnr_job_post (job_post_id)
    REFERENCES job_post (id);

-- Reference: job_post_skill_set_job_post (table: job_post_skill_set)
ALTER TABLE job_post_skill_set ADD CONSTRAINT job_post_skill_set_job_post FOREIGN KEY job_post_skill_set_job_post (job_post_id)
    REFERENCES job_post (id);

-- Reference: job_post_skill_set_skill_set (table: job_post_skill_set)
ALTER TABLE job_post_skill_set ADD CONSTRAINT job_post_skill_set_skill_set FOREIGN KEY job_post_skill_set_skill_set (skill_set_id)
    REFERENCES skill_set (id);

-- Reference: job_post_user_register (table: job_post)
ALTER TABLE job_post ADD CONSTRAINT job_post_user_register FOREIGN KEY job_post_user_register (posted_by_id)
    REFERENCES user_account (id);

-- Reference: prod_offering_prod_bundle (table: product_offering)
ALTER TABLE product_offering ADD CONSTRAINT prod_offering_prod_bundle FOREIGN KEY prod_offering_prod_bundle (product_bundle_id)
    REFERENCES product_bundle (id);

-- Reference: prod_sub_prod_bundle (table: product_subscription)
ALTER TABLE product_subscription ADD CONSTRAINT prod_sub_prod_bundle FOREIGN KEY prod_sub_prod_bundle (product_bundle_id)
    REFERENCES product_bundle (id);

-- Reference: prod_sub_user_account (table: product_subscription)
ALTER TABLE product_subscription ADD CONSTRAINT prod_sub_user_account FOREIGN KEY prod_sub_user_account (user_account_id)
    REFERENCES user_account (id);

-- Reference: product_offering_user_account (table: product_offering)
ALTER TABLE product_offering ADD CONSTRAINT product_offering_user_account FOREIGN KEY product_offering_user_account (user_account_id)
    REFERENCES user_account (id);

-- Reference: prof_visit_log_seeker_prof (table: profile_visit_log)
ALTER TABLE profile_visit_log ADD CONSTRAINT prof_visit_log_seeker_prof FOREIGN KEY prof_visit_log_seeker_prof (seeker_profile_id)
    REFERENCES seeker_profile (user_account_id);

-- Reference: q_cnsnt_qnnr_map_cnsnt_qnnr (table: ques_consent_questionnaire_map)
ALTER TABLE ques_consent_questionnaire_map ADD CONSTRAINT q_cnsnt_qnnr_map_cnsnt_qnnr FOREIGN KEY q_cnsnt_qnnr_map_cnsnt_qnnr (consent_questionnaire_id)
    REFERENCES consent_questionnaire (id);

-- Reference: q_cnsnt_qnnr_map_q (table: ques_consent_questionnaire_map)
ALTER TABLE ques_consent_questionnaire_map ADD CONSTRAINT q_cnsnt_qnnr_map_q FOREIGN KEY q_cnsnt_qnnr_map_q (question_id)
    REFERENCES question (id);

-- Reference: question_question_section (table: question)
ALTER TABLE question ADD CONSTRAINT question_question_section FOREIGN KEY question_question_section (question_section_id)
    REFERENCES question_section (id);

-- Reference: seeker_profile_user_register (table: seeker_profile)
ALTER TABLE seeker_profile ADD CONSTRAINT seeker_profile_user_register FOREIGN KEY seeker_profile_user_register (user_account_id)
    REFERENCES user_account (id);

-- Reference: seeker_skill_set_skill_set (table: seeker_skill_set)
ALTER TABLE seeker_skill_set ADD CONSTRAINT seeker_skill_set_skill_set FOREIGN KEY seeker_skill_set_skill_set (skill_set_id)
    REFERENCES skill_set (id);

-- Reference: skill_set_seeker_profile (table: seeker_skill_set)
ALTER TABLE seeker_skill_set ADD CONSTRAINT skill_set_seeker_profile FOREIGN KEY skill_set_seeker_profile (user_account_id)
    REFERENCES seeker_profile (user_account_id);

-- Reference: use_log_user_register (table: user_log)
ALTER TABLE user_log ADD CONSTRAINT use_log_user_register FOREIGN KEY use_log_user_register (user_account_id)
    REFERENCES user_account (id);

-- Reference: user_register_user_type (table: user_account)
ALTER TABLE user_account ADD CONSTRAINT user_register_user_type FOREIGN KEY user_register_user_type (user_type_id)
    REFERENCES user_type (id);

-- End of file
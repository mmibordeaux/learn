json.evaluations @course.evaluations.count
json.quality @course.evaluations.average(:quality).round(2)
json.knowledge_acquired @course.evaluations.average(:knowledge_acquired).round(2)
json.technical_skills_acquired @course.evaluations.average(:technical_skills_acquired).round(2)
json.soft_skills_acquired @course.evaluations.average(:soft_skills_acquired).round(2)
json.relevant_content @course.evaluations.collect(&:relevant_content).reject {|e| e.blank?}
json.content_to_add @course.evaluations.collect(&:content_to_add).reject {|e| e.blank?}
json.content_to_remove @course.evaluations.collect(&:content_to_remove).reject {|e| e.blank?}
json.comment @course.evaluations.collect(&:comment).reject {|e| e.blank?}
json.evaluations @course.evaluations.count
json.quality @course.quality
json.knowledge_acquired @course.knowledge_acquired
json.technical_skills_acquired @course.technical_skills_acquired
json.soft_skills_acquired @course.soft_skills_acquired
json.relevant_content @course.evaluations.collect(&:relevant_content).reject {|e| e.blank?}
json.content_to_add @course.evaluations.collect(&:content_to_add).reject {|e| e.blank?}
json.content_to_remove @course.evaluations.collect(&:content_to_remove).reject {|e| e.blank?}
json.comment @course.evaluations.collect(&:comment).reject {|e| e.blank?}
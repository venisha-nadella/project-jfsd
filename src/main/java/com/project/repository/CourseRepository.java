package com.project.repository;

import com.project.model.Course;
import com.project.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

public interface CourseRepository extends JpaRepository<Course, Long> {
    List<Course> findByMentor(User mentor);
    List<Course> findByMentorId(Long mentorId);
    
    @Query("SELECT new map(c.name as courseName, COUNT(e.id) as enrolledCount) " +
            "FROM Course c JOIN c.enrolledUsers e GROUP BY c.id")
     List<Map<String, Object>> getEnrollmentStats();
}

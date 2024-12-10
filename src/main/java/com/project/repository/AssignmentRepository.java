package com.project.repository;

import com.project.model.Assignment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AssignmentRepository extends JpaRepository<Assignment, Long> {
    List<Assignment> findBySubmittedByUserId(Long userId);
    List<Assignment> findByCourseIdAndStudentAnswerFileNotNull(Long courseId);
    List<Assignment> findByCourseId(Long courseId);

}

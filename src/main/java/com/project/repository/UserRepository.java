package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository; 
import com.project.model.User;
import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    List<User> findByUsername(String username);
    long countByRole(String role);
    
}
 

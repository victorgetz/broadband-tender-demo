package com.impresssol.broadband.data.repo;

import org.springframework.data.repository.CrudRepository;

import com.impresssol.broadband.data.entities.Project;

public interface ProjectRepository extends CrudRepository<Project, Long> {
}

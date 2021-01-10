package by.alex.guitarshop.repository;

import by.alex.guitarshop.model.ProductType;
import by.alex.guitarshop.model.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SpecificationRepository extends JpaRepository<Specification, Long> {
}

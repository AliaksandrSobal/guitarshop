package by.alex.guitarshop.repository;

import by.alex.guitarshop.model.Product;
import by.alex.guitarshop.model.ProductType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductTypeRepository extends JpaRepository<ProductType, Long> {
}

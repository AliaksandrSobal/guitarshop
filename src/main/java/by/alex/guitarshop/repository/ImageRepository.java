package by.alex.guitarshop.repository;

import by.alex.guitarshop.model.Image;
import by.alex.guitarshop.model.ProductType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, Long> {
}

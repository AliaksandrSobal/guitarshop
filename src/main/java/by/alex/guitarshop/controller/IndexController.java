package by.alex.guitarshop.controller;

import by.alex.guitarshop.Constants;
import by.alex.guitarshop.model.Image;
import by.alex.guitarshop.model.Product;
import by.alex.guitarshop.model.Specification;
import by.alex.guitarshop.repository.ImageRepository;
import by.alex.guitarshop.repository.ProductRepository;
import by.alex.guitarshop.repository.ProductTypeRepository;
import by.alex.guitarshop.repository.SpecificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.RequestContext;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.*;

@Controller
public class IndexController {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductTypeRepository productTypeRepository;

    @Autowired
    SpecificationRepository specificationRepository;

    @Autowired
    ImageRepository imageRepository;

    @GetMapping({"/", "/index"})
    public String index(
            Model model) {
        List<Product> products = productRepository.findAll();

        for (Product product: products) {
            product.setDescription(
                    product.getDescription()
                            .substring(0, Math.min(product.getDescription().length(), 12))
                            .concat("..."));
        }
        model.addAttribute("products", products);

        return "hello";
    }

    @GetMapping({"/details"})
    public String details(
            Model model,
            @RequestParam Long id) {
        Optional<Product> optional = productRepository.findById(id);
        if (optional.isPresent()) {
            Product product = optional.get();
            model.addAttribute("product", product);
        }
        return "details";
    }

    @GetMapping({"/admin"})
    public String admin(
            Model model) {
        List<Product> products = productRepository.findAll();
        products.forEach(product ->
                product.setDescription(
                        product.getDescription()
                                .substring(0, Math.min(product.getDescription().length(), 12))
                                .concat("...")));
        model.addAttribute("products", products);

        return "admin";
    }

    @GetMapping({"/cart"})
    public String cart(
            Model model,
            @RequestParam(required = false,defaultValue = "") Long[] ids) {
        List<Product> products = productRepository.findAllById(Arrays.asList(ids.clone()));
        products.forEach(product ->
                product.setDescription(
                        product.getDescription()
                                .substring(0, Math.min(product.getDescription().length(), 12))
                                .concat("...")));
        model.addAttribute("products", products);
        return "cart";
    }

    @GetMapping({"/aboutus"})
    public String aboutus(
            Model model) {
        return "aboutus";
    }

    @PostMapping({"/cart"})
    public String cart(
            @RequestParam String name,
            @RequestParam String phone,
            @RequestParam String ids) {

        String str = ids;
        int[] arr = Arrays.stream(str.substring(1, str.length()-1).split(","))
                .map(String::trim).mapToInt(Integer::parseInt).toArray();
        Long[] idsAsLong = new Long[arr.length];
        for (int i = 0; i < arr.length; i++) {
            idsAsLong[i] = Long.valueOf(arr[i]);
        }
        List<Product> products = productRepository.findAllById(Arrays.asList(idsAsLong));

        SendEmail(name, phone, products);


        return "redirect:/";
    }

    @PostMapping({"/addNew"})
    public String addNew(
            @RequestParam String type,
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String price,
            @RequestParam String imageUrl,
            @RequestParam String imageUrl2,
            @RequestParam String imageUrl3,
            @RequestParam String specificationKey1,
            @RequestParam String specificationKey2,
            @RequestParam String specificationValue1,
            @RequestParam String specificationValue2) {



        Product product = new Product();
        product.setTitle(title);
        product.setDescription(description);
        product.setProductType(productTypeRepository.getOne(Long.valueOf(type)));
        product.setDescriptionImageUrl(imageUrl);
        product.setPrice(Double.parseDouble(price));

        Image image1 = new Image();
        image1.setProduct(product);
        image1.setTitle(imageUrl2);

        Image image2 = new Image();
        image2.setProduct(product);
        image2.setTitle(imageUrl3);

        productRepository.save(product);

        Set<Image> images = new HashSet<>();
        images.add(image1);
        images.add(image2);
        product.setImages(images);

        imageRepository.save(image1);
        imageRepository.save(image2);

        Specification specification1 = new Specification();
        specification1.setKey(specificationKey1);
        specification1.setValue(specificationValue1);
        specification1.setProduct(product);

        Specification specification2 = new Specification();
        specification1.setKey(specificationKey2);
        specification2.setProduct(product);
        specification1.setValue(specificationValue2);

        specificationRepository.save(specification1);
        specificationRepository.save(specification2);

        Set<Specification> specifications = new HashSet<>();
        specifications.add(specification1);
        specifications.add(specification2);
        product.setSpecifications(specifications);


        return "redirect:/";
    }

    @PostMapping({"/deleteProduct"})
    public String deleteProduct(
            @RequestParam String name,
            @RequestParam String password,
            @RequestParam String id) {
        if (name.equals(Constants.user) && password.equals(Constants.password))
            productRepository.deleteById(Long.valueOf(id));
        else return "redirect:/";

        return "redirect:/admin";
    }

    private void SendEmail(String name, String phone, List<Product> products){
        String from = "sobolmladshij@gmail.com";
        String pass = "***********";
        String[] to = { "sobolmladshij@gmail.com" };
        String subject = " New order ";
        String s = " : ";
        for (Product p:products ) {
            s = s + " " + p.getId() + " " + p.getTitle() + " " + p.getPrice() + "." ;
        }
        String body = " User " + name + " with number " + phone +" placed an order " + s;

        sendFromGMail(from, pass, to, subject, body);
    }

    private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}

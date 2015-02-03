package kr.co.itwise;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/products")
public class ProductController {
	private List<Product> dummyList;
	
	public ProductController() {
		dummyList = new ArrayList<Product>();
		
		Random random = new Random();
		for(int i = 0; i < 1000; i++) {
			long price = random.nextInt(1000) * 1000;
			Product dummyProduct = new Product("상품" + i, price);
			dummyList.add(dummyProduct);
		}
	}
	@RequestMapping(value =  "", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> findAll(){
		return dummyList;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	@ResponseBody
	public Product addProduct(@RequestBody Product product) {
		dummyList.add(product);
		return product;
	}
}

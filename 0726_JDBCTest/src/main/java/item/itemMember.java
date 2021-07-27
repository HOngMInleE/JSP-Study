package item;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class itemMember {

	String name;
	String price;
	String description;
	
	public itemMember() {
		super();
	}
	
	
}

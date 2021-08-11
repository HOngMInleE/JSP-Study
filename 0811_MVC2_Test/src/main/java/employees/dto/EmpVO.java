package employees.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmpVO {

	private String id;
	private String pass;
	private String name;
	private String lev;
	
	private Date enter;
	private String gender;
	private String phone;
	
}

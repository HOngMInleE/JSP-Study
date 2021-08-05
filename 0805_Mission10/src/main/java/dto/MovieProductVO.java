package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieProductVO {
	int code;
	String title;
	int price;
	String director;
	String actor;
	String poster;
	String synopsis;
}

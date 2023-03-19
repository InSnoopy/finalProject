package kr.or.ddit.project.alarm.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="alNo")
public class AlarmVO {
	@NotNull
	private Integer alNo;
	@NotBlank	
	private String 	memEmail;
	@NotBlank	
	private String 	alSender;
	@NotBlank	
	private String 	alSdate;
	private String 	alReadYn;
	@NotBlank	
	private String 	alContCd;
	@NotBlank	
	private String 	memName;
	
	@NotBlank	
	private List<String> memEmailList;
}

package kr.or.ddit.member.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.groups.Default;

import org.springframework.web.multipart.MultipartFile;
 
import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.DeleteGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of="memEmail")
//@ToString(exclude= {"memPass"})
public class MemberVO implements Serializable{
	
	public MemberVO(
			@NotBlank(groups = { Default.class, DeleteGroup.class }) String memEmail,
			@NotBlank(groups = { Default.class, DeleteGroup.class }) String memPass
	) {
		super();
		this.memEmail = memEmail;
		this.memPass = memPass;
	}
	private int rnum;
	@NotBlank(groups= {Default.class, DeleteGroup.class})
	private String memEmail;
	@NotBlank
	private String memName;
	@JsonIgnore
	@NotBlank(groups= {Default.class, DeleteGroup.class})
	private String memPass;
	private String memTel;
	
	@NotBlank
	private String memSdate;
	private String memEdate;
	private String memSttsCd;
	private String memDateLog;
	private String memRole;
	
	private String mailKey;
	private boolean mailAuth;
	
	private Integer memAttNo;
	
	private MultipartFile[] files;
	private String memAttPath;
	private String mcodeNm;
	
	
	
	// 프로젝트 코드 리스트 - 1:N
	// private List<ProjectVO> projectCodeList
	// 프로젝트 역할 - 1:N
	// private List<MemRole> memRoleList

}

package kr.or.ddit.project.work.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.work.vo.WorkChargerVO;
import kr.or.ddit.project.work.vo.WorkCommVO;
import kr.or.ddit.project.work.vo.WorkVO;

@Mapper
public interface WorkDAO {
	
	// 이슈페이지 내 작업목록 조회
	public List<WorkVO> selectISWork(@Param("proCode") String proCode);
	
	// 이슈페이지 내 작업목록 조회
	public List<MemberVO> selectISMember(@Param("workNo") int workNo);
	
	/**
	 * 프로젝트 작업 리스트 조회하기
	 * @param proCode
	 * @return List<WorkVO>
	 */	
	public List<WorkVO> selectWorkList(@Param("proCode") String proCode);
	
	/**
	 * 프로젝트 상위 작업 리스트 조회하기
	 * @param proCode
	 * @return List<WorkVO>
	 */	
	public List<WorkVO> selectPntUpWorkList(@Param("proCode") String proCode);
	
	/**
	 * 프로젝트 오늘 작업 리스트 조회하기
	 * @param proCode
	 * @return List<WorkVO>
	 */	
	public List<WorkVO> selectTodayWorkList(@Param("proCode") String proCode);
	
	/**
	 * 프로젝트 나에게 배정된 작업 리스트 조회하기
	 * @param WorkVO
	 * @return List<WorkVO>
	 */	
	public List<WorkVO> selectMyWorkList(WorkVO work);
	
	/**
	 * 모든 프로젝트에서 나에게 배정된 작업 리스트 조회
	 * @param WorkVO
	 * @return List<WorkVO>
	 */	
	public List<WorkVO> selectAllMyWorkList(WorkVO work);
	
	/**
	 * 프로젝트 작업 하나 조회
	 * @param WorkVO
	 * @return WorkVO
	 */	
	public WorkVO selectWorkDetail(WorkVO work);
	
	/**
	 * 현재 작업에 하위 작업 목록 조회
	 * @param WorkVO
	 * @return WorkVO
	 */	
	public List<WorkVO> selectDownWorkList(WorkVO work);
	
	/**
	 * 작업 등록하기
	 * @param WorkVO
	 * @return 등록된 작업 수
	 */	
	public int insertWork(WorkVO work);
	
	/**
	 * 작업 수정하기
	 * @param 
	 * @return 
	 */
	public int updateWork(WorkVO work);
	
	/**
	 * 작업 날짜만 수정하기
	 * @param 
	 * @return 
	 */
	public int updateWorkDate(WorkVO work);
	
	
	/**
	 * 작업 상태 코드 수정하기
	 * @param WorkVO
	 * @return 수정된 작업 수
	 */
	public int updateWorkStateCd(WorkVO work);
	
	/**
	 * 작업 담당자 배정하기
	 * @param WorkVO
	 * @return 등록된 작업 담당자 수
	 */
	public int insertWorkCharger(WorkVO work);
	
	/**
	 * 작업 마지막 no 가져오기
	 * @param WorkVO
	 * @return 등록된 작업 담당자 수
	 */
	public WorkVO selectWorkLastNo();
	
	/**
	 * 작업 담당자 수정하기
	 * @param 
	 * @return 
	 */
	public int updateWorkCharger(List<WorkChargerVO> workChargerVOList);
	
	/**
	 * 작업 담당자 삭제하기
	 * @param 
	 * @return 
	 */
	public int deleteWorkCharger(WorkVO work);
	
	/**
	 * 작업 하나 삭제하기
	 * @param 
	 * @return 
	 */
	public int deleteWork(WorkVO work);
	
	/**
	 * 작업 댓글 추가하기
	 * @param WorkCommVO
	 * @return 
	 */
	public int insertWorkComm(WorkCommVO workComm);
	
	/**
	 * 작업 댓글 목록 가져오기
	 * @param WorkCommVO
	 * @return WorkCommVO
	 */
	public List<WorkCommVO> selectWorkCommList(WorkCommVO workComm);
	
}

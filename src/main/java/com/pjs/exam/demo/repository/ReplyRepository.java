package com.pjs.exam.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pjs.exam.demo.vo.Reply;

@Mapper
public interface ReplyRepository {
	
	
	
	@Insert("""
			INSERT INTO reply
			SET regDate = NOW(),
			updateDate = NOW(),
			memberID = #{memberId},
			relTypeCode=#{relTypeCode},
			relId=#{relId},
			`body`=#{body}
			""")
	public void writeReply(int memberId, String relTypeCode, int relId, String body);

	
	@Select("""
			SELECT LAST_INSERT_ID()
			""")
	public int getLastInsertId();

	
	@Select("""
			SELECT R.*,
			M.nickname AS extra_writerName
			FROM reply AS R
			LEFT JOIN `member` AS M
			ON r.memberId = M.id
			WHERE R.relTypeCode=#{relTypeCode}
			AND R.relId=#{relId}
			ORDER BY R.id DESC
			""")
	public List<Reply> getForPrintReplies(int memberId, String relTypeCode, int relId);

	
	@Select("""
			SELECT R.*,
			M.nickname AS extra_writerName
			FROM reply AS R
			LEFT JOIN `member` AS M
			ON r.memberId = M.id
			WHERE R.id = #{id}
			ORDER BY R.id DESC
			""")
	public Reply getForPrintReply(int memberId, int id);


	
	@Delete("""
			DELETE FROM reply
			WHERE id=#{id}
			""")
	public void deleteReply(int id);


	@Update("""
			UPDATE reply
			SET updateDate = NOW(),
			`body` = #{body}
			WHERE id = #{id}
			""")
	public void modifyReply(int id, String body);
}

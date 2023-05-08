package com.pjs.exam.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.pjs.exam.demo.vo.Article;


@Mapper
public interface ArticleRepository {
	public Article getForPrintArticle(@Param("id") int id);
	
	public List<Article> getForPrintArticles(@Param("boardId")int boardID, @Param("limitStart")int limitStart, @Param("limitTake")int limitTake, @Param("searchKeywordTypeCode")String searchKeywordTypeCode, @Param("searchKeyword")String searchKeyword);
	
	public void writeArticle(@Param("memberId")int memberId,@Param("boardId")int boardId, @Param("title")String title, @Param("body")String body);
	
	public void deleteArticle(@Param("id")int id);

	public void modifyArticle(@Param("id")int id, @Param("title")String title, @Param("body")String body);
	
	public int getLastInsertId();

	public int getArticlesCount(@Param("boardId")int boardId, @Param("searchKeywordTypeCode")String searchKeywordTypeCode, @Param("searchKeyword")String searchKeyword);

	public int increaseHitCount(@Param("id")int id);

	public int getArticleHitCount(int id);

	public int increaseGoodReactionPoint(int relId);
	
	public int increaseBadReactionPoint(int relId);

	public int decreaseGoodReactionPoint(int relId);
	
	public int decreaseBadReactionPoint(int relId);

	
	
}

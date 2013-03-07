package chap17.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Date;

import chap17.dao.ArticleDao;
import chap17.jdbc.JdbcUtil;
import chap17.jdbc.connection.ConnectionProvider;
import chap17.model.Article;
import chap17.model.WritingRequest;

public class WriteArticleService {
	private static WriteArticleService instance = new WriteArticleService();
	public static WriteArticleService getInstance() {
		return instance;
	}
	
	private WriteArticleService() {
	}
	
	public Article write(WritingRequest writingRequest) throws IdGenerationFailedException {
		
		int groupId = IdGenerator.getInstance().generateNextId("article");
		
		Article article = writingRequest.toArticle();
		
		article.setGroupId(groupId);
		article.setPostingDate(new Date());
		DecimalFormat decimalFormat = new DecimalFormat("0000000000");
		article.setSequenceNumber(decimalFormat.format(groupId) + "999999");
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			int articleId = ArticleDao.getInstance().insert(conn, article);
			if(articleId == -1) {
				JdbcUtil.rollback(conn);
				throw new RuntimeException("DB삽입 안됨:"+articleId);
			}
			conn.commit();
			article.setId(articleId);
			return article;
		} catch(SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException("DB에러: " + ex.getMessage(), ex);
		} finally {
			if(conn != null) {
				try {
					conn.setAutoCommit(true);
				} catch(SQLException ex) {
				}
			} 
			JdbcUtil.close(conn);
		}
		
	}
}

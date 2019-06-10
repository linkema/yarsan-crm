package mlk.core.dao;

import mlk.core.bean.Article;
import mlk.core.bean.Reply;
import mlk.core.bean.Words;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author YarsanMa
 */
public interface ArticleDao {
    void saveArticle(Article article);
    int selectCount();
    List<Article> findByPage(HashMap<String, Object> map);
    List<Article> findConByPage(Map<String, Object> conMap);
    void delete(int r_id);
    void update(Article article);
    Article findById(int r_id);
    void clean(int r_id);
    int selectCount2();
    void restore(int r_id);
    void saveWords(Words words);
    void saveReply(Reply reply);
    List<Words> findByWords();
    List<Reply> findByReply();
}

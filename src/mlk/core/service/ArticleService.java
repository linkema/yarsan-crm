package mlk.core.service;

import mlk.common.utils.Page;
import mlk.core.bean.Article;
import mlk.core.bean.Reply;
import mlk.core.bean.Words;

import java.util.List;
import java.util.Map;

/**
 * @author Yarsan Ma
 */
public interface ArticleService {

    void saveArticle(Article article);

    Page<Article> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);

    void delete(int r_id);

    void update(Article article);

    Article findById(int r_id);

    void clean(int r_id);

    void restore(int r_id);

    void saveWords(Words words);

    void saveReply(Reply reply);

    List<Words> findByWords();

    List<Reply> findByReply();
}

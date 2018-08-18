module ArticlesHelper

  def display_in_yen(price)
    price.to_s + " 円"
  end

  def tooltip_h
    html = "<p>Headers</p><br/>
            「#」,「##」....<br/><br/>
            <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
              <p>プレビュー</p><h3 style=&quot;border-bottom: 1px solid #9e9e9e;&quot;>見出しh3</h3>
              <p>###見出しh3</p>
            </div>"
    html.html_safe
  end

  def tooltip_code
    html =  "<p>Code</p><br/>
            <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
            (空行)<br/>
            ```ruby:qiita.rb<br/>
              function hello(){<br/>
              　return &quot;hello world!&quot;;<br/>
              }<br/>
            ```<br/>
            (空行)</div>"
    html.html_safe
  end

  def tooltip_link
    html = "<p>Links</p><br/>
            [リンクテキスト](URL)<br/><br/>
          <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
              <p>プレビュー</p><p style=&quot;border-bottom: 1px solid #9e9e9e; color: #65a931;&quot;>Trucle</p>
            [Trucle](<span style=&quot;color: #65a931;&quot;>http://trucle.com/</span>)
          </div>"
    html.html_safe
  end

  def tooltip_list
    html =  "<p>Lists</p><br/>
            「-」,「+」,「*」<br/><br/>
            <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
            - リスト１<br/>
            &nbsp;&nbsp;- ネスト　リスト1-1<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;- ネスト　リスト1-1-1<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;- ネスト　リスト1-1-2</div>"
    html.html_safe
  end

  def tooltip_quote
    html =  "<p>Quote</p><br/>
            「>」,「>>」<br/><br/>
            <p>プレビュー</p>
            <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
            本日はよろしくお願いします。<br/><br/>
            <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
            こちらこそよろしくお願いします。<br/>
            </div></div>
            <p style=&quot;border-bottom: 1px solid #9e9e9e;&quot;></p>
            > 本日はよろしくお願いします。<br/><br/>
            >> こちらこそよろしくお願いします。"
    html.html_safe
  end
end

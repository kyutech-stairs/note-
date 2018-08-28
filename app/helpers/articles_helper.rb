module ArticlesHelper

  def display_in_yen(price)
    price.to_s + " 円"
  end

  def tooltip_h
    html = "<p>Headers</p><br/>
            <label>Text</label>
            <div style=&quot; padding: 5px;&quot;>
              <p>#####Header5　　　　</p>
            </div>
            <label>Preview</label>
            <div style=&quot; padding: 5px;&quot;>
              <h5;>Header5</h5>
            </div>"
    html.html_safe
  end

  def tooltip_code
    html =  "<p>Code</p><br/>
            <label>Text</label>
            <div style=&quot; padding: 5px;&quot;>
            ```<br/>
              function hello(){<br/>
              　return &quot;hello world!&quot;;<br/>
              }<br/>
            ```</div>"
    html.html_safe
  end

  def tooltip_link
    html = "<p>Links</p><br/>
            <label>Text</label>
            <div style=&quot; padding: 5px;&quot;>
              <p>[Trucle](http://trucle.com/)</p>
            </div>
            <label>Preview</label>
            <div style=&quot; padding: 5px;&quot;>
              <p>Trucle</p>
            </div>"
    html.html_safe
  end

  def tooltip_list
    html =  "<p>Lists</p><br/>
            <label>Text</label>
            <div style=&quot; padding: 5px;&quot;>
            - リスト１<br/>
            &nbsp;&nbsp;- ネスト　リスト1-1<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;- ネスト　リスト1-1-1<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;- ネスト　リスト1-1-2</div>"
    html.html_safe
  end

  def tooltip_quote
    html =  "<p>Quote</p><br/>
            <label>Text</label>
            <div style=&quot; padding: 5px;&quot;>
              > 本日はよろしくお願いします。<br/><br/>
              >> こちらこそよろしくお願いします。
            </div><br/>
            <label>Preview</label>
            <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
            本日はよろしくお願いします。<br/><br/>
            <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
            こちらこそよろしくお願いします。<br/>
            </div></div>"
    html.html_safe
  end

  def display_header_image(article)
    if article.image.file
      image_tag(article.image.header, alt: "header", class: "header-image")
    else
      image_tag("sample-1.jpg", alt: "default", class: "header-image")
    end
  end
end

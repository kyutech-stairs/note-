module ArticlesHelper

  def display_in_yen(price)
    price.to_s + " 円"
  end

  def tooltip_h
    html = "<div style=&quot; border-bottom: 1px solid; &quot;>
              <p>Headers</p>
            </div><br/>
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
    html =  "<div style=&quot; border-bottom: 1px solid; &quot;>
              <p>Code</p>
            </div><br/>
            <label>Text</label>
            <div style=&quot; padding: 5px;&quot;>
            ```<br/>
              function hello(){<br/>
              　return &quot;hello world!&quot;;　　<br/>
              }<br/>
            ```</div>
            <label>Preview</label>
            <div style=&quot; padding: 5px; background-color: #394548; color: #e3e3e3; &quot;>
              function hello(){<br/>
              　return &quot;hello world!&quot;;<br/>
              }<br/>
            </div>"
    html.html_safe
  end

  def tooltip_link
    html = "<div style=&quot; border-bottom: 1px solid; &quot;>
              <p>Links</p>
            </div><br/>
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

  def tooltip_emphasis
    html =  "<div style=&quot; border-bottom: 1px solid; &quot;>
              <p>Emphasis　　　　　　</p>
            </div><br/>
            <label>Text</label>
            <div style=&quot; padding: 5px;&quot;>
              <p>*Hello*</p>
              <p>**Hello**</p>
            </div>
            <label>Preview</label>
            <div style=&quot; padding: 5px;&quot;>
              <em>Hello</em><br/><br/>
              <strong>Hello</strong>
            </div>"

    html.html_safe
  end

  def tooltip_quote
    html =  "<div style=&quot; border-bottom: 1px solid; &quot;>
              <p>Quote</p>
            </div><br/>
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

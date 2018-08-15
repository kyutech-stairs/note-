module ArticlesHelper

  def display_in_yen(price)
    price.to_s + " 円"
  end

  def tooltip_h
    html = "<div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
              <h3 style=&quot;border-bottom: 1px solid #9e9e9e;&quot;>見出しh3</h3>
              <p>###見出しh3</p>
              <h2 style=&quot;border-bottom: 1px solid #9e9e9e;&quot;>見出しh2</h2>
              <p>##見出しh2</p>
              <h1 style=&quot;border-bottom: 1px solid #9e9e9e;&quot;>見出しh1</h1>
              <p>#見出しh1</p>
            </div>"
    html.html_safe
  end

  def tooltip_code
    html =  "<p>コードの挿入</p><br/>
            <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
            ```php<br/>
              function hello(){<br/>
              　return &quot;hello world!&quot;;<br/>
              }<br/>
            ```</div>"
    html.html_safe
  end

  def tooltip_link
    html = "<p>リンクの挿入</p><br/>
            [リンクテキスト](URL)<br/><br/>
          <div style=&quot;border-left: 5px solid #dddddd; padding: 5px;&quot;>
            <p style=&quot;border-bottom: 1px solid #9e9e9e; color: #65a931;&quot;>Trucle</p>
            [Trucle](<span style=&quot;color: #65a931;&quot;>http://trucle.com/</span>)
          </div>"
    html.html_safe      
  end
end

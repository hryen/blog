<#if totalPages gt 1>
    <div class="pagination">
        <#--如果当前页大于1 则显示上一页-->
        <#if pageNumber gt 1>
            <a class="previous_page" href="/page/${pageNumber-1}">Previous</a>
        <#elseif pageNumber == 1>
            <span class="previous_page disabled">Previous</span>
        </#if>

        <#--如果总页数小于6 则全部显示-->
        <#if totalPages lt 6>
            <#list 1..totalPages as i>
                <#if i == pageNumber>
                    <a class="current" href="/page/${i}">${i}</a>
                <#else>
                    <a href="/page/${i}">${i}</a>
                </#if>
            </#list>
        <#else>
        <#--如果是前三页-->
            <#if pageNumber lt 4>
                <#list 1..totalPages as i>
                    <#if i gt 5>
                        <#break>
                    </#if>
                    <#if i == pageNumber>
                        <a class="current" href="/page/${i}">${i}</a>
                    <#else>
                        <a href="/page/${i}">${i}</a>
                    </#if>
                </#list>
            <#--如果是最后三页-->
            <#elseif (totalPages-pageNumber) lt 3>
                <#list totalPages-4..totalPages as i>
                    <#if i == pageNumber>
                        <a class="current" href="/page/${i}">${i}</a>
                    <#else>
                        <a href="/page/${i}">${i}</a>
                    </#if>
                </#list>
            <#else>
                <#list pageNumber-2..pageNumber+2 as i>
                    <#if i lt 1 || i gt totalPages>
                        <#continue>
                    </#if>
                    <#if i == pageNumber>
                        <a class="current" href="/page/${i}">${i}</a>
                    <#else>
                        <a href="/page/${i}">${i}</a>
                    </#if>
                </#list>
            </#if>
        </#if>

        <#--如果当前页小于总页数 则显示下一页-->
        <#if pageNumber lt totalPages>
            <a class="next_page" href="/page/${pageNumber+1}">Next</a>
        <#elseif pageNumber == totalPages>
            <span class="next_page disabled">Next</span>
        </#if>
    </div>
</#if>
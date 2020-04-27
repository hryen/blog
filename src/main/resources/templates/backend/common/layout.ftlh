<#include "header.ftlh">

<#macro app>
    <body>
        <div id="app">
<#--            <#include "left-sider.ftlh">-->
            <#nested>
        </div>
        </#macro>

        <#macro footer>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <#nested>
    </body>
</html>
</#macro>
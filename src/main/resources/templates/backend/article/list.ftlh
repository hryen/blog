<#include "../common/layout.ftlh">

<#--header-->
<@header title="Articles - " + blogTitle>
    <style>
        #breadcrumb {
            padding-bottom: 1rem;
        }
        #pagination {
            padding-top: 1rem;
        }
    </style>
</@header>

<#--app-->
<@app>
<section class="section">
    <div id="breadcrumb" class="container">
        <nav class="breadcrumb" aria-label="breadcrumbs">
            <ul>
                <li><a>Home</a></li>
                <li><a>Article</a></li>
                <li class="is-active"><a aria-current="page">List</a></li>
            </ul>
        </nav>
    </div>
    <div id="table" class="container">
        <table class="table is-fullwidth is-hoverable">
            <thead>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Permalink</th>
                <th>Published</th>
                <th>Modified</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <template v-if="articleList.length">
                <tr v-for="(article, index) in articleList">
                    <th>{{ index + 1 }}</th>
                    <td>{{ article.title }}</td>
                    <td>{{ article.permalink }}</td>
                    <td>{{ article.published }}</td>
                    <td>{{ article.modified }}</td>
                    <td>
                        <a title="View" @click="handleViewArticle(article.permalink)">View</a>
                        <a title="Edit" @click="handleEditArticle(article.id)">Edit</a>
                        <a title="Delete" @click="handleDeleteArticle(article.id)">Delete</a>
                    </td>
                </tr>
            </template>
            <template v-else>
                <tr>
                    <td colspan="6" class="has-text-centered">
                        No articles have been published yet.
                    </td>
                </tr>
            </template>
            </tbody>
        </table>
    </div>

    <#--分页-->
    <template v-if="totalPage > 1">
        <div id="pagination" class="container">
            <nav class="pagination is-centered" role="navigation" aria-label="pagination">

                <#--上一页-->
                <a @click="handleChangePage(page-1)"
                   :disabled="page == 1"
                   class="pagination-previous">Previous</a>

                <#--下一页-->
                <a @click="handleChangePage(page+1)"
                   :disabled="page == totalPage"
                   class="pagination-next">Next</a>

                <ul class="pagination-list">
                    <#--第一页-->
                    <li v-if="page > 2">
                        <a class="pagination-link" @click="handleChangePage(1)">1</a>
                    </li>

                    <#--如果当前页和第一页中间还有2个以上的页码-->
                    <li v-if="page - 1 > 2">
                        <span class="pagination-ellipsis">&hellip;</span>
                    </li>

                    <#--前一页-->
                    <li v-if="page > 1">
                        <a class="pagination-link" @click="handleChangePage(page-1)">
                            {{ page - 1 }}
                        </a>
                    </li>

                    <#--当前页-->
                    <li>
                        <a class="pagination-link is-current">
                            {{ page }}
                        </a>
                    </li>

                    <#--后一页-->
                    <li v-if="page < totalPage">
                        <a class="pagination-link" @click="handleChangePage(page+1)">
                            {{ page + 1 }}
                        </a>
                    </li>

                    <#--如果当前页和最后一页中间还有2个以上的页码-->
                    <li v-if="totalPage - page > 2">
                        <span class="pagination-ellipsis">&hellip;</span>
                    </li>

                    <#--最后一页-->
                    <li v-if="totalPage - page > 1">
                        <a class="pagination-link" @click="handleChangePage(totalPage)">
                            {{ totalPage }}
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </template>
</section>
</@app>

<#--footer-->
<@footer>
    <script>
        new Vue({
            el: '#app',
            data: {
                page: 1,
                limit: 5,
                articleList: [],
                totalCount: 0,
                totalPage: 0,
                isLoad: false
            },
            mounted: function() {
                this.handleListArticle();
            },
            methods: {
                handleListArticle: function() {
                    let _this = this;
                    _this.isLoad = true;
                    axios.get('/admin/api/articles', {
                        params: {
                            page: _this.page,
                            limit: _this.limit
                        }
                    }).then(function(response) {
                        if(response.status === 200 && response.data.code === 0) {
                            _this.articleList = response.data.data.items;
                            _this.totalCount = response.data.data.totalCount;
                            _this.totalPage = response.data.data.totalPage;
                        } else {
                            console.log('list article faild: ' + response.data.msg)
                        }
                        _this.isLoad = false;
                    }).catch(function(error) {
                        console.log('list article faild: ' + error);
                    });
                },
                handleChangePage: function(page) {
                    if(page < 1 || page > this.totalPage) {
                        return;
                    }
                    this.page = page;
                    this.handleListArticle();
                },
                handleViewArticle: function(permalink) {
                    window.open('/article/' + permalink);
                },
                handleEditArticle: function(id) {
                    window.location.href = '/admin/article/edit/' + id;
                },
                handleDeleteArticle: function(id) {
                    let _this = this;
                    let r = confirm('Are you sure delete this article?');
                    if (r) {
                        axios.delete('/admin/api/articles/' + id)
                            .then(function(response) {
                                if(response.status === 200 && response.data.code === 0) {
                                    // 在删除了当前页最后一条数据后，如果当前页不是第一页，将当前页减一
                                    if(_this.articleList.length - 1 === 0 && _this.page !== 1) {
                                        _this.page = _this.page - 1;
                                    }
                                    _this.handleListArticle();
                                } else {
                                    console.log('delete article faild: ' + response.data.msg);
                                }
                            }).catch(function (error) {
                            console.log('delete article faild: ' + error);
                        })
                    }
                }
            }
        });
    </script>
</@footer>

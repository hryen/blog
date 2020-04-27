<#include "../common/layout.ftlh">

<#--header-->
<@header title="Articles - " + blogTitle>
</@header>

<#--app-->
<@app>
<section class="section">
    <div class="container">
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
                <tr v-for="(article, index) in articleList">
                    <th>{{ index + 1 }}</th>
                    <td>{{ article.title }}</td>
                    <td>{{ article.permalink }}</td>
                    <td>{{ article.published }}</td>
                    <td>{{ article.modified }}</td>
                    <td>
                        <a title="view" @click="handleViewArticle(article.permalink)">View</a>
                        <a title="Edit" @click="handleEditArticle(article.id)">Edit</a>
                        <a title="Delete" @click="handleDeleteArticle(article.id)">Delete</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>



<#--    <main>-->
<#--        <div :class="{ active : isLoad }" class="ui centered loader"></div>-->
<#--        <template v-if="articleList.length">-->
<#--            <table class="ui table fixed single line unstackable selectable">-->
<#--                <thead>-->
<#--                <tr>-->
<#--                    <th class="one wide">#</th>-->
<#--                    <th class="five wide">Title</th>-->
<#--                    <th class="four wide">Permalink</th>-->
<#--                    <th class="two wide">Published</th>-->
<#--                    <th class="two wide">Modified</th>-->
<#--                    <th class="two wide">Action</th>-->
<#--                </tr>-->
<#--                </thead>-->
<#--                <tbody>-->
<#--                <tr v-for="(article, index) in articleList">-->
<#--                    <td>{{ index + 1 }}</td>-->
<#--                    <td>{{ article.title }}</td>-->
<#--                    <td>{{ article.permalink }}</td>-->
<#--                    <td>{{ article.published }}</td>-->
<#--                    <td>{{ article.modified }}</td>-->
<#--                    <td>-->
<#--                        <button class="ui button icon"-->
<#--                                @click="handleViewArticle(article.permalink)">-->
<#--                            <i class="icon eye"></i>-->
<#--                        </button>-->

<#--                        <button class="ui button icon"-->
<#--                                @click="handleEditArticle(article.id)">-->
<#--                            <i class="icon edit"></i>-->
<#--                        </button>-->

<#--                        <button class="negative ui button icon"-->
<#--                                @click="handleDeleteArticle(article.id)">-->
<#--                            <i class="icon trash"></i>-->
<#--                        </button>-->
<#--                    </td>-->
<#--                </tr>-->
<#--                </tbody>-->
<#--            </table>-->

<#--            <span style="font-size: 16px;">Limit:</span>-->
<#--            <label>-->
<#--                <select v-model="limit" @change="handleListArticle" style="width: 50px;display: inline">-->
<#--                    <option value="10">10</option>-->
<#--                    <option value="20">20</option>-->
<#--                    <option value="30">30</option>-->
<#--                    <option value="50">50</option>-->
<#--                    <option value="100">100</option>-->
<#--                </select>-->
<#--            </label>-->
<#--            <span style="margin-left: 10px;font-size: 16px;">Total {{ totalCount }} items.</span>-->

<#--            &lt;#&ndash;分页&ndash;&gt;-->
<#--            <template v-if="totalPage > 1">-->
<#--                <div class="ui pagination menu right floated">-->

<#--                    &lt;#&ndash;上一页&ndash;&gt;-->
<#--                    <a v-if="page > 1" class="icon item" @click="handleChangePage(page-1)">-->
<#--                        <i class="left chevron icon"></i>-->
<#--                    </a>-->

<#--                    &lt;#&ndash;总页数小于10 显示全部页码&ndash;&gt;-->
<#--                    <template v-if="totalPage < 10">-->
<#--                        <template v-for="n in totalPage">-->
<#--                            <a-->
<#--                                    v-if="n == page"-->
<#--                                    class="item active"-->
<#--                                    @click="handleChangePage(n)">{{ n }}</a>-->
<#--                            <a v-else class="item" @click="handleChangePage(n)">{{ n }}</a>-->
<#--                        </template>-->
<#--                    </template>-->

<#--                    &lt;#&ndash;总页数大于10 显示当前页的前三页和后三页&ndash;&gt;-->
<#--                    <template v-else>-->
<#--                        <a v-if="page-3 >= 1"-->
<#--                                class="item" @click="handleChangePage(page-3)">{{page-3}}</a>-->

<#--                        <a v-if="page-2 >= 1"-->
<#--                           class="item" @click="handleChangePage(page-2)">{{page-2}}</a>-->

<#--                        <a v-if="page-1 >= 1"-->
<#--                           class="item" @click="handleChangePage(page-1)">{{page-1}}</a>-->

<#--                        <a class="item active" @click="handleChangePage(page)">{{page}}</a>-->

<#--                        <a v-if="page+1 <= totalPage"-->
<#--                           class="item" @click="handleChangePage(page+1)">{{page+1}}</a>-->

<#--                        <a v-if="page+2 <= totalPage"-->
<#--                           class="item" @click="handleChangePage(page+2)">{{page+2}}</a>-->

<#--                        <a v-if="page+3 <= totalPage"-->
<#--                           class="item" @click="handleChangePage(page+3)">{{page+3}}</a>-->
<#--                    </template>-->

<#--                    &lt;#&ndash;下一页&ndash;&gt;-->
<#--                    <a v-if="page < totalPage" class="icon item" @click="handleChangePage(page+1)">-->
<#--                        <i class="right chevron icon"></i>-->
<#--                    </a>-->
<#--                </div>-->
<#--            </template>-->

<#--        </template>-->

<#--        <template v-else>-->
<#--            <p>No articles have been published yet.</p>-->
<#--        </template>-->
<#--    </main>-->
</@app>

<#--footer-->
<@footer>
    <script>
        new Vue({
            el: '#app',
            data: {
                page: 1,
                limit: 10,
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

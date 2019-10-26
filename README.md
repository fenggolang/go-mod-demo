# go-mod-demo
go mod 示例工程
# 使用步骤
## 如果是新建的项目
```markdown
# 1. 在github或者gitlab上新建一个项目然后clone到本地
git clone https://github.com/fenggolang/go-mod-demo.git

# 2. 用goland打开项目初始化模块(会在当前目录新建一个go.mod文件)
go mod init github.com/fenggolang/go-mod-demo

# 3. goland命令行下载第三方包(这样会自动在go.mod加入依赖，然后写代码的时候编辑器才会有提示，也就是需要编辑器提示是需要把三方包写在go.mod的require中的)
go get github.com/gorilla/mux

# 4. 创建一个main.go文件写点代码

# 5. 根据go.mod文件来处理依赖关系[增加丢失的module，去掉未用的module]，这种一般是拉去别人代码的时候，本地需要执行这个拉取依赖包
go mod tidy -v

# 6. 将依赖复制到vendor目录下
go mod vendor
```
## 如果是存在的项目(从go vendor迁移到go module)
```markdown
第一步: 升级到 Go 1.13。
第二步: 让 GOPATH 从你的脑海中完全消失，早一步踏入未来。
修改 GOBIN 路径（可选）：go env -w GOBIN=$HOME/bin。
打开 Go modules：go env -w GO111MODULE=on。
设置 GOPROXY：go env -w GOPROXY=https://goproxy.cn,direct # 在中国是必须的，因为它的默认值被墙了。
第三步(可选): 按照你喜欢的目录结构重新组织你的所有项目。
第四步: 在你项目的根目录下执行 go mod init <OPTIONAL_MODULE_PATH> 以生成 go.mod 文件。
第五步: 想办法说服你身边所有的人都去走一下前四步。
```
## goproxy.cn详细教程
```markdown
https://book.eddycjy.com/golang/talk/goproxy-cn.html
```
## FAQ
### go mod init [module]
```markdown
使用go mod init [module]的时候一般是go mod init my_project_name还是go mod init github.com/xxx/my_project_name

module是引用的路径，如果之前只是项目名称级别引用，module就是my_project_name,如果之前是完成路径引用包,module就是类似:github.com/xxx/my_project_name
```
### 如何对go mod使用之前方式的vendor
```markdown
# go mod vendor 命令可以在项目中创建 vendor 文件夹将依赖包拷贝过来。
go mod vendor -v
```
### 如何解决无法下载的包
```markdown
# 推荐设置GOPROXY(GOPROXY默认是https://proxy.golang.org,direct,但国内无法访问，所以需要修改)
# Go 1.13 中的 GOPROXY 环境变量拥有了一个在中国大陆无法访问到的默认值 proxy.golang.org，所以我们需要修改默认的GOPROXY环境变量
go env -w GOPROXY=https://goproxy.cn,direct

# 使用替换方式(不推荐)
go mod edit -replace=golang.org/x/crypto@v0.0.0=github.com/golang/crypto@latest
```
### GO111MODULE环境变量是什么
```markdown
可以用环境变量 GO111MODULE 开启或关闭模块支持，它有三个可选值：off、on、auto，默认值是 auto。

GO111MODULE=off 无模块支持，go 会从 GOPATH 和 vendor 文件夹寻找包。
GO111MODULE=on 模块支持，go 会忽略 GOPATH 和 vendor 文件夹，只根据 go.mod 下载依赖。
GO111MODULE=auto 在 $GOPATH/src 外面且根目录有 go.mod 文件时，开启模块支持。
在使用模块的时候，GOPATH 是无意义的，不过它还是会把下载的依赖储存在 $GOPATH/pkg/mod 中，也会把 go install 的结果放在 $GOPATH/bin 中。
```
### go mode命令
```markdown
download    download modules to local cache (下载依赖的module到本地cache))
edit        edit go.mod from tools or scripts (编辑go.mod文件)
graph       print module requirement graph (打印模块依赖图))
init        initialize new module in current directory (再当前文件夹下初始化一个新的module, 创建go.mod文件))
tidy        add missing and remove unused modules (增加丢失的module，去掉未用的module)
vendor      make vendored copy of dependencies (将依赖复制到vendor下)
verify      verify dependencies have expected content (校验依赖)
why         explain why packages or modules are needed (解释为什么需要依赖)
```
### 显示所有Import库信息
```markdown
# -json JSON格式显示;all 显示全部库
go list -m -json all
```
### go mod Cache 路径
```markdown
默认在$GOPATH/pkg 下面：
$GOPATH/pkg/mod
```
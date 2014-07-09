JCiOSProjectSampleWithRAC
=========================

把最近做的一个项目的业务流程剥离，只剩下可公用的项目框架，以便以后类似项目使用。

这是我第一个使用RAC的正式项目，原来计划完全用MVVM方式，但实际开发时并没有一步到位。现在利用这个机会顺便改造一下，使用MVVM实现列表的功能。


这次正式使用RAC开发，最大的收获就是把思路扭向了响应式设计，没有之前那样容易陷入过程式的开发思路。
RAC要完全弄熟还真的不是一时半会儿的事。

=========================
具体内容：

1、工程目录结构参考： http://limboy.me/ios/2013/09/23/build-ios-application.html 

2、用CocoaPods加入一些常用、成熟的第三方库。

3、Vendors下放一些体量小，且自己可能会直接修改源码的第三方类。

4、实现一个从服务端获取内容到UI显示的过程，做成基类供不同业务继承使用。

5、实现一些常用的UI效果或者控件。

6、多Stroyboard和独立视图XIB混用。


=========================
几个类的说明：

- BaseServerDataListViewModel

所有下来刷新，拉到底部则加载更多的视图的ViewModel基类。定义一些公用的操作和属性。

例如工程中的EventListViewModel就是继承自此类。

- EventListViewController

由于多个地方可能用到同样的列表视图，所以将这个列表视图独立出来，由其它需使用的视图包含此视图，达到重用的目的。

例如工程中的FirstFlowRootViewController包含了这个列表。


=========================
列表视图的MVVM说明：

1、EventListViewController对应EventListViewModel，除界面外的所有具体流程都在ViewModel中执行，并反馈给ViewController进行界面显示。

2、EventListViewController内的tableView需显示Cell的内容，所以每个Cell对应一个Cell的ViewModel，这些Cell的ViewModel由视图的ViewMode提供。


=========================
一些备忘：

- 使用Mantle进行JSon数据转Model。
- 使用GVUserDefaults统一管理[NSUserDefaults standardUserDefaults]的值。
- 使用UIScrollView+UzysCircularProgressPullToRefresh使TableView实现下来刷新。
- 使用UIScrollView+JCLoadMoreIndicator是TableView实现底部加载更多。
- 一些常用的方法写在UtilityFunc类中。
- BuildPhases中添加RunScirpt使编译时BuildNumber自动+1。












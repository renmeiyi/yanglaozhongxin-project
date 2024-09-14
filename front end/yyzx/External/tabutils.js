function tabutils(parent){
	function findIframe(title){
		if(parent.$("#indextabs").tabs("exists",title)) {//  if 是用来查询
			var p = parent.$("#indextabs").tabs("getTab", title);
			var url = $(p.panel('options').content).attr('src');
			
			var iframes = p.find('iframe');
			if (url != null && iframes.length > 0) {
				var ff = iframes[0];
				return ff;
			}
		}
		return null;
	}
	function findNode(title, nodeid, func){
		var ff = findIframe(title);
		if(ff != null) {
			var node = ff.contentWindow.$(nodeid);
			func(node, ff);
		}
	}
	
	function refreshByClick(title, clickid){
		findNode(title, clickid, function(node, ff){
			node.click();
		});
	}
	
	function refreshContent(title, ctxid){
		findNode(title, clickid, function(node, ff){
			ff.contentWindow.location.href=$(ctxid).val() + '/' + url; 
		});
	}
	
	function add(url,title){
		if(parent.$("#indextabs").tabs("exists",title)) {//  if 是用来查询
			parent.$("#indextabs").tabs("select",title);
		} else {
		parent.$("#indextabs").tabs("add",{
			title:title, //标题名称
			closable:true, //关闭窗口的叉叉
			iconCls:'',
			content:"<iframe  class='iframe1' frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>"//加载一个变量
		});
		var li = parent.$(".tabs-wrap ul li:last-child");
		parent.$("#close").remove();
	    li.after("<li id='close'><a class='tabs-inner' href='javascript:void()' onClick='javascript:closeAll()'>关闭全部</a></li>");
		}
	}
	function closeAll() {
		parent.$(".tabs li").each(function(index, obj) {
	          //获取所有可关闭的选项卡
	        var tab = parent.$(".tabs-closable", this).text();
	        parent.$(".easyui-tabs").tabs('close', tab);
	    });
		parent.$("#close").remove();//同时把此按钮关闭
		addtabs("欢迎使用", 'welcome');
	  }
	return {
		refreshContent: refreshContent,
		refreshByClick: refreshByClick,
		findNode: findNode,
		add: add,
	}
}
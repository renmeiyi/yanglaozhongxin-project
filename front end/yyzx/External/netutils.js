 var netutils = function() {
	 var obj = {};

	 /**
	  * obj: 参数
	  */
	 function json(obj) {
		 if (obj.hint == null) {
			 obj.hint = function(msg) {
				 $.messager.alert("警告", msg, "warning");
			 }
		 }
		 $.ajax({
			 type: obj.type ? obj.type: 'POST',
			 url : obj.url,
			 data : obj.data ? obj.data:{},
			 async : obj.async == null ? true : obj.async,
			 dataTpye : obj.dataTpye ? obj.dataTpye:'json',
			 success : function(data) {
				 var msg = "获取数据失败";
				 if (data != null && data.status != null) {
					 msg = data.errMsg ? data.errMsg : "获取数据失败";
					 if(data.status == "success" && obj.suc) {
						 obj.suc(data);
						 return;
					 } else if (data.status == "error" && obj.err) {
						 obj.err(data);
						 return;
					 } 
				 } 
				 
				 obj.hint(msg);
			 },
			 error : function (){
				 obj.hint("访问网络失败");
			 }
		 });
	 }
	 /**
	  * url: 数据地址
	  * data: 参数
	  * suc: 访问成功，具有返回值 
	  * err: 访问失败，具有返回值 
	  * hint: 提示函数，具有msg参数 
	  */
	 function ajaxJson(url, data, suc, err, hint) {
		 if (hint == null) {
			 hint = function(msg) {
				 $.messager.alert("警告", msg, "warning");
			 }
		 }
		 $.ajax({
				type: 'POST',
				url : url,
				data : data,
				async : true,
				dataTpye : 'json',
				success : function(data) {
					var msg = "获取数据失败";
					if (data != null && data.status != null) {
						msg = data.errMsg ? data.errMsg : "获取数据失败";
						if(data.status == "success" && suc) {
							suc(data);
							return;
						} else if (data.status == "error" && err) {
							err(data);
							return;
						} 
					} 
					
					hint(msg);
				},
				error : function (){
					hint("访问网络失败");
				}
			});
	 }

	 obj.ajaxJson = ajaxJson;
	 obj.json = json;
	 
	 return obj;
 }();
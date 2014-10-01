var curPage = 1; //当前页码
var total,pageSize,totalPage;
//获取数据
function getData(page){
	$.ajax({
		type: 'POST',
		url: 'listProject.watt',
		data: {'page':page,'rows':16},
		dataType:'json',
		contenttype:"application/x-www-form-urlencoded;charset=utf-8", 
		beforeSend:function(){
			$("#loading").html("<img id='loadin'g src='lib/jquery/loading.gif'>");
		},
		success:function(json){
			json = eval(json);
			$("#loading").html("");
			$("#wtlist ul").empty();
			total = json.total; //总记录数
			pageSize = json.pageSize; //每页显示条数
			curPage = page; //当前页
			totalPage = json.totalPage; //总页数
			var li = "";
			var list = json.list;
			li += "<ul class=\"clearfix\">";
			$.each(list,function(index,array){ //遍历json数据列
				li += "<li>";
					li += "<div class=\"list-item\">";
						li += "<a class=\"item-figure\" href=\"deal-show.watt?id="+array['id']+"\" target=\"_blank\">";
							li += "<img class=\"lzload\" src="+array['image']+" alt="+array['brief']+" title="+array['brief']+">";
						li += "</a>";
						li += "<div class=\"item-upvote\">";
							if(array['isFocus'] == 'Y'){
								li += "<a class=\"icons  liked \" href=\"javascript:void(0);\" rel="+array['attention']+">"+array['attention']+"</a>";
							}else{
								li += "<a class=\"icons \" href=\"javascript:void(0);\" rel="+array['attention']+" onclick=\"like_deal_v2("+array['id']+",this)\">"+array['attention']+"</a>";
							}
						li += "</div>";
						li += "<h3>";
							li += "<a href=\"deal-show.watt?id="+array['id']+"\" target=\"_blank\">"+array['name']+"</a>";
						li += "</h3>";
						li += "<div class=\"item-caption\">";
							li += "<span class=\"caption-title\">";
								li += "目标：<em>"+array['deal_days']+"天</em> ";
								li += "<em><i class=\"font-yen\">每份¥</i>"+array['limit_price']+"</em>";
							li += "</span><br/>";
							li += "<span class=\"caption-title\">";
								li += "筹集份数：<em>"+array['copies']+"份</em> ";
							li += "</span>";
							li += "<span class=\"btn-base btn-red-h20 common-sprite\" style=\"margin-top:-3px;\">";
								li += "<span class=\"common-sprite\">鉴定中</span>";
							li += "</span>";
						li += "</div>";
						li += "<div class=\"progress-bar\">";
							li += "<span class=\"progress bg-red\" style=\"width: "+array['css_percent']+"%;\"></span>";
						li += "</div>";
						li += "<div class=\"item-rate clearfix\">";
							li += "<span class=\"rate1\"> <em>"+array['percent']+"%</em><br>已达</span>";
							li += "<span class=\"rate2\"> <em>"+array['supporterCopies']+"份</em><br>已购份额</span>";
							li += "<span class=\"rate3\"> <em>"+array['remain_days']+"天</em><br>剩余时间</span>";
						li += "</div>";
					li += "</div>";
				li += "</li>";
			});
			li += "</ul>";
			$("#wtlist").html(li);
		},
		complete:function(){ //生成分页条
			getPageBar();
		},
		error:function(e){
			console.log(e);
		}
	});
}

//获取分页条
function getPageBar(){
	//页码大于最大页数
	if(curPage>totalPage) curPage=totalPage;
	//页码小于1
	if(curPage<1) curPage=1;
	pageStr = "<span class=''>共"+total+"条"+curPage+"/"+totalPage+"</span>";
	
	//如果是第一页
	if(totalPage<=4)
	{
		if(curPage==1){
			pageStr += "<span class='cur'>1</span>";
			for(var i=2;i<=totalPage;i++)
			{
				pageStr += "<a href='javascript:void(0)' rel='"+i+"'>"+i+"</a>";
			}
		}else{
			pageStr += "<a href='javascript:void(0)' rel='1'><<</a><a href='javascript:void(0)' rel='"+(curPage-1)+"'><</a>";
			for(var i=1;i<=totalPage;i++)
			{
				if(i==curPage)
				{
					pageStr += "<span class='cur'>"+i+"</span>";
				}
				else
				{
					pageStr += "<a href='javascript:void(0)' rel='"+i+"'>"+i+"</a>";
				}
			}
			
		}
	}
	else//当页数大于5的时候就要这样显示1 2 3 4 ...
	{
		if(curPage<=3){
			if(curPage==1)
			{
				pageStr += "<span class='cur'>1</span>";
			}
			else
			{
				pageStr += "<a href='javascript:void(0)' rel='1'><<</a><a href='javascript:void(0)' rel='"+(curPage-1)+"'><</a>";
				pageStr += "<span class='cur'><a href='javascript:void(0)' rel='1'>1</a></span>";
			}
			for(var i=2;i<=4;i++)
			{
				if(i==curPage)
				{
					pageStr += "<span class='cur'>"+i+"</span>";
				}
				else
				{
					pageStr += "<a href='javascript:void(0)' rel='"+i+"'>"+i+"</a>";
				}
			}
			pageStr += "<span class='cur'>...</span>";
		}else{
			pageStr += "<a href='javascript:void(0)' rel='1'><<</a><a href='javascript:void(0)' rel='"+(curPage-1)+"'><</a>";
			pageStr += "<span class='cur'>...</span>";
			if(curPage>totalPage-2)
			{
				for(var i=totalPage-2;i<=totalPage;i++)
				{
					if(i==curPage)
					{
						pageStr += "<span class='cur'>"+i+"</span>";
					}
					else
					{
						pageStr += "<a href='javascript:void(0)' rel='"+i+"'>"+i+"</a>";
					}
				}
			}
			else
			{
				pageStr += "<a href='javascript:void(0)' rel='"+(curPage-1)+"'>"+(curPage-1)+"</a>";
				pageStr += "<span class='cur'>"+curPage+"</span>";
				pageStr += "<a href='javascript:void(0)' rel='"+(parseInt(curPage)+1)+"'>"+(parseInt(curPage)+1)+"</a>";
				pageStr += "<span class='cur'>...</span>";
			}
		}
	}
	//如果是最后页
	if(curPage>=totalPage){
		//pageStr += "<span>></span>   <span>>></span>";
	}else{
		pageStr += "<a href='javascript:void(0)' rel='"+(parseInt(curPage)+1)+"'>></a><a href='javascript:void(0)' rel='"+totalPage+"'>>></a>";
	}
		
	$("#pagecount").html(pageStr);
}

$(function(){
	getData(1);
	$(document).on("click", "#pagecount a", function(){
		var rel = $(this).attr("rel");
		if(rel){
			getData(rel);
		}
	});
});
<%@page import="site.record.RecordUser"%>
<%@page import="java.util.List"%>
<%@page import="site.DocubricksSite"%>
<%@page import="site.record.RecordDocument"%>

<jsp:include page="header.html" />
<jsp:include page="top.jsp" />


<div id="main">
	<div class="container">
		<hgroup class="mb20">
			<h1>Projects</h1>
		</hgroup>
		<br/>
		
		<section class="col-xs-12 col-sm-6 col-md-12">
			
			<%
			DocubricksSite ws=new DocubricksSite();
			ws.fromSession(request.getSession());
			List<RecordDocument> listdocs=RecordDocument.searchDocuments(ws,"");
			
			for(RecordDocument doc:listdocs)
				{
				String docurl="viewer.jsp?id="+doc.id;
				%>
				

				<article class="search-result row">
					<div class="col-xs-12 col-sm-12 col-md-3">
						<a href="<% out.println(docurl); %>" title="">
						<img width=200
							src="<% 
							if(doc.documentImage.equals("")) 
								out.println("images/open_hardware_logo.png");
							else
								out.println("project/"+doc.id+"/"+doc.documentImage); 
								%>"
							class="thumbnail center-block img-responsive" />
						</a>
						<%
						RecordUser userinfo=ws.getUserInfo();
						if(userinfo!=null && userinfo.isAdmin)
							{
							%>
							<br/>
							<form action="projectproperties.jsp">
								<input type="hidden" name="id" value="<% out.println(doc.id); %>"/>
								<button type="submit">Edit</button>
							</form>
							<%
							}
						%>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-9">
						<h3>
							<a href="<% out.println(docurl); %>"
								title=""><% out.println(doc.documentName); %></a>
						</h3>
						<div class="excerpt"><% out.println(doc.documentDesc); %></div>
					</div>
					<span class="clearfix borda"></span>
				</article>
				<%
				}
			%>
			
		</section>
		<ul class="pagination pull-right">
		</ul>
	</div>
</div>

<jsp:include page="bottom.html" />

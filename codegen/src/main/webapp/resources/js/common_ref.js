/*******************************************************************************
 * 作者:gzz 资产分类选择页
 ******************************************************************************/
function getSysTypeRef(name1, name2, path) {
	var text, url, winWidth, winHeight, widId;
	text = "资产类别";
	url = path + "/systype/ref?type=radio&rname=" + name1 + "&rvalue=" + name2;
	winWidth = 400;
	winHeight = $(top.window).height() - 20;
	widId = 'win001';
	top.ShowWin(text, url, path, winWidth, winHeight, widId);
}
/*******************************************************************************
 * 作者:gzz部门机构选择页
 ******************************************************************************/
function getAreaRef(yourname, yourid, path) {
	var text, url, winWidth, winHeight, widId;
	text = "组织机构";
	url = path + "/sysdept/ref?type=radio&rname=" + yourname + "&rvalue=" + yourid;
	winWidth = 500;
	winHeight = $(top.window).height() - 20;
	widId = 'win001';
	top.ShowWin(text, url, path, winWidth, winHeight, widId);
}
/*******************************************************************************
 * 作者:gzz用户选择页
 ******************************************************************************/
function getUserRef(yourname, yourid, path) {
	var text, url, winWidth, winHeight, widId;
	text = "用户列表";
	url = path + "/user/ref?rname=" + yourname + "&rvalue=" + yourid;
	winWidth = 900;
	winHeight = $(top.window).height() - 20;
	widId = 'win001';
	top.ShowWin(text, url, path, winWidth, winHeight, widId);
}

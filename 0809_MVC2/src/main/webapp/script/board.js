// 폼에 입력된 정보가 올바른지 판단하는 자바스크립트
function boardCheck() {
	if (document.frm.name.value.length == 0) {
		alert("작성자를 입력하세요.");
		frm.name.focus();
		return false;
	}
	if (document.frm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		frm.pass.focus();
		return false;
	}
	if (document.frm.title.value.length == 0) {
		alert("제목을 입력하세요.");
		frm.title.focus();
		return false;
	}
	return true;
} // boardCheck()

function open_win(url, name) {
	window.open(url, name, "width=500, height=230");
}

// 게시글 수정 및 삭제에 입력되는 패스워드 확인
function passCheck() {
	if (document.frm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요");
		frm.pass.focus();
		return false;
	}
	return true;
} // passCheck()
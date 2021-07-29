function loginCheck() {
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력해주세요.");
		frm.userid.focus();
		return false;
	}
	if (document.frm.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		frm.pwd.focus();
		return false;
		}
		return true;
} //loginCheck end

function idCheck() {
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력해주세요.");
		frm.userid.focus();
		return false;
	}
	var url = "idCheck.do?userid=" + document.frm.userid.value;
	window.open(url, "_black_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");

}//idCheck end

function idok() {
	opener.frm.userid.value = document.frm.userid.value;
	opener.frm.reid.value = document.frm.userid.value;
	self.close; // 현재 창(자기자신)을 닫음
}//idok end

function joinCheck() {
	if (document.frm.name.value.length == 0) {
		alert("이름을 입력해주세요.");
		frm.name.focus();
		return false;
	}
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력해주세요.");
		frm.userid.focus();
		return false;
	}else if (document.frm.userid.value.length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		frm.userid.focus();
		return false;
	}
	if (document.frm.pwd.value.length == 0) {
		alert("암호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	} else if (document.frm.pwd.value != document.frm.pwd_check.value) {
		alert("암호가 일치하지 않습니다.");
		frm.pwd.focus();
		return false;
	}
	if (document.frm.reid.value.length == 0) {
		alert("중복 체크를 하지 않았습니다.");
		frm.userid.focus();
		return false;
	}
	return true;
}//joinCheck end
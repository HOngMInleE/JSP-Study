function joinCheck() {
	if (document.frm.id.value.length == 0) {
		alert("아이디를 입력해주세요.");
		frm.id.focus();
		return false;
	}
	if (document.frm.password.value.length == 0) {
		alert("암호를 입력해주세요.");
		frm.password.focus();
		return false;
	}
	if (document.frm.name.value.length == 0) {
		alert("이름을 입력해주세요.");
		frm.name.focus();
		return false;
	}
	if (document.frm.age.value.length == 0) {
		alert("나이를 입력해주세요.");
		frm.age.focus();
		return false;
	}
	if (document.frm.gender.value.length == 0) {
		alert("성별을 체크해주세요.");
		frm.gender.focus();
		return false;
	}
	if (document.frm.email.value.length == 0) {
		alert("이메일을 입력해주세요.");
		frm.email.focus();
		return false;
	}
	return true;
}//joinCheck end
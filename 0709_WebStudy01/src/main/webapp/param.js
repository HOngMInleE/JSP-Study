function check() {
	if (document.frm.id.value == "") {
		alert("아이디를 입력하세요");
		document.frm.id.focus();
		return false;
	} else if (document.frm.age.value == "") {
		alert("나이를 입력하세요");
		document.frm.age.focus();
		return false;
	} else if (isNaN(document.frm.age.value)) { /* isNaN = true 라면 숫자가 아님 */
		alert("숫자로 입력하세요");
		document.frm.age.focus();
		return false;
	} else {
		return true;
	}
}
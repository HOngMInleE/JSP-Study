function productCheck() {
//상품명 값 입력 유무
	if(document.frm.name.value == "") {
		alert("상품명을 입력해주세요.");
		frm.name.focus();
		return false;
	}
//가격 값 입력 유무
	if(document.frm.price.value == "") { //value가 없으면 비교 불가능.
		alert("가격을 입력해주세요.");
		frm.price.focus();
		return false;
	}
//가격에 입력 값이 숫자인지 아닌지 판단
	if (isNaN(document.frm.price.value)) {
		alert("숫자를 입력해주세요.");
		frm.price.focus();
		return false;
	}
	return true;
};
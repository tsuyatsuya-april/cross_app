function searchMember() {
  const submit = document.getElementById("form");
  submit.addEventListener("keyup", (e) => {
    const formResult = document.getElementById("form");
    const formData = Math.floor(formResult.value);
    // const formData = new FormData(formResult);
    const XHR = new XMLHttpRequest();
    XHR.open("GET", '/battings/search?keyword=' + encodeURIComponent(formData), true);
    XHR.responseType = "json";
    XHR.send(null);
    XHR.onload = () =>{
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const member = XHR.response.member;
      const gradeForm = document.getElementById("grade_id");
      const memberId = document.getElementById("member_id");
      const fullName = document.getElementById("full-name");
      if(member === undefined || member === null){
        gradeForm.value = "";
        memberId.value = "";
        fullName.value = "";
      }else{
        const grade = member.grade;
        const memberNumber = member.id;
        const name = member.first_name + " " + member.last_name;
        gradeForm.value = grade;
        memberId.value = memberNumber;
        fullName.value = name;
      }
      
    }
  })

}

window.addEventListener("load", searchMember);
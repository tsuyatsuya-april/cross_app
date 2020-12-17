function searchMember() {
  const submit = document.getElementById("form");
  submit.addEventListener("keyup", (e) => {
    // const formResult = document.getElementById("form");
    const formValue = Math.floor(submit.value);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", '/battings/search', true);
    XHR.responseType = "json";
    let sendNumber = JSON.stringify({
      keyword: formValue
    });
    XHR.send();
    XHR.onload = () =>{
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const member = XHR.response.member;
      const foundData = member.find((m) => m.uniform_number === Math.floor(formData));
      if(foundData === undefined || foundData === null){

      }else{
        const grade = foundData.grade;
      const memberNumber = foundData.id;
      const name = foundData.first_name + " " + foundData.last_name;
      const gradeForm = document.getElementById("grade_id");
      const memberId = document.getElementById("member_id");
      const fullName = document.getElementById("full-name");

      gradeForm.value = grade;
      memberId.value = memberNumber;
      fullName.value = name;
      }
      
    }
  })

}

window.addEventListener("load", searchMember);
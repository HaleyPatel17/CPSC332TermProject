

function getProfessorInfo() {
    const professorID = document.getElementById('professorid').value;
    alert(professorID);
    target_url = 'database.php?professorID=' + professorID; 
    synergy_ajax_send(target_url,'getProfessorInfo_response','get');
    // fetchData('professor', professorID, 'studentGrid');
}
function getProfessorInfo_response(json_ret_val) {  
    // $('body').append(json_ret_val.html);	
} 

function getCourseSectionInfo() {
    const courseID = document.getElementById('classid').value;
    const sectionID = document.getElementById('sectionid').value;
    fetchData('coursesection', {courseID, sectionID}, 'studentGrid');
}

function getCourseInfo() {
    const classID = document.getElementById('courseid').value;
    fetchData('course', classID, 'studentGrid');
}

function getStudentGrade() {
    const studentID = document.getElementById('studentid').value;
    fetchData('studentgrade', studentID, 'studentGrid');
}

function fetchData(type, id, gridId) {
    fetch('database.php', {
        method: 'POST',
        headers: {
            'Content-type': 'application/x-www-form-urlencoded',
        },
        body: "type="+encodeURIComponent(type) + "&id=" + encodeURIComponent(id)
    })
    .then(response => response.json())
    .then(data => {
        const grid=document.getElementById(gridId);
        grid.innerHTML=createTable(data);
        $dataTable=$(`#${gridId}Datatable()`);
    })
    .catch(error => console.error('Error: ', error));
}

function createTable(data) {
    if(data.length == 0) return '<p> No Data Found </p>';
    let table = `<table><thead><tr>`;
    for(const key in data[0]) {
        table += `<th>${key}</th>`;
    }
    table += `</tr><thead><body>`;
    forEach (row => {
        table += `<th>`;
        for(const key in row)
        {
            table += `<td>${row[key]}`;
        }
        table += `</tr>`;
    });
    table += `</tbody></table>`;
    return table;
}

/*$(document).ready(function(){
    $("p").click(function(){
        $(this).hide();
    });
}); */
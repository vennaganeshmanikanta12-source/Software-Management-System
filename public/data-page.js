const configs = {
 employees:{title:"Employees", api:"employees", columns:["employee_id","first_name","last_name","designation","email","experience_years","salary"]},
 projects:{title:"Projects", api:"projects", columns:["project_id","project_name","description","start_date","end_date","status","manager_id"]},
 teams:{title:"Teams", api:"teams", columns:["team_id","team_name","project_id","lead_id"]},
 sprints:{title:"Sprints", api:"sprints", columns:["sprint_id","sprint_name","project_id","start_date","end_date","goal","status"]},
 tasks:{title:"Tasks", api:"tasks", columns:["task_id","sprint_id","assigned_to","task_title","priority","story_points","status","due_date","completion_date"]},
 bugs:{title:"Bugs", api:"bugs", columns:["bug_id","task_id","reported_by","assigned_to","title","severity","status","reported_date","resolved_date"]},
 clients:{title:"Clients", api:"clients", columns:["client_id","project_id","name","email","contract_start","contract_end","sla_hours"]}
};
const key=location.pathname.split("/").pop().replace(".html","");
const cfg=configs[key];
document.getElementById("pageTitle").textContent=cfg.title;
document.getElementById("pageDesc").textContent="Live records from MySQL";
const head=document.getElementById("head");
cfg.columns.forEach(c=>{const th=document.createElement("th");th.textContent=c.replaceAll("_"," ").replace(/\b\w/g,x=>x.toUpperCase());head.appendChild(th);});
async function load(){
  const tbody=document.getElementById("body"); tbody.innerHTML='<tr><td class="empty" colspan="'+cfg.columns.length+'">Loading...</td></tr>';
  try{
    const rows=await (await fetch("/api/"+cfg.api)).json();
    tbody.innerHTML="";
    if(!rows.length){tbody.innerHTML='<tr><td class="empty" colspan="'+cfg.columns.length+'">No records found</td></tr>';return;}
    rows.forEach(row=>{
      const tr=document.createElement("tr");
      cfg.columns.forEach(c=>{const td=document.createElement("td");td.textContent=row[c] ?? "";tr.appendChild(td);});
      tbody.appendChild(tr);
    });
  }catch(e){tbody.innerHTML='<tr><td class="empty" colspan="'+cfg.columns.length+'">Database error: '+e.message+'</td></tr>';}
}
load();
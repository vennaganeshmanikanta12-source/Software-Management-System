async function getJSON(url){
  const r=await fetch(url);
  if(!r.ok) throw new Error((await r.json()).error||"Request failed");
  return r.json();
}
async function loadDashboard(){
  try{
    const d=await getJSON("/api/dashboard");
    for(const k of ["employees","projects","teams","tasks","bugs","activeTasks","openBugs"])
      document.getElementById(k).textContent=d[k];
    document.getElementById("status").textContent="● MySQL Connected";
  }catch(e){
    document.getElementById("status").textContent="● Connection Error";
    document.getElementById("status").style.background="#fee2e2";
    document.getElementById("status").style.color="#b91c1c";
  }
}
if(location.pathname.endsWith("dashboard.html")) loadDashboard();
import React from 'react';
export const Checkbox = ({id}) => {

  const archiveTask = () => {
    fetch('http://localhost:8000/api/v1/tasks/update/' + id, {
      method: 'PUT',
      // method: 'GET',
    })
    .then(res => res.text()) // or res.json()
    .then(() => window.location.reload())
    .catch(err => console.log(err))
    
    console.log("archive task")
  }
  
  return (
    <div className="checkbox-holder" onClick={() => archiveTask()}>
      <span className="checkbox" />
    </div>
  )
}
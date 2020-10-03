import React, { useEffect } from 'react';
import { useTasks } from '../hooks';
// import {firebase} from "../firebase"

export const Checkbox = ({id}) => {

  const archiveTask = () => {
    // firebase
    // .firestore()
    // .collection('tasks')
    // .doc(id)
    // .update({
    //   archived: true
    // })

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
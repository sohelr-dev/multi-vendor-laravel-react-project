import { useAuth } from "../../../context/AuthContext"

function Dashboard() {
  const {user}=useAuth();
  return (
    <>
    <div className="container">
        <h1>welcome to{user?.role_id} Admin Dashboard</h1>
        
         
        
    </div>
    
    </>
  )
}

export default Dashboard
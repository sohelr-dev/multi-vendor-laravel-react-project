import { useAuth } from "../../../context/AuthContext"

function Dashboard() {
  const {user}=useAuth();
  return (
    <>
    <div className="container">
        <h1>Welcome to {user?.role_id === 1 ? 'Admin' : 'Vendor'}  Dashboard</h1>

        
    </div>
    
    </>
  )
}

export default Dashboard
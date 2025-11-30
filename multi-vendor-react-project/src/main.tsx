import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.tsx'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import Page404 from './components/Page404.tsx'
import Login from './components/pages/auth/Login.tsx'
import Dashboard from './components/pages/admin/Dashboard.tsx'
import { AuthProvider } from './context/AuthContext'   // <-- ADD THIS
import ProtectedRoute from './components/ProtectedRoute.tsx'
import GuestRoute from './components/GuestRoute.tsx'
import UserList from './components/pages/admin/users/UserList.tsx'



const AppRouter = createBrowserRouter([
  { path: "/", element: <App />,
    children: [
      { path: "dashboard", element:<ProtectedRoute><Dashboard /> </ProtectedRoute> },
      { path: "users", element:<ProtectedRoute><UserList /> </ProtectedRoute> },
    ]
  },
  { path: "/login", element: <GuestRoute><Login /></GuestRoute> },
  { path: "/*", element: <Page404 /> },
])

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <AuthProvider>          {/* <-- WRAP HERE */}
       <RouterProvider router={AppRouter} />
    </AuthProvider>
  </StrictMode>,
)

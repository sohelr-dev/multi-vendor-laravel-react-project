import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.tsx'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import Page404 from './components/Page404.tsx'
import Login from './components/pages/auth/Login.tsx'
import Dashboard from './components/pages/admin/Dashboard.tsx'




const AppRouter = createBrowserRouter([
  {path:"/",element:<App/>,
    children:[
      {path:"dashboard",element:<Dashboard/>}
    ]
  },
  {path:"/login",element:<Login/>},
  {path:"/*",element:<Page404/>},
])

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <RouterProvider router={AppRouter} />
  </StrictMode>,
)

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
import UserDetails from './components/pages/admin/users/UserDetails.tsx'
import VendorRequestList from './components/pages/admin/vendor-request/VendorRequestList.tsx'
import VendorDetails from './components/pages/admin/vendor-request/VendorRequestDetails.tsx'
import VendorsInfo from './components/pages/admin/vendors/VendorsInfo.tsx'
import ProductList from './components/pages/admin/products/ProductList.tsx'
import ProductDetails from './components/pages/admin/products/ProductDetails.tsx'



const AppRouter = createBrowserRouter([
  { path: "/", element: <App />,
    children: [
      { path: "dashboard", element:<ProtectedRoute><Dashboard /> </ProtectedRoute> },
      { path: "users", element:<ProtectedRoute><UserList /> </ProtectedRoute> },
      { path: "users/user-details/:id", element:<ProtectedRoute><UserDetails /> </ProtectedRoute> },
      // vendor request
      { path: "Vendor-requests", element:<ProtectedRoute><VendorRequestList /> </ProtectedRoute> },
      { path: "Vendor-requests/:id", element:<ProtectedRoute><VendorDetails /> </ProtectedRoute> },
      { path: "vendors", element:<ProtectedRoute><VendorsInfo /> </ProtectedRoute> },
      //product
      { path: "products", element:<ProtectedRoute><ProductList /> </ProtectedRoute> },
      { path: "product/:id", element:<ProtectedRoute><ProductDetails /> </ProtectedRoute> },

    ]
  },
  { path: "/login", element: <GuestRoute><Login /></GuestRoute> },
  { path: "/*", element: <Page404 /> },
])

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <AuthProvider>          
       <RouterProvider router={AppRouter} />
    </AuthProvider>
  </StrictMode>,
)

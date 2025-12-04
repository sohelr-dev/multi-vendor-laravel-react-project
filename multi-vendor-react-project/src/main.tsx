import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.tsx'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import Page404 from './components/Page404.tsx'
import Login from './components/pages/auth/Login.tsx'
import Dashboard from './components/pages/admin/Dashboard.tsx'
import { AuthProvider, useAuth } from './context/AuthContext'   // <-- ADD THIS
import ProtectedRoute from './components/ProtectedRoute.tsx'
import GuestRoute from './components/GuestRoute.tsx'
import UserList from './components/pages/admin/users/UserList.tsx'
import UserDetails from './components/pages/admin/users/UserDetails.tsx'
import VendorRequestList from './components/pages/admin/vendor-request/VendorRequestList.tsx'
import VendorDetails from './components/pages/admin/vendor-request/VendorRequestDetails.tsx'
import VendorsInfo from './components/pages/admin/vendors/VendorsInfo.tsx'
import ProductList from './components/pages/admin/products/ProductList.tsx'
import ProductDetails from './components/pages/admin/products/ProductDetails.tsx'
import CreateProduct from './components/pages/admin/products/CreateProduct.tsx'
import OrderList from './components/pages/admin/orders/OrderList.tsx'
import OrderDetails from './components/pages/admin/orders/OrderDetails.jsx'
import PendingOrders from './components/pages/admin/orders/pendingOrder/pendingOrder.tsx'
import CompleteOrders from './components/pages/admin/orders/completeOrder/CompleteOrder.tsx'
import VendorDashboard from './components/pages/vendors/VendorDashboard.tsx'
import CreateProductVendor from './components/pages/admin/products/CreateProductVendor.tsx'
import CreateVendorShop from './components/pages/auth/VendorRegistration.tsx'
import VendorRegistration from './components/pages/auth/VendorRegistration.tsx'

/*const {user} = useAuth();
const role = user?.role_id */

 // element:
        //   role===1 
        //     ?<ProtectedRoute><Dashboard /> </ProtectedRoute>
        //     :role===2
        //     ?<ProtectedRoute><VendorDashboard /> </ProtectedRoute>
        //     :<Page404/>

const AppRouter = createBrowserRouter([
  { path: "/", element: <App />,
    children: [
      { path: "dashboard", element:<ProtectedRoute><Dashboard/></ProtectedRoute> },
      { path: "vendor-dashboard", element:<ProtectedRoute><VendorDashboard/></ProtectedRoute> },
      { path: "users", element:<ProtectedRoute><UserList /> </ProtectedRoute> },
      { path: "users/user-details/:id", element:<ProtectedRoute><UserDetails /> </ProtectedRoute> },
      // vendor request
      { path: "Vendor-requests", element:<ProtectedRoute><VendorRequestList /> </ProtectedRoute> },
      { path: "Vendor-requests/:id", element:<ProtectedRoute><VendorDetails /> </ProtectedRoute> },
      { path: "vendors", element:<ProtectedRoute><VendorsInfo /> </ProtectedRoute> },
      //product
      { path: "products", element:<ProtectedRoute><ProductList /> </ProtectedRoute> },
      { path: "products/create", element:<ProtectedRoute><CreateProduct /> </ProtectedRoute> },
      { path: "product/:id", element:<ProtectedRoute><ProductDetails /> </ProtectedRoute> },
      
      //order
      { path: "admin/orders", element:<ProtectedRoute><OrderList/> </ProtectedRoute> },
      { path: "orders/:id", element:<ProtectedRoute><OrderDetails/> </ProtectedRoute> },
      { path: "admin/orders/:id", element:<ProtectedRoute><OrderDetails/> </ProtectedRoute> },
      { path: "admin/orders/pending", element:<ProtectedRoute><PendingOrders/> </ProtectedRoute> },
      { path: "admin/orders/complete", element:<ProtectedRoute><CompleteOrders/> </ProtectedRoute> },

     

    ]
  },
  { path: "/login", element: <GuestRoute><Login /></GuestRoute> },
  { path: "/register", element: <GuestRoute><VendorRegistration /></GuestRoute> },
  { path: "/*", element: <Page404 /> },
])

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <AuthProvider>          
       <RouterProvider router={AppRouter} />
    </AuthProvider>
  </StrictMode>,
)

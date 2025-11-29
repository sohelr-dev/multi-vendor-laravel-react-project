// import { NavLink } from "react-router-dom";
import "./sidebar.css";
import Profile from "../../assets/img/sohel.jpg";
import { useAuth } from "../../context/AuthContext";
import type React from "react";
import api from "../../config";
import { useNavigate } from "react-router-dom";



function Sidebar() {
  const { user } = useAuth();
  const role = user?.role_id;
  const navigate =useNavigate();

  const{token,logout}=useAuth();
  console.log(logout);
  console.log(token);


  const handleSubmit=(e:React.FormEvent)=>{
    e.preventDefault();
    api.post("logout",{},{
      headers:{
        Authorization:`Bearer ${token}`,
      },
    })
      .then((res)=>{
        // console.log(res.data);
        logout();
        navigate("/login",res.data);


      })
      .catch((error)=>{
        console.log("logout failed",error.response?.data ||error);
        alert("logout failed . Try again.");
      })
    

  }


  return (
    <>
      <input type="checkbox" id="sidebar-toggle" className="d-none" />
      <label htmlFor="sidebar-toggle" className="bg-layer"></label>

      <div id="sidebar">
      <span className="fs-2 d-md-none" id="close-btn">
        <label htmlFor="sidebar-toggle">
          <i className="fas fa-chevron-left text-light"></i>
        </label>
      </span>

      {/* Panel Title */}
      {role === 1 && <h4 className="text-center">Admin Panel</h4>}
      {role === 2 && <h4 className="text-center">Vendor Panel</h4>}
      {role === 4 && <h4 className="text-center">Delivery Staff Panel</h4>}
      {!role && <h4 className="text-danger">You are not authorized</h4>}

      {/* Profile */}
      <div className="text-center mb-4">
        {user?.photo ? (
          <img
            src={user.photo}
            className="rounded-circle"
            width={36}
            height={36}
            alt="Profile"
          />
        ) : (
          <img
            src={Profile}
            className="rounded-circle"
            style={{ background: "lemonchiffon" }}
            width={80}
            height={80}
            alt="Profile"
          />
        )}

        {role === 1 && (
          <>
            <h5 className="mt-2 mb-0">{user?.name}</h5>
            <small className="text-light">Administrator</small>
          </>
        )}
        {role === 2 && (
          <>
            <h5 className="mt-2 mb-0">{user?.name}</h5>
            <small className="text-light">Seller</small>
          </>
        )}
        {role === 4 && (
          <>
            <h5 className="mt-2 mb-0">{user?.name}</h5>
            <small className="text-light">Courier</small>
          </>
        )}
        {!role && (
          <>
            <h5 className="mt-2 mb-0 text-danger">Unauthorized User</h5>
            <small className="text-light">Unauthorized</small>
          </>
        )}
      </div>

      {/* Sidebar Menu */}
      <nav className="navbar sidebar-menu">
        <ul className="nav flex-column">

          {/* Dashboard */}
          <li className="nav-item">
            <a href="/dashboard" className="nav-link text-light">
              <i className="fa-solid fa-grip me-2 fa-lg"></i> Dashboard
            </a>
          </li>

          {/* Users - Admin only */}
          {role === 1 && (
            <li>
              <a
                className="nav-link text-white dropdown-toggle"
                data-bs-toggle="collapse"
                href="#usersMenu"
              >
                <i className="fas fa-users me-2 fa-lg"></i> User Manage
              </a>
              <div className="collapse" id="usersMenu" data-bs-parent=".sidebar-menu">
                <ul className="list-unstyled ps-4">
                  <li>
                    <a href="/users" className="nav-link text-white">
                      <i className="fas fa-user me-2"></i> All Users
                    </a>
                  </li>
                  <li>
                    <a href="/vendors" className="nav-link text-white">
                      <i className="fas fa-store me-2"></i> Vendors
                    </a>
                  </li>
                  <li>
                    <a href="/vendor-requests" className="nav-link text-white">
                      <i className="fas fa-user-clock me-2"></i> Vendor Requests
                    </a>
                  </li>
                  <li>
                    <a href="/delivery-staff" className="nav-link text-white">
                      <i className="fas fa-truck me-2"></i> Delivery Staff
                    </a>
                  </li>
                </ul>
              </div>
            </li>
          )}

          {/* Products - Admin & Vendor */}
          {(role === 1 || role === 2) && (
            <li>
              <a
                className="nav-link text-white dropdown-toggle"
                data-bs-toggle="collapse"
                href="#productsMenu"
              >
                <i className="fas fa-boxes-stacked me-2 fa-lg"></i> Products
              </a>
              <div className="collapse" id="productsMenu" data-bs-parent=".sidebar-menu">
                <ul className="list-unstyled ps-4">
                  <li>
                    <a href="/products" className="nav-link text-white">
                      <i className="fas fa-box me-2"></i> All Products
                    </a>
                  </li>
                  <li>
                    <a href="/products/create" className="nav-link text-white">
                      <i className="fas fa-plus me-2"></i> Add Product
                    </a>
                  </li>
                  <li>
                    <a href="/categories" className="nav-link text-white">
                      <i className="fas fa-tags me-2"></i> Categories
                    </a>
                  </li>
                  <li>
                    <a href="/brands" className="nav-link text-white">
                      <i className="fas fa-copyright me-2"></i> Brands
                    </a>
                  </li>
                </ul>
              </div>
            </li>
          )}

          {/* Orders - Role based */}
          <li>
            <a
              className="nav-link text-white dropdown-toggle"
              data-bs-toggle="collapse"
              href="#ordersMenu"
            >
              <i className="fas fa-shopping-cart me-2 fa-lg"></i> Orders
            </a>
            {role === 1 && (
              <div className="collapse" id="ordersMenu" data-bs-parent=".sidebar-menu">
                <ul className="list-unstyled ps-4">
                  <li>
                    <a href="/admin/orders/all" className="nav-link text-white">
                      <i className="fas fa-list me-2"></i> All Orders
                    </a>
                  </li>
                  <li>
                    <a href="/admin/orders/pending" className="nav-link text-white">
                      <i className="fas fa-hourglass-half me-2"></i> Pending Orders
                    </a>
                  </li>
                  <li>
                    <a href="/admin/orders/complete" className="nav-link text-white">
                      <i className="fas fa-check me-2"></i> Completed Orders
                    </a>
                  </li>
                </ul>
              </div>
            )}
            {role === 2 && (
              <div className="collapse" id="ordersMenu" data-bs-parent=".sidebar-menu">
                <ul className="list-unstyled ps-4">
                  <li>
                    <a href="/vendor/orders" className="nav-link text-white">
                      <i className="fas fa-list me-2"></i> All Orders
                    </a>
                  </li>
                </ul>
              </div>
            )}
            {role === 4 && (
              <div className="collapse" id="ordersMenu" data-bs-parent=".sidebar-menu">
                <ul className="list-unstyled ps-4">
                  <li>
                    <a href="/delivery/orders" className="nav-link text-white">
                      <i className="fas fa-truck me-2"></i> Assigned Orders
                    </a>
                  </li>
                </ul>
              </div>
            )}
          </li>

          {/* Profile & Logout */}
          {role && (
            <>
              <li className="nav-item">
                <a href="/profile" className="nav-link text-light">
                  <i className="fas fa-user-circle me-2 fa-lg"></i> Profile
                </a>
              </li>
              <li className="nav-item">
                <form onSubmit={handleSubmit} method="POST">
                  
                <button className="nav-link text-light" >
                  <i className="fas fa-sign-out-alt me-2 fa-lg"></i> Logout
                </button>
                </form>
              </li>
            </>
          )}
        </ul>
      </nav>
    </div>
    </>
  );
}

export default Sidebar;

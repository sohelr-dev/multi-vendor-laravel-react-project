import { NavLink } from "react-router-dom";
import "./sidebar.css";
import Profile from "../../assets/img/sohel.jpg";

function Sidebar() {
  const role = 3; // 1 = Admin, 2 = Vendor, 3 = Delivery

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

        {/* ---------- ROLE PANEL ---------- */}
        {role === 1 && <h4 className="text-center">Admin Panel</h4>}
        {role === 2 && <h4 className="text-center">Vendor Panel</h4>}
        {role === 3 && <h4 className="text-center">Delivery Staff Panel</h4>}
        {!role && <h4 className="text-danger">You are not authorized</h4>}

        {/* ---------- PROFILE AREA ---------- */}
        <div className="text-center mb-4">
          <img
            src={Profile}
            width={80}
            height={80}
            className="rounded-circle"
            alt="Profile"
            style={{ background: "lemonchiffon" }}
          />

          {role === 1 && (
            <>
              <h5 className="mt-2 mb-0">Super Admin</h5>
              <small className="text-light">Administrator</small>
            </>
          )}

          {role === 2 && (
            <>
              <h5 className="mt-2 mb-0">Vendor</h5>
              <small className="text-light">Seller</small>
            </>
          )}

          {role === 3 && (
            <>
              <h5 className="mt-2 mb-0">Delivery Staff</h5>
              <small className="text-light">Courier</small>
            </>
          )}
        </div>

        {/* ---------- MENU START ---------- */}
        <nav className="navbar sidebar-menu">
          <ul className="nav flex-column">

            {/* Dashboard */}
            <li className="nav-item">
              <NavLink
                to="/dashboard"
                className="nav-link text-light link-navbar"
              >
                <i className="fa-solid fa-grip me-2 fa-lg"></i>
                Dashboard
              </NavLink>
            </li>

            {/* -------- ADMIN ONLY MENU -------- */}
            {role === 1 && (
              <>
                <li>
                  <a
                    className="nav-link text-white dropdown-toggle"
                    data-bs-toggle="collapse"
                    href="#usersMenu"
                    role="button"
                  >
                    <i className="fas fa-users me-2 fa-lg"></i>
                    User Manage
                  </a>

                  <div className="collapse" id="usersMenu">
                    <ul className="list-unstyled ps-4">
                      <li>
                        <NavLink to="/users" className="nav-link text-white">
                          <i className="fas fa-user me-2"></i> All Users
                        </NavLink>
                      </li>
                      <li>
                        <NavLink to="/vendors" className="nav-link text-white">
                          <i className="fas fa-store me-2"></i> Vendors
                        </NavLink>
                      </li>
                      <li>
                        <NavLink
                          to="/vendor-requests"
                          className="nav-link text-white"
                        >
                          <i className="fas fa-user-clock me-2"></i>
                          Vendor Requests
                        </NavLink>
                      </li>
                    </ul>
                  </div>
                </li>

                {/* Products */}
                <li className="nav-item">
                  <NavLink to="/products" className="nav-link text-light">
                    <i className="fa-solid fa-box me-2"></i>
                    Products
                  </NavLink>
                </li>
              </>
            )}

            {/* -------- VENDOR ONLY MENU -------- */}
            {role === 2 && (
              <>
                <li className="nav-item">
                  <NavLink
                    to="/vendor/products"
                    className="nav-link text-light"
                  >
                    <i className="fa-solid fa-box me-2"></i>
                    My Products
                  </NavLink>
                </li>

                <li className="nav-item">
                  <NavLink to="/vendor/orders" className="nav-link text-light">
                    <i className="fa-solid fa-cart-shopping me-2"></i>
                    Orders
                  </NavLink>
                </li>
              </>
            )}

            {/* -------- DELIVERY ONLY MENU -------- */}
            {role === 3 && (
              <li className="nav-item">
                <NavLink to="/delivery/orders" className="nav-link text-light">
                  <i className="fa-solid fa-motorcycle me-2"></i>
                  Delivery Orders
                </NavLink>
              </li>
            )}
          </ul>
        </nav>
      </div>
    </>
  );
}

export default Sidebar;

import Sidebar from "./Sidebar";
import Topbar from "./Topbar";
import "../../assets/custom.css";
import { Outlet } from "react-router-dom";

function Layout() {
  return (
    <>
      <div className="d-flex">
        <Sidebar />
        <div className="main w-100">
          <Topbar />
          <div className="container mt-4">
            <Outlet />
          </div>
        </div>
      </div>
    </>
  );
}

export default Layout;

import Profile from "../../assets/img/sohel.jpg";

function Topbar() {
  return (
    <nav className="navbar bg-dark bg-opacity-10 p-2">
      <div className="container-fluid d-flex align-items-center flex-nowrap">
        <label
          htmlFor="sidebar-toggle"
          className="cursor-pointer d-md-none me-2"
        >
          <i className="fa-solid fa-bars-staggered fa-fade fa-lg"></i>
        </label>
        {/* search bar */}
        <div >
          <form className="d-flex flex-grow-1 me-3" role="search">
            <input
              className="form-control form-control-md me-2"
              type="search"
              placeholder="Search"
              aria-label="Search"
            />
            <button className="btn btn-sm btn-outline-success" type="submit">
              {" "}
              Search
            </button>
          </form>
        </div>
        {/* Notifications */}
        <div className="d-flex flex-row">
          <div className="dropdown mt-2 me-sm-4">
            <a
              href="#"
              className="text-dark position-relative"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <i className="fa-solid fa-bell fa-lg"></i>
              <span className="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                3
              </span>
            </a>
            <ul className="dropdown-menu dropdown-menu-end">
              <li>
                <span className="dropdown-item-text fw-bold">
                  Notifications
                </span>
              </li>
              <li>
                <hr className="dropdown-divider" />
              </li>
              <li>
                <a className="dropdown-item" href="#">
                  New comment on your post
                </a>
              </li>
              <li>
                <a className="dropdown-item" href="#">
                  New follower
                </a>
              </li>
              <li>
                <a className="dropdown-item" href="#">
                  System update available
                </a>
              </li>
            </ul>
          </div>
          <div className="dropdown">
            {/* <a href="#" className="dropdown-toggle d-flex align-items-center" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
            <img src={Profile} width={36} height={36} className="rounded-circle" alt="Profile" />
          </a> */}
            <a
              href="#"
              className="dropdown-toggle d-flex align-items-center"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <img
                src={Profile}
                width={36}
                height={36}
                className="rounded-circle"
                alt="Profile"
              />

              <span className="ms-2 d-none d-sm-inline fw-semibold">
                SOHEL RANA
              </span>
            </a>

            <ul className="dropdown-menu dropdown-menu-end">
              <li>
                <a className="dropdown-item" href="#">
                  Profile
                </a>
              </li>
              <li>
                <a className="dropdown-item" href="#">
                  Settings
                </a>
              </li>
              <li>
                <hr className="dropdown-divider" />
              </li>
              <li>
                <a className="dropdown-item" href="#">
                  Logout
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
  );
}

export default Topbar;

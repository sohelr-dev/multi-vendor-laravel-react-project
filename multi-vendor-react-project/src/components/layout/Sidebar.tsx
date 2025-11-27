import "./sidebar.css";
import Profile from "../../assets/img/sohel.jpg";
import { NavLink } from "react-router-dom";
import {
  FaChartBar,
  FaPills,
  FaFlask,
  FaPrescriptionBottleAlt,
  FaCalendar,
  FaCalendarCheck,
  FaHistory,
  FaUsers,
  FaFileMedicalAlt,
  FaChevronLeft,
  FaPlus
} from "react-icons/fa";
import { MdUpcoming } from "react-icons/md";
import { RiMedicineBottleFill } from "react-icons/ri";
import { GiMedicines } from "react-icons/gi";

function Sidebar() {
  return (
    <>
      <input type="checkbox" id="sidebar-toggle" className="d-none" />
      <label htmlFor="sidebar-toggle" className="bg-layer"></label>

      <div id="sidebar">
        <span className="fs-2 d-md-none" id="close-btn">
          <label htmlFor="sidebar-toggle">
            <FaChevronLeft className="text-light" />
          </label>
        </span>

        <h4 className="text-center">Dr. SOHEL</h4>
        <div className="text-center mb-4">
          <img
            src={Profile}
            width={80}
            height={80}
            className="rounded-circle"
            alt="Profile"
          />
          <h5 className="mt-2 mb-0">Sohel Rana</h5>
          <small className="text-light">Doctor</small>
        </div>

        <nav className="navber">
          <ul className="nav flex-column">
            <li className="nav-item">
              <NavLink
                to="/dashboard"
                className={({ isActive }) =>
                  isActive
                    ? "nav-link trans text-light link-navbar active"
                    : "nav-link trans text-light link-navbar"
                }
              >
                <FaChartBar className="me-2 fa-lg" />
                Dashboard
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink
                to="/createPrescription"
                className={({ isActive }) =>
                  isActive
                    ? "nav-link trans text-light link-navbar active"
                    : "nav-link trans text-light link-navbar"
                }
              >
                <FaPrescriptionBottleAlt className="me-2 fa-lg" />
                Create Prescription
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink
                to="/appointments/create-appointment"
                className={({ isActive }) =>
                  isActive
                    ? "nav-link trans text-light link-navbar active"
                    : "nav-link trans text-light link-navbar"
                }
              >
                <FaPlus className="me-2 fa-lg" />
 
                {/* <FaPrescriptionBottleAlt className="me-2 fa-lg" /> */}
                New Appointment
              </NavLink>
            </li>
            <li>
              <a
                className="nav-link item-nav text-white dropdown-toggle"
                href="#patientsSubmenu"
                data-bs-toggle="collapse"
                role="button"
                aria-expanded="false"
                aria-controls="patientsSubmenu"
              >
                <FaUsers className="me-2 fa-lg" />
                My Patients
              </a>

              <div className="collapse" id="patientsSubmenu">
                <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                  <li>
                    <NavLink
                      to="/patients"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active"
                          : "nav-link text-white ps-4"
                      }
                    >
                      <FaCalendarCheck className="me-2" />
                      Patients List
                    </NavLink>
                  </li>

                  <li>
                    <NavLink
                      to="/patients/patient-medical-history"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active"
                          : "nav-link text-white ps-4"
                      }
                    >
                      <MdUpcoming className="me-2" />
                      Medical History
                    </NavLink>
                  </li>
                </ul>
              </div>
            </li>

            <li>
              <a
                className="nav-link item-nav text-white dropdown-toggle"
                href="#appointmentsSubmenu"
                data-bs-toggle="collapse"
                role="button"
                aria-expanded="false"
                aria-controls="appointmentsSubmenu"
              >
                <FaCalendar className="me-2 fa-lg" />
                Appointments
              </a>
              <div className="collapse" id="appointmentsSubmenu">
                <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                  <li>
                    <NavLink
                      to="/appointments"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active"
                          : "nav-link text-white ps-4"
                      }
                    >
                      <FaCalendarCheck className="me-2" />
                      Appointments List
                    </NavLink>
                  </li>
                  <li>
                    <NavLink
                      to="/appointments/today"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active"
                          : "nav-link text-white ps-4"
                      }
                    >
                      <FaCalendarCheck className="me-2" />
                      Today's Appointments
                    </NavLink>
                  </li>
                  <li>
                    <NavLink
                      to="/appointments/upcoming"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active"
                          : "nav-link text-white ps-4"
                      }
                    >
                      <MdUpcoming className="me-2" />
                      Upcoming
                    </NavLink>
                  </li>
                  <li>
                    <NavLink
                      to="/appointments/history"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active fs-6"
                          : "fs-6 nav-link text-white ps-4"
                      }
                    >
                      <FaHistory className="me-2" />
                      History
                    </NavLink>
                  </li>
                </ul>
              </div>
            </li>
            <li>
              <a
                className="nav-link item-nav text-white dropdown-toggle"
                href="#medcinesubmenu"
                data-bs-toggle="collapse"
                role="button"
                aria-expanded="false"
                aria-controls="medcinesubmenu"
              >
                <FaPills className="me-2 fa-lg" />
                Medicines
              </a>
              <div className="collapse" id="medcinesubmenu">
                <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                  <li>
                    <NavLink
                      to="/medicine-types"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active"
                          : "nav-link text-white ps-4"
                      }
                    >
                      <RiMedicineBottleFill className="me-2" />
                      Medicine Types
                    </NavLink>
                  </li>
                  <li>
                    <NavLink
                      to="/medicines"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active fs-6"
                          : "fs-6 nav-link text-white ps-4"
                      }
                    >
                      <GiMedicines className="me-2" />
                      Medicine
                    </NavLink>
                  </li>
                  <li>
                    <NavLink
                      to="/dosages"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active fs-6"
                          : "fs-6 nav-link text-white ps-4"
                      }
                    >
                      <GiMedicines className="me-2" />
                      Dosages
                    </NavLink>
                  </li>
                  <li>
                    <NavLink
                      to="/create-dosages"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active fs-6"
                          : "fs-6 nav-link text-white ps-4"
                      }
                    >
                      <GiMedicines className="me-2" />
                      Create Dosage
                    </NavLink>
                  </li>
                  <li>
                    <NavLink
                      to="/durations"
                      className={({ isActive }) =>
                        isActive
                          ? "nav-link text-white ps-4 active fs-6"
                          : "fs-6 nav-link text-white ps-4"
                      }
                    >
                      <GiMedicines className="me-2" />
                      Duration
                    </NavLink>
                  </li>
                </ul>
              </div>
            </li>

            <li className="nav-item">
              <NavLink
                to="/tests"
                className={({ isActive }) =>
                  isActive
                    ? "nav-link text-light link-navbar active"
                    : "nav-link text-light link-navbar"
                }
              >
                <FaFlask className="me-2 fa-lg" />
                Tests
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink
                to="/prescriptions"
                className={({ isActive }) =>
                  isActive
                    ? "nav-link text-light link-navbar active"
                    : "nav-link text-light link-navbar"
                }
              >
                <FaFileMedicalAlt className="me-2 fa-lg" />
                Prescription History
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink
                to="/users"
                className={({ isActive }) =>
                  isActive
                    ? "nav-link text-light link-navbar active"
                    : "nav-link text-light link-navbar"
                }
              >
                <FaUsers className="me-2 fa-lg" />
                Users
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink
                to="/roles"
                className={({ isActive }) =>
                  isActive
                    ? "nav-link text-light link-navbar active"
                    : "nav-link text-light link-navbar"
                }
              >
                {/* <FaUsers className="me-2 fa-lg" /> */}
                <i className="me-2 fa-solid fa-users-gear"></i>
                Roles
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink
                to="/doctors"
                className={({ isActive }) =>
                  isActive
                    ? "nav-link text-light link-navbar active"
                    : "nav-link text-light link-navbar"
                }
              >
                {/* <FaUsers className="me-2 fa-lg" /> */}
                <i className="me-2 fa-solid fa-users-gear"></i>
                Doctors
              </NavLink>
            </li>
          </ul>
        </nav>
      </div>
    </>
  );
}

export default Sidebar;

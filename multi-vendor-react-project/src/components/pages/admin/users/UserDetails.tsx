import { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import api, { baseUrl } from "../../../../config";

function UserDetails() {
  const { id } = useParams();
  const [user, setUser] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    document.title = "User Details";
    getUserDetails();
  }, []);

  const getUserDetails = () => {
    setLoading(true);
    api
      .get(`user/details/${id}`)
      .then((res) => {
        if (res.status === 200) {
          setUser(res.data.user);
        }
      })
      .catch((error) => console.log(error))
      .finally(() => setLoading(false));
  };

  return (
    <>
      {/* Header & Breadcrumb */}
      <div className="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center bg-light p-4 rounded-3 shadow-sm mb-4 border">
        <nav aria-label="breadcrumb" className="mb-3 mb-md-0">
          <ol className="breadcrumb mb-0 fs-6">
            <li className="breadcrumb-item">
              <Link to="/users" className="text-primary text-decoration-none fw-semibold">
                Users
              </Link>
            </li>
            <li className="breadcrumb-item active text-secondary fw-bold" aria-current="page">
              User Details
            </li>
          </ol>
        </nav>

        <div className="d-flex gap-2">
          <Link to="/users" className="btn btn-outline-primary fw-semibold">
            <i className="fa-solid fa-arrow-left me-2"></i>Back to List
          </Link>
        </div>
      </div>

      {/* Loader */}
      {loading ? (
        <div className="d-flex justify-content-center align-items-center mt-5">
          <div
            className="spinner-border text-primary"
            role="status"
            style={{ width: "3rem", height: "3rem" }}
          ></div>
        </div>
      ) : user ? (
        <div className="container">
          <div className="card shadow-sm border-0">
            <div className="card-header bg-white border-bottom d-flex justify-content-between">
              <h4 className="fw-bold mb-0">User Information</h4>
              <Link
                to={`/user/edit/${user.id}`}
                className="btn btn-primary fw-semibold"
              >
                <i className="fa-solid fa-pen-to-square me-2"></i>Edit User
              </Link>
            </div>

            <div className="card-body p-4">
              <div className="row g-4">

                {/* Profile Section */}
                <div className="col-md-4 text-center">
                  <img
                    src={user.photo ? baseUrl + user.photo : "/no-image.png"}
                    alt="Profile"
                    className="rounded-circle border shadow-sm"
                    style={{ width: "150px", height: "150px", objectFit: "cover" }}
                  />
                  <h5 className="mt-3 fw-bold">{user.full_name ?? user.name}</h5>
                  <span className={`badge ${
                    user.status === "active"
                      ? "bg-success"
                      : user.status === "inactive"
                      ? "bg-warning text-dark"
                      : "bg-danger"
                  }`}>
                    {user.status}
                  </span>
                </div>

                {/* Details Section */}
                <div className="col-md-8">
                  <div className="table-responsive">
                    <table className="table table-bordered">
                      <tbody>
                        <tr>
                          <th style={{ width: "200px" }}>User ID</th>
                          <td>{user.id}</td>
                        </tr>
                        <tr>
                          <th>Name</th>
                          <td>{user.full_name ?? user.name}</td>
                        </tr>
                        <tr>
                          <th>Email</th>
                          <td>{user.email}</td>
                        </tr>
                        <tr>
                          <th>Phone</th>
                          <td>{user.phone ?? "N/A"}</td>
                        </tr>
                        <tr>
                          <th>Role</th>
                          <td>{user.role_name}</td>
                        </tr>
                        <tr>
                          <th>Email Verified</th>
                          <td>
                            {user.email_verified_at ? (
                              <span className="badge bg-success">Verified</span>
                            ) : (
                              <span className="badge bg-danger">Not Verified</span>
                            )}
                          </td>
                        </tr>
                        <tr>
                          <th>Join Date</th>
                          <td>
                            {new Date(user.created_at).toLocaleDateString("en-US", {
                              month: "short",
                              day: "2-digit",
                              year: "numeric",
                            })}
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>

                  {/* Address Section */}
                  <h5 className="mt-4 fw-bold">Address Information</h5>
                  <div className="table-responsive">
                    <table className="table table-bordered">
                      <tbody>
                        <tr>
                          <th style={{ width: "200px" }}>Address</th>
                          <td>{user.address ?? "N/A"}</td>
                        </tr>
                        <tr>
                          <th>City</th>
                          <td>{user.city ?? "N/A"}</td>
                        </tr>
                        <tr>
                          <th>District</th>
                          <td>{user.district ?? "N/A"}</td>
                        </tr>
                        <tr>
                          <th>Postal Code</th>
                          <td>{user.postal_code ?? "N/A"}</td>
                        </tr>
                        <tr>
                          <th>Country</th>
                          <td>{user.country ?? "N/A"}</td>
                        </tr>
                        <tr>
                          <th>Address Phone</th>
                          <td>{user.address_phone ?? "N/A"}</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      ) : (
        <div className="container text-center mt-5">
          <h4 className="text-danger">User not found</h4>
        </div>
      )}
    </>
  );
}

export default UserDetails;

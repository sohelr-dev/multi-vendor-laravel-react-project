import { useEffect, useState } from "react";
import api, { baseUrl } from "../../../../config";
import { Link } from "react-router-dom";

function UserList() {
  const [users, setUsers] = useState<any[]>([]);
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(true);
  const [userId, setUserId] = useState<any>(null); // For modal

  useEffect(() => {
    document.title = "User list";
    getUsers();
  }, []);

  const getUsers = () => {
    setLoading(true);
    api
      .get("users")
      .then((res) => {
        if (res.status === 200) {
          setUsers(res.data.data);
        }
      })
      .catch((error) => console.log(error))
      .finally(() => setLoading(false));
  };

  const handleSearch = () => {
    console.log(search);
    getUsers();

  };

  const handleModal = (id: any) => {
    setUserId(id);
    // Show modal manually using Bootstrap JS
    
  };

  const handleDelete = (deleteId:any) => {
    
    api
      .delete(`user/delete/${deleteId}`)
      .then((res) => {
        alert(JSON.stringify(res.data.message));
        getUsers();
      })
      .catch((error) => console.log(error))
      .finally(() => setUserId(null));
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
              User Management
            </li>
          </ol>
        </nav>
        <div className="d-flex gap-2">
          <Link to="/create-user" className="btn btn-primary fw-semibold">
            <i className="fa-solid fa-plus me-2"></i>Create User
          </Link>
          <button className="btn btn-outline-primary fw-semibold">
            <i className="fa-solid fa-print me-2"></i>Print
          </button>
        </div>
      </div>

      {/* Search */}
      <div className="container mb-4">
        <div className="card shadow-sm">
          <div className="card-body">
            <form>
              <div className="input-group">
                <span className="input-group-text bg-white border-end-0">
                  <i className="fa-solid fa-magnifying-glass text-muted"></i>
                </span>
                <input
                  type="text"
                  className="form-control border-start-0"
                  placeholder="Search users..."
                  value={search}
                  onChange={(e) => setSearch(e.target.value)}
                  onKeyUp={handleSearch}
                />
              </div>
            </form>
          </div>
        </div>
      </div>

      {/* Loader */}
      {loading ? (
        <div className="d-flex justify-content-center align-items-center mt-5">
          <div className="spinner-border text-primary" role="status" style={{ width: "3rem", height: "3rem" }}>
            <span className="visually-hidden">Loading...</span>
          </div>
        </div>
      ) : (
        <div className="container">
          <div className="card-body p-0">
            <div className="table-responsive">
              <table className="table table-hover table-striped align-middle mb-0">
                <thead className="sticky-top bg-light">
                  <tr>
                    <th>#ID</th>
                    <th><i className="fa-solid fa-user"></i> Name</th>
                    <th><i className="fa-regular fa-envelope"></i> Email</th>
                    <th><i className="fa-solid fa-user-tag"></i> Role</th>
                    <th><i className="fa-solid fa-square-phone"></i> Phone</th>
                    <th><i className="fa-solid fa-calendar-day"></i> Join Date</th>
                    <th><i className="fa-solid fa-signal"></i> Status</th>
                    <th className="text-center no-print"><i className="fa-solid fa-gear"></i> Action</th>
                  </tr>
                </thead>
                <tbody>
                  {users.map((item) => (
                    <tr key={item.id}>
                      <td>{item.id}</td>
                      <td>
                        {item.name}
                        {item.photo && (
                          <span className="ms-2 d-inline-block">
                            <img
                              src={baseUrl + item.photo}
                              alt={item.name}
                              className="rounded-circle"
                              style={{ width: "40px", height: "40px", objectFit: "cover" }}
                            />
                          </span>
                        )}
                      </td>
                      <td>{item.email}</td>
                      <td>{item.role_name ? item.role_name.charAt(0).toUpperCase() + item.role_name.slice(1) : ""}</td>
                      <td>{item.phone ?? "N/A"}</td>
                      <td>{new Date(item.created_at).toLocaleDateString("en-US", { month: "short", day: "2-digit", year: "numeric" })}</td>
                      <td>
                        {item.status === "active" ? (
                          <span className="badge bg-success">Active</span>
                        ) : item.status === "inactive" ? (
                          <span className="badge bg-warning text-dark">Inactive</span>
                        ) : item.status === "banned" ? (
                          <span className="badge bg-danger">Banned</span>
                        ) : (
                          <span className="badge bg-secondary">Unknown</span>
                        )}
                      </td>
                      <td className="text-center d-flex gap-2">
                        <Link to={`/user/details-user/${item.id}`} className="btn" style={{ backgroundColor: "#185a64", color: "white", border: "none" }}>
                          <i className="fa-solid fa-eye"></i>
                        </Link>
                        <Link to={`/user/edit/${item.id}`} className="btn" style={{ backgroundColor: "#0d6efd", color: "white", border: "none" }}>
                          <i className="fa-solid fa-pen-to-square"></i>
                        </Link>
                        <button
                            type="button"
                            className="btn btn-icon btn-danger"
                            onClick={() => handleModal(item.id)}
                            data-bs-toggle="modal"
                            data-bs-target="#modalDelete"
                          >
                            <i className="fas fa-trash"></i>
                          </button>
                        
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      )}

      {/* Delete Confirmation Modal */}
      
      <div className="modal" id="modalDelete" tab-index="-1">
        <div className="modal-dialog">
          <div className="modal-content">
            <div className="modal-body text-center fs-1">
              <i className="fas fa-trash fs-3 text-danger"></i>
            </div>
            <div className="modal-body text-center">
              <p>Are you Want to delete This Item {userId}</p>
            </div>
            <div className="modal-footer">
              <button
                type="button"
                className="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Close
              </button>
              <button
                type="button"
                className="btn btn-primary"
                data-bs-dismiss="modal"
                onClick={() => handleDelete(userId)}
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default UserList;

import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import api, { baseUrl } from "../../../../config";

function VendorRequestList() {
  const [requests, setRequests] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  // Alert message
  const [alert, setAlert] = useState<{ type: string; message: string } | null>(
    null
  );

  useEffect(() => {
    document.title = "Vendor Requests";
    getRequests();
  }, []);

  const showAlert = (type: string, message: string) => {
    setAlert({ type, message });

    setTimeout(() => {
      setAlert(null);
    }, 3000);
  };

  const getRequests = () => {
    setLoading(true);
    api
      .get("vendor-requests")
      .then((res) => {
        if (res.status === 200) {
          setRequests(res.data.data);
        }
      })
      .catch((error) => console.log(error))
      .finally(() => setLoading(false));
  };

  const handleStatusChange = (id: number, newStatus: string) => {
    setRequests((prev) =>
      prev.map((req) =>
        req.id === id ? { ...req, status: "updating" } : req
      )
    );

    api
      .patch(`vendor-requests/${id}/status`, { status: newStatus })
      .then((res) => {
        if (res.data.success) {
          setRequests((prev) =>
            prev.map((req) =>
              req.id === id ? { ...req, status: newStatus } : req
            )
          );

          showAlert("success", "Vendor status updated successfully!");
        }
      })
      .catch(() => {
        setRequests((prev) =>
          prev.map((req) =>
            req.id === id ? { ...req, status: "error" } : req
          )
        );

        showAlert("danger", "Failed to update vendor status!");
      });
  };

  const getStatusBadgeClass = (status: string) => {
    switch (status) {
      case "approved":
        return "badge bg-success";
      case "pending":
        return "badge bg-warning text-dark";
      case "suspended":
        return "badge bg-secondary text-dark";
      case "rejected":
        return "badge bg-danger";
      case "updating":
        return "badge bg-warning text-dark";
      default:
        return "badge bg-danger";
    }
  };

  return (
    <>
      {/* Header & Breadcrumb */}
      <div className="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center bg-light p-4 rounded-3 shadow-sm mb-4 border">
        <nav aria-label="breadcrumb" className="mb-3 mb-md-0">
          <ol className="breadcrumb mb-0 fs-6">
            <li className="breadcrumb-item">
              <Link
                to="/vendor-requests"
                className="text-primary text-decoration-none fw-semibold"
              >
                Vendor Requests
              </Link>
            </li>
            <li
              className="breadcrumb-item active text-secondary fw-bold"
              aria-current="page"
            >
              Vendor Management
            </li>
          </ol>
        </nav>

        <button className="btn btn-outline-primary fw-semibold">
          <i className="fa-solid fa-print me-2"></i>Print
        </button>
      </div>

      {/* Alert Message */}
      {alert && (
        <div
          className={`alert alert-${alert.type} mx-4 mb-3 shadow-sm fade show`}
          role="alert"
        >
          {alert.message}
        </div>
      )}

      {/* Main Card */}
      <div className="container-fluid py-2">
        <div className="card shadow border-0">
          <div className="card-header bg-white d-flex justify-content-between align-items-center">
            <h4 className="mb-0 fw-bold">Vendor Requests</h4>
          </div>

          <div className="card-body">
            {loading ? (
              <div className="d-flex justify-content-center py-5">
                <div className="spinner-border text-primary"></div>
              </div>
            ) : (
              <div className="table-responsive">
                <table className="table align-middle table-hover">
                  <thead className="table-light">
                    <tr>
                      <th>SL.</th>
                      <th>#Id</th>
                      <th>Vendor</th>
                      <th>Shop</th>
                      <th>Contact</th>
                      <th>Status</th>
                      <th>Joined</th>
                      <th className="text-end">Actions</th>
                    </tr>
                  </thead>

                  <tbody>
                    {requests.map((req, index) => (
                      <tr key={req.id}>
                        <td>{index + 1}</td>
                        <td>{req.id}</td>

                        {/* Vendor Info */}
                        <td>
                          <div className="d-flex align-items-center">
                            <img
                              src={baseUrl + req.logo}
                              alt={req.vendor_name}
                              className="rounded-circle me-3"
                              width="45"
                              height="45"
                              style={{ objectFit: "cover" }}
                            />
                            <div>
                              <div className="fw-bold">{req.vendor_name}</div>
                              <small className="text-muted">
                                {req.vendor_email}
                              </small>
                            </div>
                          </div>
                        </td>

                        {/* Shop */}
                        <td>
                          <div className="fw-semibold">{req.shop_name}</div>
                          <small className="text-muted">
                            {req.city}, {req.country}
                          </small>
                        </td>

                        {/* Contact */}
                        <td>
                          <div>
                            <i className="fa fa-telephone"></i>{" "}
                            {req.vendor_phone}
                          </div>
                          <div>
                            <i className="fa fa-envelope"></i>{" "}
                            {req.business_email}
                          </div>
                        </td>

                        {/* Status */}
                        <td className="text-center">
                          <select
                            className="form-select form-select-sm"
                            value={req.status}
                            onChange={(e) =>
                              handleStatusChange(req.id, e.target.value)
                            }
                          >
                            <option value="approved">Approved</option>
                            <option value="pending">Pending</option>
                            <option value="suspended">Suspended</option>
                            <option value="rejected">Rejected</option>
                          </select>

                          <span
                            className={`${getStatusBadgeClass(
                              req.status
                            )} mt-2 d-block`}
                          >
                            {req.status === "updating"
                              ? "Updating..."
                              : req.status.charAt(0).toUpperCase() +
                                req.status.slice(1)}
                          </span>
                        </td>

                        {/* Joined */}
                        <td>
                          <small className="text-muted">
                            {new Date(req.created_at).toLocaleDateString(
                              "en-US",
                              {
                                day: "2-digit",
                                month: "short",
                                year: "numeric",
                              }
                            )}
                          </small>
                        </td>

                        {/* Actions */}
                        <td className="text-end">
                          <Link
                            to={`/vendor-requests/${req.id}`}
                            className="btn btn-sm btn-primary"
                          >
                            <i className="fa fa-eye me-2"></i>View
                          </Link>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        </div>
      </div>
    </>
  );
}

export default VendorRequestList;

import { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";
import api, { baseUrl } from "../../../../config";

interface Vendor {
  id: number;
  shop_name: string;
  vendor_name: string;
  vendor_email: string;
  vendor_phone: string;
  business_email: string;
  business_phone: string;
  commission_rate: number;
  balance: number;
  user_status: string;
  user_joined: string;
  banner: string | null;
  logo: string | null;
  address: string;
  city: string;
  country: string;
  status: string;
  description: string;
}

function VendorDetails() {
  const { id } = useParams<{ id: string }>();
  const [vendor, setVendor] = useState<Vendor | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    document.title = "Vendor Details";
    fetchVendor();
  }, [id]);

  const fetchVendor = () => {
    setLoading(true);
    api
      .get(`vendor/details/${id}`)
      .then((res) => {
        if (res.status === 200) {
            // console.log(res.data.vendor);
          setVendor(res.data.vendor);
        }
      })
      .catch((err) => console.log(err))
      .finally(() => setLoading(false));
  };

  const getStatusBadgeClass = (status: string) => {
    switch (status) {
      case "approved":
        return "bg-success";
      case "pending":
        return "bg-warning text-dark";
      case "suspended":
        return "bg-secondary";
      case "rejected":
        return "bg-danger";
      default:
        return "bg-secondary";
    }
  };

  if (loading) {
    return (
      <div className="d-flex justify-content-center align-items-center mt-5">
        <div
          className="spinner-border text-primary"
          role="status"
          style={{ width: "3rem", height: "3rem" }}
        >
          <span className="visually-hidden">Loading...</span>
        </div>
      </div>
    );
  }

  if (!vendor) {
    return <p className="text-center mt-5">Vendor not found</p>;
  }

  return (
    <div className="container-fluid py-4">
      {/* Header & Breadcrumb */}
      <div className="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center bg-light p-4 rounded-3 shadow-sm mb-4 border">
        <div>
          <h3 className="fw-bold mb-1">Vendor Details</h3>
          <nav aria-label="breadcrumb">
            <ol className="breadcrumb mb-0 fs-6">
              <li className="breadcrumb-item">
                <Link
                  to="/vendor-requests"
                  className="text-primary text-decoration-none"
                >
                  Vendor Requests
                </Link>
              </li>
              <li
                className="breadcrumb-item active fw-semibold"
                aria-current="page"
              >
                Vendor Details
              </li>
            </ol>
          </nav>
        </div>

        <Link
          to="/vendor-requests"
          className="btn btn-outline-primary fw-semibold mt-3 mt-md-0"
        >
          <i className="fa fa-arrow-left me-2"></i> Back
        </Link>
      </div>

      {/* Card */}
      <div className="card shadow-lg border-0 rounded-4 overflow-hidden">
        {/* Banner */}
        <div className="position-relative">
          {vendor.banner ? (
            <img
              src={baseUrl + vendor.banner}
              className="w-100"
              style={{ height: 260, objectFit: "cover" }}
            />
          ) : (
            <div
              className="bg-secondary-subtle text-center py-5 text-muted fw-bold"
              style={{ height: 260 }}
            >
              No Banner Available
            </div>
          )}

          {/* Logo */}
          <img
            src={
              vendor.logo ? baseUrl + vendor.logo : baseUrl + "default-avatar.png"
            }
            className="rounded-circle shadow position-absolute"
            width={110}
            height={110}
            style={{ bottom: -50, left: 40, objectFit: "cover", border: "4px solid #fff" }}
          />
        </div>

        <div className="card-body p-5 mt-4">
          {/* Title & Status */}
          <div className="d-flex flex-column flex-md-row align-items-start align-items-md-center mb-4">
            <div>
              <h3 className="fw-bold mb-1">{vendor.shop_name ?? "N/A"}</h3>
              <p className="text-muted mb-0">Vendor: {vendor.vendor_name ?? "N/A"}</p>
            </div>

            <div className="ms-md-auto mt-3 mt-md-0">
              <span className={`badge fs-6 px-3 py-2 ${getStatusBadgeClass(vendor.status)}`}>
                {vendor.status?.charAt(0).toUpperCase() + vendor.status?.slice(1)}
              </span>
            </div>
          </div>

          <hr />

          {/* Info Grid */}
          <div className="row g-4">
            {/* Contact */}
            <div className="col-md-4">
              <div className="p-3 rounded-3 bg-light h-100 shadow-sm">
                <h6 className="fw-bold mb-3">
                  <i className="fa fa-person-lines-fill me-2"></i>Contact Information
                </h6>
                <p className="mb-2">
                  <i className="fa fa-envelope me-2"></i> {vendor.vendor_email ?? "N/A"}
                </p>
                <p className="mb-2">
                  <i className="fa fa-phone me-2"></i> {vendor.vendor_phone ?? "N/A"}
                </p>
                <p className="mb-0">
                  <i className="fa fa-geo-alt me-2"></i>
                  {vendor.address ?? "N/A"}, {vendor.city ?? "N/A"}, {vendor.country ?? "N/A"}
                </p>
              </div>
            </div>

            {/* Business */}
            <div className="col-md-4">
              <div className="p-3 rounded-3 bg-light h-100 shadow-sm">
                <h6 className="fw-bold mb-3">
                  <i className="fa fa-building me-2"></i>Business Details
                </h6>
                <p><strong>Business Email:</strong> {vendor.business_email ?? "N/A"}</p>
                <p><strong>Business Phone:</strong> {vendor.business_phone ?? "N/A"}</p>
                <p><strong>Commission Rate:</strong> {vendor.commission_rate ?? "N/A"}%</p>
              </div>
            </div>

            {/* Financial */}
            <div className="col-md-4">
              <div className="p-3 rounded-3 bg-light h-100 shadow-sm">
                <h6 className="fw-bold mb-3">
                  <i className="fa fa-cash-coin me-2"></i>Financial Information
                </h6>
                <p><strong>Balance:</strong> ${vendor.balance ?? "0.00"}</p>
                <p><strong>User Status:</strong> {vendor.user_status ? vendor.user_status.charAt(0).toUpperCase() + vendor.user_status.slice(1) : "N/A"}</p>
                <p><strong>Joined:</strong> {vendor.user_joined ? new Date(vendor.user_joined).toLocaleDateString("en-US", { month: "short", day: "2-digit", year: "numeric" }) : "N/A"}</p>
              </div>
            </div>
          </div>

          {/* Description */}
          <hr />
          <h5 className="fw-bold">Shop Description</h5>
          <p className="text-muted fs-6">{vendor.description ?? "No description available."}</p>
        </div>
      </div>
    </div>
  );
}

export default VendorDetails;

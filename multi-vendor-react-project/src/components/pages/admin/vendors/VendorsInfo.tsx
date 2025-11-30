import React, { useEffect, useState } from 'react';
import api from '../../../../config';

function VendorsInfo() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    getVendorInfo();
  }, []);

  const getVendorInfo = () => {
    api.get('vendors-info')
      .then((res) => {
        setData(res.data);
        setLoading(false);
      })
      .catch((error) => {
        console.error(error);
        setLoading(false);
      });
  };

  if (loading) return <div className="text-center mt-5">Loading...</div>;
  if (!data) return <div className="text-center mt-5">No data found</div>;

  return (
    <div className="container">
      <h2 className="mb-4">Vendor Dashboard</h2>

      {/* Status Counts */}
      <div className="row mb-4">
        {data.status_counts.map((status, index) => {
          let bgColor = "secondary"; // default gray
          if (status.status === "approved") bgColor = "success";
          if (status.status === "pending") bgColor = "warning";
          if (status.status === "rejected") bgColor = "danger";
          if (status.status === "suspended") bgColor = "dark";

          return (
            <div key={index} className="col-6 col-md-3 mb-3">
              <div className={`card text-center text-white bg-${bgColor} shadow-sm`}>
                <div className="card-body">
                  <h5 className="card-title text-capitalize">{status.status}</h5>
                  <p className="card-text display-6">{status.total}</p>
                </div>
              </div>
            </div>
          );
        })}
      </div>

      {/* Approved Vendors Table */}
      <div className="card shadow-sm">
        <div className="card-header bg-primary text-white fw-bold">
          Approved Vendors ({data.total_approved})
        </div>
        <div className="card-body p-0">
          <div className="table-responsive">
            <table className="table table-striped table-hover mb-0 align-middle">
              <thead className="table-dark">
                <tr>
                  <th>#</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Vendor ID</th>
                  <th>Created At</th>
                  <th>Updated At</th>
                </tr>
              </thead>
              <tbody>
                {data.approved_vendors.map((vendor, index) => (
                  <tr key={vendor.id}>
                    <td>{index + 1}</td>
                    <td>{vendor.vendor_name}</td>
                    <td>{vendor.vendor_email}</td>
                    <td>{vendor.vendor_phone}</td>
                    <td>{vendor.id}</td>
                    <td>{new Date(vendor.created_at).toLocaleDateString()}</td>
                    <td>{new Date(vendor.updated_at).toLocaleDateString()}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}

export default VendorsInfo;

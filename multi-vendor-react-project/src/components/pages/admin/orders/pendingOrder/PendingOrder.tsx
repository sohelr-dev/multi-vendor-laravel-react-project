import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import api from "../../../../../config";


interface Order {
  order_id: number;
  order_number: string;
  customer_name: string;
  vendor_shop_name: string;
  vendor_name: string;
  total: number;
  created_at: string;
  order_status: string;
}

const PendingOrders: React.FC = () => {
  const [orders, setOrders] = useState<Order[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [alert, setAlert] = useState<{ type: "success" | "danger"; message: string } | null>(null);

  useEffect(() => {
    document.title = "Pending Orders";
    fetchOrders();
  }, []);

  const fetchOrders = async (query = "") => {
    setLoading(true);
    try {
      const res = await api.get(`orders/pending`);
      console.log(res.data.orders);
      setOrders(res.data.orders.data || []);
    } catch (err) {
      console.error("Failed to fetch orders", err);
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    fetchOrders(search);
  };

  const updateStatus = async (orderId: number, status: string) => {
    const prevOrders = [...orders];
    // Optimistic UI Update
    setOrders(
      orders.map((o) => (o.order_id === orderId ? { ...o, order_status: status } : o))
    );

    try {
      const res = await api.post(`/orders/${orderId}/update-status`, { order_status: status });
      if (res.data.success) {
        setAlert({ type: "success", message: `Order #${orderId} status updated to ${status}` });
        setTimeout(() => setAlert(null), 3000); // hide alert after 3 sec
      } else {
        setOrders(prevOrders);
        setAlert({ type: "danger", message: `Failed to update Order #${orderId}` });
        setTimeout(() => setAlert(null), 3000);
      }
    } catch (err) {
      console.error(err);
      setOrders(prevOrders);
      setAlert({ type: "danger", message: `Error updating Order #${orderId}` });
      setTimeout(() => setAlert(null), 3000);
    }
  };


  const getBadgeClass = (status: string) => {
    switch (status) {
      case "pending":
        return "bg-warning text-dark";
      case "confirmed":
        return "bg-primary text-white";
      case "processing":
        return "bg-info text-white";
      case "shipped":
        return "bg-secondary text-white";
      case "delivered":
        return "bg-success text-white";
      case "cancelled":
        return "bg-danger text-white";
      case "returned":
        return "bg-dark text-white";
      default:
        return "bg-light text-dark";
    }
  };

  return (
    <div className="container-fluid py-4">
        {/* Alert */}
        {alert && (
        <div className={`alert alert-${alert.type} position-fixed top-0 end-0 mt-4`} role="alert" style={{ zIndex: 9999 }}>
            {alert.message}
        </div>
        )}

      <div className="row justify-content-center">
        <div className="col-lg-11 col-md-12">

          <div className="card">
            <div className="card-header d-flex justify-content-between align-items-center">
              <h4 className="mb-0"><i className="fa-solid fa-clock me-2"></i>Pending Orders</h4>

              <form className="d-flex" style={{ maxWidth: "300px" }} onSubmit={handleSearch}>
                <input
                  className="form-control form-control-sm me-2"
                  type="search"
                  placeholder="Search pending orders..."
                  value={search}
                  onChange={(e) => setSearch(e.target.value)}
                />
                <button className="btn btn-light btn-sm" type="submit">
                  <i className="fa-solid fa-search"></i>
                </button>
              </form>
            </div>

            <div className="card-body p-0">
              <div className="table-responsive">
                <table className="table table-hover align-middle mb-0">
                  <thead className="sticky-top">
                    <tr>
                      <th>#ID</th>
                      <th>Order No</th>
                      <th>Customer</th>
                      <th>Shop</th>
                      <th>Vendor</th>
                      <th>Total</th>
                      <th>Date</th>
                      <th>Status</th>
                      <th className="text-end">Action</th>
                    </tr>
                  </thead>

                  <tbody>
                    {loading ? (
                      <tr>
                        <td colSpan={9} className="text-center py-4">
                          <div className="spinner-border text-primary" style={{ width: "3rem", height: "3rem" }}></div>
                        </td>
                      </tr>
                    ) : orders.length > 0 ? (
                      orders.map((order) => (
                        <tr key={order.order_id}>
                          <td>{order.order_id}</td>
                          <td>{order.order_number}</td>
                          <td>{order.customer_name || "N/A"}</td>
                          <td>{order.vendor_shop_name || "N/A"}</td>
                          <td>{order.vendor_name || "N/A"}</td>
                          <td>{order.total} ৳</td>
                          <td>{new Date(order.created_at).toLocaleDateString("en-US", { month: "short", day: "2-digit", year: "numeric" })}</td>

                          {/* Status */}
                          <td className="text-center">
                            <select
                              className="form-select form-select-sm mb-1"
                              value={order.order_status}
                              onChange={(e) => updateStatus(order.order_id, e.target.value)}
                            >
                              {["pending","confirmed","processing","shipped","delivered","cancelled","returned"].map((status) => (
                                <option key={status} value={status}>
                                  {status.charAt(0).toUpperCase() + status.slice(1)}
                                </option>
                              ))}
                            </select>

                            <span className={`badge mt-1 ${getBadgeClass(order.order_status)}`}>
                              {order.order_status.charAt(0).toUpperCase() + order.order_status.slice(1)}
                            </span>
                          </td>

                          <td className="text-end">
                            <Link to={`/orders/${order.order_id}`} className="btn btn-sm btn-outline-warning">
                              <i className="fa-solid fa-eye"></i> View
                            </Link>
                          </td>
                        </tr>
                      ))
                    ) : (
                      <tr>
                        <td colSpan={9} className="text-center py-4 text-muted">
                          No pending orders found.
                        </td>
                      </tr>
                    )}
                  </tbody>
                </table>
              </div>
            </div>

            {/* TODO: Pagination if needed */}
          </div>

        </div>
      </div>
    </div>
  );
};

export default PendingOrders;

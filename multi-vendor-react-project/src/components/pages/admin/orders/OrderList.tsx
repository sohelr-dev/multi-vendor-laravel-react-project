import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import api from "../../../../config";

function OrderList() {
  const [orders, setOrders] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [pagination, setPagination] = useState<any>({});

  useEffect(() => {
    document.title = "Orders Management";
    getOrders();
  }, []);

  const getOrders = (pageUrl: string = "orders") => {
    setLoading(true);

    api
      .get(pageUrl)
      .then((res) => {
        if (res.status === 200) {
          
          const paginated = res.data.data ? res.data.data : res.data;
          setOrders(paginated.data || []); 
          setPagination(paginated);            
        }
      })
      .catch((err) => console.log(err))
      .finally(() => setLoading(false));
  };

  const handleSearch = (e: any) => {
    e.preventDefault();
    if (!search) return;

    setLoading(true);

    api
      .get(`orders/search?query=${search}`)
      .then((res) => {
        
        setOrders(res.data || []);
        setPagination({}); 
      })
      .catch((err) => console.log(err))
      .finally(() => setLoading(false));
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case "pending":
        return "warning";
      case "confirmed":
        return "primary";
      case "processing":
        return "info";
      case "shipped":
        return "secondary";
      case "delivered":
        return "success";
      case "cancelled":
        return "danger";
      case "returned":
        return "dark";
      default:
        return "light text-dark";
    }
  };

  const getStatusIcon = (status: string) => {
    switch (status) {
      case "pending":
        return "fa-clock";
      case "confirmed":
        return "fa-circle-check";
      case "processing":
        return "fa-spinner fa-spin";
      case "shipped":
        return "fa-truck-fast";
      case "delivered":
        return "fa-check";
      case "cancelled":
        return "fa-ban";
      case "returned":
        return "fa-rotate-left";
      default:
        return "fa-circle-question";
    }
  };

  return (
    <>
      {/* Header */}
      <div className="d-flex flex-column flex-md-row justify-content-between align-items-md-center bg-light p-4 rounded-3 shadow-sm mb-4 border">
        <h3 className="fw-bold text-primary mb-3 mb-md-0">
          <i className="fa-solid fa-bag-shopping me-2"></i> Orders Management
        </h3>

        <div className="d-flex gap-2">
          <form onSubmit={handleSearch} className="d-flex">
            <input
              className="form-control form-control-sm me-2"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              type="search"
              placeholder="Search orders..."
            />
            <button className="btn btn-outline-secondary btn-sm" type="submit">
              <i className="fa-solid fa-search"></i>
            </button>
          </form>

          {/* চাইলে Export/Print button ও রাখতে পারো */}
          <button className="btn btn-outline-dark btn-sm" onClick={() => window.print()}>
            <i className="fa-solid fa-print"></i>
          </button>
        </div>
      </div>

      {/* Loader */}
      {loading ? (
        <div className="d-flex justify-content-center align-items-center mt-5">
          <div
            className="spinner-border text-primary"
            style={{ width: "3rem", height: "3rem" }}
          ></div>
        </div>
      ) : (
        <div className="card shadow-sm border-0">
          <div className="card-header bg-primary text-white">
            <h5 className="mb-0">
              <i className="fa-solid fa-list me-2"></i> All Orders
            </h5>
          </div>

          <div className="table-responsive">
            <table className="table table-hover align-middle mb-0">
              <thead className="table-dark text-center">
                <tr>
                  <th>#ID</th>
                  <th>
                    <i className="fa-solid fa-hashtag"></i> Order No
                  </th>
                  <th>
                    <i className="fa-solid fa-user"></i> Customer
                  </th>
                  <th>
                    <i className="fa-solid fa-store"></i> Shop
                  </th>
                  <th>
                    <i className="fa-solid fa-user-tie"></i> Vendor
                  </th>
                  <th>
                    <i className="fa-solid fa-money-bill-wave"></i> Total
                  </th>
                  <th>
                    <i className="fa-solid fa-calendar-day"></i> Date
                  </th>
                  <th>
                    <i className="fa-solid fa-signal"></i> Status
                  </th>
                  <th className="text-end">
                    <i className="fa-solid fa-gear"></i> Action
                  </th>
                </tr>
              </thead>

              <tbody>
                {orders.length > 0 ? (
                  orders.map((order: any) => (
                    <tr key={order.order_id}>
                      <td className="text-center">{order.order_id}</td>
                      <td>{order.order_number}</td>
                      <td>{order.customer_name}</td>
                      <td>{order.vendor_shop_name}</td>
                      <td>{order.vendor_name}</td>
                      <td>{order.total} ৳</td>
                      <td>
                        {new Date(order.created_at).toLocaleDateString("en-US", {
                          month: "short",
                          day: "2-digit",
                          year: "numeric",
                        })}
                      </td>

                      <td className="text-center">
                        <span
                          className={`badge bg-${getStatusColor(
                            order.order_status
                          )} d-flex align-items-center justify-content-center gap-1 px-2 py-2`}
                          style={{ minWidth: "110px" }}
                        >
                          <i
                            className={`fa-solid ${getStatusIcon(
                              order.order_status
                            )}`}
                          ></i>
                          {order.order_status
                            ? order.order_status.charAt(0).toUpperCase() +
                              order.order_status.slice(1)
                            : "Unknown"}
                        </span>
                      </td>

                      <td className="text-end">
                        <div className="d-flex gap-1 justify-content-end">
                          <Link
                            to={`/admin/orders/${order.order_id}`}
                            className="btn btn-outline-primary btn-sm"
                          >
                            <i className="fa-solid fa-eye"></i> View
                          </Link>
                        </div>
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan={9} className="text-center py-4 text-muted">
                      No orders found.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>

          {/* Pagination */}
          <div className="card-footer text-center bg-light">
            <div className="d-flex justify-content-center gap-2">
              {pagination.prev_page_url && (
                <button
                  className="btn btn-outline-primary btn-sm"
                  onClick={() => getOrders(pagination.prev_page_url)}
                >
                  Previous
                </button>
              )}

              {pagination.next_page_url && (
                <button
                  className="btn btn-outline-primary btn-sm"
                  onClick={() => getOrders(pagination.next_page_url)}
                >
                  Next
                </button>
              )}
            </div>
          </div>
        </div>
      )}
    </>
  );
}

export default OrderList;
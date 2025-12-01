import React, { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";
import api from "../../../../config"; // your axios instance
import "../../../../assets/custom/print.css"; // print styles (added below)

const OrderDetails: React.FC = () => {
  const { id } = useParams();
  const [order, setOrder] = useState<any>(null);
  const [items, setItems] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  // Fetch details
  useEffect(() => {
    document.title="Order Details";
    const fetchData = async () => {
      try {
        const res = await api.get(`orders/${id}`);
        setOrder(res.data.order);
        setItems(res.data.items);
      } catch (error) {
        console.error("Error loading order details", error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [id]);

  if (loading) {
    return (
      <div className="text-center py-5">
        <div className="spinner-border text-primary" role="status">
          <span className="visually-hidden">Loading...</span>
        </div>
      </div>
    );
  }

  if (!order) return <div className="text-center py-5">Order Not Found</div>;

  return (
    <div className="container-fluid py-4">

      {/* Breadcrumb */}
      <div className="row mb-3">
        <div className="col-12 d-flex justify-content-between align-items-center">
          <nav aria-label="breadcrumb">
            <ol className="breadcrumb bg-light rounded p-2 mb-0">
              <li className="breadcrumb-item">
                <Link to="/admin/orders" className="text-decoration-none">
                  <i className="fa-solid fa-house me-1"></i>Orders
                </Link>
              </li>

              <li className="breadcrumb-item">
                <i className="fa-solid fa-bag-shopping me-1"></i>Order Details
              </li>

              <li className="breadcrumb-item active">
                <i className="fa-solid fa-circle-info me-1"></i>Order #{order.order_number}
              </li>
            </ol>
          </nav>

          <div className="d-flex gap-2">
            <Link to="/admin/orders" className="btn btn-outline-info text-black">Back</Link>

            <button className="btn btn-success no-print" onClick={() => window.print()}>
              <i className="fa-solid fa-print me-1"></i> Print
            </button>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="row mt-4" id="printArea">
        <div className="col-lg-12">
          <div className="card shadow-sm">
            <div className="card-header bg-primary text-white d-flex justify-content-between">
              <h4 className="mb-0">
                <i className="fa-solid fa-bag-shopping me-2"></i>
                Order #{order.order_number}
              </h4>

              <span className={`badge bg-${
                order.order_status === "pending"
                  ? "warning"
                  : order.order_status === "delivered"
                  ? "success"
                  : "primary"
              }`}>
                {order.order_status}
              </span>
            </div>

            <div className="card-body">
              <div className="row mb-4">
                
                {/* Customer Info */}
                <div className="col-md-4">
                  <div className="card">
                    <div className="card-header">Customer Info</div>
                    <div className="p-2">
                      <p><strong>{order.customer_name}</strong></p>
                      <p>{order.customer_email}</p>
                      <p>{order.customer_phone}</p>
                    </div>
                  </div>
                </div>

                {/* Shipping */}
                <div className="col-md-4">
                  <div className="card">
                    <div className="card-header">Shipping Address</div>
                    <div className="p-2">
                      <p><strong>{order.shipping_name}</strong></p>
                      <p>{order.shipping_address}, {order.shipping_city}, {order.shipping_district}</p>
                      <p>{order.country} - {order.postal_code}</p>
                      <p>{order.shipping_phone}</p>
                    </div>
                  </div>
                </div>

                {/* Vendor */}
                <div className="col-md-4">
                  <div className="card">
                    <div className="card-header">Vendor / Shop Info</div>
                    <div className="p-2">
                      <p><strong>{order.vendor_shop_name}</strong></p>
                      <p>{order.vendor_name}</p>
                      <p>{order.vendor_phone} | {order.vendor_email_user}</p>
                    </div>
                  </div>
                </div>

              </div>

              {/* Items Table */}
              <div className="table-responsive mb-4">
                <table className="table table-hover align-middle">
                  <thead className="table-light">
                    <tr>
                      <th className="no-print">Image</th>
                      <th>Product</th>
                      <th>Category</th>
                      <th>Brand</th>
                      <th>Variant</th>
                      <th>Price * Qty</th>
                      <th>Discount * Qty</th>
                      <th>Total</th>
                    </tr>
                  </thead>

                  <tbody>
                    {items.map((item, i) => {
                      const amount = item.price * item.quantity;
                      const discount = item.per_product_discount * item.quantity;

                      return (
                        <tr key={i}>
                          <td className="no-print">
                            <img
                              src={item.product_image || "/default.jpg"}
                              className="img-thumbnail"
                              style={{ width: 60 }}
                            />
                          </td>

                          <td>{item.product_name}</td>
                          <td>{item.category_name}</td>
                          <td>{item.brand_name}</td>

                          <td>
                            {item.variant_name
                              ? `${item.variant_type}: ${item.variant_name} (+${item.additional_price}৳)`
                              : "N/A"}
                          </td>

                          <td className="text-center">
                            {item.price} x {item.quantity} ৳
                          </td>

                          <td className="text-end">
                            {item.per_product_discount} x {item.quantity} ৳
                          </td>

                          <td className="text-end">
                            {(amount - discount).toFixed(2)} ৳
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>

              {/* Totals */}
              <div className="row justify-content-end">
                <div className="col-md-4 shadow p-2">
                  <table className="table table-borderless">
                    <tr>
                      <th>Shipping:</th>
                      <td>{order.shipping_cost} ৳</td>
                    </tr>

                    <tr>
                      <th>Total:</th>
                      <td><strong>{order.total} ৳</strong></td>
                    </tr>
                  </table>
                </div>
              </div>

              {/* Notes */}
              {order.notes && (
                <div className="mt-3">
                  <h6 className="text-muted">Customer Notes:</h6>
                  <p>{order.notes}</p>
                </div>
              )}

            </div>
          </div>
        </div>
      </div>

    </div>
  );
};

export default OrderDetails;
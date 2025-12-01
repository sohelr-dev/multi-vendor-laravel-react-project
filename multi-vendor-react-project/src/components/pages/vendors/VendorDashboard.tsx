import "bootstrap/dist/css/bootstrap.min.css";

import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from "chart.js";
import { Line } from "react-chartjs-2";

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

export default function VendorDashboard() {
  // Vendor-specific sample data
  const stats = [
    { title: "My Sales", value: "৳ 412,320", subtitle: "This month" },
    { title: "Orders", value: 324, subtitle: "Pending: 12" },
    { title: "Products", value: 84, subtitle: "Out of stock: 4" },
    { title: "Avg Rating", value: 4.6, subtitle: "From 1,280 reviews" },
  ];

  const products = [
    { sku: "V-001", name: "Bluetooth Speaker", price: "৳ 2,200", stock: 12, status: "Active" },
    { sku: "V-002", name: "Fitness Band", price: "৳ 1,800", stock: 0, status: "Out of stock" },
    { sku: "V-003", name: "Phone Case", price: "৳ 350", stock: 120, status: "Active" },
  ];

  const orders = [
    { id: "VOD501", customer: "Arif", total: "৳ 2,200", status: "Processing", date: "2025-11-30" },
    { id: "VOD502", customer: "Salma", total: "৳ 350", status: "Delivered", date: "2025-11-29" },
    { id: "VOD503", customer: "Rana", total: "৳ 1,800", status: "Cancelled", date: "2025-11-28" },
  ];

  // Sales line chart (last 14 days)
  const days = Array.from({ length: 14 }).map((_, i) => {
    const d = new Date();
    d.setDate(d.getDate() - (13 - i));
    return `${d.getMonth() + 1}/${d.getDate()}`;
  });
  const salesData = {
    labels: days,
    datasets: [
      {
        label: "Daily Sales (৳)",
        data: [1200, 2400, 1800, 3000, 2600, 2800, 3200, 2900, 3100, 3400, 3600, 3800, 4000, 4200],
        fill: true,
        tension: 0.25,
        pointRadius: 2,
      },
    ],
  };
  const salesOptions = {
    responsive: true,
    plugins: { legend: { display: false }, title: { display: true, text: "Your Sales (Last 14 days)" } },
    scales: { y: { beginAtZero: true } },
  };

  return (
    <main className="p-4 bg-light" style={{ minHeight: "100vh" }}>
      {/* Header row for vendor name & actions */}
      <div className="d-flex justify-content-between align-items-center mb-4">
        <div>
          <h4 className="mb-0">Vendor Dashboard — SoundLab</h4>
          <small className="text-muted">Manage products, orders and promotions</small>
        </div>
        <div className="d-flex gap-2">
          <button className="btn btn-outline-secondary">Preview Store</button>
          <button className="btn btn-primary">Add Product</button>
        </div>
      </div>

      {/* Stats */}
      <div className="row g-3 mb-4">
        {stats.map((s, i) => (
          <div className="col-12 col-sm-6 col-lg-3" key={i}>
            <div className="card h-100 shadow-sm">
              <div className="card-body">
                <h6 className="text-muted">{s.title}</h6>
                <div className="d-flex align-items-center justify-content-between mt-2">
                  <h3 className="mb-0">{s.value}</h3>
                  <small className="text-muted">{s.subtitle}</small>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Sales chart + Quick controls */}
      <div className="row gy-4 mb-4">
        <div className="col-12 col-lg-8">
          <div className="card shadow-sm">
            <div className="card-body">
              <div className="d-flex justify-content-between align-items-center mb-3">
                <h5 className="card-title mb-0">Sales Overview</h5>
                <div>
                  <select className="form-select form-select-sm">
                    <option>Last 14 days</option>
                    <option>Last 30 days</option>
                    <option>Last 90 days</option>
                  </select>
                </div>
              </div>
              <Line data={salesData} options={salesOptions} />
            </div>
          </div>
        </div>

        <div className="col-12 col-lg-4">
          <div className="card shadow-sm mb-3">
            <div className="card-body">
              <h6 className="card-title">Quick Actions</h6>
              <div className="d-grid gap-2 mt-3">
                <button className="btn btn-outline-primary">Create Promotion</button>
                <button className="btn btn-outline-success">Manage Inventory</button>
                <button className="btn btn-outline-warning">Payouts</button>
              </div>
            </div>
          </div>

          <div className="card shadow-sm">
            <div className="card-body">
              <h6 className="card-title">Shop Info</h6>
              <p className="mb-1"><strong>Location:</strong> Dhaka, Bangladesh</p>
              <p className="mb-1"><strong>Since:</strong> 2023</p>
              <p className="mb-0"><strong>Verified:</strong> Yes</p>
            </div>
          </div>
        </div>
      </div>

      {/* Orders & Products tables */}
      <div className="row gy-4">
        <div className="col-12 col-xl-6">
          <div className="card shadow-sm">
            <div className="card-body">
              <div className="d-flex justify-content-between align-items-center mb-3">
                <h5 className="card-title mb-0">Recent Orders</h5>
                <button className="btn btn-sm btn-outline-primary">View All</button>
              </div>

              <div className="table-responsive">
                <table className="table table-hover align-middle mb-0">
                  <thead className="table-light">
                    <tr>
                      <th>Order</th>
                      <th>Customer</th>
                      <th>Total</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    {orders.map((o) => (
                      <tr key={o.id}>
                        <td>{o.id}</td>
                        <td>{o.customer}</td>
                        <td>{o.total}</td>
                        <td><span className={`badge ${o.status === "Processing"? 'bg-warning text-dark' : o.status === 'Delivered' ? 'bg-success' : 'bg-danger'}`}>{o.status}</span></td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

        <div className="col-12 col-xl-6">
          <div className="card shadow-sm">
            <div className="card-body">
              <div className="d-flex justify-content-between align-items-center mb-3">
                <h5 className="card-title mb-0">Your Products</h5>
                <button className="btn btn-sm btn-outline-secondary">Manage</button>
              </div>

              <ul className="list-group list-group-flush">
                {products.map((p) => (
                  <li className="list-group-item d-flex justify-content-between align-items-center" key={p.sku}>
                    <div>
                      <div className="fw-semibold">{p.name}</div>
                      <small className="text-muted">SKU: {p.sku}</small>
                    </div>
                    <div className="text-end">
                      <div className="mb-1">{p.price}</div>
                      <small className={`badge ${p.stock === 0 ? 'bg-danger' : 'bg-secondary'}`}>{p.stock === 0 ? 'Out of stock' : `${p.stock} in stock`}</small>
                    </div>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </div>
      </div>

      <footer className="mt-4 text-center text-muted">© {new Date().getFullYear()} Vendor Dashboard — Static demo</footer>
    </main>
  );
}
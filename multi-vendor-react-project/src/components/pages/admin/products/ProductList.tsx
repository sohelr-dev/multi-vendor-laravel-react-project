import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import api, { baseUrl } from "../../../../config";

function ProductList() {
  const [products, setProducts] = useState<any>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [pagination, setPagination] = useState<any>({});

  useEffect(() => {
    document.title = "Products Management";
    getProducts();
  }, []);

  const getProducts = (pageUrl = "products") => {
    setLoading(true);

    api
      .get(pageUrl)
      .then((res) => {
        if (res.status === 200) {
          setProducts(res.data.data.data); // Laravel pagination -> data.data
          setPagination(res.data.data);
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
      .get(`products/search?search=${search}`)
      .then((res) => {
        setProducts(res.data.data.data);
        setPagination(res.data.data);
      })
      .catch((err) => console.log(err))
      .finally(() => setLoading(false));
  };

  const updateStatus = (productId: number, status: string) => {
    // Update instantly on UI
    setProducts((prev: any[]) =>
        prev.map((p) =>
        p.id === productId ? { ...p, status } : p
        )
    );

    api
        .post(`products/${productId}/status`, { status })
        .then((res) => {
        if (!res.data.success) {
            alert("Failed to update");
        }
        })
        .catch(() => alert("Error updating status"));
    };

  return (
    <>
      {/* Header */}
      <div className="d-flex flex-column flex-md-row justify-content-between align-items-md-center bg-light p-4 rounded-3 shadow-sm mb-4 border">

        <h3 className="fw-bold text-primary mb-3 mb-md-0">
          <i className="fa-solid fa-boxes me-2"></i> Products Management
        </h3>

        <div className="d-flex gap-2">
          <form onSubmit={handleSearch} className="d-flex">
            <input
              className="form-control form-control-sm me-2"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              type="search"
              placeholder="Search products..."
            />
            <button className="btn btn-outline-secondary btn-sm" type="submit">
              <i className="fa-solid fa-search"></i>
            </button>
          </form>

          <Link to="/products/create" className="btn btn-primary btn-sm">
            <i className="fa-solid fa-plus me-1"></i> Add New
          </Link>

          <button className="btn btn-outline-dark btn-sm" onClick={() => window.print()}>
            <i className="fa-solid fa-print"></i>
          </button>
        </div>
      </div>

      {/* Loader */}
      {loading ? (
        <div className="d-flex justify-content-center align-items-center mt-5">
          <div className="spinner-border text-primary" style={{ width: "3rem", height: "3rem" }}></div>
        </div>
      ) : (
        <div className="card shadow-sm border-0">
          <div className="card-header bg-primary text-white">
            <h5 className="mb-0">
              <i className="fa-solid fa-list me-2"></i> All Products
            </h5>
          </div>

          <div className="table-responsive">
            <table className="table table-hover align-middle mb-0">
              <thead className="table-dark text-center">
                <tr>
                  <th>ID</th>
                  <th>Thumbnail</th>
                  <th>Name</th>
                  <th>Vendor</th>
                  <th>Category</th>
                  <th>Brand</th>
                  <th>SKU</th>
                  <th>Price</th>
                  <th>Qty</th>
                  <th>Status</th>
                  <th>Created</th>
                  <th>Actions</th>
                </tr>
              </thead>

              <tbody>
                {products.length > 0 ? (
                  products.map((item: any) => (
                    <tr key={item.id}>
                      <td className="text-center">{item.id}</td>

                      {/* Thumbnail */}
                      <td className="text-center">
                        <img
                          src={
                            item.thumbnail
                              ? baseUrl + item.thumbnail
                              : "/no-image.png"
                          }
                          width="50"
                          height="50"
                          className="rounded border"
                          alt="thumbnail"
                        />
                      </td>

                      <td className="fw-semibold">{item.name}</td>
                      <td>{item.vendorName}</td>
                      <td>{item.categoryName}</td>
                      <td>{item.brandName}</td>

                      <td className="text-muted">{item.sku}</td>

                      <td>
                        <span className="fw-bold text-success">৳{(item.price-item.discount_price||0) ?? item.price}</span>
                        {item.discount_price && (
                          <small className="text-decoration-line-through text-muted">
                            ৳{item.price}
                          </small>
                        )}
                      </td>

                      <td className="text-center">{item.quantity}</td>

                      {/* Status dropdown for Admin */}
                     <td className="text-center">
                        <div className="d-flex flex-column align-items-center">

                            {/* Select for update */}
                            <select
                            className="form-select form-select-sm"
                            value={item.status}
                            onChange={(e) => updateStatus(item.id, e.target.value)}
                            style={{ minWidth: "120px" }}
                            >
                            <option value="active">Active</option>
                            <option value="pending">Pending</option>
                            <option value="draft">Draft</option>
                            <option value="inactive">Inactive</option>
                            </select>

                            {/* Status Badge (Laravel Style) */}
                            <span
                            className={`badge mt-1 ${
                                item.status === "active"
                                ? "bg-success"
                                : item.status === "pending"
                                ? "bg-danger"
                                : item.status === "draft"
                                ? "bg-secondary"
                                : item.status === "inactive"
                                ? "bg-dark"
                                : "bg-light text-dark"
                            }`}
                            id={`status-badge-${item.id}`}
                            style={{ fontSize: "12px" }}
                            >
                            {item.status.charAt(0).toUpperCase() + item.status.slice(1)}
                            </span>

                        </div>
                        </td>


                      <td>
                        {new Date(item.created_at).toLocaleDateString("en-US", {
                          month: "short",
                          day: "2-digit",
                          year: "numeric",
                        })}
                      </td>

                      <td className="text-center">
                        <div className="d-flex gap-1 justify-content-center">
                          <Link to={`/product/${item.id}`} className="btn btn-info btn-sm">
                            <i className="fa-solid fa-eye"></i>
                          </Link>

                          <Link to={`/products/edit/${item.id}`} className="btn btn-warning btn-sm">
                            <i className="fa-solid fa-pen-to-square"></i>
                          </Link>

                          <button className="btn btn-danger btn-sm">
                            <i className="fa-solid fa-trash"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan={12} className="text-center py-4 text-muted">
                      No products found.
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
                  onClick={() => getProducts(pagination.prev_page_url)}
                >
                  Previous
                </button>
              )}

              {pagination.next_page_url && (
                <button
                  className="btn btn-outline-primary btn-sm"
                  onClick={() => getProducts(pagination.next_page_url)}
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

export default ProductList;

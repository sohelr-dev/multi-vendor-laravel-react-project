import { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import api, { baseUrl } from "../../../../config";

function ProductDetails() {
  const { id } = useParams();
  const [product, setProduct] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    document.title = "Product Details";
    fetchProduct();
  }, []);

  const fetchProduct = () => {
    api
      .get(`products/${id}`)
      .then((res) => {
        if (res.data.success) {
          setProduct(res.data.data);
        }
      })
      .catch((err) => console.log(err))
      .finally(() => setLoading(false));
  };

  if (loading) {
    return (
      <div className="d-flex justify-content-center mt-5">
        <div className="spinner-border text-primary" style={{ width: "3rem", height: "3rem" }}></div>
      </div>
    );
  }

  if (!product) {
    return (
      <div className="text-center mt-5">
        <h4 className="text-danger">Product not found</h4>
        <Link className="btn btn-outline-primary mt-3" to="/products">
          Back to List
        </Link>
      </div>
    );
  }

  return (
    <>
      {/* HEADER + BREADCRUMB  */}
      <div className="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center bg-light p-4 rounded-3 shadow-sm mb-4 border">
        <nav aria-label="breadcrumb" className="mb-3 mb-md-0">
          <ol className="breadcrumb mb-0 fs-6">
            <li className="breadcrumb-item">
              <Link to="/products" className="text-primary fw-semibold text-decoration-none">
                Products
              </Link>
            </li>
            <li className="breadcrumb-item active fw-bold text-secondary" aria-current="page">
              Product Details
            </li>
          </ol>
        </nav>

        <div className="d-flex gap-2">
          <Link
            to={`/products/edit/${product.id}`}
            className="btn btn-warning fw-semibold"
          >
            <i className="bi bi-pencil-square me-2"></i>Edit
          </Link>

          <Link to="/products" className="btn btn-secondary fw-semibold">
            <i className="bi bi-arrow-left-circle me-2"></i>Back to List
          </Link>
        </div>
      </div>

      {/* MAIN CONTENT */}
      <div className="container-fluid py-4 admin-product-view bg-body-secondary">

        <div className="row g-4">
          {/* LEFT COLUMN – IMAGES */}
          <div className="col-lg-5">
            <div className="card shadow-sm border-0">
              <div className="card-header bg-primary fw-semibold">Product Images</div>
              <div className="card-body text-center">

                {product.images && product.images.length > 0 ? (
                  <>
                    {/* Carousel */}
                    <div id="productCarousel" className="carousel slide" data-bs-ride="carousel">
                      <div className="carousel-inner">
                        {product.images.map((img: string, i: number) => (
                          <div className={`carousel-item ${i === 0 ? "active" : ""}`} key={i}>
                            <img
                              src={baseUrl + img}
                              className="d-block w-100 rounded"
                              style={{ maxHeight: "380px", objectFit: "contain" }}
                              alt={product.name}
                            />
                          </div>
                        ))}
                      </div>

                      <button className="carousel-control-prev" data-bs-target="#productCarousel" data-bs-slide="prev">
                        <span className="carousel-control-prev-icon"></span>
                      </button>
                      <button className="carousel-control-next" data-bs-target="#productCarousel" data-bs-slide="next">
                        <span className="carousel-control-next-icon"></span>
                      </button>
                    </div>

                    {/* Thumbnails */}
                    <div className="d-flex justify-content-center gap-2 mt-3 flex-wrap">
                      {product.images.map((img: string, i: number) => (
                        <img
                          key={i}
                          src={baseUrl + img}
                          className="img-thumbnail"
                          style={{ width: "70px", height: "70px", objectFit: "cover", cursor: "pointer" }}
                        />
                      ))}
                    </div>
                  </>
                ) : (
                  <img
                    src="/no-image.png"
                    className="img-fluid rounded"
                    alt="placeholder"
                  />
                )}

              </div>
            </div>
          </div>

          {/* RIGHT COLUMN – PRODUCT INFO */}
          <div className="col-lg-7">
            <div className="card shadow-sm border-0">
              <div className="card-header bg-info fw-semibold">Product Information</div>
              <div className="card-body">

                <h5 className="fw-bold mb-2">{product.name}</h5>
                <p className="text-muted small mb-3">SKU: {product.sku}</p>

                {/* Price Display */}
                <div className="d-flex align-items-baseline gap-2 mb-3">
                  <span className="fs-5 fw-semibold text-success">
                    ৳ {product.discount_price
                            ? (product.price - product.discount_price).toFixed(2)
                            : product.price.toFixed(2)
                        }
                  </span>

                  {product.discount_price && product.discount_price !== product.price && (
                    <>
                      <span className="text-muted text-decoration-line-through">
                        ৳ {product.price}
                      </span>
                      <span className="badge bg-success">
                        Save ৳ {product.discount_price}
                      </span>
                    </>
                  )}
                </div>

                <div className="row g-3 mb-3">
                  <div className="col-md-6">
                    <strong>Status:</strong>{" "}
                    <span
                      className={`badge ${
                        product.status === "active" ? "bg-success" : "bg-secondary"
                      } ms-1`}
                    >
                      {product.status}
                    </span>
                  </div>

                  <div className="col-md-6">
                    <strong>Stock:</strong> {product.quantity} {product.unit ?? ""}
                  </div>

                  <div className="col-md-6">
                    <strong>Category:</strong> {product.categoryName ?? "—"}
                  </div>

                  <div className="col-md-6">
                    <strong>Brand:</strong> {product.brandName ?? "—"}
                  </div>
                </div>

                <p className="mb-3 small text-muted">{product.short_description}</p>

                {/* Variants */}
                {product.variants && product.variants.length > 0 && (
                  <div className="mb-3">
                    <strong>Available Variants:</strong>
                    <ul className="list-group list-group-flush mt-2">
                      {product.variants.map((variant: any) => (
                        <li
                          key={variant.id}
                          className="list-group-item d-flex justify-content-between align-items-center"
                        >
                          {variant.variant_type}: {variant.variant_name}
                          <span className="small text-muted">Stock: {variant.stock}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                )}

                {/* Description */}
                <div className="mt-4 border-top pt-3">
                  <strong>Description:</strong>
                  <div
                    className="small text-muted mt-2"
                    dangerouslySetInnerHTML={{
                      __html: product.description ?? "<em>No detailed description provided.</em>",
                    }}
                  ></div>
                </div>

              </div>
            </div>

            {/* VENDOR CARD */}
            <div className="card shadow-sm border-0 mt-4">
              <div className="card-header bg-light fw-semibold">Vendor Details</div>

              <div className="card-body d-flex align-items-center gap-3">
                <img
                  src={
                    product.vendorShopLogo
                      ? baseUrl + product.vendorShopLogo
                      : "/default_vendor.png"
                  }
                  className="rounded-circle border"
                  style={{ width: "70px", height: "70px", objectFit: "cover" }}
                />

                <div>
                  <div className="fw-semibold">
                    {product.vendorShopName ?? product.vendorName}
                  </div>

                  <div className="small text-muted">{product.vendorAddress}</div>

                  <div className="small mt-1">
                    <a href={`mailto:${product.vendorEmail}`}>{product.vendorEmail}</a> •{" "}
                    {product.vendorPhone}
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>

      <style>{`
        .admin-product-view .card { border-radius: 10px; }
        .admin-product-view .card-header { font-size: 0.95rem; }
        .admin-product-view img.img-thumbnail:hover { border-color: #0d6efd; }
      `}</style>
    </>
  );
}

export default ProductDetails;
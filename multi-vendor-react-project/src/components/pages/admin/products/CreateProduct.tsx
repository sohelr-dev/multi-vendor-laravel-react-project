import { useState, useEffect } from "react";
import api from "../../../../config"; 
import { CKEditor } from "@ckeditor/ckeditor5-react";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";

const CreateProduct = () => {
  const [loading, setLoading] = useState(true);
  const [categories, setCategories] = useState([]);
  const [brands, setBrands] = useState([]);
  const [vendors, setVendors] = useState([]);
  const [form, setForm] = useState({
    name: "",
    slug: "",
    sku: "",
    category_id: "",
    brand_id: "",
    vendor_id: "",
    price: "",
    discount_price: "",
    quantity: "",
    unit: "",
    status: "active",
    short_description: "",
    description: "",
    thumbnail: null,
    images: [],
    variants: [],
  });
  const [errors, setErrors] = useState({});

  // Fetch categories, brands, vendors
  useEffect(() => {
    api
      .get("get-product")
      .then((res) => {
        if (res.data.status==='success') {
          console.log(res.data);
          setCategories(res.data.categories);
          setBrands(res.data.brands);
          setVendors(res.data.vendors);
        } else {
          alert("Failed to fetch data");
        }
      })
      .catch(() => alert("Error fetching product data"))
      .finally(() => setLoading(false));
  }, []);

  // Handle input change
  const handleChange = (e) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));

    // Auto-generate slug
    if (name === "name") {
      const slug = value.toLowerCase().replace(/\s+/g, "-").replace(/[^a-z0-9\-]/g, "");
      setForm((prev) => ({ ...prev, slug }));
    }
  };

  // Handle file inputs
  const handleFileChange = (e) => {
    const { name, files } = e.target;
    if (name === "thumbnail") {
      setForm((prev) => ({ ...prev, thumbnail: files[0] }));
    } else if (name === "images") {
      setForm((prev) => ({ ...prev, images: Array.from(files) }));
    }
  };

  // Handle CKEditor change
  const handleDescriptionChange = (event, editor) => {
    const data = editor.getData();
    setForm((prev) => ({ ...prev, description: data }));
  };

  // Variants
  const addVariant = () => {
    setForm((prev) => ({
      ...prev,
      variants: [
        ...prev.variants,
        { variant_type: "", variant_name: "", additional_price: 0, variant_stock: 0 },
      ],
    }));
  };

  const removeVariant = (index) => {
    setForm((prev) => ({
      ...prev,
      variants: prev.variants.filter((_, i) => i !== index),
    }));
  };

  const handleVariantChange = (index, field, value) => {
    setForm((prev) => ({
      ...prev,
      variants: prev.variants.map((v, i) => (i === index ? { ...v, [field]: value } : v)),
    }));
  };

  // Submit form
  const handleSubmit = async (e) => {
    e.preventDefault();
    setErrors({}); // Clear previous errors

    const data = new FormData();
    for (const key in form) {
      if (key === "images") {
        form.images.forEach((file) => data.append("images[]", file));
      } else if (key === "thumbnail") {
        if (form.thumbnail) data.append("thumbnail", form.thumbnail);
      } else if (key === "variants") {
        form.variants.forEach((v) => {
          data.append("variant_type[]", v.variant_type);
          data.append("variant_name[]", v.variant_name);
          data.append("additional_price[]", v.additional_price);
          data.append("variant_stock[]", v.variant_stock);
        });
      } else {
        data.append(key, form[key]);
      }
    }

    try {
      const res = await api.post("products", data, {
        headers: { "Content-Type": "multipart/form-data" },
      });

      if (res.data.status ==='success') {
        alert("Product created successfully!");
        // Optionally reset form
        setForm({
          name: "",
          slug: "",
          sku: "",
          category_id: "",
          brand_id: "",
          vendor_id: "",
          price: "",
          discount_price: "",
          quantity: "",
          unit: "",
          status: "active",
          short_description: "",
          description: "",
          thumbnail: null,
          images: [],
          variants: [],
        });
      } else {
        alert("Failed to create product");
      }
    }  catch (err) {
  if (err.response) {
    console.error("Validation errors:", err.response.data);
    if (err.response.status === 422) {
      setErrors(err.response.data.errors);
    } else {
      alert("Error creating product");
    }
  } else {
    console.error(err);
    alert("Unexpected error occurred");
  }
}
  };

  if (loading) return <p>Loading...</p>;

  return (
    <div className="container-fluid py-4">
      <h4 className="fw-bold mb-4">Add New Product</h4>

      <form onSubmit={handleSubmit} encType="multipart/form-data" method="POST">
        {/* General Information */}
        <div className="card shadow-sm border-0 mb-4">
          <div className="card-header bg-light fw-semibold">General Information</div>
          <div className="card-body row g-3">
            <div className="col-md-6">
              <label className="form-label">
                Product Name <span className="text-danger">*</span>
              </label>
              <input
                type="text"
                name="name"
                className={`form-control ${errors.name ? "is-invalid" : ""}`}
                value={form.name}
                onChange={handleChange}
                required
              />
              {errors.name && <div className="invalid-feedback">{errors.name[0]}</div>}
            </div>

            <div className="col-md-6">
              <label className="form-label">Slug</label>
              <input
                type="text"
                name="slug"
                className={`form-control ${errors.slug ? "is-invalid" : ""}`}
                value={form.slug}
                onChange={handleChange}
              />
              {errors.slug && <div className="invalid-feedback">{errors.slug[0]}</div>}
            </div>

            <div className="col-md-4">
              <label className="form-label">SKU</label>
              <input
                type="text"
                name="sku"
                className={`form-control ${errors.sku ? "is-invalid" : ""}`}
                value={form.sku}
                onChange={handleChange}
              />
              {errors.sku && <div className="invalid-feedback">{errors.sku[0]}</div>}
            </div>

            <div className="col-md-4">
              <label className="form-label">Category <span className="text-danger">*</span></label>
              <select
                name="category_id"
                className={`form-select ${errors.category_id ? "is-invalid" : ""}`}
                value={form.category_id}
                onChange={handleChange}
                required
              >
                <option value="">-- Select Category --</option>
                {categories.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.name}
                  </option>
                ))}
              </select>
              {errors.category_id && <div className="invalid-feedback">{errors.category_id[0]}</div>}
            </div>

            <div className="col-md-4">
              <label className="form-label">Brand</label>
              <select
                name="brand_id"
                className={`form-select ${errors.brand_id ? "is-invalid" : ""}`}
                value={form.brand_id}
                onChange={handleChange}
              >
                <option value="">-- Select Brand --</option>
                {brands.map((b) => (
                  <option key={b.id} value={b.id}>
                    {b.name}
                  </option>
                ))}
              </select>
              {errors.brand_id && <div className="invalid-feedback">{errors.brand_id[0]}</div>}
            </div>

            <div className="col-md-4">
              <label className="form-label">Vendor</label>
              <select
                name="vendor_id"
                className={`form-select ${errors.vendor_id ? "is-invalid" : ""}`}
                value={form.vendor_id}
                onChange={handleChange}
              >
                <option value="">-- Select Vendor --</option>
                {vendors.map((v) => (
                  <option key={v.id} value={v.id}>
                    {v.shop_name} ({v.vendorName})
                  </option>
                ))}
              </select>
              {errors.vendor_id && <div className="invalid-feedback">{errors.vendor_id[0]}</div>}
            </div>

            <div className="col-md-4">
              <label className="form-label">Price <span className="text-danger">*</span></label>
              <input
                type="number"
                name="price"
                className={`form-control ${errors.price ? "is-invalid" : ""}`}
                value={form.price}
                onChange={handleChange}
                step="0.01"
                required
              />
              {errors.price && <div className="invalid-feedback">{errors.price[0]}</div>}
            </div>

            <div className="col-md-4">
              <label className="form-label">Discount Price</label>
              <input
                type="number"
                name="discount_price"
                className={`form-control ${errors.discount_price ? "is-invalid" : ""}`}
                value={form.discount_price}
                onChange={handleChange}
                step="0.01"
              />
              {errors.discount_price && <div className="invalid-feedback">{errors.discount_price[0]}</div>}
            </div>

            <div className="col-md-4">
              <label className="form-label">Quantity</label>
              <input
                type="number"
                name="quantity"
                className={`form-control ${errors.quantity ? "is-invalid" : ""}`}
                value={form.quantity}
                onChange={handleChange}
                min="0"
              />
              {errors.quantity && <div className="invalid-feedback">{errors.quantity[0]}</div>}
            </div>

            <div className="col-md-4">
              <label className="form-label">Unit</label>
              <input
                type="text"
                name="unit"
                className={`form-control ${errors.unit ? "is-invalid" : ""}`}
                value={form.unit}
                onChange={handleChange}
                placeholder="e.g. pcs, kg"
              />
              {errors.unit && <div className="invalid-feedback">{errors.unit[0]}</div>}
            </div>

            <div className="col-md-4">
              <label className="form-label">Status</label>
              <select
                name="status"
                className={`form-select ${errors.status ? "is-invalid" : ""}`}
                value={form.status}
                onChange={handleChange}
              >
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
                <option value="draft">Draft</option>
              </select>
              {errors.status && <div className="invalid-feedback">{errors.status[0]}</div>}
            </div>
          </div>
        </div>

        {/* Descriptions */}
        <div className="card shadow-sm border-0 mb-4">
          <div className="card-header bg-light fw-semibold">Descriptions</div>
          <div className="card-body">
            <div className="mb-3">
              <label className="form-label">Short Description</label>
              <textarea
                name="short_description"
                rows="2"
                className={`form-control ${errors.short_description ? "is-invalid" : ""}`}
                value={form.short_description}
                onChange={handleChange}
              ></textarea>
              {errors.short_description && <div className="invalid-feedback">{errors.short_description[0]}</div>}
            </div>
            <div className="mb-3">
              <label className="form-label">Full Description</label>
              <CKEditor
                editor={ClassicEditor}
                data={form.description}
                onChange={handleDescriptionChange}
              />
              {errors.description && <div className="text-danger">{errors.description[0]}</div>}
            </div>
          </div>
        </div>

        {/* Images */}
        <div className="card shadow-sm border-0 mb-4">
          <div className="card-header bg-light fw-semibold">Images</div>
          <div className="card-body row g-3">
            <div className="col-md-6">
              <label className="form-label">Thumbnail</label>
              <input type="file" name="thumbnail" className="form-control" onChange={handleFileChange} />
            </div>
            <div className="col-md-6">
              <label className="form-label">Gallery Images</label>
              <input type="file" name="images" multiple className="form-control" onChange={handleFileChange} />
            </div>
          </div>
        </div>

        {/* Variants */}
        <div className="card shadow-sm border-0 mb-4">
          <div className="card-header bg-light fw-semibold d-flex justify-content-between align-items-center">
            <span>Product Variants</span>
            <button type="button" className="btn btn-sm btn-outline-primary" onClick={addVariant}>
              Add Variant
            </button>
          </div>
          <div className="card-body">
            <table className="table table-bordered align-middle">
              <thead className="table-light">
                <tr>
                  <th>Type</th>
                  <th>Name</th>
                  <th>Additional Price</th>
                  <th>Stock</th>
                  <th width="60">Action</th>
                </tr>
              </thead>
              <tbody>
                {form.variants.map((v, index) => (
                  <tr key={index}>
                    <td>
                      <input
                        type="text"
                        className="form-control"
                        value={v.variant_type}
                        onChange={(e) => handleVariantChange(index, "variant_type", e.target.value)}
                        placeholder="e.g. Color"
                        required
                      />
                    </td>
                    <td>
                      <input
                        type="text"
                        className="form-control"
                        value={v.variant_name}
                        onChange={(e) => handleVariantChange(index, "variant_name", e.target.value)}
                        placeholder="e.g. Black"
                        required
                      />
                    </td>
                    <td>
                      <input
                        type="number"
                        className="form-control"
                        value={v.additional_price}
                        onChange={(e) => handleVariantChange(index, "additional_price", e.target.value)}
                        step="0.01"
                      />
                    </td>
                    <td>
                      <input
                        type="number"
                        className="form-control"
                        value={v.variant_stock}
                        onChange={(e) => handleVariantChange(index, "variant_stock", e.target.value)}
                        min="0"
                      />
                    </td>
                    <td className="text-center">
                      <button type="button" className="btn btn-sm btn-danger" onClick={() => removeVariant(index)}>
                        Delete
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        <div className="text-end mt-4">
          <button type="submit" className="btn btn-primary px-4">
            Save Product
          </button>
        </div>
      </form>
    </div>
  );
};

export default CreateProduct;
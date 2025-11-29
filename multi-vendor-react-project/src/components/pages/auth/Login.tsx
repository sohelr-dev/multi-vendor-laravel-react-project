import { useEffect, useState } from "react";
import { defaultUserInt, type UserInt } from "../../interfaces/User.interfaces";
import api from "../../../config";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../../../context/AuthContext";

function Login() {
  const navigate = useNavigate();
  const { login } = useAuth(); // context login function
   console.log(login);
  const [user, setUser] = useState<UserInt>(defaultUserInt);
  const [error, setError] = useState<string>("");

  useEffect(() => {
    document.title = "Login";
  }, []);

  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault();
    setError("");

    api
      .post("login", user)
      .then((res) => {
        // Assuming API returns { user: {...}, token: "..." }
        const { user: userData, token } = res.data;

        // 1️⃣ Save in AuthContext + localStorage
        login(userData, token);

        // 2️⃣ Redirect after login
        navigate("/dashboard");
      })
      .catch((err) => {
        console.log(err);
        setError(err.response?.data?.message || "Invalid email or password");
      });
  };

  return (
    <div className="d-flex align-items-center justify-content-center vh-100 bg-light">
      <div className="card shadow" style={{ maxWidth: "380px", width: "100%" }}>
        <div className="card-body p-4">
          <h3 className="text-center mb-4 fw-bold">Sign In</h3>

          {/* Error message */}
          {error && <div className="alert alert-danger py-2">{error}</div>}

          <form onSubmit={handleLogin}>
            <div className="mb-3">
              <label className="form-label">Email</label>
              <input
                type="email"
                name="email"
                className="form-control"
                placeholder="Enter your email"
                value={user.email ?? ""}
                onChange={(e) => setUser({ ...user, email: e.target.value })}
                required
              />
            </div>

            <div className="mb-3">
              <label className="form-label">Password</label>
              <input
                type="password"
                name="password"
                className="form-control"
                placeholder="Enter your password"
                value={user.password ?? ""}
                onChange={(e) => setUser({ ...user, password: e.target.value })}
                required
              />
            </div>

            <div className="d-flex justify-content-between mb-3">
              <div className="form-check">
                <input className="form-check-input" type="checkbox" id="remember" />
                <label className="form-check-label" htmlFor="remember">
                  Remember me
                </label>
              </div>
              <a href="#" className="text-decoration-none">
                Forgot password?
              </a>
            </div>

            <button type="submit" className="btn btn-primary w-100 py-2">
              Login
            </button>
          </form>

          <p className="text-center mt-3">
            Don’t have an account?{" "}
            <a href="#" className="text-decoration-none">
              Register
            </a>
          </p>
        </div>
      </div>
    </div>
  );
}

export default Login;

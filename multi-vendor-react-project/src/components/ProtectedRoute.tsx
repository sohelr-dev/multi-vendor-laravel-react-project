import { Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import type { ReactNode } from "react";

const ProtectedRoute = ({ children }: { children: ReactNode }) => {
  const { user, loading } = useAuth();

  if (loading) return <div>Loading...</div>;

  if (!user) return <Navigate to="/login" replace />;
  if (user.role_id === 1) {
    return children; // for admin
  }
  if (user.role_id === 2) {
    return children; // for vendor
  }

  return <Navigate to="/404" replace />;
};

export default ProtectedRoute;

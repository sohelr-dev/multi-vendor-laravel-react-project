import { Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import type { JSX } from "react";

export default function GuestRoute({ children }: { children: JSX.Element }) {
  const { user, loading } = useAuth();

  if (loading) return <p>Loading...</p>;

  // Logged in user cannot access login/register pages
  if (user) {
    return <Navigate to="/dashboard" replace />;
  }

  return children;
}

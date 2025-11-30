import axios from "axios";
import { useAuth } from "./context/AuthContext";


//server

// const baseApiUrl="https://sohelit.com/rx-power-api/api/";
// const baseUrl ="https://sohelit.com/rx-power-api/";

//local
const token = localStorage.getItem('token');




const baseApiUrl ="http://127.0.0.1:8000/api/";
const baseUrl ="http://127.0.0.1:8000/";

export {baseUrl};

const api = axios.create({
    baseURL: baseApiUrl,
    headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization:`Bearer ${token}`
        
    }
});
export default api;
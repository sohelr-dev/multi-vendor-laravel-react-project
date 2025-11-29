import axios from "axios";


//server

// const baseApiUrl="https://sohelit.com/rx-power-api/api/";
// const baseUrl ="https://sohelit.com/rx-power-api/";

//local



const baseApiUrl ="http://127.0.0.1:8000/api/";
const baseUrl ="http://127.0.0.1:8000/";

export {baseUrl};

const api = axios.create({
    baseURL: baseApiUrl,
    headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        
        
    }
});
export default api;
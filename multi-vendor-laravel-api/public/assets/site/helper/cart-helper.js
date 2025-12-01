class CartHelper {
    constructor(storageKey = 'multi_vendor') {
        this.storageKey = storageKey;
        this.cart = this.loadCart();
    }

    loadCart() {
        const stored = localStorage.getItem(this.storageKey);
        return stored ? JSON.parse(stored) : [];
    }

    saveCart() {
        localStorage.setItem(this.storageKey, JSON.stringify(this.cart));
    }

    findIndex(productId) {
        return this.cart.findIndex(item => item.id == productId);
    }

    addItem(id, name, brand, price, discountPrice, quantity = 1, vendorId, category, status, unit ) {      // discount = 0
        id = parseInt(id);
        vendorId = parseInt(vendorId);
        price = parseFloat(price);
        quantity = parseInt(quantity);
        discountPrice = parseInt(discountPrice);
        unit = parseInt(unit);
        // discount = parseFloat(discount);

        const index = this.findIndex(id);
        if (index !== -1) {
            this.cart[index].quantity += quantity;
        } else {
            this.cart.push({ id, name, brand, price, discountPrice, quantity, vendorId, category, status, unit });
        }
        this.saveCart();
    }

    increaseQuantity(productId) {
        const index = this.findIndex(productId);
        if (index !== -1) {
            this.cart[index].quantity += 1;
            this.saveCart();
        }
    }

    decreaseQuantity(productId) {
        const index = this.findIndex(productId);
        if (index !== -1) {
            if (this.cart[index].quantity > 1) {
                this.cart[index].quantity -= 1;
            } else {
                this.cart.splice(index, 1);
            }
            this.saveCart();
        }
    }

    removeItem(productId) {
        const index = this.findIndex(productId);
        if (index !== -1) {
            this.cart.splice(index, 1);
            this.saveCart();
        }
    }

    emptyCart() {
        this.cart = [];
        localStorage.removeItem(this.storageKey);
    }

    getCart() {
        return this.cart;
    }

    getTotal() {
        return this.cart.reduce((total, item) => {
            const discounted = item.price - (item.discount || 0);
            return total + (discounted * item.quantity);
        }, 0).toFixed(2);
    }
}
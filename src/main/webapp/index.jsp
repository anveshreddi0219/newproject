<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>NexusShop — Modern UI</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root{
  --bg:#f8fafc;
  --primary:#0f172a;
  --accent:#6366f1;
  --card:#ffffff;
  --muted:#6b7280;
}

*{box-sizing:border-box;transition:all .2s ease}
body{
  margin:0;
  font-family:Inter,sans-serif;
  background:var(--bg);
  color:var(--primary);
}

.container{max-width:1200px;margin:auto;padding:20px}

/* HEADER */
header{
  position:sticky;top:0;
  backdrop-filter:blur(12px);
  background:rgba(255,255,255,0.7);
  border-bottom:1px solid #eee;
}
.header{
  display:flex;justify-content:space-between;align-items:center;
}
.brand{font-weight:700;font-size:20px}
.brand span{color:var(--accent)}

.search{
  background:#eef2ff;padding:8px 12px;border-radius:20px;
}
.search input{
  border:none;background:none;outline:none;
}

/* HERO */
.hero{
  text-align:center;
  padding:80px 20px;
  color:white;
  background:
  linear-gradient(135deg,rgba(15,23,42,.8),rgba(99,102,241,.6)),
  url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80');
}
.hero h1{font-size:42px}

/* GRID */
.grid{display:grid;gap:20px}
.products{grid-template-columns:repeat(auto-fit,minmax(250px,1fr))}

/* CARD */
.product{
  background:rgba(255,255,255,0.7);
  backdrop-filter:blur(10px);
  border-radius:16px;
  overflow:hidden;
  border:1px solid rgba(0,0,0,0.05);
}
.product:hover{
  transform:translateY(-8px) scale(1.02);
  box-shadow:0 20px 40px rgba(0,0,0,0.1);
}
.product img{
  width:100%;height:200px;object-fit:cover;
}
.product-body{padding:15px}
.price{font-weight:700}

button{
  cursor:pointer;border:none;
  padding:10px;border-radius:10px;
}
.add-btn{
  width:100%;
  background:linear-gradient(135deg,#6366f1,#8b5cf6);
  color:white;
}
</style>

</head>

<body>

<header>
<div class="container header">
<div class="brand">Nexus<span>Shop</span></div>

<div class="search">
<input id="searchInput" placeholder="Search...">
</div>
</div>
</header>

<section class="hero">
<h1>Premium Collections</h1>
<p>Modern UI • Fast Performance • Clean Design</p>
</section>

<div class="container">
<div class="grid products" id="products"></div>
</div>

<script>
const PRODUCTS=[
{title:"iPhone 14 Pro",price:999,img:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80"},
{title:"MacBook Pro",price:1999,img:"https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80"},
{title:"Headphones",price:399,img:"https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80"},
{title:"Sneakers",price:150,img:"https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80"}
];

const container=document.getElementById("products");

function render(list){
container.innerHTML=list.map(p=>`
<div class="product">
<img loading="lazy" src="${p.img}">
<div class="product-body">
<h4>${p.title}</h4>
<div class="price">$${p.price}</div>
<button class="add-btn">Add to Cart</button>
</div>
</div>
`).join('');
}

render(PRODUCTS);

/* FAST SEARCH (debounced) */
let t;
document.getElementById("searchInput").addEventListener("input",e=>{
clearTimeout(t);
t=setTimeout(()=>{
const q=e.target.value.toLowerCase();
render(PRODUCTS.filter(p=>p.title.toLowerCase().includes(q)));
},300);
});
</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Toast Notification Container -->
<div id="erp-toast-container"></div>

<!-- Loading Overlay for Algorithm / Operations -->
<div id="erp-loading-overlay">
    <div class="erp-spinner"></div>
    <h3 style="margin:0; font-size:20px; font-weight:700;">Generating College Timetable</h3>
    <p style="margin-top:8px; color:#cbd5e1; font-size:14px;">Running Genetic Algorithm iterations, evaluating hard & soft constraints...</p>
</div>

<!-- Core Scripts -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script>
function toggleSidebar() {
    var sb = document.getElementById('erpSidebar');
    if (sb) {
        sb.classList.toggle('active');
    }
}

function showToast(message, type) {
    type = type || 'success';
    var container = document.getElementById('erp-toast-container');
    if (!container) return;
    
    var toast = document.createElement('div');
    toast.className = 'erp-toast toast-' + type;
    
    var iconClass = 'fa-check-circle text-success';
    if (type === 'danger') iconClass = 'fa-exclamation-circle text-danger';
    if (type === 'warning') iconClass = 'fa-exclamation-triangle text-warning';
    
    toast.innerHTML = '<i class="fa ' + iconClass + '" style="font-size:18px;"></i><span>' + message + '</span>';
    container.appendChild(toast);
    
    setTimeout(function() {
        toast.style.transition = 'all 0.4s ease';
        toast.style.opacity = '0';
        toast.style.transform = 'translateY(10px)';
        setTimeout(function() {
            if (toast.parentNode) toast.parentNode.removeChild(toast);
        }, 400);
    }, 3500);
}

function showLoading(msg) {
    var overlay = document.getElementById('erp-loading-overlay');
    if (overlay) {
        if (msg) {
            var p = overlay.querySelector('p');
            if (p) p.innerText = msg;
        }
        overlay.style.display = 'flex';
    }
}

function hideLoading() {
    var overlay = document.getElementById('erp-loading-overlay');
    if (overlay) overlay.style.display = 'none';
}
</script>

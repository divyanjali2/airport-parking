(function () {
    'use strict';
    var endpoint = new URL('../../api/validate-promo.php', document.currentScript.src);
    var promo = null;
    var version = 0;
    var refresh = function () {};
    var input, status, summary, form;

    function clearPromo() {
        version++;
        promo = null;
        status.textContent = '';
        status.removeAttribute('data-state');
        summary.textContent = '';
        input.setCustomValidity('');
        refresh();
    }

    window.AirportBookingPromotions = {
        init: function (recalculate) {
            input = document.getElementById('promo-code');
            status = document.getElementById('promo-status');
            summary = document.getElementById('promo-savings');
            form = document.getElementById('booking-form');
            refresh = function () { summary.textContent = ''; recalculate(); };
            var button = document.getElementById('apply-promo');
            input.addEventListener('input', clearPromo);
            form.addEventListener('reset', function () {
                clearPromo();
                setTimeout(refresh, 0);
            });
            button.addEventListener('click', async function () {
                clearPromo();
                var code = input.value.trim().toUpperCase();
                if (!code) return;
                var request = version;
                button.disabled = true;
                status.textContent = 'Checking promo code...';
                status.dataset.state = 'checking';
                try {
                    var response = await fetch(endpoint, {
                        method: 'POST', body: new URLSearchParams({ code: code })
                    });
                    var result = await response.json();
                    if (request !== version) return;
                    if (!result.success) throw new Error(result.message);
                    promo = result.promo;
                    input.value = promo.code;
                    status.textContent = promo.name + ' applied.';
                    status.dataset.state = 'success';
                    refresh();
                } catch (error) {
                    if (request === version) {
                        status.textContent = error.message || 'Unable to check promo code. Please try again.';
                        status.dataset.state = 'error';
                        refresh();
                    }
                } finally {
                    button.disabled = false;
                }
            });
        },
        adjust: function (parking, extrasTotal) {
            if (!promo) { if (summary) summary.textContent = ''; return parking + extrasTotal; }
            var discount = promo.discount_type === 'percentage' ? parking * promo.amount / 100 : promo.amount;
            discount = Math.round(Math.min(parking, Math.max(0, discount)) * 100) / 100;
            var shuttle = 0;
            if (promo.free_shuttle) {
                form.querySelectorAll('.extra-service:checked').forEach(function (service) {
                    if (service.dataset.name.indexOf('Shuttle ') === 0) shuttle += Number(service.value);
                });
            }
            summary.textContent = 'Parking discount: LKR ' + discount.toLocaleString() +
                (shuttle ? '. Shuttle: FREE (saved LKR ' + shuttle.toLocaleString() + ').' : '');
            if (promo.free_shuttle && !shuttle) {
                var warning = document.createElement('span');
                warning.className = 'promo-shuttle-warning';
                warning.textContent = ' No shuttle selected; free shuttle is not included.';
                summary.appendChild(warning);
            }
            return Math.round((parking - discount + extrasTotal - shuttle) * 100) / 100;
        },
        code: function () { return input ? input.value.trim() : ''; }
    };
})();

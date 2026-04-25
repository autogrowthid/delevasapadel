$path = "C:\laragon\www\Website UMKM Manager\HTML\borneo_padel\index.html"
$content = Get-Content $path -Raw

$css = @"
        /* ================================================
           INTERACTIVE SCHEDULE
        ================================================ */
        .interactive-schedule {
            background: var(--brand-dark);
            border-radius: var(--r-xl);
            display: grid;
            grid-template-columns: 350px 1fr;
            gap: 40px;
            padding: 60px;
            box-shadow: 0 16px 40px rgba(0,0,0,0.4);
            margin-top: 30px;
        }
        
        .isched-left { display: flex; flex-direction: column; gap: 24px; }
        .isched-cal { background: #fff; color: var(--brand-dark); padding: 30px; border-radius: var(--r-lg); }
        .cal-header { font-family: var(--sport); font-size: 1.6rem; text-transform: uppercase; text-align: center; margin-bottom: 20px; }
        .cal-days { display: grid; grid-template-columns: repeat(7, 1fr); text-align: center; font-weight: 600; font-size: 0.8rem; margin-bottom: 16px; color: var(--muted); }
        .cal-grid { display: grid; grid-template-columns: repeat(7, 1fr); gap: 10px; text-align: center; }
        .cal-date { width: 34px; height: 34px; display: flex; align-items: center; justify-content: center; margin: 0 auto; border-radius: 50%; font-size: 0.95rem; font-weight: 600; cursor: pointer; transition: 0.2s; }
        .cal-date:hover:not(.muted):not(.active) { background: #f0f0f0; }
        .cal-date.muted { opacity: 0.3; pointer-events: none; }
        .cal-date.active { background: var(--brand-red); color: #fff; box-shadow: 0 4px 10px rgba(220,53,69,0.3); }

        .isched-toggle { display: flex; background: rgba(255,255,255,0.08); padding: 8px; border-radius: var(--r-pill); gap: 6px; }
        .tgl-btn { flex: 1; padding: 14px; border: none; background: transparent; color: #fff; border-radius: var(--r-pill); cursor: pointer; font-weight: 600; font-family: var(--sans); font-size: 1rem; transition: 0.3s; }
        .tgl-btn.active { background: var(--brand-red); box-shadow: 0 4px 12px rgba(0,0,0,0.2); }

        .isched-right { display: flex; flex-direction: column; gap: 24px; }
        .isched-header h3 { color: #fff; font-family: var(--sport); font-size: 2.2rem; }
        .isched-header p { color: rgba(255,255,255,0.6); font-size: 1.1rem; }

        .isched-slots { display: grid; grid-template-columns: repeat(auto-fill, minmax(130px, 1fr)); gap: 16px; }
        .slot-box { background: rgba(255,255,255,0.04); border: 1px solid rgba(255,255,255,0.08); padding: 16px; border-radius: var(--r-sm); text-align: center; cursor: pointer; transition: 0.3s; }
        .slot-time { display: block; font-family: var(--sport); font-size: 1.6rem; color: #fff; margin-bottom: 2px; }
        .slot-price { font-size: 0.85rem; font-weight: 700; display: block; }
        .slot-box.available .slot-price { color: #28a745; }
        .slot-box.booked .slot-price { color: #dc3545; }
        .slot-box.booked { opacity: 0.4; cursor: not-allowed; background: transparent; }
        .slot-box.available:hover { background: rgba(40,167,69,0.1); border-color: #28a745; transform: translateY(-2px); }

        /* ================================================
           REVIEWS & TESTIMONIALS (BENTOS)
        ================================================ */
        .review-bento { display: grid; grid-template-columns: 350px 1fr; gap: 30px; }
        .review-main { background: var(--brand-dark); color: #fff; border-radius: var(--r-xl); display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 50px 40px; text-align: center; box-shadow: 0 16px 32px rgba(0,0,0,0.3); }
        .review-score { font-family: var(--sport); font-size: 6rem; line-height: 1; margin-bottom: 5px; }
        .review-stars { color: #FFD700; font-size: 2.5rem; letter-spacing: 4px; margin-bottom: 16px; line-height: 1; }
        .review-desc { color: rgba(255,255,255,0.7); font-size: 0.95rem; font-weight: 500; }
        
        .review-list { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 20px; }
        .review-card { background: #fff; border-radius: var(--r-md); padding: 35px 30px; display: flex; flex-direction: column; justify-content: space-between; border: 1px solid rgba(0,0,0,0.06); box-shadow: 0 12px 24px rgba(0,0,0,0.06); transition: 0.3s; }
        .review-card:hover { transform: translateY(-4px); box-shadow: 0 16px 32px rgba(0,0,0,0.1); }
        .review-card p { font-size: 1.05rem; line-height: 1.6; color: var(--text-dark); margin-bottom: 24px; font-style: italic; font-weight: 500; }
        .rev-author { font-weight: 700; font-size: 0.95rem; color: var(--brand-red); text-transform: uppercase; font-family: var(--sport); letter-spacing: 0.05em; }

        @media (max-width: 900px) {
            .interactive-schedule { grid-template-columns: 1fr; padding: 40px 30px; gap: 30px; }
            .review-bento { grid-template-columns: 1fr; }
            .review-main { padding: 40px; }
        }
"@

$content = $content -replace "(?s)\/\* ================================================\s*RESPONSIVE", "$css`n`n        /* ================================================`n           RESPONSIVE"

# Overwrite old CSS block for .sched-table and .schedule-block to make sure they're removed
$content = $content -replace '(?s)\.schedule-block \{.*?\/* ==', "/* ==" 

$content = $content -replace "Rp 350\.000 / Jam", "Rp 300.000 / Jam"

Set-Content -Path $path -Value $content

$path = "C:\laragon\www\Website UMKM Manager\HTML\borneo_padel\index.html"
$content = Get-Content $path -Raw

# 1. Inject About Facilities
$facilitiesHtml = @"
                    <p class="about-desc">
                        Kami berkomitmen menjadi rumah bagi komunitas padel Kalimantan Selatan — dari pemula hingga atlet kompetitif.
                    </p>
                    <ul class="about-facilities">
                        <li><span>✔</span> Premium Padel Courts (Court 1 &amp; 2)</li>
                        <li><span>✔</span> Modern Lighting System</li>
                        <li><span>✔</span> Clean Shower Rooms (Free Soap &amp; Shampoo)</li>
                        <li><span>✔</span> Racket Rental (Regular &amp; Premium Options)</li>
                    </ul>
"@

$content = $content -replace '(?s)<p class="about-desc">\s*Kami berkomitmen menjadi rumah bagi komunitas padel Kalimantan Selatan [^<]* pemula hingga\s*atlet kompetitif\.\s*</p>', $facilitiesHtml


# 2. Inject Schedule HTML
$scheduleHtml = @"
            <div class="interactive-schedule">
                <!-- Left: Calendar -->
                <div class="isched-left reveal">
                    <div class="isched-cal">
                        <div class="cal-header">April 2026</div>
                        <div class="cal-days">
                            <span>S</span><span>M</span><span>T</span><span>W</span><span>T</span><span>F</span><span>S</span>
                        </div>
                        <div class="cal-grid">
                            <span class="cal-date muted">29</span><span class="cal-date muted">30</span><span class="cal-date muted">31</span>
                            <span class="cal-date">1</span><span class="cal-date">2</span><span class="cal-date">3</span><span class="cal-date">4</span>
                            <span class="cal-date">5</span><span class="cal-date">6</span><span class="cal-date">7</span><span class="cal-date">8</span><span class="cal-date active">9</span><span class="cal-date">10</span><span class="cal-date">11</span>
                            <span class="cal-date">12</span><span class="cal-date">13</span><span class="cal-date">14</span><span class="cal-date">15</span><span class="cal-date">16</span><span class="cal-date">17</span><span class="cal-date">18</span>
                        </div>
                    </div>
                    <div class="isched-toggle">
                        <button class="tgl-btn active">Court 1</button>
                        <button class="tgl-btn">Court 2</button>
                    </div>
                </div>
                
                <!-- Right: Time Slots -->
                <div class="isched-right reveal d1">
                    <div class="isched-header">
                        <h3>Pilih Slot Waktu</h3>
                        <p>Kamis, 9 April 2026</p>
                    </div>
                    <div class="isched-slots">
                        <div class="slot-box available" onclick="bookSlot('06:00', 'Rp 200.000')"><span class="slot-time">06:00</span><span class="slot-price">Rp 200.000</span></div>
                        <div class="slot-box available" onclick="bookSlot('07:00', 'Rp 200.000')"><span class="slot-time">07:00</span><span class="slot-price">Rp 200.000</span></div>
                        <div class="slot-box booked"><span class="slot-time">08:00</span><span class="slot-price">Booked</span></div>
                        <div class="slot-box booked"><span class="slot-time">09:00</span><span class="slot-price">Booked</span></div>
                        <div class="slot-box available" onclick="bookSlot('10:00', 'Rp 200.000')"><span class="slot-time">10:00</span><span class="slot-price">Rp 200.000</span></div>
                        <div class="slot-box available" onclick="bookSlot('11:00', 'Rp 200.000')"><span class="slot-time">11:00</span><span class="slot-price">Rp 200.000</span></div>
                        <div class="slot-box available" onclick="bookSlot('12:00', 'Rp 200.000')"><span class="slot-time">12:00</span><span class="slot-price">Rp 200.000</span></div>
                        <div class="slot-box booked"><span class="slot-time">13:00</span><span class="slot-price">Booked</span></div>
                        <div class="slot-box booked"><span class="slot-time">14:00</span><span class="slot-price">Booked</span></div>
                        <div class="slot-box booked"><span class="slot-time">15:00</span><span class="slot-price">Booked</span></div>
                        <div class="slot-box available" onclick="bookSlot('16:00', 'Rp 250.000')"><span class="slot-time">16:00</span><span class="slot-price">Rp 250.000</span></div>
                        <div class="slot-box booked"><span class="slot-time">17:00</span><span class="slot-price">Booked</span></div>
                        <div class="slot-box booked"><span class="slot-time">18:00</span><span class="slot-price">Booked</span></div>
                        <div class="slot-box available" onclick="bookSlot('19:00', 'Rp 300.000')"><span class="slot-time">19:00</span><span class="slot-price">Rp 300.000</span></div>
                        <div class="slot-box booked"><span class="slot-time">20:00</span><span class="slot-price">Booked</span></div>
                        <div class="slot-box booked"><span class="slot-time">21:00</span><span class="slot-price">Booked</span></div>
                        <div class="slot-box available" onclick="bookSlot('22:00', 'Rp 250.000')"><span class="slot-time">22:00</span><span class="slot-price">Rp 250.000</span></div>
                    </div>
                </div>
            </div>
"@
$content = $content -replace '(?s)<div class="schedule-block">.*?</div>\s*</div>\s*</div>\s*</section>', "$scheduleHtml</div></section>"


# 3. Replace Testimonials
$testiHtml = @"
    <!-- ════════ REVIEWS & TESTIMONIALS ════════ -->
    <section id="reviews">
        <div class="testi-wrap">
            <div class="testi-hdr reveal">
                <p class="testi-hdr__label">Kata Mereka</p>
                <h2 class="testi-hdr__title">Komunitas yang berbicara.</h2>
            </div>
            <div class="review-bento">
                <div class="review-main reveal">
                    <div class="review-score">4.9</div>
                    <div class="review-stars">★★★★★</div>
                    <div class="review-desc">Berdasarkan Ulasan Google Maps</div>
                </div>
                <div class="review-list">
                    <div class="review-card reveal d1">
                        <p>"Padel paling nyaman di Kota Banjarmasin. Terdapat shower room yang dilengkapi amenities sabun dan sampo."</p>
                        <div class="rev-author">- Aditya R.</div>
                    </div>
                    <div class="review-card reveal d2">
                        <p>"Fasilitas tampak sangat bersih, dengan pencahayaan optimal... Jaringan berwarna oranye memberikan kontras menarik."</p>
                        <div class="rev-author">- Fathur N.</div>
                    </div>
                    <div class="review-card reveal d3">
                        <p>"Fasilitas kamar mandi bagus, dan raket banyak pilihan untuk disewa 😍"</p>
                        <div class="rev-author">- Dinda K.</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
"@
$content = $content -replace '(?s)<!-- ════════ TESTIMONIALS ════════ -->.*?</footer>', "$testiHtml`n`n    <footer class=`"footer`">"


# 4. Footer & Prices & JS
$content = $content -replace 'Jl\.\s*HKSN\s*Komp\.\s*Amd[^<]*', 'Jl. HKSN Komp. Amd Permai, Alalak Utara, Kec. Banjarmasin Utara, Kota Banjarmasin, Kalimantan Selatan 70127'

$jsInject = @"
    <script>
        function bookSlot(time, price) {
            alert("Lanjutkan Booking jam " + time + " dengan harga " + price + "?");
        }
    </script>
</body>
"@
$content = $content -replace '</body>', $jsInject



Set-Content -Path $path -Value $content

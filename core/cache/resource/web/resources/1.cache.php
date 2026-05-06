<?php  return array (
  'resourceClass' => 'MODX\\Revolution\\modDocument',
  'resource' => 
  array (
    'id' => 1,
    'type' => 'document',
    'pagetitle' => 'Home',
    'longtitle' => 'Congratulations!',
    'description' => '',
    'alias' => 'index',
    'link_attributes' => '',
    'published' => 1,
    'pub_date' => 0,
    'unpub_date' => 0,
    'parent' => 0,
    'isfolder' => 0,
    'introtext' => '',
    'content' => '<body id = "homePage">
    <!-- Home hero starts -->
    <section id="homeHero">
        <div class="swiper homeHeroSwiper">
            <div class="swiper-wrapper">
                <!-- Slide 1 -->
                <div class="swiper-slide">
                    <img src="assets/images/home-hero/img-1.webp" alt="Airport Parking"class="img-fluid">
                </div>

                <!-- Slide 2 -->
                <div class="swiper-slide">
                    <img src="assets/images/home-hero/img-2.webp" alt="Airport Parking" class="img-fluid">
                </div>

                <!-- Slide 3 -->
                <div class="swiper-slide">
                    <img src="assets/images/home-hero/img-3.webp" alt="Airport Parking" class="img-fluid">
                </div>
            </div>
        </div>

        <!-- Hero Content -->
        <div class="homehero-content">
            <h1 data-aos="fade-down-right" data-aos-duration="1000">
                Secure Parking  <br class="d-md-none">
                Designed <br class="d-none d-md-block">
                Around Your Journey
            </h1>
            <p class="mt-3" data-aos="fade-down-left" data-aos-duration="1000">
                Secure, convenient parking designed to keep your journey smooth.<br>
                Reliable access, peace of mind, and hassle-free arrivals and returns.
            </p>
            <a href="#reserve-slots" class="mt-3">Reserve Your Space</a>
        </div>

    </section>
    <!-- Home hero ends -->

    <!-- Who we are section starts -->
    <section id="who-we-are" class="py-5">
        <div class="container">
            <div class="row d-flex align-items-center justify-content-center">
                <div class="col-12 col-md-6 col-lg-8">
                    <h2 class="heading">Who We Are</h2>
                    <p class="supportive-text">Airport Parking Service</p>
                    <p><b>Airportparking.lk</b> is a flagship venture of <b><a href="https://explore.vacations/" style ="text-decoration:none; color: black;">Explore Holdings</a></b> and a pioneer in introducing dedicated airport parking services in Sri Lanka. As one of the first providers to establish this concept, we set the industry standard for secure, convenient, and cost-effective airport parking solutions. Our facility is strategically located in close proximity to Bandaranaike International Airport, enabling travelers to park with confidence and reach the terminal quickly and effortlessly.</p>
                    <p class="mb-0">With 24/7 surveillance, controlled access, and a professionally trained operations team, we ensure the highest level of safety and reliability for every vehicle entrusted to us. Supported by flexible parking options and responsive customer service, Airportparking.lk continues to lead the industry by delivering a seamless, stress-free parking experience that allows our customers to begin and end their journeys with complete peace of mind.
                    </p>
                </div>
                 <div class="col-12 col-md-6 col-lg-4">
                    <img src="assets/images/who-we-are.jpeg" alt="Who we are image" class="img-fluid rounded-3 mt-4 mt-md-0">
                </div>
            </div>
        </div>
    </section>
    <!-- Who we are section ends -->

    <!-- Why Choose Us section starts -->
    <section id="why-choose-us" class="py-3">
        <div class="container">
            <div class="row g-5 justify-content-center">
                <div class="col-12 col-md-6 col-lg-3 why-choose">
                    <img src="assets/images/why-choose-us/img-1.png" alt="Why choose us image" class="img-fluid">
                    <p>SAFE AND SECURE PARKING AREAS</p>
                </div>
                <div class="col-12 col-md-6 col-lg-3 why-choose">
                    <img src="assets/images/why-choose-us/img-2.png" alt="Why choose us image" class="img-fluid">
                    <p>FRIENDLY AND EFFICIENT STAFF</p>
                </div>
                <div class="col-12 col-md-6 col-lg-3 why-choose">
                    <img src="assets/images/why-choose-us/img-3.png" alt="Why choose us image" class="img-fluid">
                    <p>ONLINE BOOKING FACILITY</p>
                </div>
                <div class="col-12 col-md-6 col-lg-3 why-choose">
                    <img src="assets/images/why-choose-us/img-4.png" alt="Why choose us image" class="img-fluid">
                    <p>24/7 CCTV SURVEILLANCE</p>
                </div>
            </div>
        </div>
    </section>
    <!-- Why Choose Us section ends -->

    <!--Reserve Slots section starts -->
    <section id="reserve-slots" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="heading text-center">Reserve Your Parking Slot Today</h2>
                    <p class="supportive-text text-center">Book your parking space in advance and enjoy a hassle-free experience.</p>
                </div>
                <hr>

                <p class="text-danger text-center mb-2 fw-bold">Pick your trip dates to see available parking!</p>  
                <div class="date-picker-container d-flex justify-content-center align-items-center flex-wrap gap-3 mb-3">
                    <div class="date-picker-item">
                        <label for="initial-start-date" class="form-label">Start Date</label>
                        <input type="date" id="initial-start-date" class="form-control rounded-0">
                    </div>

                    <div class="date-picker-item">
                        <label for="initial-end-date" class="form-label">End Date</label>
                        <input type="date" id="initial-end-date" class="form-control rounded-0">
                    </div>

                    <div class="date-picker-item align-self-end">
                        <button id="check-availability" class="btn btn-success rounded-0" style="background-color:#001c35; border-color: transparent;">Check Availability</button>
                    </div>
                    <div class="date-picker-item align-self-end" style="min-width: auto;">
                        <button id="clear-dates" class="btn btn-outline-danger">
                            <i class="bi bi-trash3"></i>                        
                        </button>
                    </div>
                </div>

                <hr>              
                <div class="col-12 d-flex justify-content-center">
                    <div class="parking-building-wrapper">
                        <!-- Legend -->
                        <div class="parking-legend">
                            <div class="legend-item">
                                <span class="available"></span> Available
                            </div>
                            <div class="legend-item">
                                <span class="selected"></span> Selected
                            </div>
                            <div class="legend-item">
                                <span class="booked"></span> Booked
                            </div>
                        </div>

                        <!-- Parking layout -->
                        <div class="floor active">
                            <!-- ALL BOOKED banner -->
                            <div class="all-booked-banner d-none">
                                <div class="all-booked-card">
                                    <div class="all-booked-icon">
                                        <i class="bi bi-exclamation-circle-fill"></i>
                                    </div>
                                    <div class="all-booked-text">
                                        <h5>Basement Parking Fully Booked</h5>
                                        <p>
                                            We’re sorry for the inconvenience. All Basement Parking slots are currently booked
                                            for your selected dates. Please check the available Surface Parking slots below.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Main parking layout -->
                            <div class="main-layout booked-zone">
                                <!-- Row 1 -->
                                <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                </div>

                                <!-- Row 2 -->
                                <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                </div>

                                <!-- Row 3 -->
                                <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                </div>

                                <!-- Row 4 -->
                                <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                </div>

                                <!-- Row 5 -->
                                <!-- <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                    </div>
                                </div> -->

                                <!-- Row 6 -->
                                <!-- <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                    </div>
                                </div> -->
                            </div>

                            <!-- Outer slots -->
                            <div class="outer-slots-section">
                                <h4 class="outer-slot-title">Surface Parking Area</h4>
                                <p class="outer-slot-subtitle">Limited slots available near perimeter</p>

                                <div class="outer-layout">
                                    <!-- Row 1 -->
                                    <div class="row parking-row">
                                        <div class="bay left">
                                            <button class="slot outer-slot" data-slot="G1"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G2"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G3"><i class="bi bi-car-front icon-car"></i></button>
                                        </div>

                                        <div class="driveway small">Driveway</div>

                                        <div class="bay right">
                                            <button class="slot outer-slot" data-slot="G4"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G5"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G6"><i class="bi bi-car-front icon-car"></i></button>
                                        </div>
                                    </div>

                                    <!-- Row 2 -->
                                    <div class="row parking-row">
                                        <div class="bay left">
                                            <button class="slot outer-slot" data-slot="G7"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G8"><i class="bi bi-car-front icon-car"></i></button>
                                        </div>

                                        <div class="driveway small">Driveway</div>

                                        <div class="bay right">
                                            <button class="slot outer-slot" data-slot="G9"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G10"><i class="bi bi-car-front icon-car"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Entry/Exit -->
                            <div class="entry-exit">
                                <span class="marker entry">Entry</span>
                                <span class="marker exit">Exit</span>
                            </div>
                        </div>

<div class="extend-note">
    Need to extend your booking after booking?  
    Create an account via <strong>My Account</strong> in the navigation bar and update your end date easily.  
    <br>⚠️ Additional charges will be applied based on the extended duration.
</div>

                        <!-- Booking Modal -->
                        <div id="booking-modal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <h3>Reserve Your Parking Slot</h3>
                                <hr>
                                <form id="booking-form" class="booking-form-grid">
                                    <div class="form-group d-none">
                                        <label>Slot Number</label>
                                        <input type="text" id="slot-number" readonly>
                                    </div>

                                   <div class="form-group">
                                        <label>Vehicle Number <span class="text-danger">*</span></label>
                                        <input type="text" id="vehicle_number" placeholder="Enter Vehicle Number" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Vehicle Type <span class="text-danger">*</span></label>
                                        <select class="form-select" id="vehicle-type" required>
                                            <option value="">Select vehicle</option>
                                            <option value="car">Car</option>
                                            <option value="van">Van</option>
                                            <option value="bus">Bus</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Flight Number <span class="text-danger">*</span></label>
                                        <input type="text" id="flight-number" placeholder="Enter Flight Number" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Start Date & Time <span class="text-danger">*</span></label>
                                        <input type="datetime-local" id="start-date" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>End Date & Time <span class="text-danger">*</span></label>
                                        <input type="datetime-local" id="end-date" class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Name <span class="text-danger">*</span></label>
                                        <input type="text" id="user-name" placeholder="Enter Name" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Hometown <span class="text-danger">*</span></label>
                                        <input type="text" id="hometown" placeholder="Enter Hometown" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Email <span class="text-danger">*</span></label>
                                        <input type="email" id="user-email" placeholder="Enter Email" required>
                                    </div>
                                    <div class="form-group mb-0 mt-2">
                                        <label>WhatsApp Number <span class="text-danger">*</span></label>
                                        <input type="number" id="whatsapp-number" class="form-control" required placeholder="94771234567 (without + or spaces)">
                                    </div>

                                    <div class="form-group mb-0 mt-2">
                                        <label>Air Ticket Image <span class="text-danger">*</span></label>
                                        <input type="file" id="air_ticket_image_url" name="air_ticket_image_url" accept="image/*" required>
                                    </div>

                                    <div class="form-group mb-0 mt-2">
                                        <label>Passport Copy Image <span class="text-danger">*</span></label>
                                        <input type="file" id="passport_copy_image_url" name="passport_copy_image_url" accept="image/*" required>
                                    </div>

                                    <div class="form-group mb-0 mt-2">
                                        <label>Passenger Count <span class="text-danger">*</span></label>
                                        <input type="number" id="passenger_count" name="passenger_count" class="form-control" min="1" placeholder="Enter Passenger Count" required>
                                    </div>
                                    <div class="extra-services mt-2">
                                        <p><strong>Extra Services</strong></p>

                                        <label class="checkbox-item">
                                            <input type="checkbox" class="extra-service" value="1000" data-name="Body Wash & Vacuum">
                                            Body Wash & Vacuum (LKR 1,000)
                                        </label>

                                        <label class="checkbox-item">
                                            <input type="checkbox" class="extra-service" value="500" data-name="Shuttle One Way">
                                            Shuttle One Way (LKR 500)
                                        </label>

                                        <label class="checkbox-item">
                                            <input type="checkbox" class="extra-service" value="1000" data-name="Shuttle Two Way">
                                            Shuttle Two Way (LKR 1,000)
                                        </label>
                                    </div>
                                    <div class="price-summary mt-2">
                                        <p>
                                            <strong>Total Days:</strong>
                                            <span id="total-days-text">0</span>
                                        </p>
                                        <p>
                                            <strong>Price per Day:</strong>
                                            LKR 1,000
                                        </p>
                                        <p class="total-amount">
                                            <strong>Total Price:</strong>
                                            LKR <span id="total-price-text">0</span>
                                        </p>
                                    </div>
                                    <div class="booking-notes mt-3">
                                        <p class="mb-0"><strong>Important Notice:</strong></p>
                                        <ul class="whitespace-nowrap">
                                           <li>Please arrive at least <strong>one (1) hour early</strong> to allow time for vehicle handover and necessary procedures.</li>
                                            <li>If the end time is extended, a 2-hour grace applies; thereafter, 25% (2–4h), 50% (4–6h), 75% (6–8h), or 100% (>8h) of the daily rate will be charged.</li>
                                        </ul>
                                    </div>
                                    <button type="submit" id="submit-booking-btn">Book Slot</button>
                                    <!-- <div class="booking-notes mt-3">
                                        <p><strong>Important Notice:</strong></p>
                                        <ul>
                                            <li>Please arrive at our office at least <strong>three (3) hours prior</strong> to your scheduled departure time.</li>
                                            <li>Transfers are arranged to ensure arrival within the recommended check-in period.</li>
                                        </ul>
                                    </div> -->
                                </form>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Reserve Slots section ends -->

    <!-- Booking Tips section starts -->
    <section id="booking-tips" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="heading text-center">Booking Tips</h2>
                    <p class="supportive-text text-center">Follow these steps for a smooth parking experience.</p>
                </div>
            </div>
           <div class="row mt-4">
                <div class="col-md-8">
                    <ul class="booking-tips-timeline">
                        <li>
                            <span class="tip-circle">01</span>
                            <div class="tip-content">Reserve your parking slot in advance</div>
                        </li>
                        <li>
                            <span class="tip-circle">02</span>
                            <div class="tip-content">Double-check your start and end dates</div>
                        </li>
                        <li>
                            <span class="tip-circle">03</span>
                            <div class="tip-content">Keep your reference number safe</div>
                        </li>
                        <li>
                            <span class="tip-circle">04</span>
                            <div class="tip-content">Select extra services if required</div>
                        </li>
                        <li>
                            <span class="tip-circle">05</span>
                            <div class="tip-content">Arrive early for a smooth check-in</div>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4 d-flex justify-content-center align-items-center">
                    <img src="assets/images/booking-tips.webp" alt="Booking tips image" class="img-fluid">
                </div>
            </div>
        </div>
    </section>
    <!-- Booking Tips section ends -->

    <!-- Our Services section starts -->
    <section id="our-services" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="heading text-center">Our Services</h2>
                    <p class="supportive-text text-center">Comprehensive parking solutions tailored to your needs.</p>
                </div>
            </div>
            <div class="row justify-content-center mt-4">
                <!-- Airport Parking Services -->
                <div class="col-12 col-md-6 col-lg-3 mb-4">
                    <div class="service-card">
                        <img src="assets/images/services/airport-parking-area.webp" alt="Airport Parking Services" class="img-fluid">
                        <div class="service-content">
                            <h3>Airport Parking Services</h3>
                            <p class="service-short text-center">
                                Secure airport parking 10 minutes from BIA.
                            </p>

                            <button class="toggle-service">View Details</button>

                            <div class="service-details">
                                <p>
                                    Airport Parking Sri Lanka is one of the wing companies of
                                    Explore Holdings. We are the only airport parking provider
                                    in Sri Lanka for overseas travelers, located just
                                    10 minutes from Bandaranayake International Airport with
                                    optional shuttle services. <a href="https://airportparking.lk/">Airport Parking</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tour Operations in Sri Lanka -->
                <div class="col-12 col-md-6 col-lg-3 mb-4">
                    <div class="service-card">
                        <img src="assets/images/services/airport-taxi-service.webp"
                            alt="Tour Operations in Sri Lanka"
                            class="img-fluid">

                        <div class="service-content">
                            <h3>Tour Operations in Sri Lanka</h3>
                            <p class="service-short text-center">
                                Tailor-made Sri Lanka holiday experiences.
                            </p>

                            <button class="toggle-service">View Details</button>

                            <div class="service-details">
                                <p>
                                    Explore Vacations offers customized Sri Lanka tours with
                                    customer-friendly guided experiences. Every client is
                                    treated as a VIP, ensuring a memorable and enriching
                                    journey across the island. <a href="https://explore.vacations/" target="_blank">Explore Vacations</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Car Rental Services -->
                <div class="col-12 col-md-6 col-lg-3 mb-4">
                    <div class="service-card">
                        <img src="assets/images/services/car-rental-services.webp"
                            alt="Car Rental Services"
                            class="img-fluid">

                        <div class="service-content">
                            <h3>Car Rental Services</h3>
                            <p class="service-short text-center">
                                Premium vehicles at affordable rates.
                            </p>

                            <button class="toggle-service">View Details</button>

                            <div class="service-details">
                                <p>
                                    SR Rent A Car provides a fleet of over 100 luxury vehicles
                                    suitable for business travel and leisure trips. Our
                                    smooth rental process ensures convenience and comfort
                                    for every journey. <a href="https://srilankarentacar.lk/" target="_blank">SR Rent a Car</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Airport Taxi Service -->
                <div class="col-12 col-md-6 col-lg-3 mb-4">
                    <div class="service-card">
                        <img src="assets/images/services/hotel-booking-service.webp"
                            alt="Airport Taxi Service"
                            class="img-fluid">

                        <div class="service-content">
                            <h3>Airport Taxi Service</h3>
                            <p class="service-short text-center">
                                Seamless airport-hotel transfers.
                            </p>

                            <button class="toggle-service">View Details</button>

                            <div class="service-details">
                                <p>
                                    SR Transfers offers reliable airport taxi services with
                                    competitive rates. Our customer-focused approach ensures
                                    timely and comfortable transfers between the airport
                                    and your destination. <a href="https://srilankatransfer.lk/" target="_blank">SR Transfers</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Our Services section ends -->

    <!-- Testimonials section starts -->
    <section id="testimonials" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="heading text-center">What Our Customers Say</h2>
                    <p class="supportive-text text-center">Real feedback from our valued clients.</p>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-12">
                    <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner" id="testimonialContainer"></div>

                        <button class="carousel-control-prev" type="button"
                            data-bs-target="#testimonialCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>

                        <button class="carousel-control-next" type="button"
                            data-bs-target="#testimonialCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- View More Button -->
            <div class="row">
                <div class="col text-center">
                    <a href="https://www.google.com/maps/place/Airport+Parking+Sri+Lanka/@7.1292859,79.8732382,17z/data=!4m8!3m7!1s0x3ae2f16b53527527:0xfa15e5c2744b0e7f!8m2!3d7.1292859!4d79.8758131!9m1!1b1!16s%2Fg%2F11j30yjgyb?entry=ttu&g_ep=EgoyMDI2MDEwNC4wIKXMDSoASAFQAw%3D%3D" class="btn btn-outline-primary px-4" target="_blank" rel="noopener noreferrer">
                        View More Reviews
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonials section ends -->

    <script>
        fetch(\'assets/data/testimonials.json\')
            .then(response => response.json())
            .then(data => {
                const container = document.getElementById(\'testimonialContainer\');
                const wordLimit = 20;

                const limitWords = (text, limit) => {
                    const words = text.split(\' \');
                    return words.length > limit
                        ? words.slice(0, limit).join(\' \') + \'...\'
                        : text;
                };

                const firstFour = data.slice(0, 4);

                let slideHTML = `
                    <div class="carousel-item active">
                        <div class="row">
                `;

                firstFour.forEach(item => {
                    slideHTML += `
                        <div class="col-12 col-md-6 col-lg-3 mb-4">
                            <div class="testimonial-card text-center p-4 h-100">
                                <p class="testimonial-text">
                                    "${limitWords(item.text, wordLimit)}"
                                </p>
                                <h5 class="testimonial-name mt-3">- ${item.name}</h5>
                                <p class="testimonial-role">${item.role}</p>
                            </div>
                        </div>
                    `;
                });

                slideHTML += `
                        </div>
                    </div>
                `;

                container.insertAdjacentHTML(\'beforeend\', slideHTML);
            })
            .catch(err => console.error(\'Error loading testimonials:\', err));
    </script>

    <script>
        window.addEventListener(\'load\', () =>{
            if(window.location.hash === "#reserve-slots") {
                const section = document.getElementById("reserve-slots");
                if(section) section.scrollIntoView({ behavior: "smooth" });
            }
        });
    </script>
     
    <script>
        document.querySelectorAll(\'.toggle-service\').forEach(button => {
            button.addEventListener(\'click\', () => {
                const card = button.closest(\'.service-card\');
                card.classList.toggle(\'active\');
                button.textContent = card.classList.contains(\'active\')
                    ? \'Hide Details\'
                    : \'View Details\';
            });
        });
    </script>

    <script>
        document.addEventListener(\'DOMContentLoaded\', () => {
            const slots = Array.from(document.querySelectorAll(\'#reserve-slots .slot\'));
            const modal = document.getElementById(\'booking-modal\');
            const closeModal = modal.querySelector(\'.close\');
            const bookingForm = document.getElementById(\'booking-form\');

            const slotInput = document.getElementById(\'slot-number\');
            const vehicleTypeInput = document.getElementById(\'vehicle-type\');
            const hometownInput = document.getElementById(\'hometown\');

            const startDateInput = document.getElementById(\'start-date\');
            const endDateInput = document.getElementById(\'end-date\');

            const totalDaysText = document.getElementById(\'total-days-text\');
            const totalPriceText = document.getElementById(\'total-price-text\');

            const extraServices = document.querySelectorAll(\'.extra-service\');

            const PRICE_PER_DAY = 1000;

            const now = new Date();
            const tzOffset = now.getTimezoneOffset() * 60000; 
            const localISO = new Date(now - tzOffset).toISOString().slice(0,16); 

            startDateInput.min = localISO;
            endDateInput.min = localISO;

            function calculateTotal() {
                if (!startDateInput.value || !endDateInput.value) {
                    totalDaysText.textContent = \'0 days 0 hours\';
                    totalPriceText.textContent = \'0.00\';
                    return;
                }

                const start = new Date(startDateInput.value);
                const end = new Date(endDateInput.value);

                if (end <= start) {
                    totalDaysText.textContent = \'0 days 0 hours\';
                    totalPriceText.textContent = \'0.00\';
                    return;
                }

                // Difference in milliseconds
                const diffMs = end - start;

                // Total hours
                const totalHours = diffMs / (1000 * 60 * 60);

                // Calculate full days and remaining hours
                const fullDays = Math.floor(totalHours / 24);
                const remainingHours = Math.round(totalHours % 24);

                // Total days as float for pricing
                const totalDaysFloat = totalHours / 24;

                // Price: multiply by PRICE_PER_DAY proportionally
                let total = totalDaysFloat * PRICE_PER_DAY;

                // Add extra services
                extraServices.forEach(service => {
                    if (service.checked) {
                        total += parseInt(service.value, 10);
                    }
                });

                // Update display
                totalDaysText.textContent = `${fullDays} day${fullDays !== 1 ? \'s\' : \'\'} ${remainingHours} hour${remainingHours !== 1 ? \'s\' : \'\'}`;
                const roundedTotal = Math.round(total);
                totalPriceText.textContent = `${roundedTotal.toLocaleString()}`;
            }

            startDateInput.addEventListener(\'change\', () => {
                endDateInput.min = startDateInput.value;
                calculateTotal();
            });

            endDateInput.addEventListener(\'change\', calculateTotal);

            extraServices.forEach(service => {
                service.addEventListener(\'change\', calculateTotal);
            });

            /* Slot click */
            slots.forEach(slot => {
                slot.addEventListener(\'click\', () => {
                    if (slot.classList.contains(\'booked\') || slot.disabled) return;

                    bookingForm.reset();
                    slotInput.value = slot.dataset.slot;
                    totalDaysText.textContent = \'0\';
                    totalPriceText.textContent = \'0\';

                    modal.style.display = \'block\';
                });
            });

            /*  Close modal */
            closeModal.addEventListener(\'click\', () => {
                modal.style.display = \'none\';
                bookingForm.reset();
            });

            window.addEventListener(\'click\', e => {
                if (e.target === modal) {
                modal.style.display = \'none\';
                bookingForm.reset();
                }
            });

            bookingForm.addEventListener(\'submit\', e => {
                e.preventDefault();

                const submitBtn = document.getElementById(\'submit-booking-btn\');
                submitBtn.disabled = true;
                submitBtn.textContent = \'Reserving...\';

                // Calculate exact total hours for fractional days
                const start = new Date(startDateInput.value);
                const end = new Date(endDateInput.value);
                const totalHours = (end - start) / (1000 * 60 * 60); // total hours
                const totalDaysFloat = totalHours / 24;

                // Calculate total price including extra services
                let totalPrice = totalDaysFloat * PRICE_PER_DAY;
                extraServices.forEach(service => {
                    if (service.checked) totalPrice += parseInt(service.value, 10);
                });

                const payload = {
                    slot: slotInput.value,
                    vehicleType: document.getElementById(\'vehicle-type\').value,
                    hometown: document.getElementById(\'hometown\').value,
                    startDate: startDateInput.value,
                    endDate: endDateInput.value,
                    days: totalDaysFloat.toFixed(2),      
                    pricePerDay: PRICE_PER_DAY,
                    totalPrice: Math.round(totalPrice),
                    extras: Array.from(document.querySelectorAll(\'.extra-service:checked\'))
                        .map(e => e.dataset.name),
                    flightNumber: document.getElementById(\'flight-number\').value,
                    vehicleNumber: document.getElementById(\'vehicle_number\').value,
                    whatsapp: document.getElementById(\'whatsapp-number\').value,
                    passenger_count: document.getElementById(\'passenger_count\').value,
                    name: document.getElementById(\'user-name\').value,
                    email: document.getElementById(\'user-email\').value
                };

                const formData = new FormData();

                Object.keys(payload).forEach(key => {
                    if (Array.isArray(payload[key])) {
                        payload[key].forEach(val => formData.append(`${key}[]`, val));
                    } else {
                        formData.append(key, payload[key]);
                    }
                });

                // Append images
                formData.append(\'air_ticket_image_url\', document.getElementById(\'air_ticket_image_url\').files[0]);
                formData.append(\'passport_copy_image_url\', document.getElementById(\'passport_copy_image_url\').files[0]);
                console.log(\'========== BOOKING DEBUG ==========\');
                console.log(\'slotInput.value:\', slotInput.value);
                console.log(\'vehicleType:\', payload.vehicleType);
                console.log(\'startDate:\', payload.startDate);
                console.log(\'endDate:\', payload.endDate);

                console.log(\'---- Payload Object ----\');
                console.log(payload);

                console.log(\'---- FormData Contents ----\');
                for (const [key, value] of formData.entries()) {
                    console.log(key, value);
                }
                console.log(\'===================================\');

                                fetch(\'assets/includes/save-booking.php\', {
                                    method: \'POST\',
                                    body: formData
                                })
                .then(res => res.text())
                .then(t => { console.log("RAW RESPONSE:", t); return JSON.parse(t); })
                                .then(response => {
                                    if (!response.success) {
                                        submitBtn.disabled = false;
                                        submitBtn.textContent = \'Book Slot\';

                                        Swal.fire({
                                            icon: \'error\',
                                            title: \'Booking Failed\',
                                            //text: response.message || \'Unknown error\',
                text: response.detail || response.error || \'Unknown error\'

                        });
                        return;
                    }

                    Swal.fire({
                        icon: \'success\',
                        title: \'Booking Successful\',
                        html: `
                            Slot <strong>${payload.slot}</strong> reserved.<br>
                            Reference: <strong>${response.reference}</strong>
                        `
                    }).then(() => {
                        window.open(response.pdf_url, \'_blank\', \'noopener,noreferrer\');
                        setTimeout(() => window.location.reload(), 1000);
                    });

                    const slotElement = slots.find(s => s.dataset.slot === payload.slot);
                    if (slotElement) slotElement.classList.add(\'booked\');

                    modal.style.display = \'none\';
                    bookingForm.reset();
                })
                .catch(error => {
                    submitBtn.disabled = false;
                    submitBtn.textContent = \'Book Slot\';

                    Swal.fire({
                        icon: \'error\',
                        title: \'Server Error\',
                        text: error.message,
                    });
                    console.error(error);
                });
            });
        });
    </script>

    <script>
        document.addEventListener(\'DOMContentLoaded\', () => {
            const outerSlots = Array.from(document.querySelectorAll(\'#reserve-slots .outer-slot\'));
            const startInput = document.getElementById(\'initial-start-date\');
            const endInput = document.getElementById(\'initial-end-date\');
            const checkBtn = document.getElementById(\'check-availability\');
            const clearBtn = document.getElementById(\'clear-dates\');
            const banner = document.querySelector(\'.all-booked-banner\');
            let lastStart = \'\';
            let lastEnd = \'\';

            function shuffle(array) {
                const arr = [...array];
                for (let i = arr.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [arr[i], arr[j]] = [arr[j], arr[i]];
                }
                return arr;
            }

            function resetOuterSlots() {
                outerSlots.forEach(slot => {
                    slot.classList.remove(\'booked\', \'selected\');
                    slot.disabled = true;
                });
            }

            function showRandomOuterAvailability() {
                resetOuterSlots();

                const shuffledSlots = shuffle(outerSlots);

                const bookedCount = 7;

                const bookedSlots = shuffledSlots.slice(0, bookedCount);
                const availableSlot = shuffledSlots[bookedCount];

                bookedSlots.forEach(slot => {
                    slot.classList.add(\'booked\');
                    slot.disabled = true;
                });

                if (availableSlot) {
                    availableSlot.classList.remove(\'booked\');
                    availableSlot.disabled = false;
                }
            }

            resetOuterSlots();

            clearBtn.addEventListener(\'click\', () => {
                startInput.value = \'\';
                endInput.value = \'\';
                lastStart = \'\';
                lastEnd = \'\';

                resetOuterSlots();

                banner.classList.add(\'d-none\');
            });

            checkBtn.addEventListener(\'click\', () => {
                const start = startInput.value;
                const end = endInput.value;

                if (!start || !end) {
                    alert(\'Please select both start and end dates.\');
                    return;
                }

                if (end < start) {
                    alert(\'End date must be after start date.\');
                    return;
                }

                if (start !== lastStart || end !== lastEnd) {
                    lastStart = start;
                    lastEnd = end;

                    showRandomOuterAvailability();

                    banner.classList.remove(\'d-none\');
                }
            });
        });
    </script>

    <script>
        const heroSwiper = new Swiper(".homeHeroSwiper", {
            loop: true,
            autoplay: {
                delay: 3500,
                disableOnInteraction: false,
            },
            speed: 800,
            effect: "fade",
            fadeEffect: {
                crossFade: true
            }
        });
    </script>

    <script>
        document.addEventListener(\'DOMContentLoaded\', () => {
            const start = document.getElementById(\'initial-start-date\');
            const end = document.getElementById(\'initial-end-date\');

            const today = new Date().toISOString().split(\'T\')[0]; // YYYY-MM-DD

            start.min = end.min = today;

            start.addEventListener(\'change\', () => {
                end.min = start.value || today;
            });
        });
    </script>
</body>',
    'richtext' => 1,
    'template' => 2,
    'menuindex' => 0,
    'searchable' => 1,
    'cacheable' => 1,
    'createdby' => 1,
    'createdon' => 1766399981,
    'editedby' => 1,
    'editedon' => 1777014671,
    'deleted' => 0,
    'deletedon' => 0,
    'deletedby' => 0,
    'publishedon' => 0,
    'publishedby' => 0,
    'menutitle' => '',
    'content_dispo' => 0,
    'hidemenu' => 0,
    'class_key' => 'MODX\\Revolution\\modDocument',
    'context_key' => 'web',
    'content_type' => 1,
    'uri' => '',
    'uri_override' => 0,
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'properties' => NULL,
    'alias_visible' => 1,
    '_content' => '<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?php echo WEBSITE_DESCRIPTION; ?>">
    <meta name="keywords" content="<?php echo WEBSITE_KEYWORDS; ?>">
    <meta name="author" content="Airport Parking">
    <meta name="robots" content="index, follow">

    <!-- Page Title -->
    <title>Airport Parking</title>

    <!-- Favicon -->
    <link rel="icon" href="assets/images/favicon.ico?v=2" type="image/x-icon">

    <!-- Canonical URL -->
    <link rel="canonical" href="">

    <!-- Fontawesome -->
    <link rel="stylesheet" href="node_modules/@fortawesome/fontawesome-free/css/all.min.css">
    <!-- Swiper JS -->
    <link rel="stylesheet" href="node_modules/swiper/swiper-bundle.min.css">
    <!-- AOS Animations CSS -->
    <link href="node_modules/aos/dist/aos.css" rel="stylesheet">
    <!-- Lightgallery -->
    <link type="text/css" rel="stylesheet" href="node_modules/lightgallery/css/lightgallery-bundle.css" />
    <!-- Stylesheets -->
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/variables.css">
    <link rel="stylesheet" href="assets/css/overrides.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
     <!-- SweetAlert2 CSS & JS -->
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Bootstrap -->
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Swiper JS -->
    <script src="node_modules/swiper/swiper-bundle.min.js"></script>
    <!-- AOS Animations JS -->
    <script src="node_modules/aos/dist/aos.js"></script>
    <!-- Whatsapp widget JS -->
    <script src="assets/js/whatsapp-widget.js"></script>
    <!-- Lightgallery -->
    <script src="node_modules/lightgallery/lightgallery.umd.js"></script>
    <!-- Custom JS -->
    <script src="assets/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Scroll to Top Button -->
    <button id="scrollTopBtn" title="Go to top"><img src="assets/images/top-icon.png" alt="top-icon" class="img-fluid" style="
        width: 20px;
        height: 20px;
        display: flex;
    "></button>

</body>

<script>
    //Get the button
    const scrollTopBtn = document.getElementById("scrollTopBtn");

    // Show button when user scrolls down 100px
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
            scrollTopBtn.style.display = "block";
        } else {
            scrollTopBtn.style.display = "none";
        }
    }

    // Scroll to top smoothly when clicked
    scrollTopBtn.addEventListener(\'click\', () => {
        window.scrollTo({
            top: 0,
            behavior: \'smooth\'
        });
    });
</script>

</html>
<header>

    <!-- Top Info Bar -->
    <div class="top-bar">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="top-left">
                <a href="https://wa.me/94761414557" target="_blank" class="top-link">
                    <i class="fa-brands fa-whatsapp fa-lg"></i> +94 76 1414 557
                </a>
                <a href="mailto:info@airportparking.lk" class="top-link">
                    <i class="fa-regular fa-envelope fa-lg"></i> info@airportparking.lk
                </a>
            </div>
            <div class="top-right">
                <a href="https://www.skyscanner.net/" class="top-link" target="_blank">
                    <i class="fa-solid fa-plane"></i> Flight Info
                </a>
                <a href="https://srilankarentacar.com/" class="top-btn" target="_blank">
                    Rent a Car
                </a>
            </div>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg p-lg-0">
        <div class="container d-flex align-items-center justify-content-between">

            <a class="navbar-brand" href="./">
                <img src="assets/images/logo.png" alt="Explore Vacations | Logo">
            </a>

            <button class="navbar-toggler border-0" type="button"
                data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar">
                <i class="fa-solid fa-bars"></i>
            </button>

            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title">Explore Vacations</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav ms-auto align-items-lg-center">
                        <li class="nav-item"><a class="nav-link active" href="./">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=2">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=4">FAQ</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=5">Gallery</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=3">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=6">My Account</a></li>

                    </ul>
                </div>
            </div>

        </div>
    </nav>

</header>

<script>
window.addEventListener("scroll", function () {
    const navbar = document.querySelector(".navbar");

    if (window.scrollY > 50) {
        navbar.classList.add("scrolled");
    } else {
        navbar.classList.remove("scrolled");
    }
});
</script>


<body id = "homePage">
    <!-- Home hero starts -->
    <section id="homeHero">
        <div class="swiper homeHeroSwiper">
            <div class="swiper-wrapper">
                <!-- Slide 1 -->
                <div class="swiper-slide">
                    <img src="assets/images/home-hero/img-1.webp" alt="Airport Parking"class="img-fluid">
                </div>

                <!-- Slide 2 -->
                <div class="swiper-slide">
                    <img src="assets/images/home-hero/img-2.webp" alt="Airport Parking" class="img-fluid">
                </div>

                <!-- Slide 3 -->
                <div class="swiper-slide">
                    <img src="assets/images/home-hero/img-3.webp" alt="Airport Parking" class="img-fluid">
                </div>
            </div>
        </div>

        <!-- Hero Content -->
        <div class="homehero-content">
            <h1 data-aos="fade-down-right" data-aos-duration="1000">
                Secure Parking  <br class="d-md-none">
                Designed <br class="d-none d-md-block">
                Around Your Journey
            </h1>
            <p class="mt-3" data-aos="fade-down-left" data-aos-duration="1000">
                Secure, convenient parking designed to keep your journey smooth.<br>
                Reliable access, peace of mind, and hassle-free arrivals and returns.
            </p>
            <a href="#reserve-slots" class="mt-3">Reserve Your Space</a>
        </div>

    </section>
    <!-- Home hero ends -->

    <!-- Who we are section starts -->
    <section id="who-we-are" class="py-5">
        <div class="container">
            <div class="row d-flex align-items-center justify-content-center">
                <div class="col-12 col-md-6 col-lg-8">
                    <h2 class="heading">Who We Are</h2>
                    <p class="supportive-text">Airport Parking Service</p>
                    <p><b>Airportparking.lk</b> is a flagship venture of <b><a href="https://explore.vacations/" style ="text-decoration:none; color: black;">Explore Holdings</a></b> and a pioneer in introducing dedicated airport parking services in Sri Lanka. As one of the first providers to establish this concept, we set the industry standard for secure, convenient, and cost-effective airport parking solutions. Our facility is strategically located in close proximity to Bandaranaike International Airport, enabling travelers to park with confidence and reach the terminal quickly and effortlessly.</p>
                    <p class="mb-0">With 24/7 surveillance, controlled access, and a professionally trained operations team, we ensure the highest level of safety and reliability for every vehicle entrusted to us. Supported by flexible parking options and responsive customer service, Airportparking.lk continues to lead the industry by delivering a seamless, stress-free parking experience that allows our customers to begin and end their journeys with complete peace of mind.
                    </p>
                </div>
                 <div class="col-12 col-md-6 col-lg-4">
                    <img src="assets/images/who-we-are.jpeg" alt="Who we are image" class="img-fluid rounded-3 mt-4 mt-md-0">
                </div>
            </div>
        </div>
    </section>
    <!-- Who we are section ends -->

    <!-- Why Choose Us section starts -->
    <section id="why-choose-us" class="py-3">
        <div class="container">
            <div class="row g-5 justify-content-center">
                <div class="col-12 col-md-6 col-lg-3 why-choose">
                    <img src="assets/images/why-choose-us/img-1.png" alt="Why choose us image" class="img-fluid">
                    <p>SAFE AND SECURE PARKING AREAS</p>
                </div>
                <div class="col-12 col-md-6 col-lg-3 why-choose">
                    <img src="assets/images/why-choose-us/img-2.png" alt="Why choose us image" class="img-fluid">
                    <p>FRIENDLY AND EFFICIENT STAFF</p>
                </div>
                <div class="col-12 col-md-6 col-lg-3 why-choose">
                    <img src="assets/images/why-choose-us/img-3.png" alt="Why choose us image" class="img-fluid">
                    <p>ONLINE BOOKING FACILITY</p>
                </div>
                <div class="col-12 col-md-6 col-lg-3 why-choose">
                    <img src="assets/images/why-choose-us/img-4.png" alt="Why choose us image" class="img-fluid">
                    <p>24/7 CCTV SURVEILLANCE</p>
                </div>
            </div>
        </div>
    </section>
    <!-- Why Choose Us section ends -->

    <!--Reserve Slots section starts -->
    <section id="reserve-slots" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="heading text-center">Reserve Your Parking Slot Today</h2>
                    <p class="supportive-text text-center">Book your parking space in advance and enjoy a hassle-free experience.</p>
                </div>
                <hr>

                <p class="text-danger text-center mb-2 fw-bold">Pick your trip dates to see available parking!</p>  
                <div class="date-picker-container d-flex justify-content-center align-items-center flex-wrap gap-3 mb-3">
                    <div class="date-picker-item">
                        <label for="initial-start-date" class="form-label">Start Date</label>
                        <input type="date" id="initial-start-date" class="form-control rounded-0">
                    </div>

                    <div class="date-picker-item">
                        <label for="initial-end-date" class="form-label">End Date</label>
                        <input type="date" id="initial-end-date" class="form-control rounded-0">
                    </div>

                    <div class="date-picker-item align-self-end">
                        <button id="check-availability" class="btn btn-success rounded-0" style="background-color:#001c35; border-color: transparent;">Check Availability</button>
                    </div>
                    <div class="date-picker-item align-self-end" style="min-width: auto;">
                        <button id="clear-dates" class="btn btn-outline-danger">
                            <i class="bi bi-trash3"></i>                        
                        </button>
                    </div>
                </div>

                <hr>              
                <div class="col-12 d-flex justify-content-center">
                    <div class="parking-building-wrapper">
                        <!-- Legend -->
                        <div class="parking-legend">
                            <div class="legend-item">
                                <span class="available"></span> Available
                            </div>
                            <div class="legend-item">
                                <span class="selected"></span> Selected
                            </div>
                            <div class="legend-item">
                                <span class="booked"></span> Booked
                            </div>
                        </div>

                        <!-- Parking layout -->
                        <div class="floor active">
                            <!-- ALL BOOKED banner -->
                            <div class="all-booked-banner d-none">
                                <div class="all-booked-card">
                                    <div class="all-booked-icon">
                                        <i class="bi bi-exclamation-circle-fill"></i>
                                    </div>
                                    <div class="all-booked-text">
                                        <h5>Basement Parking Fully Booked</h5>
                                        <p>
                                            We’re sorry for the inconvenience. All Basement Parking slots are currently booked
                                            for your selected dates. Please check the available Surface Parking slots below.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Main parking layout -->
                            <div class="main-layout booked-zone">
                                <!-- Row 1 -->
                                <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                </div>

                                <!-- Row 2 -->
                                <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                </div>

                                <!-- Row 3 -->
                                <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                </div>

                                <!-- Row 4 -->
                                <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front icon-car"></i></button>
                                    </div>
                                </div>

                                <!-- Row 5 -->
                                <!-- <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                    </div>
                                </div> -->

                                <!-- Row 6 -->
                                <!-- <div class="row parking-row">
                                    <div class="bay left">
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <span class="marker elevator"></span>
                                    </div>
                                    <div class="driveway">Driveway</div>
                                    <div class="bay right">
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                        <button class="slot booked"><i class="bi bi-car-front"></i></button>
                                    </div>
                                </div> -->
                            </div>

                            <!-- Outer slots -->
                            <div class="outer-slots-section">
                                <h4 class="outer-slot-title">Surface Parking Area</h4>
                                <p class="outer-slot-subtitle">Limited slots available near perimeter</p>

                                <div class="outer-layout">
                                    <!-- Row 1 -->
                                    <div class="row parking-row">
                                        <div class="bay left">
                                            <button class="slot outer-slot" data-slot="G1"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G2"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G3"><i class="bi bi-car-front icon-car"></i></button>
                                        </div>

                                        <div class="driveway small">Driveway</div>

                                        <div class="bay right">
                                            <button class="slot outer-slot" data-slot="G4"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G5"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G6"><i class="bi bi-car-front icon-car"></i></button>
                                        </div>
                                    </div>

                                    <!-- Row 2 -->
                                    <div class="row parking-row">
                                        <div class="bay left">
                                            <button class="slot outer-slot" data-slot="G7"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G8"><i class="bi bi-car-front icon-car"></i></button>
                                        </div>

                                        <div class="driveway small">Driveway</div>

                                        <div class="bay right">
                                            <button class="slot outer-slot" data-slot="G9"><i class="bi bi-car-front icon-car"></i></button>
                                            <button class="slot outer-slot" data-slot="G10"><i class="bi bi-car-front icon-car"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Entry/Exit -->
                            <div class="entry-exit">
                                <span class="marker entry">Entry</span>
                                <span class="marker exit">Exit</span>
                            </div>
                        </div>

<div class="extend-note">
    Need to extend your booking after booking?  
    Create an account via <strong>My Account</strong> in the navigation bar and update your end date easily.  
    <br>⚠️ Additional charges will be applied based on the extended duration.
</div>

                        <!-- Booking Modal -->
                        <div id="booking-modal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <h3>Reserve Your Parking Slot</h3>
                                <hr>
                                <form id="booking-form" class="booking-form-grid">
                                    <div class="form-group d-none">
                                        <label>Slot Number</label>
                                        <input type="text" id="slot-number" readonly>
                                    </div>

                                   <div class="form-group">
                                        <label>Vehicle Number <span class="text-danger">*</span></label>
                                        <input type="text" id="vehicle_number" placeholder="Enter Vehicle Number" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Vehicle Type <span class="text-danger">*</span></label>
                                        <select class="form-select" id="vehicle-type" required>
                                            <option value="">Select vehicle</option>
                                            <option value="car">Car</option>
                                            <option value="van">Van</option>
                                            <option value="bus">Bus</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Flight Number <span class="text-danger">*</span></label>
                                        <input type="text" id="flight-number" placeholder="Enter Flight Number" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Start Date & Time <span class="text-danger">*</span></label>
                                        <input type="datetime-local" id="start-date" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>End Date & Time <span class="text-danger">*</span></label>
                                        <input type="datetime-local" id="end-date" class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Name <span class="text-danger">*</span></label>
                                        <input type="text" id="user-name" placeholder="Enter Name" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Hometown <span class="text-danger">*</span></label>
                                        <input type="text" id="hometown" placeholder="Enter Hometown" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Email <span class="text-danger">*</span></label>
                                        <input type="email" id="user-email" placeholder="Enter Email" required>
                                    </div>
                                    <div class="form-group mb-0 mt-2">
                                        <label>WhatsApp Number <span class="text-danger">*</span></label>
                                        <input type="number" id="whatsapp-number" class="form-control" required placeholder="94771234567 (without + or spaces)">
                                    </div>

                                    <div class="form-group mb-0 mt-2">
                                        <label>Air Ticket Image <span class="text-danger">*</span></label>
                                        <input type="file" id="air_ticket_image_url" name="air_ticket_image_url" accept="image/*" required>
                                    </div>

                                    <div class="form-group mb-0 mt-2">
                                        <label>Passport Copy Image <span class="text-danger">*</span></label>
                                        <input type="file" id="passport_copy_image_url" name="passport_copy_image_url" accept="image/*" required>
                                    </div>

                                    <div class="form-group mb-0 mt-2">
                                        <label>Passenger Count <span class="text-danger">*</span></label>
                                        <input type="number" id="passenger_count" name="passenger_count" class="form-control" min="1" placeholder="Enter Passenger Count" required>
                                    </div>
                                    <div class="extra-services mt-2">
                                        <p><strong>Extra Services</strong></p>

                                        <label class="checkbox-item">
                                            <input type="checkbox" class="extra-service" value="1000" data-name="Body Wash & Vacuum">
                                            Body Wash & Vacuum (LKR 1,000)
                                        </label>

                                        <label class="checkbox-item">
                                            <input type="checkbox" class="extra-service" value="500" data-name="Shuttle One Way">
                                            Shuttle One Way (LKR 500)
                                        </label>

                                        <label class="checkbox-item">
                                            <input type="checkbox" class="extra-service" value="1000" data-name="Shuttle Two Way">
                                            Shuttle Two Way (LKR 1,000)
                                        </label>
                                    </div>
                                    <div class="price-summary mt-2">
                                        <p>
                                            <strong>Total Days:</strong>
                                            <span id="total-days-text">0</span>
                                        </p>
                                        <p>
                                            <strong>Price per Day:</strong>
                                            LKR 1,000
                                        </p>
                                        <p class="total-amount">
                                            <strong>Total Price:</strong>
                                            LKR <span id="total-price-text">0</span>
                                        </p>
                                    </div>
                                    <div class="booking-notes mt-3">
                                        <p class="mb-0"><strong>Important Notice:</strong></p>
                                        <ul class="whitespace-nowrap">
                                           <li>Please arrive at least <strong>one (1) hour early</strong> to allow time for vehicle handover and necessary procedures.</li>
                                            <li>If the end time is extended, a 2-hour grace applies; thereafter, 25% (2–4h), 50% (4–6h), 75% (6–8h), or 100% (>8h) of the daily rate will be charged.</li>
                                        </ul>
                                    </div>
                                    <button type="submit" id="submit-booking-btn">Book Slot</button>
                                    <!-- <div class="booking-notes mt-3">
                                        <p><strong>Important Notice:</strong></p>
                                        <ul>
                                            <li>Please arrive at our office at least <strong>three (3) hours prior</strong> to your scheduled departure time.</li>
                                            <li>Transfers are arranged to ensure arrival within the recommended check-in period.</li>
                                        </ul>
                                    </div> -->
                                </form>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Reserve Slots section ends -->

    <!-- Booking Tips section starts -->
    <section id="booking-tips" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="heading text-center">Booking Tips</h2>
                    <p class="supportive-text text-center">Follow these steps for a smooth parking experience.</p>
                </div>
            </div>
           <div class="row mt-4">
                <div class="col-md-8">
                    <ul class="booking-tips-timeline">
                        <li>
                            <span class="tip-circle">01</span>
                            <div class="tip-content">Reserve your parking slot in advance</div>
                        </li>
                        <li>
                            <span class="tip-circle">02</span>
                            <div class="tip-content">Double-check your start and end dates</div>
                        </li>
                        <li>
                            <span class="tip-circle">03</span>
                            <div class="tip-content">Keep your reference number safe</div>
                        </li>
                        <li>
                            <span class="tip-circle">04</span>
                            <div class="tip-content">Select extra services if required</div>
                        </li>
                        <li>
                            <span class="tip-circle">05</span>
                            <div class="tip-content">Arrive early for a smooth check-in</div>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4 d-flex justify-content-center align-items-center">
                    <img src="assets/images/booking-tips.webp" alt="Booking tips image" class="img-fluid">
                </div>
            </div>
        </div>
    </section>
    <!-- Booking Tips section ends -->

    <!-- Our Services section starts -->
    <section id="our-services" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="heading text-center">Our Services</h2>
                    <p class="supportive-text text-center">Comprehensive parking solutions tailored to your needs.</p>
                </div>
            </div>
            <div class="row justify-content-center mt-4">
                <!-- Airport Parking Services -->
                <div class="col-12 col-md-6 col-lg-3 mb-4">
                    <div class="service-card">
                        <img src="assets/images/services/airport-parking-area.webp" alt="Airport Parking Services" class="img-fluid">
                        <div class="service-content">
                            <h3>Airport Parking Services</h3>
                            <p class="service-short text-center">
                                Secure airport parking 10 minutes from BIA.
                            </p>

                            <button class="toggle-service">View Details</button>

                            <div class="service-details">
                                <p>
                                    Airport Parking Sri Lanka is one of the wing companies of
                                    Explore Holdings. We are the only airport parking provider
                                    in Sri Lanka for overseas travelers, located just
                                    10 minutes from Bandaranayake International Airport with
                                    optional shuttle services. <a href="https://airportparking.lk/">Airport Parking</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tour Operations in Sri Lanka -->
                <div class="col-12 col-md-6 col-lg-3 mb-4">
                    <div class="service-card">
                        <img src="assets/images/services/airport-taxi-service.webp"
                            alt="Tour Operations in Sri Lanka"
                            class="img-fluid">

                        <div class="service-content">
                            <h3>Tour Operations in Sri Lanka</h3>
                            <p class="service-short text-center">
                                Tailor-made Sri Lanka holiday experiences.
                            </p>

                            <button class="toggle-service">View Details</button>

                            <div class="service-details">
                                <p>
                                    Explore Vacations offers customized Sri Lanka tours with
                                    customer-friendly guided experiences. Every client is
                                    treated as a VIP, ensuring a memorable and enriching
                                    journey across the island. <a href="https://explore.vacations/" target="_blank">Explore Vacations</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Car Rental Services -->
                <div class="col-12 col-md-6 col-lg-3 mb-4">
                    <div class="service-card">
                        <img src="assets/images/services/car-rental-services.webp"
                            alt="Car Rental Services"
                            class="img-fluid">

                        <div class="service-content">
                            <h3>Car Rental Services</h3>
                            <p class="service-short text-center">
                                Premium vehicles at affordable rates.
                            </p>

                            <button class="toggle-service">View Details</button>

                            <div class="service-details">
                                <p>
                                    SR Rent A Car provides a fleet of over 100 luxury vehicles
                                    suitable for business travel and leisure trips. Our
                                    smooth rental process ensures convenience and comfort
                                    for every journey. <a href="https://srilankarentacar.lk/" target="_blank">SR Rent a Car</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Airport Taxi Service -->
                <div class="col-12 col-md-6 col-lg-3 mb-4">
                    <div class="service-card">
                        <img src="assets/images/services/hotel-booking-service.webp"
                            alt="Airport Taxi Service"
                            class="img-fluid">

                        <div class="service-content">
                            <h3>Airport Taxi Service</h3>
                            <p class="service-short text-center">
                                Seamless airport-hotel transfers.
                            </p>

                            <button class="toggle-service">View Details</button>

                            <div class="service-details">
                                <p>
                                    SR Transfers offers reliable airport taxi services with
                                    competitive rates. Our customer-focused approach ensures
                                    timely and comfortable transfers between the airport
                                    and your destination. <a href="https://srilankatransfer.lk/" target="_blank">SR Transfers</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Our Services section ends -->

    <!-- Testimonials section starts -->
    <section id="testimonials" class="py-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="heading text-center">What Our Customers Say</h2>
                    <p class="supportive-text text-center">Real feedback from our valued clients.</p>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-12">
                    <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner" id="testimonialContainer"></div>

                        <button class="carousel-control-prev" type="button"
                            data-bs-target="#testimonialCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>

                        <button class="carousel-control-next" type="button"
                            data-bs-target="#testimonialCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- View More Button -->
            <div class="row">
                <div class="col text-center">
                    <a href="https://www.google.com/maps/place/Airport+Parking+Sri+Lanka/@7.1292859,79.8732382,17z/data=!4m8!3m7!1s0x3ae2f16b53527527:0xfa15e5c2744b0e7f!8m2!3d7.1292859!4d79.8758131!9m1!1b1!16s%2Fg%2F11j30yjgyb?entry=ttu&g_ep=EgoyMDI2MDEwNC4wIKXMDSoASAFQAw%3D%3D" class="btn btn-outline-primary px-4" target="_blank" rel="noopener noreferrer">
                        View More Reviews
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonials section ends -->

    <script>
        fetch(\'assets/data/testimonials.json\')
            .then(response => response.json())
            .then(data => {
                const container = document.getElementById(\'testimonialContainer\');
                const wordLimit = 20;

                const limitWords = (text, limit) => {
                    const words = text.split(\' \');
                    return words.length > limit
                        ? words.slice(0, limit).join(\' \') + \'...\'
                        : text;
                };

                const firstFour = data.slice(0, 4);

                let slideHTML = `
                    <div class="carousel-item active">
                        <div class="row">
                `;

                firstFour.forEach(item => {
                    slideHTML += `
                        <div class="col-12 col-md-6 col-lg-3 mb-4">
                            <div class="testimonial-card text-center p-4 h-100">
                                <p class="testimonial-text">
                                    "${limitWords(item.text, wordLimit)}"
                                </p>
                                <h5 class="testimonial-name mt-3">- ${item.name}</h5>
                                <p class="testimonial-role">${item.role}</p>
                            </div>
                        </div>
                    `;
                });

                slideHTML += `
                        </div>
                    </div>
                `;

                container.insertAdjacentHTML(\'beforeend\', slideHTML);
            })
            .catch(err => console.error(\'Error loading testimonials:\', err));
    </script>

    <script>
        window.addEventListener(\'load\', () =>{
            if(window.location.hash === "#reserve-slots") {
                const section = document.getElementById("reserve-slots");
                if(section) section.scrollIntoView({ behavior: "smooth" });
            }
        });
    </script>
     
    <script>
        document.querySelectorAll(\'.toggle-service\').forEach(button => {
            button.addEventListener(\'click\', () => {
                const card = button.closest(\'.service-card\');
                card.classList.toggle(\'active\');
                button.textContent = card.classList.contains(\'active\')
                    ? \'Hide Details\'
                    : \'View Details\';
            });
        });
    </script>

    <script>
        document.addEventListener(\'DOMContentLoaded\', () => {
            const slots = Array.from(document.querySelectorAll(\'#reserve-slots .slot\'));
            const modal = document.getElementById(\'booking-modal\');
            const closeModal = modal.querySelector(\'.close\');
            const bookingForm = document.getElementById(\'booking-form\');

            const slotInput = document.getElementById(\'slot-number\');
            const vehicleTypeInput = document.getElementById(\'vehicle-type\');
            const hometownInput = document.getElementById(\'hometown\');

            const startDateInput = document.getElementById(\'start-date\');
            const endDateInput = document.getElementById(\'end-date\');

            const totalDaysText = document.getElementById(\'total-days-text\');
            const totalPriceText = document.getElementById(\'total-price-text\');

            const extraServices = document.querySelectorAll(\'.extra-service\');

            const PRICE_PER_DAY = 1000;

            const now = new Date();
            const tzOffset = now.getTimezoneOffset() * 60000; 
            const localISO = new Date(now - tzOffset).toISOString().slice(0,16); 

            startDateInput.min = localISO;
            endDateInput.min = localISO;

            function calculateTotal() {
                if (!startDateInput.value || !endDateInput.value) {
                    totalDaysText.textContent = \'0 days 0 hours\';
                    totalPriceText.textContent = \'0.00\';
                    return;
                }

                const start = new Date(startDateInput.value);
                const end = new Date(endDateInput.value);

                if (end <= start) {
                    totalDaysText.textContent = \'0 days 0 hours\';
                    totalPriceText.textContent = \'0.00\';
                    return;
                }

                // Difference in milliseconds
                const diffMs = end - start;

                // Total hours
                const totalHours = diffMs / (1000 * 60 * 60);

                // Calculate full days and remaining hours
                const fullDays = Math.floor(totalHours / 24);
                const remainingHours = Math.round(totalHours % 24);

                // Total days as float for pricing
                const totalDaysFloat = totalHours / 24;

                // Price: multiply by PRICE_PER_DAY proportionally
                let total = totalDaysFloat * PRICE_PER_DAY;

                // Add extra services
                extraServices.forEach(service => {
                    if (service.checked) {
                        total += parseInt(service.value, 10);
                    }
                });

                // Update display
                totalDaysText.textContent = `${fullDays} day${fullDays !== 1 ? \'s\' : \'\'} ${remainingHours} hour${remainingHours !== 1 ? \'s\' : \'\'}`;
                const roundedTotal = Math.round(total);
                totalPriceText.textContent = `${roundedTotal.toLocaleString()}`;
            }

            startDateInput.addEventListener(\'change\', () => {
                endDateInput.min = startDateInput.value;
                calculateTotal();
            });

            endDateInput.addEventListener(\'change\', calculateTotal);

            extraServices.forEach(service => {
                service.addEventListener(\'change\', calculateTotal);
            });

            /* Slot click */
            slots.forEach(slot => {
                slot.addEventListener(\'click\', () => {
                    if (slot.classList.contains(\'booked\') || slot.disabled) return;

                    bookingForm.reset();
                    slotInput.value = slot.dataset.slot;
                    totalDaysText.textContent = \'0\';
                    totalPriceText.textContent = \'0\';

                    modal.style.display = \'block\';
                });
            });

            /*  Close modal */
            closeModal.addEventListener(\'click\', () => {
                modal.style.display = \'none\';
                bookingForm.reset();
            });

            window.addEventListener(\'click\', e => {
                if (e.target === modal) {
                modal.style.display = \'none\';
                bookingForm.reset();
                }
            });

            bookingForm.addEventListener(\'submit\', e => {
                e.preventDefault();

                const submitBtn = document.getElementById(\'submit-booking-btn\');
                submitBtn.disabled = true;
                submitBtn.textContent = \'Reserving...\';

                // Calculate exact total hours for fractional days
                const start = new Date(startDateInput.value);
                const end = new Date(endDateInput.value);
                const totalHours = (end - start) / (1000 * 60 * 60); // total hours
                const totalDaysFloat = totalHours / 24;

                // Calculate total price including extra services
                let totalPrice = totalDaysFloat * PRICE_PER_DAY;
                extraServices.forEach(service => {
                    if (service.checked) totalPrice += parseInt(service.value, 10);
                });

                const payload = {
                    slot: slotInput.value,
                    vehicleType: document.getElementById(\'vehicle-type\').value,
                    hometown: document.getElementById(\'hometown\').value,
                    startDate: startDateInput.value,
                    endDate: endDateInput.value,
                    days: totalDaysFloat.toFixed(2),      
                    pricePerDay: PRICE_PER_DAY,
                    totalPrice: Math.round(totalPrice),
                    extras: Array.from(document.querySelectorAll(\'.extra-service:checked\'))
                        .map(e => e.dataset.name),
                    flightNumber: document.getElementById(\'flight-number\').value,
                    vehicleNumber: document.getElementById(\'vehicle_number\').value,
                    whatsapp: document.getElementById(\'whatsapp-number\').value,
                    passenger_count: document.getElementById(\'passenger_count\').value,
                    name: document.getElementById(\'user-name\').value,
                    email: document.getElementById(\'user-email\').value
                };

                const formData = new FormData();

                Object.keys(payload).forEach(key => {
                    if (Array.isArray(payload[key])) {
                        payload[key].forEach(val => formData.append(`${key}[]`, val));
                    } else {
                        formData.append(key, payload[key]);
                    }
                });

                // Append images
                formData.append(\'air_ticket_image_url\', document.getElementById(\'air_ticket_image_url\').files[0]);
                formData.append(\'passport_copy_image_url\', document.getElementById(\'passport_copy_image_url\').files[0]);
                console.log(\'========== BOOKING DEBUG ==========\');
                console.log(\'slotInput.value:\', slotInput.value);
                console.log(\'vehicleType:\', payload.vehicleType);
                console.log(\'startDate:\', payload.startDate);
                console.log(\'endDate:\', payload.endDate);

                console.log(\'---- Payload Object ----\');
                console.log(payload);

                console.log(\'---- FormData Contents ----\');
                for (const [key, value] of formData.entries()) {
                    console.log(key, value);
                }
                console.log(\'===================================\');

                                fetch(\'assets/includes/save-booking.php\', {
                                    method: \'POST\',
                                    body: formData
                                })
                .then(res => res.text())
                .then(t => { console.log("RAW RESPONSE:", t); return JSON.parse(t); })
                                .then(response => {
                                    if (!response.success) {
                                        submitBtn.disabled = false;
                                        submitBtn.textContent = \'Book Slot\';

                                        Swal.fire({
                                            icon: \'error\',
                                            title: \'Booking Failed\',
                                            //text: response.message || \'Unknown error\',
                text: response.detail || response.error || \'Unknown error\'

                        });
                        return;
                    }

                    Swal.fire({
                        icon: \'success\',
                        title: \'Booking Successful\',
                        html: `
                            Slot <strong>${payload.slot}</strong> reserved.<br>
                            Reference: <strong>${response.reference}</strong>
                        `
                    }).then(() => {
                        window.open(response.pdf_url, \'_blank\', \'noopener,noreferrer\');
                        setTimeout(() => window.location.reload(), 1000);
                    });

                    const slotElement = slots.find(s => s.dataset.slot === payload.slot);
                    if (slotElement) slotElement.classList.add(\'booked\');

                    modal.style.display = \'none\';
                    bookingForm.reset();
                })
                .catch(error => {
                    submitBtn.disabled = false;
                    submitBtn.textContent = \'Book Slot\';

                    Swal.fire({
                        icon: \'error\',
                        title: \'Server Error\',
                        text: error.message,
                    });
                    console.error(error);
                });
            });
        });
    </script>

    <script>
        document.addEventListener(\'DOMContentLoaded\', () => {
            const outerSlots = Array.from(document.querySelectorAll(\'#reserve-slots .outer-slot\'));
            const startInput = document.getElementById(\'initial-start-date\');
            const endInput = document.getElementById(\'initial-end-date\');
            const checkBtn = document.getElementById(\'check-availability\');
            const clearBtn = document.getElementById(\'clear-dates\');
            const banner = document.querySelector(\'.all-booked-banner\');
            let lastStart = \'\';
            let lastEnd = \'\';

            function shuffle(array) {
                const arr = [...array];
                for (let i = arr.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [arr[i], arr[j]] = [arr[j], arr[i]];
                }
                return arr;
            }

            function resetOuterSlots() {
                outerSlots.forEach(slot => {
                    slot.classList.remove(\'booked\', \'selected\');
                    slot.disabled = true;
                });
            }

            function showRandomOuterAvailability() {
                resetOuterSlots();

                const shuffledSlots = shuffle(outerSlots);

                const bookedCount = 7;

                const bookedSlots = shuffledSlots.slice(0, bookedCount);
                const availableSlot = shuffledSlots[bookedCount];

                bookedSlots.forEach(slot => {
                    slot.classList.add(\'booked\');
                    slot.disabled = true;
                });

                if (availableSlot) {
                    availableSlot.classList.remove(\'booked\');
                    availableSlot.disabled = false;
                }
            }

            resetOuterSlots();

            clearBtn.addEventListener(\'click\', () => {
                startInput.value = \'\';
                endInput.value = \'\';
                lastStart = \'\';
                lastEnd = \'\';

                resetOuterSlots();

                banner.classList.add(\'d-none\');
            });

            checkBtn.addEventListener(\'click\', () => {
                const start = startInput.value;
                const end = endInput.value;

                if (!start || !end) {
                    alert(\'Please select both start and end dates.\');
                    return;
                }

                if (end < start) {
                    alert(\'End date must be after start date.\');
                    return;
                }

                if (start !== lastStart || end !== lastEnd) {
                    lastStart = start;
                    lastEnd = end;

                    showRandomOuterAvailability();

                    banner.classList.remove(\'d-none\');
                }
            });
        });
    </script>

    <script>
        const heroSwiper = new Swiper(".homeHeroSwiper", {
            loop: true,
            autoplay: {
                delay: 3500,
                disableOnInteraction: false,
            },
            speed: 800,
            effect: "fade",
            fadeEffect: {
                crossFade: true
            }
        });
    </script>

    <script>
        document.addEventListener(\'DOMContentLoaded\', () => {
            const start = document.getElementById(\'initial-start-date\');
            const end = document.getElementById(\'initial-end-date\');

            const today = new Date().toISOString().split(\'T\')[0]; // YYYY-MM-DD

            start.min = end.min = today;

            start.addEventListener(\'change\', () => {
                end.min = start.value || today;
            });
        });
    </script>
</body>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-4 col order-lg-1 ">
                <h6 class="footer-logo m-0"><img src="assets/images/footer-logo.png" alt="Airport Parking | Logo"></h6>
                <p class="my-3 my-lg-4">Start your journey stress-free,<br>with secure and easy parking.
                </p>
                <ul class="list-unstyled d-flex" id="footer-social-list">
                    <li class="me-2">
                        <a href="https://www.facebook.com/airportparkinglk" target="_blank" alt="facebook">
                            <i class="fa-brands fa-facebook-f"></i>
                        </a>
                    </li>
                    <li class="mx-2">
                        <a href="https://www.instagram.com/airportparking.lk/" target="_blank" alt="instragram">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                    </li>
                    <li class="ms-2">
                        <a href="https://wa.me/94761414557" target="_blank" alt="whatsapp">
                            <i class="fa-brands fa-whatsapp"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-4 order-lg-2">
                <h2 class="my-4 mt-lg-0">Links</h2>
                <ul class="list-unstyled" id="footer-nav-link-list">
                    <li>
                        <a href="./">Home</a>
                    </li>
                    <li>
                        <a href="index.php?id=2">About</a>
                    </li>
                    <li>
                        <a href="index.php?id=4">FAQ</a>
                    </li>
                    <li>
                        <a href="index.php?id=5">Gallery</a>
                    </li>
                    <li>
                        <a href="index.php?id=3">Contact</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-4 order-lg-4">
                <h2 class="my-4 mt-lg-0">Contact</h2>
                <ul class="list-unstyled" id="footer-contact-list">
                   <li>
                        <img src="assets/images/icons/footer-phone.svg" 
                            alt="Airport Parking | Footer Contact Icon" 
                            class="me-1">

                        <a href="tel:+94761414557">+94 76 141 4557</a>
                    </li>
                    <li class="d-flex align-items-center">
                        <img src="assets/images/icons/footer-email.svg" alt="Airport Parking | Footer Contact Icon" class="me-1">
                        <div class="d-inline-block">
                            <a href="mailto:info@airportparking.lk">info@airportparking.lk</a> 
                        </div>
                    </li>
                    <li>
                        <img src="assets/images/icons/footer-location.svg" alt="Airport Parking | Footer Contact Icon" class="me-1">
                        <a href="https://maps.app.goo.gl/GYYZrAGs9UKBf7j5A" target="_blank">371/5 Negombo Rd, Seeduwa</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
    <div class="col-12">
    <p class="m-0 py-4">
        Designed and Developed by 
        <a href="https://explore.vacations/" target="_blank">Explore Vacations</a>. 
        <br class="d-md-none">© <span id="year"></span>
    </p>
</div>

<script>
    document.getElementById("year").textContent = new Date().getFullYear();
</script>
        </div>
    </div>
</footer>

<!--Whatsapp widget-->
<div id="whatsapp-widget">
    <div class="chat-header" id="chat-header">
        <div class="avatar-container">
            <img src="assets/images/whatsapp-img.jpg" alt="logo">
            <div class="online-dot"></div>
        </div>
        <div class="chat-header-info">
            <span style="transform: translateY(2px);">Airport Parking</span>
            <div style="color: #eeeeee;">online</div>

        </div>
        <button class="close-btn" id="close-btn">&times;</button>
    </div>
    <div class="chat-content" id="chat-content">
    </div>
    <div class="message-input" id="message-input">
        <button class="whatsapp-btn" id="whatsapp-btn">Chat in WhatsApp</button>
    </div>
    <div class="chat-icon" id="chat-icon">
        <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp">
    </div>
</div>',
    '_isForward' => false,
  ),
  'contentType' => 
  array (
    'id' => 1,
    'name' => 'HTML',
    'description' => 'HTML content',
    'mime_type' => 'text/html',
    'file_extensions' => '.html',
    'icon' => '',
    'headers' => NULL,
    'binary' => 0,
  ),
  'policyCache' => 
  array (
  ),
  'elementCache' => 
  array (
    '[[$header?]]' => '<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?php echo WEBSITE_DESCRIPTION; ?>">
    <meta name="keywords" content="<?php echo WEBSITE_KEYWORDS; ?>">
    <meta name="author" content="Airport Parking">
    <meta name="robots" content="index, follow">

    <!-- Page Title -->
    <title>Airport Parking</title>

    <!-- Favicon -->
    <link rel="icon" href="assets/images/favicon.ico?v=2" type="image/x-icon">

    <!-- Canonical URL -->
    <link rel="canonical" href="">

    <!-- Fontawesome -->
    <link rel="stylesheet" href="node_modules/@fortawesome/fontawesome-free/css/all.min.css">
    <!-- Swiper JS -->
    <link rel="stylesheet" href="node_modules/swiper/swiper-bundle.min.css">
    <!-- AOS Animations CSS -->
    <link href="node_modules/aos/dist/aos.css" rel="stylesheet">
    <!-- Lightgallery -->
    <link type="text/css" rel="stylesheet" href="node_modules/lightgallery/css/lightgallery-bundle.css" />
    <!-- Stylesheets -->
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/variables.css">
    <link rel="stylesheet" href="assets/css/overrides.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
     <!-- SweetAlert2 CSS & JS -->
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Bootstrap -->
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Swiper JS -->
    <script src="node_modules/swiper/swiper-bundle.min.js"></script>
    <!-- AOS Animations JS -->
    <script src="node_modules/aos/dist/aos.js"></script>
    <!-- Whatsapp widget JS -->
    <script src="assets/js/whatsapp-widget.js"></script>
    <!-- Lightgallery -->
    <script src="node_modules/lightgallery/lightgallery.umd.js"></script>
    <!-- Custom JS -->
    <script src="assets/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Scroll to Top Button -->
    <button id="scrollTopBtn" title="Go to top"><img src="assets/images/top-icon.png" alt="top-icon" class="img-fluid" style="
        width: 20px;
        height: 20px;
        display: flex;
    "></button>

</body>

<script>
    //Get the button
    const scrollTopBtn = document.getElementById("scrollTopBtn");

    // Show button when user scrolls down 100px
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
            scrollTopBtn.style.display = "block";
        } else {
            scrollTopBtn.style.display = "none";
        }
    }

    // Scroll to top smoothly when clicked
    scrollTopBtn.addEventListener(\'click\', () => {
        window.scrollTo({
            top: 0,
            behavior: \'smooth\'
        });
    });
</script>

</html>',
    '[[~2]]' => 'index.php?id=2',
    '[[~4]]' => 'index.php?id=4',
    '[[~5]]' => 'index.php?id=5',
    '[[~3]]' => 'index.php?id=3',
    '[[~6]]' => 'index.php?id=6',
    '[[$navbar?]]' => '<header>

    <!-- Top Info Bar -->
    <div class="top-bar">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="top-left">
                <a href="https://wa.me/94761414557" target="_blank" class="top-link">
                    <i class="fa-brands fa-whatsapp fa-lg"></i> +94 76 1414 557
                </a>
                <a href="mailto:info@airportparking.lk" class="top-link">
                    <i class="fa-regular fa-envelope fa-lg"></i> info@airportparking.lk
                </a>
            </div>
            <div class="top-right">
                <a href="https://www.skyscanner.net/" class="top-link" target="_blank">
                    <i class="fa-solid fa-plane"></i> Flight Info
                </a>
                <a href="https://srilankarentacar.com/" class="top-btn" target="_blank">
                    Rent a Car
                </a>
            </div>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg p-lg-0">
        <div class="container d-flex align-items-center justify-content-between">

            <a class="navbar-brand" href="./">
                <img src="assets/images/logo.png" alt="Explore Vacations | Logo">
            </a>

            <button class="navbar-toggler border-0" type="button"
                data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar">
                <i class="fa-solid fa-bars"></i>
            </button>

            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title">Explore Vacations</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav ms-auto align-items-lg-center">
                        <li class="nav-item"><a class="nav-link active" href="./">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=2">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=4">FAQ</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=5">Gallery</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=3">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.php?id=6">My Account</a></li>

                    </ul>
                </div>
            </div>

        </div>
    </nav>

</header>

<script>
window.addEventListener("scroll", function () {
    const navbar = document.querySelector(".navbar");

    if (window.scrollY > 50) {
        navbar.classList.add("scrolled");
    } else {
        navbar.classList.remove("scrolled");
    }
});
</script>

',
    '[[$footer?]]' => '<footer>
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-4 col order-lg-1 ">
                <h6 class="footer-logo m-0"><img src="assets/images/footer-logo.png" alt="Airport Parking | Logo"></h6>
                <p class="my-3 my-lg-4">Start your journey stress-free,<br>with secure and easy parking.
                </p>
                <ul class="list-unstyled d-flex" id="footer-social-list">
                    <li class="me-2">
                        <a href="https://www.facebook.com/airportparkinglk" target="_blank" alt="facebook">
                            <i class="fa-brands fa-facebook-f"></i>
                        </a>
                    </li>
                    <li class="mx-2">
                        <a href="https://www.instagram.com/airportparking.lk/" target="_blank" alt="instragram">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                    </li>
                    <li class="ms-2">
                        <a href="https://wa.me/94761414557" target="_blank" alt="whatsapp">
                            <i class="fa-brands fa-whatsapp"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-4 order-lg-2">
                <h2 class="my-4 mt-lg-0">Links</h2>
                <ul class="list-unstyled" id="footer-nav-link-list">
                    <li>
                        <a href="./">Home</a>
                    </li>
                    <li>
                        <a href="index.php?id=2">About</a>
                    </li>
                    <li>
                        <a href="index.php?id=4">FAQ</a>
                    </li>
                    <li>
                        <a href="index.php?id=5">Gallery</a>
                    </li>
                    <li>
                        <a href="index.php?id=3">Contact</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-4 order-lg-4">
                <h2 class="my-4 mt-lg-0">Contact</h2>
                <ul class="list-unstyled" id="footer-contact-list">
                   <li>
                        <img src="assets/images/icons/footer-phone.svg" 
                            alt="Airport Parking | Footer Contact Icon" 
                            class="me-1">

                        <a href="tel:+94761414557">+94 76 141 4557</a>
                    </li>
                    <li class="d-flex align-items-center">
                        <img src="assets/images/icons/footer-email.svg" alt="Airport Parking | Footer Contact Icon" class="me-1">
                        <div class="d-inline-block">
                            <a href="mailto:info@airportparking.lk">info@airportparking.lk</a> 
                        </div>
                    </li>
                    <li>
                        <img src="assets/images/icons/footer-location.svg" alt="Airport Parking | Footer Contact Icon" class="me-1">
                        <a href="https://maps.app.goo.gl/GYYZrAGs9UKBf7j5A" target="_blank">371/5 Negombo Rd, Seeduwa</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
    <div class="col-12">
    <p class="m-0 py-4">
        Designed and Developed by 
        <a href="https://explore.vacations/" target="_blank">Explore Vacations</a>. 
        <br class="d-md-none">© <span id="year"></span>
    </p>
</div>

<script>
    document.getElementById("year").textContent = new Date().getFullYear();
</script>
        </div>
    </div>
</footer>

<!--Whatsapp widget-->
<div id="whatsapp-widget">
    <div class="chat-header" id="chat-header">
        <div class="avatar-container">
            <img src="assets/images/whatsapp-img.jpg" alt="logo">
            <div class="online-dot"></div>
        </div>
        <div class="chat-header-info">
            <span style="transform: translateY(2px);">Airport Parking</span>
            <div style="color: #eeeeee;">online</div>

        </div>
        <button class="close-btn" id="close-btn">&times;</button>
    </div>
    <div class="chat-content" id="chat-content">
    </div>
    <div class="message-input" id="message-input">
        <button class="whatsapp-btn" id="whatsapp-btn">Chat in WhatsApp</button>
    </div>
    <div class="chat-icon" id="chat-icon">
        <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp">
    </div>
</div>',
  ),
  'sourceCache' => 
  array (
    'MODX\\Revolution\\modChunk' => 
    array (
      'header' => 
      array (
        'fields' => 
        array (
          'id' => 2,
          'source' => 1,
          'property_preprocess' => false,
          'name' => 'header',
          'description' => '',
          'editor_type' => 0,
          'category' => 0,
          'cache_type' => 0,
          'snippet' => '<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?php echo WEBSITE_DESCRIPTION; ?>">
    <meta name="keywords" content="<?php echo WEBSITE_KEYWORDS; ?>">
    <meta name="author" content="Airport Parking">
    <meta name="robots" content="index, follow">

    <!-- Page Title -->
    <title>Airport Parking</title>

    <!-- Favicon -->
    <link rel="icon" href="assets/images/favicon.ico?v=2" type="image/x-icon">

    <!-- Canonical URL -->
    <link rel="canonical" href="">

    <!-- Fontawesome -->
    <link rel="stylesheet" href="node_modules/@fortawesome/fontawesome-free/css/all.min.css">
    <!-- Swiper JS -->
    <link rel="stylesheet" href="node_modules/swiper/swiper-bundle.min.css">
    <!-- AOS Animations CSS -->
    <link href="node_modules/aos/dist/aos.css" rel="stylesheet">
    <!-- Lightgallery -->
    <link type="text/css" rel="stylesheet" href="node_modules/lightgallery/css/lightgallery-bundle.css" />
    <!-- Stylesheets -->
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/variables.css">
    <link rel="stylesheet" href="assets/css/overrides.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
     <!-- SweetAlert2 CSS & JS -->
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Bootstrap -->
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Swiper JS -->
    <script src="node_modules/swiper/swiper-bundle.min.js"></script>
    <!-- AOS Animations JS -->
    <script src="node_modules/aos/dist/aos.js"></script>
    <!-- Whatsapp widget JS -->
    <script src="assets/js/whatsapp-widget.js"></script>
    <!-- Lightgallery -->
    <script src="node_modules/lightgallery/lightgallery.umd.js"></script>
    <!-- Custom JS -->
    <script src="assets/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Scroll to Top Button -->
    <button id="scrollTopBtn" title="Go to top"><img src="assets/images/top-icon.png" alt="top-icon" class="img-fluid" style="
        width: 20px;
        height: 20px;
        display: flex;
    "></button>

</body>

<script>
    //Get the button
    const scrollTopBtn = document.getElementById("scrollTopBtn");

    // Show button when user scrolls down 100px
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
            scrollTopBtn.style.display = "block";
        } else {
            scrollTopBtn.style.display = "none";
        }
    }

    // Scroll to top smoothly when clicked
    scrollTopBtn.addEventListener(\'click\', () => {
        window.scrollTo({
            top: 0,
            behavior: \'smooth\'
        });
    });
</script>

</html>',
          'locked' => false,
          'properties' => 
          array (
          ),
          'static' => false,
          'static_file' => '',
          'content' => '<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?php echo WEBSITE_DESCRIPTION; ?>">
    <meta name="keywords" content="<?php echo WEBSITE_KEYWORDS; ?>">
    <meta name="author" content="Airport Parking">
    <meta name="robots" content="index, follow">

    <!-- Page Title -->
    <title>Airport Parking</title>

    <!-- Favicon -->
    <link rel="icon" href="assets/images/favicon.ico?v=2" type="image/x-icon">

    <!-- Canonical URL -->
    <link rel="canonical" href="">

    <!-- Fontawesome -->
    <link rel="stylesheet" href="node_modules/@fortawesome/fontawesome-free/css/all.min.css">
    <!-- Swiper JS -->
    <link rel="stylesheet" href="node_modules/swiper/swiper-bundle.min.css">
    <!-- AOS Animations CSS -->
    <link href="node_modules/aos/dist/aos.css" rel="stylesheet">
    <!-- Lightgallery -->
    <link type="text/css" rel="stylesheet" href="node_modules/lightgallery/css/lightgallery-bundle.css" />
    <!-- Stylesheets -->
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/variables.css">
    <link rel="stylesheet" href="assets/css/overrides.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
     <!-- SweetAlert2 CSS & JS -->
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Bootstrap -->
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Swiper JS -->
    <script src="node_modules/swiper/swiper-bundle.min.js"></script>
    <!-- AOS Animations JS -->
    <script src="node_modules/aos/dist/aos.js"></script>
    <!-- Whatsapp widget JS -->
    <script src="assets/js/whatsapp-widget.js"></script>
    <!-- Lightgallery -->
    <script src="node_modules/lightgallery/lightgallery.umd.js"></script>
    <!-- Custom JS -->
    <script src="assets/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Scroll to Top Button -->
    <button id="scrollTopBtn" title="Go to top"><img src="assets/images/top-icon.png" alt="top-icon" class="img-fluid" style="
        width: 20px;
        height: 20px;
        display: flex;
    "></button>

</body>

<script>
    //Get the button
    const scrollTopBtn = document.getElementById("scrollTopBtn");

    // Show button when user scrolls down 100px
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
            scrollTopBtn.style.display = "block";
        } else {
            scrollTopBtn.style.display = "none";
        }
    }

    // Scroll to top smoothly when clicked
    scrollTopBtn.addEventListener(\'click\', () => {
        window.scrollTo({
            top: 0,
            behavior: \'smooth\'
        });
    });
</script>

</html>',
        ),
        'policies' => 
        array (
          'web' => 
          array (
          ),
        ),
        'source' => 
        array (
          'id' => 1,
          'name' => 'Filesystem',
          'description' => '',
          'class_key' => 'MODX\\Revolution\\Sources\\modFileMediaSource',
          'properties' => 
          array (
          ),
          'is_stream' => true,
        ),
      ),
      'navbar' => 
      array (
        'fields' => 
        array (
          'id' => 3,
          'source' => 1,
          'property_preprocess' => false,
          'name' => 'navbar',
          'description' => '',
          'editor_type' => 0,
          'category' => 0,
          'cache_type' => 0,
          'snippet' => '<header>

    <!-- Top Info Bar -->
    <div class="top-bar">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="top-left">
                <a href="https://wa.me/94761414557" target="_blank" class="top-link">
                    <i class="fa-brands fa-whatsapp fa-lg"></i> +94 76 1414 557
                </a>
                <a href="mailto:info@airportparking.lk" class="top-link">
                    <i class="fa-regular fa-envelope fa-lg"></i> info@airportparking.lk
                </a>
            </div>
            <div class="top-right">
                <a href="https://www.skyscanner.net/" class="top-link" target="_blank">
                    <i class="fa-solid fa-plane"></i> Flight Info
                </a>
                <a href="https://srilankarentacar.com/" class="top-btn" target="_blank">
                    Rent a Car
                </a>
            </div>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg p-lg-0">
        <div class="container d-flex align-items-center justify-content-between">

            <a class="navbar-brand" href="./">
                <img src="assets/images/logo.png" alt="Explore Vacations | Logo">
            </a>

            <button class="navbar-toggler border-0" type="button"
                data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar">
                <i class="fa-solid fa-bars"></i>
            </button>

            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title">Explore Vacations</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav ms-auto align-items-lg-center">
                        <li class="nav-item"><a class="nav-link active" href="./">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~2]]">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~4]]">FAQ</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~5]]">Gallery</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~3]]">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~6]]">My Account</a></li>

                    </ul>
                </div>
            </div>

        </div>
    </nav>

</header>

<script>
window.addEventListener("scroll", function () {
    const navbar = document.querySelector(".navbar");

    if (window.scrollY > 50) {
        navbar.classList.add("scrolled");
    } else {
        navbar.classList.remove("scrolled");
    }
});
</script>

',
          'locked' => false,
          'properties' => 
          array (
          ),
          'static' => false,
          'static_file' => '',
          'content' => '<header>

    <!-- Top Info Bar -->
    <div class="top-bar">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="top-left">
                <a href="https://wa.me/94761414557" target="_blank" class="top-link">
                    <i class="fa-brands fa-whatsapp fa-lg"></i> +94 76 1414 557
                </a>
                <a href="mailto:info@airportparking.lk" class="top-link">
                    <i class="fa-regular fa-envelope fa-lg"></i> info@airportparking.lk
                </a>
            </div>
            <div class="top-right">
                <a href="https://www.skyscanner.net/" class="top-link" target="_blank">
                    <i class="fa-solid fa-plane"></i> Flight Info
                </a>
                <a href="https://srilankarentacar.com/" class="top-btn" target="_blank">
                    Rent a Car
                </a>
            </div>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg p-lg-0">
        <div class="container d-flex align-items-center justify-content-between">

            <a class="navbar-brand" href="./">
                <img src="assets/images/logo.png" alt="Explore Vacations | Logo">
            </a>

            <button class="navbar-toggler border-0" type="button"
                data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar">
                <i class="fa-solid fa-bars"></i>
            </button>

            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title">Explore Vacations</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav ms-auto align-items-lg-center">
                        <li class="nav-item"><a class="nav-link active" href="./">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~2]]">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~4]]">FAQ</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~5]]">Gallery</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~3]]">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="[[~6]]">My Account</a></li>

                    </ul>
                </div>
            </div>

        </div>
    </nav>

</header>

<script>
window.addEventListener("scroll", function () {
    const navbar = document.querySelector(".navbar");

    if (window.scrollY > 50) {
        navbar.classList.add("scrolled");
    } else {
        navbar.classList.remove("scrolled");
    }
});
</script>

',
        ),
        'policies' => 
        array (
          'web' => 
          array (
          ),
        ),
        'source' => 
        array (
          'id' => 1,
          'name' => 'Filesystem',
          'description' => '',
          'class_key' => 'MODX\\Revolution\\Sources\\modFileMediaSource',
          'properties' => 
          array (
          ),
          'is_stream' => true,
        ),
      ),
      'footer' => 
      array (
        'fields' => 
        array (
          'id' => 1,
          'source' => 1,
          'property_preprocess' => false,
          'name' => 'footer',
          'description' => '',
          'editor_type' => 0,
          'category' => 0,
          'cache_type' => 0,
          'snippet' => '<footer>
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-4 col order-lg-1 ">
                <h6 class="footer-logo m-0"><img src="assets/images/footer-logo.png" alt="Airport Parking | Logo"></h6>
                <p class="my-3 my-lg-4">Start your journey stress-free,<br>with secure and easy parking.
                </p>
                <ul class="list-unstyled d-flex" id="footer-social-list">
                    <li class="me-2">
                        <a href="https://www.facebook.com/airportparkinglk" target="_blank" alt="facebook">
                            <i class="fa-brands fa-facebook-f"></i>
                        </a>
                    </li>
                    <li class="mx-2">
                        <a href="https://www.instagram.com/airportparking.lk/" target="_blank" alt="instragram">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                    </li>
                    <li class="ms-2">
                        <a href="https://wa.me/94761414557" target="_blank" alt="whatsapp">
                            <i class="fa-brands fa-whatsapp"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-4 order-lg-2">
                <h2 class="my-4 mt-lg-0">Links</h2>
                <ul class="list-unstyled" id="footer-nav-link-list">
                    <li>
                        <a href="./">Home</a>
                    </li>
                    <li>
                        <a href="[[~2]]">About</a>
                    </li>
                    <li>
                        <a href="[[~4]]">FAQ</a>
                    </li>
                    <li>
                        <a href="[[~5]]">Gallery</a>
                    </li>
                    <li>
                        <a href="[[~3]]">Contact</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-4 order-lg-4">
                <h2 class="my-4 mt-lg-0">Contact</h2>
                <ul class="list-unstyled" id="footer-contact-list">
                   <li>
                        <img src="assets/images/icons/footer-phone.svg" 
                            alt="Airport Parking | Footer Contact Icon" 
                            class="me-1">

                        <a href="tel:+94761414557">+94 76 141 4557</a>
                    </li>
                    <li class="d-flex align-items-center">
                        <img src="assets/images/icons/footer-email.svg" alt="Airport Parking | Footer Contact Icon" class="me-1">
                        <div class="d-inline-block">
                            <a href="mailto:info@airportparking.lk">info@airportparking.lk</a> 
                        </div>
                    </li>
                    <li>
                        <img src="assets/images/icons/footer-location.svg" alt="Airport Parking | Footer Contact Icon" class="me-1">
                        <a href="https://maps.app.goo.gl/GYYZrAGs9UKBf7j5A" target="_blank">371/5 Negombo Rd, Seeduwa</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
    <div class="col-12">
    <p class="m-0 py-4">
        Designed and Developed by 
        <a href="https://explore.vacations/" target="_blank">Explore Vacations</a>. 
        <br class="d-md-none">© <span id="year"></span>
    </p>
</div>

<script>
    document.getElementById("year").textContent = new Date().getFullYear();
</script>
        </div>
    </div>
</footer>

<!--Whatsapp widget-->
<div id="whatsapp-widget">
    <div class="chat-header" id="chat-header">
        <div class="avatar-container">
            <img src="assets/images/whatsapp-img.jpg" alt="logo">
            <div class="online-dot"></div>
        </div>
        <div class="chat-header-info">
            <span style="transform: translateY(2px);">Airport Parking</span>
            <div style="color: #eeeeee;">online</div>

        </div>
        <button class="close-btn" id="close-btn">&times;</button>
    </div>
    <div class="chat-content" id="chat-content">
    </div>
    <div class="message-input" id="message-input">
        <button class="whatsapp-btn" id="whatsapp-btn">Chat in WhatsApp</button>
    </div>
    <div class="chat-icon" id="chat-icon">
        <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp">
    </div>
</div>',
          'locked' => false,
          'properties' => 
          array (
          ),
          'static' => false,
          'static_file' => '',
          'content' => '<footer>
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-4 col order-lg-1 ">
                <h6 class="footer-logo m-0"><img src="assets/images/footer-logo.png" alt="Airport Parking | Logo"></h6>
                <p class="my-3 my-lg-4">Start your journey stress-free,<br>with secure and easy parking.
                </p>
                <ul class="list-unstyled d-flex" id="footer-social-list">
                    <li class="me-2">
                        <a href="https://www.facebook.com/airportparkinglk" target="_blank" alt="facebook">
                            <i class="fa-brands fa-facebook-f"></i>
                        </a>
                    </li>
                    <li class="mx-2">
                        <a href="https://www.instagram.com/airportparking.lk/" target="_blank" alt="instragram">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                    </li>
                    <li class="ms-2">
                        <a href="https://wa.me/94761414557" target="_blank" alt="whatsapp">
                            <i class="fa-brands fa-whatsapp"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-4 order-lg-2">
                <h2 class="my-4 mt-lg-0">Links</h2>
                <ul class="list-unstyled" id="footer-nav-link-list">
                    <li>
                        <a href="./">Home</a>
                    </li>
                    <li>
                        <a href="[[~2]]">About</a>
                    </li>
                    <li>
                        <a href="[[~4]]">FAQ</a>
                    </li>
                    <li>
                        <a href="[[~5]]">Gallery</a>
                    </li>
                    <li>
                        <a href="[[~3]]">Contact</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-4 order-lg-4">
                <h2 class="my-4 mt-lg-0">Contact</h2>
                <ul class="list-unstyled" id="footer-contact-list">
                   <li>
                        <img src="assets/images/icons/footer-phone.svg" 
                            alt="Airport Parking | Footer Contact Icon" 
                            class="me-1">

                        <a href="tel:+94761414557">+94 76 141 4557</a>
                    </li>
                    <li class="d-flex align-items-center">
                        <img src="assets/images/icons/footer-email.svg" alt="Airport Parking | Footer Contact Icon" class="me-1">
                        <div class="d-inline-block">
                            <a href="mailto:info@airportparking.lk">info@airportparking.lk</a> 
                        </div>
                    </li>
                    <li>
                        <img src="assets/images/icons/footer-location.svg" alt="Airport Parking | Footer Contact Icon" class="me-1">
                        <a href="https://maps.app.goo.gl/GYYZrAGs9UKBf7j5A" target="_blank">371/5 Negombo Rd, Seeduwa</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
    <div class="col-12">
    <p class="m-0 py-4">
        Designed and Developed by 
        <a href="https://explore.vacations/" target="_blank">Explore Vacations</a>. 
        <br class="d-md-none">© <span id="year"></span>
    </p>
</div>

<script>
    document.getElementById("year").textContent = new Date().getFullYear();
</script>
        </div>
    </div>
</footer>

<!--Whatsapp widget-->
<div id="whatsapp-widget">
    <div class="chat-header" id="chat-header">
        <div class="avatar-container">
            <img src="assets/images/whatsapp-img.jpg" alt="logo">
            <div class="online-dot"></div>
        </div>
        <div class="chat-header-info">
            <span style="transform: translateY(2px);">Airport Parking</span>
            <div style="color: #eeeeee;">online</div>

        </div>
        <button class="close-btn" id="close-btn">&times;</button>
    </div>
    <div class="chat-content" id="chat-content">
    </div>
    <div class="message-input" id="message-input">
        <button class="whatsapp-btn" id="whatsapp-btn">Chat in WhatsApp</button>
    </div>
    <div class="chat-icon" id="chat-icon">
        <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp">
    </div>
</div>',
        ),
        'policies' => 
        array (
          'web' => 
          array (
          ),
        ),
        'source' => 
        array (
          'id' => 1,
          'name' => 'Filesystem',
          'description' => '',
          'class_key' => 'MODX\\Revolution\\Sources\\modFileMediaSource',
          'properties' => 
          array (
          ),
          'is_stream' => true,
        ),
      ),
    ),
    'MODX\\Revolution\\modSnippet' => 
    array (
    ),
    'MODX\\Revolution\\modTemplateVar' => 
    array (
    ),
  ),
);
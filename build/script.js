document.addEventListener('DOMContentLoaded', function () {
  // Calculate tomorrow's date string first
  const tomorrow = new Date();
  tomorrow.setDate(tomorrow.getDate() + 1);
  const yyyy = tomorrow.getFullYear();
  const mm = String(tomorrow.getMonth() + 1).padStart(2, '0');
  const dd = String(tomorrow.getDate()).padStart(2, '0');
  const tomorrowStr = `${yyyy}-${mm}-${dd}`;

  // Set min date for the date input to tomorrow
  const reservationDateInput = document.getElementById('reservation_date');
  reservationDateInput.min = tomorrowStr;
  reservationDateInput.value = tomorrowStr;
  reservationDateInput.dispatchEvent(new Event('change'));

  // Initialize FullCalendar with validRange using tomorrowStr
  const calendarEl = document.getElementById('calendar');
  const calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    headerToolbar: {
      left: '',
      center: 'title',
      right: 'prev,next'
    },
    validRange: {
      start: tomorrowStr // Only allow selecting from tomorrow onwards
    },
    dateClick: function(info) {
      calendar.select(info.date); // <-- This will highlight the clicked date
      reservationDateInput.value = info.dateStr;
      reservationDateInput.dispatchEvent(new Event('change'));
      document.getElementById('slot-section').style.display = 'block';
    }
  });
  calendar.render();

  // Fetch vehicle categories from API and populate select
  fetch('https://192.168.115.106:8000/api/vehicle-types')
    .then(res => res.json())
    .then(data => {
      const select = document.getElementById('vehicle_type_id');
      select.innerHTML = '<option value="">Select vehicle category</option>';
      data.forEach(type => {
        const option = document.createElement('option');
        option.value = type.id;
        option.textContent = type.name || type.category || type.title || `Type ${type.id}`;
        select.appendChild(option);
      });
    });

  const startHour = 8;
  const endHour = 20;

  function generateTimeSlots() {
    const slots = [];
    for (let hour = startHour; hour < endHour; hour++) {
      for (let min = 0; min < 60; min += 20) {
        slots.push(`${String(hour).padStart(2, '0')}:${String(min).padStart(2, '0')}`);
      }
    }
    return slots;
  }

function fetchAllTimeSlots() {
  fetch('https://192.168.115.106:8000/api/time-slots')
    .then(res => res.json())
    .then(data => {
      // Example: log to console or display in a table
      console.log(data);
      
    });
}

function fetchReservedSlots(date, callback) {
  fetch('https://192.168.115.106:8000/api/timeslots/available?date=' + encodeURIComponent(date), {
    headers: {
      'Accept': 'application/json'
    }
  })
    .then(res => {
      if (!res.ok) throw new Error('Network response was not ok');
      return res.json();
    })
    .then(data => callback(data))
    .catch(() => callback([]));
}

function fetchAvailableSlotsForDate(date, callback) {
  fetch('https://192.168.115.106:8000/api/time-slots')
    .then(res => res.json())
    .then(slots => {
      
      const checks = slots.map(slot =>
        fetch(`https://192.168.115.106:8000/api/days/${date}/slots/availability/${slot.id}`)
          .then(res => res.json())
          .then(avail => avail.available ? slot : null)
      );
      Promise.all(checks).then(results => {
        
        callback(results.filter(Boolean));
      });
    });
}

document.getElementById('reservation_date').addEventListener('change', function () {
  const date = this.value;
  fetchAvailableSlotsForDate(date, function(availableSlots) {
    populateTimeSlotSelect('arrival-time-slot', availableSlots.map(s => s.time));
    populateTimeSlotSelect('departure-time-slot', availableSlots.map(s => s.time));
  });
});

  async function reserveSlot() {
    const reservationDate = document.getElementById('reservation_date').value;
    const arrivalTimeStr = document.getElementById('arrival-time-slot').value; // npr. "08:00"
    const company = document.getElementById('company_name').value.trim();
    const country = document.getElementById('country-input').value.trim();
    const registration = document.getElementById('registration-input').value.trim();
    const email = document.getElementById('email').value.trim();
    const vehicleType = document.getElementById('vehicle_type_id').value;

    
    const slots = await fetch('https://192.168.115.106:8000/api/time-slots').then(res => res.json());
    const arrivalSlot = slots.find(slot => slot.time === arrivalTimeStr);
    if (!arrivalSlot) {
      alert('Nije pronađen odgovarajući vremenski slot!');
      return;
    }

    
    const data = {
      time_slot_id: arrivalSlot.id,
      reservation_date: reservationDate,
      type: "drop_off", 
      user_name: company,
      country: country,
      license_plate: registration,
      vehicle_type_id: vehicleType,
      email: email
    };

    
    fetch('https://192.168.115.106:8000/api/reservations/reserve', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    })
      .then(res => res.json())
      .then(response => {
        if (response.success) {
          alert('Rezervacija uspješna!');
        } else {
          alert('Greška prilikom rezervacije!');
        }
      });
  }

  document.getElementById('show-terms').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('terms-modal').style.display = 'block';
  });
  document.getElementById('close-terms').addEventListener('click', function() {
    document.getElementById('terms-modal').style.display = 'none';
  });
})
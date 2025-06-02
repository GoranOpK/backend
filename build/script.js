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
  fetch('http://192.168.115.106:8000/api/vehicle-types')
    .then(res => res.json())
    .then(data => {
      const select = document.getElementById('vehicle_type_id');
      select.innerHTML = '<option value="">Select vehicle category</option>';
      data.forEach(type => {
        const option = document.createElement('option');
        option.value = type.id;
        option.textContent = type.description_vehicle || type.name || type.category || type.title || `Type ${type.id}`;
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
  fetch('http://192.168.115.106:8000/api/time-slots')
    .then(res => res.json())
    .then(data => {
      // Example: log to console or display in a table
      console.log(data);
      
    });
}

function fetchReservedSlots(date, callback) {
  fetch('http://192.168.115.106:8000/api/timeslots/available?date=' + encodeURIComponent(date), {
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
  fetch('http://192.168.115.106:8000/api/timeslots/available?date=' + encodeURIComponent(date))
    .then(res => res.json())
    .then(slots => {
      callback(slots); // backend returns an array of available slots
    });
}

  document.getElementById('reservation_date').addEventListener('change', function () {
    const date = this.value;
    fetchAvailableSlotsForDate(date, function(availableSlots) {
      populateTimeSlotSelect('arrival-time-slot', availableSlots.map(s => s.time_slot));
      populateTimeSlotSelect('departure-time-slot', availableSlots.map(s => s.time_slot));
    });
  });

  document.getElementById('show-terms').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('terms-modal').style.display = 'block';
  });
  document.getElementById('close-terms').addEventListener('click', function() {
    document.getElementById('terms-modal').style.display = 'none';
  });
})

async function reserveSlot() {
  const reservationDate = document.getElementById('reservation_date').value;
  const arrivalTimeStr = document.getElementById('arrival-time-slot').value;
  const company = document.getElementById('company_name').value.trim();
  const country = document.getElementById('country-input').value.trim();
  const registration = document.getElementById('registration-input').value.trim();
  const email = document.getElementById('email').value.trim();
  const vehicleType = document.getElementById('vehicle_type_id').value;

  // Fetch all slots and find the one matching the selected time_slot
  const slotsResponse = await fetch('http://192.168.115.106:8000/api/timeslots');
  const slotsData = await slotsResponse.json();
  const slots = slotsData.data || slotsData;
  const arrivalSlot = slots.find(slot => slot.time_slot === arrivalTimeStr);

  if (!arrivalSlot) {
    alert('Could not find the selected time slot!');
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

  fetch('http://192.168.115.106:8000/api/reservations/reserve', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data)
  })
    .then(res => res.json())
    .then(response => {
      if (response.success) {
        alert('Reservation successful!');
      } else {
        alert('Reservation failed!');
      }
    });
}

function populateTimeSlotSelect(selectId, times) {
  const select = document.getElementById(selectId);
  select.innerHTML = '<option value="">Select time slot</option>';
  times.forEach(time => {
    const option = document.createElement('option');
    option.value = time;
    option.textContent = time;
    select.appendChild(option);
  });
}
const Booking = require('../model/userWorkout.model');

class BookingService {
  async createBooking(bookingData) {
    try {
      const booking = new Booking(bookingData);
      const savedBooking = await booking.save();
      return savedBooking;
    } catch (error) {
      throw error;
    }
  }
}

module.exports = new BookingService();

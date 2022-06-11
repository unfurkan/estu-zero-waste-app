class CarbonFootPrintCalculator {
  double accommodation = 0.0;
  double food = 0.0;
  double energy = 0.0;
  static final CarbonFootPrintCalculator _instance = CarbonFootPrintCalculator._internal();

// passes the instantiation to the _instance object
  factory CarbonFootPrintCalculator() => _instance;

//initialize variables in here
  CarbonFootPrintCalculator._internal() {
  }

  double getFinalResult() {
    return this.accommodation + this.food + this.energy;
  }
  double setAccommodation(double test) {
    return this.accommodation=test;
  }

  double setFood(double food) {
    return this.food=food;
  }
  double setEnergy(double energy) {
    return this.energy=energy;
  }
}

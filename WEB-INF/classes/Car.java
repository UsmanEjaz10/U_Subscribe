public class Car implements java.io.Serializable{
   private String car_id;
   private String model;
   private String version;
   private String availablity;
   private String color;
   private String year;
   private double price;

   public Car(){}

   public Car(String car_id, String model, String version, String availablity, String color, String year, double price)
   {
    this.car_id = car_id;
    this.model = model;
    this.version = version;
    this.availablity = availablity;
    this.color = color;
    this.year = year;
    this.price = price;
   }

   public void setCar_id(String car_id)
   {
    this.car_id = car_id;
   }
   
   public void setModel(String model)
   {
    this.model = model;
   }
   
   public void setVersion(String version)
   {
    this.version = version;
   }
   
   public void setAvailability(String availablity)
   {
    this.availablity = availablity;
   }
   
   public void setColor(String color)
   {
    this.color = color;
   }
   
   public void setYear(String year)
   {
    this.year = year;
   }

   public void setPrice(double price)
   {
    this.price = price;
   }

   public String getCar_id()
   {
    return car_id;
   }

   public String getModel()
   {
    return model;
   }

   public String getVersion()
   {
    return version;
   }

   public String getAvailability()
   {
    return availablity;
   }

   public String getColor()
   {
    return color;
   }

   public String getYear()
   {
    return year;
   }

   public double getPrice()
   {
    return price;
   }
}
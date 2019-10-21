package com.jcg.spring.jdbctemplate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Product {
    private long id;
    private String name;
    private String description;
    private Date create_date;
    private long place_storage;
    private boolean reserved;
    private SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);


    public Product(long id, String name, String description, Date create_date, long place_storage, boolean reserved) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.create_date = create_date;
        this.place_storage = place_storage;
        this.reserved = reserved;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public String getCreate_dateAsString() {
        return format.format(create_date);
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public long getPlace_storage() {
        return place_storage;
    }

    public void setPlace_storage(long place_storage) {
        this.place_storage = place_storage;
    }

    public boolean isReserved() {
        return reserved;
    }

    public void setReserved(boolean reserved) {
        this.reserved = reserved;
    }

    @Override
    public String toString() {
        return id + "\t" + name + "\t" + description + "\t" + format.format(create_date) + "\t" + place_storage + "\t" + reserved;
    }

        @Override
    public boolean equals(Object o) {
        if (o == null) return false;
        if (o == this) return true;
        if (!(o instanceof Product)) return false;
        if (!o.getClass().getName().equals(this.getClass().getName())) return false;

        Product temp = (Product) o;

        if (temp.id != id) return false;
        if (temp.name != null ? !temp.name.equals(name) : name != null) return false;
        if (temp.description != null ? !temp.description.equals(description) : description != null) return false;
        if (temp.create_date != null ? !temp.create_date.equals(create_date) : create_date != null) return false;
        if (temp.place_storage != place_storage) return false;
        if (temp.reserved != reserved) return false;
        return true;
    }
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;

        result = PRIME * result + (int)id;
        result = PRIME * result + ((name == null) ? 0 : name.hashCode());
        result = PRIME * result + ((description == null) ? 0 : description.hashCode());
        result = PRIME * result + ((create_date == null) ? 0 : create_date.hashCode());
        result = PRIME * result + (int)place_storage;
        result = PRIME * result + (reserved ? 0 : 1);
        return result;
    }
}
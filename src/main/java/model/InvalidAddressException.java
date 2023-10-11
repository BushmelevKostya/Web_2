package model;

public class InvalidAddressException extends Exception{
	public InvalidAddressException(String errorMessage) {
		super(errorMessage);
	}
}

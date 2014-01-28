//* Description *//
// Title: Tokenizer
// Author: Tyler Reed
// Implements a String Tokenizer

//* Header Definition *//
#ifndef TOKENIZER_H
#define TOKENIZER_H

//* Libraries *//
#include <string>

//* Constants *//
// Default Delimiter for Strings (Space, Tab, Newline, Return, Form Feed)
const std::string DEFAULT_DELIMITER = " \t\v\n\r\f";

//* Tokenizer Class *//
class Tokenizer
{
	//* Class Variables *//
	// Private Variables
	private:
		std::string buffer;
		std::string token;
		std::string delimiter;
		std::string::const_iterator currPos;

	//* Class Methods *//
	// Public Methods
	public:
		// Constructors and Destructors
		Tokenizer();
		Tokenizer(const std::string& str, const std::string& delimiter = DEFAULT_DELIMITER);
		~Tokenizer();

		// Set String and Delimiter Methods
		void set(const std::string& str, const std::string& delimiter = DEFAULT_DELIMITER);
		void setString(const std::string& str);
		void setDelimiter(const std::string& delimiter);
	
		// Tokenizer Methods
		std::string next();

	// Private Methods
	private:
		// Delimiter Methods
		void skipDelimiter();
		bool isDelimiter(char c);
};

//* Constructors *//
// Default Constructor
Tokenizer::Tokenizer() : buffer(""), token(""), delimiter(DEFAULT_DELIMITER)
{
	currPos = buffer.begin();
}

// Argument Constructor
Tokenizer::Tokenizer(const std::string& str, const std::string& delimiter) : buffer(str), token(""), delimiter(delimiter)
{
	currPos = buffer.begin();
}

//* Destructor *//
Tokenizer::~Tokenizer()
{
}

//* Mutator Methods *//
// Sets the String and Delimiter
void Tokenizer::set(const std::string& str, const std::string& delimiter)
{
	this -> buffer = str;
	this -> delimiter = delimiter;
	this -> currPos = buffer.begin();
}

// Sets the String
void Tokenizer::setString(const std::string& str)
{
	this -> buffer = str;
}

// Sets the Delimiter
void Tokenizer::setDelimiter(const std::string& delimiter)
{
	this -> delimiter = delimiter;
	this -> currPos = buffer.begin();
}

//* Tokenizer Methods *//
std::string Tokenizer::next()
{
	// Make sure the Buffer isn't Empty
	if(buffer.size() <= 0)
		return "";

	// Reset the Token String
	token.clear();

	// Skip the Leading Delimiters
	this -> skipDelimiter();

	// Append each Character to the Token String until a Delimiter is met
	while(currPos != buffer.end() && !isDelimiter(*currPos))
	{
		token += *currPos;
		++currPos;
	}

	return token;
}

//* Delimiter Methods *//
// Skips Leading Delimiters
void Tokenizer::skipDelimiter()
{
	while(currPos != buffer.end() && isDelimiter(*currPos))
		++currPos;
}

// Returns whether or not the specified Character is a Delimiter
bool Tokenizer::isDelimiter(char c)
{
	return (delimiter.find(c) != std::string::npos);
}

//* End of Header Definition *//
#endif

//* Description *//
// Title: Stack
// Author: Tyler Reed
// Defines a Last-In-First-Out Style Linked List

//* Header Definition *//
#ifndef STACK_H
#define STACK_H

//* Libraries *//
#include "LinkedList.h"

//* Function List *//
// Stack Methods:
//  + push(T* element) : void
//  + pop() : T*
//  + peek() : T*
//
//  + getSize() : int
//  + isEmpty() : bool
//  + clear() : void

//* Stack Class *//
template <class T> class Stack
{
	//* Class Variables *//
	// Private Variables
	private:
		LinkedList<T>* list;

	//* Class Methods *//
	// Public Methods
	public:
		// Constructor and Destructor
		Stack();
		~Stack();

		// Stack Methods
		void push(T* element);
		T* pop();
		T* peek();

		// Container Methods
		int getSize();
		bool isEmpty();
		void clear();
};

//* Constructor and Destructor *//
// Default Constructor
template <class T> Stack<T>::Stack()
{
	list = new LinkedList<T>();
}

// Default Destructor
template <class T> Stack<T>::~Stack()
{
	delete list;
}

//* Stack Methods *//
// Adds the specified Element to the Top of the Stack
template <class T> void Stack<T>::push(T* element)
{
	list -> addFirst(element);
}

// Removes the Top Element from the Stack
template <class T> T* Stack<T>::pop()
{
	return list -> removeFirst();
}

// Returns the Top Element of the Stack
template <class T> T* Stack<T>::peek()
{
	return list -> getFirst();
}

//* Container Methods *//
// Returns the Size of the Stack
template <class T> int Stack<T>::getSize()
{
	return list -> getSize();
}

// Returns whether or not the Stack is Empty
template <class T> bool Stack<T>::isEmpty()
{
	return list -> isEmpty();
}

// Clears the Stack
template <class T> void Stack<T>::clear()
{
	list -> clear();
}

//* End of Header Definition *//
#endif

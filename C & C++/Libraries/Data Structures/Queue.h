//* Description *//
// Title: Queue
// Author: Tyler Reed
// Defines a First-In-First-Out Style Linked List

//* Header Definition *//
#ifndef QUEUE_H
#define QUEUE_H

//* Libraries *//
#include "LinkedList.h"

//* Function List *//
// Queue Methods:
//  + enqueue(T* element) : void
//  + dequeue() : T*
//  + peek() : T*
//
//  + getSize() : int
//  + isEmpty() : bool
//  + clear() : void

//* Queue Class *//
template <class T> class Queue
{
	//* Class Variables *//
	// Private Variables
	private:
		LinkedList<T>* list;

	//* Class Methods *//
	// Public Methods
	public:
		// Constructor and Destructor
		Queue();
		~Queue();

		// Queue Methods
		void enqueue(T* element);
		T* dequeue();
		T* peek();

		// Container Methods
		int getSize();
		bool isEmpty();
		void clear();
};

//* Constructor and Destructor *//
// Default Constructor
template <class T> Queue<T>::Queue()
{
	list = new LinkedList<T>();
}

// Default Destructor
template <class T> Queue<T>::~Queue()
{
	delete list;
}

//* Queue Methods *//
// Adds the specified Element to the End of the Queue
template <class T> void Queue<T>::enqueue(T* element)
{
	list -> addLast(element);
}

// Removes the Top Element from the Queue
template <class T> T* Queue<T>::dequeue()
{
	return list -> removeFirst();
}

// Returns the Top Element of the Queue
template <class T> T* Queue<T>::peek()
{
	return list -> getFirst();
}

//* Container Methods *//
// Returns the Size of the Queue
template <class T> int Queue<T>::getSize()
{
	return list -> getSize();
}

// Returns whether or not the Queue is Empty
template <class T> bool Queue<T>::isEmpty()
{
	return list -> isEmpty();
}

// Clears the Queue
template <class T> void Queue<T>::clear()
{
	list -> clear();
}

//* End of Header Definition *//
#endif

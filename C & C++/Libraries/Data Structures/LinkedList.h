//* Description *//
// Title: Linked List
// Author: Tyler Reed
// Defines a set of Nodes directionally Linked to each other

//* Header Definition *//
#ifndef LINKED_LIST_H
#define LINKED_LIST_H

//* Libraries *//
#include <cstddef>

//* Class Definitions *//
template <class T> class LinkedList; // Linked List Definition
template <class T> class LinkedNode; // Linked Node Definition

//* Function List *//
// Linked List Methods:
//  + getFirst() : T*
//  + get(int index) : T*
//  + getLast() : T*
//
//  + addFirst(T* element) : void
//  + addLast(T* element) : void
//  + add(T* element) : void
//
//  + removeFirst() : T*
//  + removeLast() : T*
//  + remove(int index) : T*
//
//  + indexOf(T* element int start = 0) : int
//  + contains(T* element) : bool
//
//  + getSize() : int
//  + isEmpty() : bool
//  + clear() : void
//
//  - destroy() : void
//
// Linked Node Methods:
//  + getData() : T*
//  + setData(T* data) : void
//
//  + getNext() : LinkedNote<T>*
//  + setNext(LinkedNote<T>* node) : void
//  + hasNext() : bool
//  + unlinkNext() : void

//* Linked Node Class *//
template <class T> class LinkedNode
{
	//* Class Variables *//
	// Public Variables
   	public:
		template <class> friend class LinkedList;

	// Private Variables
    	private:
		T* data;
		LinkedNode *next;

	//* Class Methods *//
	// Public Methods
	public:
		// Constructor and Destructor
		LinkedNode();
		~LinkedNode();

		// Data Methods
		T* getData();
		void setData(T *data);

		// Node Methods
		LinkedNode<T>* getNext();
		void setNext(LinkedNode<T> *node);
		bool hasNext();
		void unlinkNext();
};

//* Constructor *//
template <class T> LinkedNode<T>::LinkedNode()
{
	data = NULL;
	next = NULL;
}

//* Destructor *//
template <class T> LinkedNode<T>::~LinkedNode()
{
	// Nothing to Delete
	// Linked List will handle Deletion
}

//* Data Methods *//
// Returns the Data pointed by this Node
template <class T> T *LinkedNode<T>::getData()
{
	return data;
}

// Sets the Data pointed by this Node
template <class T> void LinkedNode<T>::setData(T *data)
{
	this -> data = data;
}

//* Node Methods *//
// Returns the Next Node pointed by this Node
template <class T> LinkedNode<T>* LinkedNode<T>::getNext()
{
	return next;
}

// Sets the Next Node pointed by this Node
template <class T> void LinkedNode<T>::setNext(LinkedNode<T> *node)
{
	this -> next = node;
}

// Returns whether or not this Node points to an Existing Node
template <class T> bool LinkedNode<T>::hasNext()
{
	return *next != NULL;
}

// Unlinks the Node pointed by this Node
template <class T> void LinkedNode<T>::unlinkNext()
{
	next = NULL;
}

//* Linked List Class *//
template <class T> class LinkedList
{
	//* Class Variables *//
	// Private Variables
    	private:
		LinkedNode<T> *head;
		LinkedNode<T> *tail;
		int size;

	//* Class Methods *//
	// Public Methods
	public:
		// Constructors and Destructors
		LinkedList(); // Normal constructor
		LinkedList(LinkedList &source); // Copy Constructor
		~LinkedList(); // Destructor

		// Accessor Methods
		T* getFirst();
		T* get(int index);
		T* getLast();

		// Add Methods
		void addFirst(T *element);
		void addLast(T *element);
		void add(T *element, int index);

		// Remove Methods
		T* removeFirst();
		T* removeLast();
		T* remove(int index);

		// Search Methods
		int indexOf(T* element, int start);
		bool contains(T *element);

		// Container Methods
		int getSize();
		bool isEmpty();
		void clear();

	// Private Methods
	private:
 		void destroy();
};

//* Constructors *//
// Normal Constructor
template <class T> LinkedList<T>::LinkedList()
{
	head = NULL;
	tail = NULL;
	size = 0;
}

// Copy Constructor
template <class T> LinkedList<T>::LinkedList(LinkedList &source)
{
	head = NULL;
	tail = NULL;
	size = 0;

	*this = source;
}

// Destructor
template <class T> LinkedList<T>::~LinkedList()
{
	destroy();
}

//* Accessor Methods *//
// Returns the Element at the Beginning of the List
template <class T> T* LinkedList<T>::getFirst()
{
	return head -> getData();
}

// Returns the Element at the specified Index
template <class T> T* LinkedList<T>::get(int index)
{
	LinkedNode<T> *node = head;

	for(int i = 0; i < index; i++)
		node = node -> getNext();

	return node -> getData();
}

// Returns the Element at the End of the List
template <class T> T* LinkedList<T>::getLast()
{
	return tail -> getData();
}

//* Add Methods *//
// Adds the specified Element to the Beginning of the List
template <class T> void LinkedList<T>::addFirst(T *element)
{
	// Create a New Node
	LinkedNode<T> *node = new LinkedNode<T>();

	// Link the New Node
	node -> setData(element);
	node -> setNext(head);

	// Move the Node to the Head
	head = node;

	// Assign the Tail if it doesn't exist
	if(tail == NULL)
		tail = node;

	// Increase the List Size
	size++;
}

// Adds the specified Element to the End of the List
template <class T> void LinkedList<T>::addLast(T *element)
{
	// Assign the Head if it doesn't exist
	if(head == NULL)
	{
		addFirst(element);
		return;
	}

	// Create a New Node
	LinkedNode<T> *node = new LinkedNode<T>();

	// Link the New Node
	node -> setData(element);
	tail -> setNext(node);

	// Move the Node to the Tail
	tail = node;

	// Increase the List Size
	size++;
}

// Adds the specified Element to the specified Index of the List
template <class T> void LinkedList<T>::add(T *element, int index)
{
	// Check First and Last Cases
	if(index == 0)
	{
		addFirst(element);
		return;
	}
	else if(index >= size - 1)
	{
		addLast(element);
		return;
	}

	// Find the Previous Node of the specified Index
	LinkedNode<T> *previous = head;

	for(int i = 0; i < index - 1; i++)
		previous = previous -> getNext();

	// Create a new Node
	LinkedNode<T> *node = new LinkedNode<T>();
	node -> setData(*element);

	// Link the Nodes together
	node -> setNext(*(previous -> getNext()));
	previous -> setNext(*node);

	// Increase the Size of the List
	size++;
}

//* Remove Methods *//
// Removes the First Element from the List
template <class T> T* LinkedList<T>::removeFirst()
{
	// Make sure the Head exists
	if(head == NULL)
		return NULL;

	// Store the Head Data
	T* data = head -> getData();

	// Define the New Head
	LinkedNode<T> *node = head;

	// Linked the New Head
	head = head -> getNext();

	// Delete the Old Head
	delete node;

	// Clear the Tail if the List is empty
	if(head == NULL)
		tail = NULL;

	// Decrease the List Size
	size--;

	// Return the Removed Data
	return data;
}

// Removes the Last Element from the List
template <class T> T* LinkedList<T>::removeLast()
{
	// Make sure the Head exists
	if(head == NULL)
		return NULL;

	// Check if the Tail is also the Head
	if(head == tail)
		return removeFirst();

	// Store the Tail Data
	T data = tail -> getData();

	// Find the Node before the Tail
	LinkedNode<T> *node = head;

	// Navigate through the List
	while(node -> getNext() -> getNext() != NULL)
		node = node -> getNext();

	// Delete the Old Tail
	delete tail;

	// Define the new Tail
	tail = node;

	// Clear any connections after the Tail
	tail -> unlinkNext();

	// Decrease the List Size
	size--;

	// Return the Removed Data
	return data;
}

// Removes the specified Element from the List
template <class T> T* LinkedList<T>::remove(int index)
{
	// Check First and Last Cases
	if(index == 0)
		return removeFirst();
	else if(index >= size - 1)
		return removeLast();

	// Find the Previous Node of the specified Index
	LinkedNode<T> *previous = head;

	for(int i = 0; i < index - 1; i++)
		previous = previous -> getNext();

	// Determine Node to be Removed
	LinkedNode<T> *node = previous -> getNext();

	// Store the Data
	T data = node -> getData();

	// Remove the Node
	previous -> setNext(*(node -> getNext()));
	delete node;

	// Decrease the Size of the List
	size--;

	// Return the Removed Data
	return data;
}

//* Search Methods *//
// Returns the Index of the specified Element
template <class T> int LinkedList<T>::indexOf(T* element, int start = 0)
{
	LinkedNode<T> *node = head;

	for(int i = 0; i < size; i++)
		if(*element == *(node -> getData()) && i >= start)
			return i;
		else
			node = node -> getNext();

	return -1;
}

// Returns whether or not the List contains the specified Element
template <class T> bool LinkedList<T>::contains(T *element)
{
	indexOf(element) >= 0;
}

//* Container Methods *//
// Returns the Size of the List
template <class T> int LinkedList<T>::getSize()
{
	return size;
}

// Returns whether or not the List is Empty
template <class T> bool LinkedList<T>::isEmpty()
{
	return head == NULL;
}

// Destroys the contents of the List and the List itself
template <class T> void LinkedList<T>::destroy()
{
	// Clear the First Element until nothing is left
	while(!isEmpty())
	{
		T* data = head -> data;
		removeFirst();
		delete data;
	}
}

// Destroys the List, but the contents will remain (Can cause Memory Leaks)
template <class T> void LinkedList<T>::clear()
{
	// Clear the First Element until nothing is left
	while(!isEmpty())
		removeFirst();

	delete this;
}

//* End of Header Definition *//
#endif

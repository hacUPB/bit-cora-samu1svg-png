## main.cpp
```.asm
#include "ofMain.h"
#include "ofApp.h"

//========================================================================
int main( ){

	//Use ofGLFWWindowSettings for more options like multi-monitor fullscreen
	ofGLWindowSettings settings;
	settings.setSize(1024, 768);
	settings.windowMode = OF_WINDOW; //can also be OF_FULLSCREEN

	auto window = ofCreateWindow(settings);

	ofRunApp(window, std::make_shared<ofApp>());
	ofRunMainLoop();

}

```
## Codigo de ofApp.cpp
```.asm
#include "ofApp.h"
//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
	ofSetCircleResolution(60);
}
//--------------------------------------------------------------
void ofApp::update() {
	backgroundHue += 0.2;
	if (backgroundHue > 255)
		backgroundHue = 0;
	if (ofGetMousePressed()) {
		float x = ofGetMouseX();
		float y = ofGetMouseY();
		float radius = ofRandom(8, 18);

		ofColor color;
		color.setHsb(ofRandom(255), 200, 255);

		float opacity = 255;

		strokes.enqueue(x, y, radius, color, opacity);
	}
	// TODO: agregar un nuevo trazo si el mouse está presionado.
	// Usa strokes.enqueue(x, y, radius, color, opacity);
}
//--------------------------------------------------------------
void ofApp::draw() {
	// Fondo con gradiente dinámico
	ofColor color1, color2;
	color1.setHsb(backgroundHue, 150, 240);
	color2.setHsb(fmod(backgroundHue + 128, 255), 150, 240);
	ofBackgroundGradient(color1, color2, OF_GRADIENT_LINEAR);
	// TODO: dibujar los trazos almacenados en la cola.
	Node * current = strokes.front;
	int index = 0;
	// Recorre los nodos desde strokes.front hasta nullptr y usa ofDrawCircle().
	while (current != nullptr) {
		float alpha = ofMap(index, 0, strokes.size - 1, 40, 255, true);

		ofSetColor(current->color.r, current->color.g, current->color.b, alpha);
		ofDrawCircle(current->x, current->y, current->radius);

		current = current->next;
		index++;
	}
}
//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == 'c') {
		// TODO: limpiar la cola de trazos.
		strokes.clear();

	}
	if (key == 'a') {
		// TODO: alternar entre 50 y 100 trazos.
		if (strokes.maxSize == 50) {
			strokes.maxSize = 100;
		} else {
			strokes.maxSize = 50;
		}

		while (strokes.size > strokes.maxSize) {
			strokes.dequeue();
		}
	} else if (key == 's') {
		// TODO: guardar el frame actual.
		ofSaveScreen("screenshot_" + ofGetTimestampString() + ".png");
	}
}

```
## ofApp.h
```.asm
#pragma once
#include "ofMain.h"

// Nodo de la cola
struct Node {
	float x, y;
	float radius;
	ofColor color;
	float opacity;
	Node * next;

	Node(float _x, float _y, float _radius, ofColor _color, float _opacity)
		: x(_x)
		, y(_y)
		, radius(_radius)
		, color(_color)
		, opacity(_opacity)
		, next(nullptr) { }
};

// Implementación manual de una cola (FIFO)
class BrushQueue {
public:
	Node * front;
	Node * rear;
	int size;
	int maxSize;

	BrushQueue(int _maxSize);
	~BrushQueue();

	void enqueue(float x, float y, float radius, ofColor color, float opacity);
	void dequeue();
	void clear();
	bool isEmpty();
};

// Constructor
BrushQueue::BrushQueue(int _maxSize)
	: front(nullptr)
	, rear(nullptr)
	, size(0)
	, maxSize(_maxSize) {
}

// Destructor
BrushQueue::~BrushQueue() {
	clear();
}

// Implementa aquí `enqueue()`
void BrushQueue::enqueue(float x, float y, float radius, ofColor color, float opacity) {
	Node * newNode = new Node(x, y, radius, color, opacity);

	if (isEmpty()) {
		front = newNode;
		rear = newNode;
	} else {
		rear->next = newNode;
		rear = newNode;
	}

	size++;

	if (size > maxSize) {
		dequeue();
	}
}

// Implementa aquí `dequeue()`
void BrushQueue::dequeue() {
	if (isEmpty()) {
		return;
	}

	Node * temp = front;
	front = front->next;
	delete temp;
	size--;

	if (front == nullptr) {
		rear = nullptr;
	}
}

// Implementa aquí `clear()`
void BrushQueue::clear() {
	while (!isEmpty()) {
		dequeue();
	}
}

// Implementa aquí `isEmpty()`
bool BrushQueue::isEmpty() {
	return front == nullptr;
}

class ofApp : public ofBaseApp {
public:
	BrushQueue strokes; // cola de trazos
	float backgroundHue = 0;

	ofApp()
		: strokes(50) { } // Tamaño máximo inicial de la cola

	void setup();
	void update();
	void draw();
	void keyPressed(int key);
};

```

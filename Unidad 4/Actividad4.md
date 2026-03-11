## main.cpp
```.asm
#include "ofApp.h"
#include "ofMain.h"

//========================================================================
int main() {

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

	backgroundHue += 0.2f;

	if (backgroundHue > 255) {
		backgroundHue = 0;
	}

	if (!ofGetMousePressed()) return;

	float mx = ofGetMouseX();
	float my = ofGetMouseY();

	float r = ofRandom(8, 18);

	ofColor c;
	c.setHsb(ofRandom(255), 200, 255);

	float op = 255;

	strokes.enqueue(mx, my, r, c, op);
}

//--------------------------------------------------------------
void ofApp::draw() {

	ofColor c1, c2;

	c1.setHsb(backgroundHue, 150, 240);
	c2.setHsb(fmod(backgroundHue + 128, 255), 150, 240);

	ofBackgroundGradient(c1, c2, OF_GRADIENT_LINEAR);

	Node * ptr = strokes.front;

	int pos = 0;

	while (ptr != nullptr) {

		float alpha = ofMap(pos, 0, strokes.size - 1, 40, 255, true);

		ofSetColor(ptr->color.r, ptr->color.g, ptr->color.b, alpha);

		ofDrawCircle(ptr->x, ptr->y, ptr->radius);

		ptr = ptr->next;
		pos++;
	}
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {

	if (key == 'c') {
		strokes.clear();
	}

	if (key == 'a') {

		if (strokes.maxSize == 50) {
			strokes.maxSize = 100;
		} else {
			strokes.maxSize = 50;
		}

		while (strokes.size > strokes.maxSize) {
			strokes.dequeue();
		}
	}

	else if (key == 's') {
		ofSaveScreen("screenshot_" + ofGetTimestampString() + ".png");
	}
}

```
## ofApp.h
```.asm
#pragma once
#include "ofMain.h"

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

BrushQueue::BrushQueue(int _maxSize)
	: front(nullptr)
	, rear(nullptr)
	, size(0)
	, maxSize(_maxSize) { }

BrushQueue::~BrushQueue() {
	clear();
}

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

void BrushQueue::dequeue() {

	if (isEmpty()) return;

	Node * oldFront = front;

	front = front->next;

	delete oldFront;

	size--;

	if (front == nullptr) {
		rear = nullptr;
	}
}

void BrushQueue::clear() {

	while (!isEmpty()) {
		dequeue();
	}
}

bool BrushQueue::isEmpty() {

	return front == nullptr;
}

class ofApp : public ofBaseApp {

public:
	BrushQueue strokes;
	float backgroundHue = 0;

	ofApp()
		: strokes(50) { }

	void setup();
	void update();
	void draw();
	void keyPressed(int key);
};

```
## link del videito jejeje
https://youtu.be/KuinTA4lxNw?feature=shared

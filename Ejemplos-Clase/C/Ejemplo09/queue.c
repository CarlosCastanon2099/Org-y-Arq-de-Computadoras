#include <stdlib.h>
#include "queue.h"

typedef struct node {
  void *element;
  struct node *next;
} node;

struct queue {
  node *head;
  node *tail;
  int size;
};

queue *new_queue()
{
  queue *ptnew_queue = malloc(sizeof(queue));
  ptnew_queue->head = NULL;
  ptnew_queue->tail = NULL;
  ptnew_queue->size = 0;
  return ptnew_queue;
}

void free_queue(queue *q)
{
  int i = 0;
  node *ptnode, *ptnext_node;
  ptnode = q->head;
  for(i = 0; i < q->size; i++) {
    ptnext_node = ptnode->next;
    free(ptnode);
    ptnode = ptnext_node;
  }
  free(q);
}

int size(queue *q)
{
  return q->size;
}

void enqueue(void *element, queue *q)
{
  node *ptnew_node;
  ptnew_node = malloc(sizeof(node));
  ptnew_node->element = element;
  ptnew_node->next = NULL;
  if (q->size == 0) {
    q->head = ptnew_node;
    q->tail = ptnew_node;
  } else {
    q->tail->next = ptnew_node;
    q->tail = ptnew_node;
  }
  q->size++;
}

void *dequeue(queue *q)
{
  node *ptnode;
  void *ptelem;
  ptnode = q->head;
  ptelem = ptnode->element;
  q->head = ptnode->next;
  q->size--;
  free(ptnode);
  return ptelem;
}

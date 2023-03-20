#if !defined(NULL)
#define NULL 0
#endif

typedef struct queue queue;

queue *new_queue();
void free_queue(queue *q);
int size(queue *q);

void enqueue(void *element, queue *q);
void *dequeue(queue *q);

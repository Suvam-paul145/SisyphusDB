package main

import "sync"

type KVStore struct {
	mp map[string]string
	mu sync.RWMutex
}

func NewKVStore() *KVStore {
	return &KVStore{mp: make(map[string]string)}
}

func (kv *KVStore) Put(key string, val string) {
	kv.mu.Lock()
	defer kv.mu.Unlock()
	kv.mp[key] = val
}

func (kv *KVStore) Get(key string) (string, bool) {
	kv.mu.RLock()
	defer kv.mu.RUnlock()
	val, ok := kv.mp[key]
	return val, ok
}

func (kv *KVStore) Delete(key string) {
	kv.mu.Lock()
	defer kv.mu.Unlock()
	delete(kv.mp, key)
}

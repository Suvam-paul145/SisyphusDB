package kv

import (
	"KV-Store/wal"
	"sync"
)

type Store struct {
	mp  map[string]string
	mu  sync.RWMutex
	Wal *wal.WAL
}

func NewKVStore(filename string) (*Store, error) {

	walLog, entries, err := wal.OpenWAL(filename)
	if err != nil {
		return nil, err
	}
	mp := make(map[string]string)
	for _, entry := range entries {
		switch entry.Cmd {
		case wal.CmdPut:
			mp[string(entry.Key)] = string(entry.Value)
		case wal.CmdDelete:
			delete(mp, string(entry.Key))
		}
	}

	return &Store{mp: mp, Wal: walLog}, nil

}

func (kv *Store) Put(key string, val string) {
	kv.mu.Lock()
	defer kv.mu.Unlock()
	kv.mp[key] = val
}

func (kv *Store) Get(key string) (string, bool) {
	kv.mu.RLock()
	defer kv.mu.RUnlock()
	val, ok := kv.mp[key]
	return val, ok
}

func (kv *Store) Delete(key string) {
	kv.mu.Lock()
	defer kv.mu.Unlock()
	delete(kv.mp, key)
}


CXX = CC

# upcxx-meta PPFLAGS are really CFLAGS to be used during compilation
# upcxx-meta LDFLAGS are really CFLAGS to be used during linking
# upcxx-meta LIBFLAGS are really a combination of LDLIBS and LDFLAGS

CXXFLAGS = `upcxx-meta PPFLAGS` `upcxx-meta LDFLAGS`
LDFLAGS = `upcxx-meta LIBFLAGS`


#all: kmer_hash hashmap
all: kmer_hash

kmer_hash: kmer_hash.cpp hashmap.h kmer_t.hpp pkmer_t.hpp packing.hpp read_kmers.hpp hash_map.hpp butil.hpp
	$(CXX) kmer_hash.cpp -o kmer_hash $(CXXFLAGS) $(LDFLAGS)

hashmap: hashmap.cpp hashmap.h kmer_t.hpp pkmer_t.hpp packing.hpp read_kmers.hpp butil.hpp
	$(CXX) hashmap.cpp -o hashmap $(CXXFLAGS) $(LDFLAGS)

clean:
	@rm -fv kmer_hash hashmap

/******************************************************************************

test for features of newton's method for sqrt_r

*******************************************************************************/
#include <iostream>
#include <cmath>
using namespace std;

int dph;
int gus; // init guess for sqrt_r
double buf; // sqrt result when at specific depth
const double BASE = 72 * 72; // BASE is used to convert block^2 to double
const int MAX = 20 * 72 * 72; // MAX is used to limit(20 block / tick) the range of sqrt_r

int dig(int g, int a) {
    dph++;
    int r = (g + (2 * a / g) / 2) / 2;
    if (dph == 4 || g == r) buf = r;
    if (g == r || dph > 50) return r;
    return dig(r, a);
}

int sqrt_r(int a) {
    dph = 0;
    if (a == 0) return 0;
    return dig(gus, a);
}

double avg(int g) {
    gus = g;
    int t = 0;
    for(int i = 1; i < MAX; i++) {
        sqrt_r(i);
        t += dph;
    }
    return (float)(t) / MAX;
}

// find first guess toward minium recurise time
// result: 235
void test1()
{
    int argmin;
    double min = 1e10, val;
    for(int i = 100; i < 301; i++) {
        val = avg(i);
        if(val < min) {
            min = val;
            argmin = i;
            printf("new min: [%d]-> %.3f\n", argmin, min);
        }
    }
}

// find accurcy for long(50+) recurise, when limited to 4
// result: 65535 gives  biggest error (0.098 * BASE)
void test2() {
    gus = 235;
    double diff;
    for(int i = 1; i < MAX; i++) {
        sqrt_r(i);
        diff = (buf * buf - i) / BASE;
        if(diff < 0) diff = -diff;
        if (dph >= 50 && diff > 2e-4) {
            printf("big depth: [%d (%.3f block^2)], diff: %f block^2\n",
                                i,  i / BASE,             diff);
        }
    }
}

// find biggest error when limited to 4 recurise.
// result: 103039 gives biggest error (0.123 * BASE)
void test3(){
    gus = 235;
    
    int argmax;
    double max = 0;
    
    double v, diff;
    for(int i = 1; i < MAX; i++) {
        sqrt_r(i);
        diff = buf * buf - i;
        if(diff < 0) diff = -diff;
        if(diff > max) {
            max = diff;
            argmax = i;
            printf("new max: [%d]-> %.3f (%.3f block^2)\n",
                              argmax, max, max / BASE);
        }
    }
}

// find average and standard deviation of error
// result in block^2: avg: -0.041, stddev: 0.029
// result in block: avg: -9.56e-05, stddev: 5.89e-05
void test3_1(){
    gus = 235;
    
    double sum = 0, sum2 = 0, diff;
    int count = 0;
    
    for(int i = 1; i < MAX; i++) {
        sqrt_r(i);
        diff = buf - sqrt(i);
        sum += diff;
        sum2 += diff * diff;
        count++;
    }
    
    double avg = sum / count;
    double stddev = sqrt(sum2 / count - avg * avg);
    
    // printf("avg: %.3f, stddev: %.3f\n", avg / BASE, stddev / BASE);
    printf("avg: %.2e, stddev: %.2e\n", avg / BASE, stddev / BASE);
}

# include <vector>
# include <string>
#include <algorithm>
#include <random>
class Bucket {
    vector<vector<int>> values;
public:
    Bucket(size_t n): values(vector<vector<int>>(n)) {}
    void append(int val, int depth) {
        values[depth].push_back(val);
    }
    void show(size_t N=3, int seed = 0) {
        cout << '\n';
        for(size_t j = 0; j < values.size(); j++) {
            auto& c = values[j];
            if(c.size() == 0) continue;
            
            // if (c.size() > N) {
            //     std::mt19937 rng(seed + j);
            //     std::shuffle(c.begin(), c.end(), rng);
            // }

            size_t stop = (c.size() > N)? N: c.size();
            cout << ((j > 50)? "50+": to_string(j)) << "   " << c.size() << ":[ ";
            for(size_t i = 0; i < stop; i++) {
                cout << c[i] << " ";
            }
            if (c.size() > N) cout << "...";
            cout << "]\n";
        }
    }
};

// find occur time of each possible depth (up to 50)
/* Result:
depth   count   value
    1     470   [ 55225 55226 55227 ...]
    2   13117   [ 45796 45797 45798 ...]
    3   60597   [ 20736 20737 20738 ...]
    4   22204   [ 4900 4901 4902 ...]
    5    5644   [ 900 901 902 ...]
    6    1126   [ 144 145 146 ...]
    7     180   [ 16 17 18 ...]
    8      21   [ 1 2 4 ...]
  50+     320   [ 3 8 15 ...]
*/
void test4(){
    
    gus = 235;
    
    int argmax;
    double max = 0;
    
    Bucket b = Bucket(52);
    for(int i = 1; i < MAX; i++) {
        sqrt_r(i);
        b.append(i, dph);
    }
    b.show();
}

// find occur time of positive and negative error
/* Result:
Error   count   value
neg     103154  [ 2 5 6 ...]
pos     525     [ 1 3 4 ...]
*/ 
void test4_1(){
    gus = 235;
    
    Bucket b = Bucket(52);
    for(int i = 1; i < MAX; i++) {
        sqrt_r(i);
        double diff = buf - sqrt(i);
        b.append(i, diff >= 0);
    }
    b.show(10);
}

int main() {
    test4();
    return 0;
}
#!/bin/env node

const M = 1000n * 1000n * 1000n;

if(process.argv.length < 4) {
	console.log('Usage: node ./fibo.js ALGO N');
	console.log('ALGO can be one of the below:');
	console.log([
		'\trec - compute recursively: O(\\phi^N) (\\phi = [1+sqrt(5)]/2 = Golden Ratio)',
		'\tdpa - compute with a dynamic programming using an array: O(N)',
		'\tdpn - compute with a dynamic programming WITHOUT using an array: O(N)',
		'\tmat - compute using repeated squaring with a matrix: O(log(N))'
	].join('\n'));
	return 0;
}

const ALGO = process.argv[2];
const N = BigInt(process.argv[3]);

if(N < 0) {
	throw new Error('N should be larger than 0!!!');
}

switch(ALGO) {
	case 'rec':
		const fibo_rec = (n) => {
			if(n == 0) return 0n;
			if(n == 1) return 1n;
			return (fibo_rec(n-1n) + fibo_rec(n-2n)) % M;
		};
		console.log(`Fn = ${fibo_rec(N)}`);
		break;
	case 'dpa':
		const fibo = [0n, 1n];
		for(let i=2n; i<=N; i++) {
			fibo.push((fibo[i-1n] + fibo[i-2n]) % M);
		}
		console.log(`Fn = ${fibo[N]}`);
		break;
	case 'dpn':
		let [a, b] = [0n, 1n];
		for(let i=2n; i<=N; i++) {
			[a, b] = [b, (a + b) % M];
		}
		console.log(`Fn = ${b}`);
		break;
	case 'mat':
		const mat_mul = (a, b) => [
			(a[0]*b[0] + a[1]*b[2]) % M, (a[0]*b[1] + a[1]*b[3]) % M,
			(a[2]*b[0] + a[3]*b[2]) % M, (a[2]*b[1] + a[3]*b[3]) % M
		];
		const mat_exp_rec = (a, n) => {
			if(n == 0) return [1n, 0n, 0n, 1n];
			const x = mat_exp_rec(a, n>>1n);
			const y = mat_mul(x, x);
			return (n%2n == 0) ? y : mat_mul(y, a);
		};
		const mat_exp_norec = (a, n) => {
			let a2 = a;
			let ans = [1n, 0n, 0n, 1n];
			while(n > 0) {
				if(n%2n == 1) ans = mat_mul(ans, a2);
				a2 = mat_mul(a2, a2);
				n >>= 1n;
			}
			return ans;
		};
		console.log(`Fn = ${mat_exp_rec([1n, 1n, 1n, 0n], N)[2]}`);
		//console.log(`Fn = ${mat_exp_norec([1n, 1n, 1n, 0n], N)[2]}`);
		break;
	default:
		throw new Error('E: unknown algorithm: ' + ALGO);
}


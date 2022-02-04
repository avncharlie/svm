#!/bin/bash
mkdir build 2> /dev/null
cd compiler
npm run build -- ../src/*.js ../build/out.sasm
cd ..
cd optfuscator
npm run build -- ../build/out.sasm ../build/optimized.sasm
cd ..
cd assembler
npm run build -- ../build/optimized.sasm ../build/out.sobj ../build/out.smap ../build/instrs.txt
cd ..
cd preprocessor
npm run build -- ../build/out.sobj global ../build/instrs.txt ../client/src/index.js ../client/src/index.js
cd ..
cd client
npm run build --production
cd ..

// Definition context e.g. library

function asyncProcess(cb) {
    // async
    // ...
    cb(result);
}

// invokation context

function onFinish(x) {
    // async code finished and this callback has been called asynchronusly
    return x * x;
}

// asyncProcess(onFinish);

asyncProcess(x => x * x);

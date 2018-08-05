function asyncTask() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            console.log('after 2s');
            const r = parseInt(Math.random() * 100);
            console.log(r);
            if (r >= 50) {
                resolve([r, 122, 123, 523]); // odpowiednik return w kodzie synchronicznym
            } else {
                reject(new Error('ERR_DB_IO'));
            }
        }, 2000);
    });
}


function handleResults(magicNumber) {
    console.log('success');
    console.log(magicNumber);
    return Promise.resolve();
}

function handleError(err) {
    console.log('Error handling');
    console.log(err);
    return Promise.resolve();
}

// promise resolve -> then -> promise fullfill
// promise reject -> catch -> promise rejection
asyncTask().then(handleResults).catch(handleError);



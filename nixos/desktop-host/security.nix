{...}:
{

  security = {
    polkit.enable = true;

    pam.loginLimits = [{
      domain = "*";
      type = "-";
      item = "memlock";
      value = "infinity";


    }];
    };
}

{ isDarwin, ... }:
{
  programs.git =
    let
      sshSigningKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNIrIThyoPhDtxHqiqtV0nKXHu8MrFzB/kF3ZxC2/OIGhgOzh756cmJC7J6razz2VM8gqQS07jU52QfwegvQCBHGaPOn65jhvUwxz6NAIFvISFcN97YF6etUNTRHvrL1jtEEtKHBx5jMgbZa47VOcIuUgXYpdE39QeFUmF3O/mRWCzWcCA6JM2vX2qLk81QuPMRcOUoM6rHb+xi3dTsJOEoeLlR/NmB/Sl4FQ2tJlJcPBjHQFWeKL13MPchTA3EwocJZjE4elK1LPl0RXZzd2y9MY1YKl/k8Aaxsu77PVfxfDQhiyJ21/SyGbwl9yxo+OMf0hPlN4cuWM7TW9d5F5QNmMh3+/YlxtkYEII5WmaWbEIdhaf0MKWMydZs3ktsAVInvxpZEnmSFVOEi1uuNUWXVToRHnxn/Exz4h/7092LZt73is9aTHiqzaCx1EH4XtESDnD26f2MiFO02zaMsF0tZQEyETnSdD0zx9eDXqhfMJmDnLHlJ64tch9U6afsF2Eby+Gpgoz6pJCx0NyGexLWgPpRF/lquZDR+07TxTtk+yAzQ5Khk6CumhjdcuHvty5+BhPegsveiTm3cxL/vOPy+Ecwf+/qMwQeG8s0Qp+d8SzxYoeaB5G6KqgBSEqZECJ6RNQbgOXsBI5Icnc09P0YMWiDQcGiR9VpAAO7JHYMw==";
    in
    {
      enable = true;
      userName = "poisonphang";
      userEmail = "17688291+PoisonPhang@users.noreply.github.com";
      lfs.enable = true;
      extraConfig = {
        color.ui = true;
        github.user = "poisonphang";
        gpg.format = "ssh";
        init.defaultBranch = "main";

        # Fix go private dependency fetching by using SSH instead of HTTPS
        "url \"ssh://git@github.com/\"".insteadOf = "https://github.com/";
        commit.gpgsign = true;
        user.signingkey = sshSigningKey;
        signing = {
          signByDefault = true;
          key = sshSigningKey;
        };
      };
    };
}

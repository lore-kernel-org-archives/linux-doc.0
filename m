Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B21087D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 16:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbeJBXi0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 19:38:26 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:40719 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbeJBXi0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 19:38:26 -0400
Received: by mail-yw1-f66.google.com with SMTP id l79-v6so1035970ywc.7
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 09:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=3KjyMR08bmd9YZmum53kS/V/XW07F6Rp6ifIGqpPh2M=;
        b=AuCTrPWPVkjdDsflK4b3v5Nu5F/wwaZZXIByGqgI4xNRRHvWAYxNTFlAZcADMZCmiK
         NQJOPjWhluzj0VV4MUcGKvZKg4vjuWEs+7asTr7PD8ZltruGrOB0CBGbCVWuvc5q7yYd
         KZWRcJ2X1SYMqNEa2sf+yZh7xIBMqw4pgbv08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=3KjyMR08bmd9YZmum53kS/V/XW07F6Rp6ifIGqpPh2M=;
        b=Uy/Qzq8rQ511TKtdbbcjAlMDVDbHx4z0ZVGQEUVla0RNmM5noNiZZ6RI6LIG9PKP66
         LWzYcH+OLzfOnAOhqUtpP5EDylSIfmjegpNQjA6G5xW9uT1wfRVxro7veWq6PNlYN4yn
         hIZyk5BKDXTGBnaYfEzVmpX+qiL1yqiSUmyUtj758MBxB4MJDTGMNiOETXwsYmuiskt/
         xLn1Ep3WM1DzrT6/mP0V/n5ap7z8z8GSF+uRGFZREr0SBuxj8A0a85V5LI48i8UhnFzB
         4zBfTSVKbv7mg4ydUIfX9zqRrb5S8qtHEl28rG9WfxMwyRlgl5e+03uprUiJeUYJHdyf
         lERA==
X-Gm-Message-State: ABuFfojz9C/BYGwIzfDoRuCPVmn2vfcPA8fQKPj9Q7WNS1zej7ua4r1/
        HP5zheDM4wHcLJeChT3xbX4K+v2y6JY=
X-Google-Smtp-Source: ACcGV60dKF7lpJ71FQPvWf1U/ok3+D2/k6uX4PbgQRqWHmxQsq8uhQqm/ajpWfHL6unjE3oIu9sKNQ==
X-Received: by 2002:a0d:e001:: with SMTP id j1-v6mr9303602ywe.391.1538499247328;
        Tue, 02 Oct 2018 09:54:07 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id r128-v6sm928668ywd.19.2018.10.02.09.54.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 09:54:07 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 184-v6so1084780ybg.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 09:54:06 -0700 (PDT)
X-Received: by 2002:a25:3588:: with SMTP id c130-v6mr7666980yba.410.1538499246259;
 Tue, 02 Oct 2018 09:54:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 09:54:05 -0700 (PDT)
In-Reply-To: <QpdcE4QSCQKJqDmB2QBEGBlnlioHuRHlM0g5HF8KbHjU1zIUAOjnQ2r9EIMu3m0S2OWNR3_M_TSp_M6CVDqkp6kKuFPUvegsyDPNw1AGju4=@protonmail.ch>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-24-keescook@chromium.org>
 <CAHC9VhQjMfH6Q+Tif8nBknZojgxrb6x+oDz4vHRiZN8rb8MZ5Q@mail.gmail.com>
 <785ef6a9-ae46-3533-0348-74bcf6f10928@tycho.nsa.gov> <CAGXu5jKNzG3rGUAV39D0w4txHRG3H2qU1Z1e_b+03OgycTaWqA@mail.gmail.com>
 <809f1cfd-077b-ee58-51ba-b22daf46d12b@tycho.nsa.gov> <QpdcE4QSCQKJqDmB2QBEGBlnlioHuRHlM0g5HF8KbHjU1zIUAOjnQ2r9EIMu3m0S2OWNR3_M_TSp_M6CVDqkp6kKuFPUvegsyDPNw1AGju4=@protonmail.ch>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 2 Oct 2018 09:54:05 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKqXNbEvPr1axQtGCCnWsGhDgjynW5u326mcx4vZ1oH8g@mail.gmail.com>
Message-ID: <CAGXu5jKqXNbEvPr1axQtGCCnWsGhDgjynW5u326mcx4vZ1oH8g@mail.gmail.com>
Subject: Re: [PATCH security-next v4 23/32] selinux: Remove boot parameter
To:     Jordan Glover <Golden_Miller83@protonmail.ch>
Cc:     Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 2, 2018 at 9:33 AM, Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
> It's always documented as: "selinux=1 security=selinux" so security= should
> still do the job and selinux=1 become no-op, no?

The v3 patch set worked this way, yes. (The per-LSM enable defaults
were set by the LSM. Only in the case of "lsm.disable=selinux" would
the above stop working.)

John did not like the separation of having two CONFIG and two
bootparams mixing the controls. The v3 resolution rules were:

SECURITY_SELINUX_BOOTPARAM_VALUE overrides CONFIG_LSM_ENABLE.
SECURITY_APPARMOR_BOOTPARAM_VALUE overrides CONFIG_LSM_ENABLE.
selinux= overrides SECURITY_SELINUX_BOOTPARAM_VALUE.
apparmor.enabled= overrides SECURITY_APPARMOR_BOOTPARAM_VALUE.
apparmor= overrides apparmor.enabled=.
lsm.enable= overrides selinux=.
lsm.enable= overrides apparmor=.
lsm.disable= overrides lsm.enable=.
major LSM _omission_ from security= (if present) overrides lsm.enable.

v4 removed the per-LSM boot params and CONFIGs at John's request, but
Paul and Stephen don't want this for SELinux.

The pieces for reducing conflict with CONFIG_LSM_ENABLE and
lsm.{enable,disable}= were:

1- Remove SECURITY_APPARMOR_BOOTPARAM_VALUE.
2- Remove apparmor= and apparmor.enabled=.
3- Remove SECURITY_SELINUX_BOOTPARAM_VALUE.
4- Remove selinux=.

v4 used all of 1-4 above. SELinux says "4" cannot happen as it's too
commonly used. Would 3 be okay for SELinux?

John, with 4 not happening, do you prefer to not have 2 happen?

With CONFIGs removed, then the boot time defaults are controlled by
CONFIG_LSM_ENABLE, but the boot params continue to work as before.
Only the use of the new lsm.enable= and lsm.disable= would override
the per-LSM boot params. This would clean up the build-time CONFIG
weirdness, and leave the existing boot params as before (putting us
functionally in between the v3 and v4 series).

-Kees

-- 
Kees Cook
Pixel Security

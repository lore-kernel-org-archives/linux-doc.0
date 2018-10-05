Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BFC827D099
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 00:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbeJEHBO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Oct 2018 03:01:14 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:35410 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbeJEHBN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Oct 2018 03:01:13 -0400
Received: by mail-yw1-f68.google.com with SMTP id y76-v6so4559550ywd.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Oct 2018 17:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=YiS6kj9F/mIyeBOtensRm7BthCtrk4+9vKJ/9TOUD60=;
        b=GbYgaM6tlQBZk15VYd/sqf+K2Qj/m520UDDBw1ouQtrHOvIXvKKAZAqtK6gGMKRyjy
         8ACXz5k6EtIgHbz8htcPdTl5zC03k4zH+fkxIITYLkEIxJHRSVHoKKaEr1QiNpXU3fLQ
         NVAgoTILmiueYDi7gnJwmTENx/oErMyyo12AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=YiS6kj9F/mIyeBOtensRm7BthCtrk4+9vKJ/9TOUD60=;
        b=jjOCRenTqE3yo5RMj/6ov+eQ5oeNR2y5uTMjXli/nSd3XMHxe1qiM0vqRJynCuzmDP
         NeRyGYdaOi4Oroo//XCGTpGa5NVM2JkiUyTHJP1F5kU9RIc9fcmp80XN+GtgoqV18quY
         II7LlHfEYUfxM/lhJ2T2dVm7MbKEyDpBDW374H0mNV0N/nlVyPeSBcr/NDJH9l6zVZrN
         huRbfsVYoxwUAgKn3Mx4vMwpynPP7p3J6lbhnDKTCBp2R11IE17Je6m6oIM75uiKJq91
         Y7nHleh8RFlW4UBnHiA8RmvDZN+fqMowl01yikEIlYL6+pMc1Xoeg80JOxTO1Rc4isPX
         WINA==
X-Gm-Message-State: ABuFfohkqtvCs+QNYmc4A0DBiqlYzcF10cJxBgFADkBdszrTsamov5oS
        6FLF848fFlG1w5mXk3W/thuIfgfW8OM=
X-Google-Smtp-Source: ACcGV617s6pibo7ncUoxPhFy5UE4DIVLPNQaYDcxwfTG8t56ODEqWZGNjOdaLpgjYBCQvhx7xPDAYg==
X-Received: by 2002:a81:698b:: with SMTP id e133-v6mr5029552ywc.271.1538697914302;
        Thu, 04 Oct 2018 17:05:14 -0700 (PDT)
Received: from mail-yw1-f42.google.com (mail-yw1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id n7-v6sm2374018ywb.8.2018.10.04.17.05.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Oct 2018 17:05:12 -0700 (PDT)
Received: by mail-yw1-f42.google.com with SMTP id a197-v6so4546671ywh.9
        for <linux-doc@vger.kernel.org>; Thu, 04 Oct 2018 17:05:11 -0700 (PDT)
X-Received: by 2002:a81:98cb:: with SMTP id p194-v6mr4982145ywg.353.1538697911394;
 Thu, 04 Oct 2018 17:05:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Thu, 4 Oct 2018 17:05:09 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.21.1810050338470.14095@namei.org>
References: <20181002005505.6112-1-keescook@chromium.org> <809f1cfd-077b-ee58-51ba-b22daf46d12b@tycho.nsa.gov>
 <QpdcE4QSCQKJqDmB2QBEGBlnlioHuRHlM0g5HF8KbHjU1zIUAOjnQ2r9EIMu3m0S2OWNR3_M_TSp_M6CVDqkp6kKuFPUvegsyDPNw1AGju4=@protonmail.ch>
 <CAGXu5jKqXNbEvPr1axQtGCCnWsGhDgjynW5u326mcx4vZ1oH8g@mail.gmail.com>
 <abe03d09-4dcb-2b02-4102-5e108d617a42@canonical.com> <CAGXu5jJtC1gkJ0ZKDFroL8UzvjiPfmC+6EsrzyB0j0oETdSQQg@mail.gmail.com>
 <alpine.LRH.2.21.1810030758460.23596@namei.org> <CAGXu5jLKgrdhah-5TtAXDL-odbLGeyAUH2=PkAU769AkEnZFfQ@mail.gmail.com>
 <5955f5ce-b803-4f58-8b07-54c291e33da5@canonical.com> <alpine.LRH.2.21.1810040416500.13517@namei.org>
 <CAGXu5j+oPR58oJ06-n7e96-Rmu+ywTW0hud5LhOZ_3UXG5s12w@mail.gmail.com>
 <alpine.LRH.2.21.1810040427550.13517@namei.org> <CAGXu5jJmVR4Wsdti=aFaDhCBaxsVu1KTJOdsJOtFvZOV1ZhdvQ@mail.gmail.com>
 <alpine.LRH.2.21.1810040723320.16168@namei.org> <CAGXu5jJDBhFrdCBHH4MZVDmG88mMxSaSx0w9anCcyx24YHLO5w@mail.gmail.com>
 <alpine.LRH.2.21.1810050338470.14095@namei.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 4 Oct 2018 17:05:09 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+3HqqBa_ogQqGJYubeZr9uCrbKzEoKO3Or=71e4c_=Gw@mail.gmail.com>
Message-ID: <CAGXu5j+3HqqBa_ogQqGJYubeZr9uCrbKzEoKO3Or=71e4c_=Gw@mail.gmail.com>
Subject: Re: [PATCH security-next v4 23/32] selinux: Remove boot parameter
To:     James Morris <jmorris@namei.org>
Cc:     John Johansen <john.johansen@canonical.com>,
        Jordan Glover <Golden_Miller83@protonmail.ch>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
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

On Thu, Oct 4, 2018 at 10:49 AM, James Morris <jmorris@namei.org> wrote:
> On Wed, 3 Oct 2018, Kees Cook wrote:
>> Then someone boots the system with:
>>
>> selinux=1 security=selinux
>>
>> In what order does selinux get initialized relative to yama?
>> (apparmor, flagged as a "legacy major", would have been disabled by
>> the "security=" not matching it.)
>
> It doesn't, it needs to be specified in one place.
>
> Distros will need to update boot parameter handling for this kernel
> onwards.  Otherwise, we will need to carry this confusing mess forward
> forever.

Are you saying that you want to overrule Paul and Stephen about
keeping "selinux=1 secuiryt=selinux" working?

>> CONFIG_LSM="yama,apparmor,!selinux"
>>
>> to mean "put selinux here in the order, but don't enable it". Then the
>> problem becomes what happens to an LSM that has been built in but not
>> listed in CONFIG_LSM?
>
> In my most recent suggestion, there is no '!' disablement, just
> enablement.  If an LSM is not listed in CONFIG_LSM="", it's not enabled.

And a user would need to specify ALL lsms on the "lsm=" line?

What do you think of my latest proposal? It could happily work all
three ways: old boot params and security= work ("selinux=1
security=selinux" keeps working), individual LSM enable/disable works
("lsm=+loadpin"), and full LSM ordering works
("lsm=each,lsm,in,order,here"):

https://lore.kernel.org/lkml/CAGXu5jJJit8bDNvgXaFkuvFPy7NWtJW2oRWFbG-6iWk0+A1qng@mail.gmail.com/

-Kees

-- 
Kees Cook
Pixel Security

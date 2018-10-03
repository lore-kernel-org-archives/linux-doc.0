Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 635867D08F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Oct 2018 00:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbeJCG7A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 02:59:00 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:42498 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725754AbeJCG67 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Oct 2018 02:58:59 -0400
Received: by mail-yb1-f194.google.com with SMTP id p74-v6so1621449ybc.9
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=X5BnuAGhgfj4DUNsWuwoN0sZkV1YAJwtcmx3txcghz0=;
        b=D4CQvmW2TA1WvT7TeKvuETP4MpHuHFm4D7Fj859S51UPV57DvMYXoVD+/kPXRx9ZTS
         Wk++7esffUgh551V568wm99Of6FhfuGptyi6suZbHU2VacHbQfrPw/9lZOwIQo8uRqvX
         Nl7r5ZNpcOGQHiX0hN55oKhsDd4e0hLtJLIAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=X5BnuAGhgfj4DUNsWuwoN0sZkV1YAJwtcmx3txcghz0=;
        b=iCwAzKboYqiq2sXWIODQKnQhTN0rqDfPsZE7bgQAKCrGbVxtVnUHriau6A9QumsHkY
         nqoX58ppQqJOUvXmr1cqbvGbk90mE0POApeIndpyugTv33kY7lFVirvLH4fVkfJ8JoNs
         b8QxsCnPtpN2ioeUN8jU/tH0HQa9xBVWyDcMENs6l2YBVxQK4HTZ3Vqw/VUJs+xDmMT5
         W0QCgKGjPQ+4nqHaKAbql9Tj4Wh6CiBCwEoM8GoKOuJjmwYSSidsIaAdeajpozNo5iWp
         YCn71kTxdajqDLOO4+aLxkK1uTPXwoIGzwu9ODuoRjEhxDj3GqxPnKogX9rCt1Oj7kQo
         f69w==
X-Gm-Message-State: ABuFfoiBqOcMSYFiCNHa6rGXaySmXzON7MzALnlTl0hddUfRtzCumaaN
        B6C9Ewn6OdmC2FE0bMTJKye59OzNQrU=
X-Google-Smtp-Source: ACcGV62xpoowHkPKE5cqlxJ/esPp5QXRQ1MsA5QnNsSfGOzRJGxRTbH0++Vuz05eRdF3ob+M2L58qg==
X-Received: by 2002:a25:7105:: with SMTP id m5-v6mr10144960ybc.485.1538525582870;
        Tue, 02 Oct 2018 17:13:02 -0700 (PDT)
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id q11-v6sm1267341ywb.44.2018.10.02.17.12.59
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 17:12:59 -0700 (PDT)
Received: by mail-yw1-f41.google.com with SMTP id l79-v6so1569349ywc.7
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 17:12:59 -0700 (PDT)
X-Received: by 2002:a0d:d302:: with SMTP id v2-v6mr10168177ywd.124.1538525579097;
 Tue, 02 Oct 2018 17:12:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 17:12:58 -0700 (PDT)
In-Reply-To: <3b539d37-136f-b868-3155-f2982eb63890@canonical.com>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-24-keescook@chromium.org>
 <CAHC9VhQjMfH6Q+Tif8nBknZojgxrb6x+oDz4vHRiZN8rb8MZ5Q@mail.gmail.com>
 <785ef6a9-ae46-3533-0348-74bcf6f10928@tycho.nsa.gov> <CAGXu5jKNzG3rGUAV39D0w4txHRG3H2qU1Z1e_b+03OgycTaWqA@mail.gmail.com>
 <809f1cfd-077b-ee58-51ba-b22daf46d12b@tycho.nsa.gov> <QpdcE4QSCQKJqDmB2QBEGBlnlioHuRHlM0g5HF8KbHjU1zIUAOjnQ2r9EIMu3m0S2OWNR3_M_TSp_M6CVDqkp6kKuFPUvegsyDPNw1AGju4=@protonmail.ch>
 <CAGXu5jKqXNbEvPr1axQtGCCnWsGhDgjynW5u326mcx4vZ1oH8g@mail.gmail.com>
 <abe03d09-4dcb-2b02-4102-5e108d617a42@canonical.com> <CAGXu5jJtC1gkJ0ZKDFroL8UzvjiPfmC+6EsrzyB0j0oETdSQQg@mail.gmail.com>
 <alpine.LRH.2.21.1810030758460.23596@namei.org> <CAGXu5jLKgrdhah-5TtAXDL-odbLGeyAUH2=PkAU769AkEnZFfQ@mail.gmail.com>
 <5955f5ce-b803-4f58-8b07-54c291e33da5@canonical.com> <CAGXu5jKqSZ5LhQ_HwbA9-_DAg3efNzWfLjpxO_rurBgUZ-nnAA@mail.gmail.com>
 <3b539d37-136f-b868-3155-f2982eb63890@canonical.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 2 Oct 2018 17:12:58 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJ-2V5ch-Qer_O0mg1J5-9SUmyJXsGYicZEMyg5KkqHaw@mail.gmail.com>
Message-ID: <CAGXu5jJ-2V5ch-Qer_O0mg1J5-9SUmyJXsGYicZEMyg5KkqHaw@mail.gmail.com>
Subject: Re: [PATCH security-next v4 23/32] selinux: Remove boot parameter
To:     John Johansen <john.johansen@canonical.com>
Cc:     James Morris <jmorris@namei.org>,
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

On Tue, Oct 2, 2018 at 5:05 PM, John Johansen
<john.johansen@canonical.com> wrote:
> On 10/02/2018 04:54 PM, Kees Cook wrote:
>> That's not how I have it currently. It's a comma-separated a string,
>> including the reserved name "all". The default would just be
>> "CONFIG_LSM_ENABLE=all". Casey and I wanted this to have a way to
>> capture new LSMs by default at build-time.
>>
>
> I understand where you are coming from, but speaking with my distro
> hat on, that is not going to work. As a distro Ubuntu very much wants
> to be able to offer all the LSMs built in to the kernel so the user
> can select them. But very much wants to be able to specify a default
> supported subset that is enabled at boot.
>
> I expect RH and Suse will feel similarily. Speaking for Ubuntu if this
> isn't available as part of lsm stacking it will get distro patched in.

Right. Ubuntu would do something like:

CONFIG_LSM_ENABLE=yama,apparmor,integrity

And that's why I wanted non-explicit lsm.enable, so that an end user
could just do:

lsm.enable=loadpin

to add loadpin.

Perhaps we could have both? "lsm.enable=+loadpin" (add loadpin to
build default list) vs "lsm.enable=loadpin" (override build default
list with ONLY loadpin).

-Kees

-- 
Kees Cook
Pixel Security

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C57087D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 20:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbeJCDO5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 23:14:57 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:43985 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbeJCDO4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 23:14:56 -0400
Received: by mail-yw1-f65.google.com with SMTP id j75-v6so1339502ywj.10
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=xkubUhT1JOPull8ZaAjzdOGaMvUij5ox3WB5+0xqLEA=;
        b=DuvQvUvI5S8aEP6og3V8j46ebUtz0fJWKZDL7BT4TNmgm/AVHlr5FVYb2qB5miIdvE
         /bAJYook+SkPE22nykwlxmiMkU2AVvSvZpbXI0Ut/4OVFPptQEic4cgUEaH5r4YrpYUn
         uwKUii56yLjPjMGIXPlQ1+n2Hy62JPF6l5D8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=xkubUhT1JOPull8ZaAjzdOGaMvUij5ox3WB5+0xqLEA=;
        b=UM+cy07htVc1alRMtnI/+E87QKjzNye4fY6i/tu04qLyn9NpeMag40vIjBiXUd/yHo
         Xyi1K9JDA1WbLNTfcPv5P4EDDKFtaxktikWZalrJo0AGmnVb17qr8Jw/o9rjSwKHu0av
         PKq0TB0RNTsez232l2ur4aNmANBz5X3aZQNfzOvstSTLuVZnqesWqVfMxSMS5IzleCvr
         Sph39EFHsl0i5xEaivyb116JD43Z+yA7f6al3XY8mvOrtzmEyT6yqr3oO00k/sX954J7
         6BjK/AlIZTF30yyHGLmXu7+LFz9tTBNWSHqs+Ngs5wdmCQ8u4lfb0jWVPMlVTY/h1wCB
         ZYoA==
X-Gm-Message-State: ABuFfoi3pWGxW2p9pRf1i6RvqqevlljKE3st1MTxs7CkEl/Snq+eFinA
        hdgeU9S92axdUvuqptk2AAL4s05kkfA=
X-Google-Smtp-Source: ACcGV60Mdw5FQ3p1ko7wIFZDCceWFOKJDw51XsrkQC3hAKLQmLUAMisv/h1C/9dca1jxUArs0NOPtg==
X-Received: by 2002:a81:af5a:: with SMTP id x26-v6mr9320485ywj.31.1538512186295;
        Tue, 02 Oct 2018 13:29:46 -0700 (PDT)
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id h13-v6sm6406128ywc.100.2018.10.02.13.29.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 13:29:44 -0700 (PDT)
Received: by mail-yw1-f43.google.com with SMTP id y76-v6so1352527ywd.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 13:29:44 -0700 (PDT)
X-Received: by 2002:a0d:cd84:: with SMTP id p126-v6mr2117852ywd.288.1538512183688;
 Tue, 02 Oct 2018 13:29:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 13:29:42 -0700 (PDT)
In-Reply-To: <125243f2-8532-c0c0-0b0e-d28b3ecb910e@canonical.com>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-24-keescook@chromium.org>
 <CAHC9VhQjMfH6Q+Tif8nBknZojgxrb6x+oDz4vHRiZN8rb8MZ5Q@mail.gmail.com>
 <785ef6a9-ae46-3533-0348-74bcf6f10928@tycho.nsa.gov> <CAGXu5jKNzG3rGUAV39D0w4txHRG3H2qU1Z1e_b+03OgycTaWqA@mail.gmail.com>
 <809f1cfd-077b-ee58-51ba-b22daf46d12b@tycho.nsa.gov> <QpdcE4QSCQKJqDmB2QBEGBlnlioHuRHlM0g5HF8KbHjU1zIUAOjnQ2r9EIMu3m0S2OWNR3_M_TSp_M6CVDqkp6kKuFPUvegsyDPNw1AGju4=@protonmail.ch>
 <CAGXu5jKqXNbEvPr1axQtGCCnWsGhDgjynW5u326mcx4vZ1oH8g@mail.gmail.com>
 <abe03d09-4dcb-2b02-4102-5e108d617a42@canonical.com> <CAGXu5jJtC1gkJ0ZKDFroL8UzvjiPfmC+6EsrzyB0j0oETdSQQg@mail.gmail.com>
 <125243f2-8532-c0c0-0b0e-d28b3ecb910e@canonical.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 2 Oct 2018 13:29:42 -0700
X-Gmail-Original-Message-ID: <CAGXu5jLcK6k+Ox5Q1ZN_4wF9WeR6KchX9LJzbSbfdrcDpZftLg@mail.gmail.com>
Message-ID: <CAGXu5jLcK6k+Ox5Q1ZN_4wF9WeR6KchX9LJzbSbfdrcDpZftLg@mail.gmail.com>
Subject: Re: [PATCH security-next v4 23/32] selinux: Remove boot parameter
To:     John Johansen <john.johansen@canonical.com>
Cc:     Jordan Glover <Golden_Miller83@protonmail.ch>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
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

On Tue, Oct 2, 2018 at 12:47 PM, John Johansen
<john.johansen@canonical.com> wrote:
> On 10/02/2018 12:17 PM, Kees Cook wrote:
>> I could define CONFIG_LSM_ENABLE as being "additive" to
>> SECURITY_APPARMOR_BOOTPARAM_VALUE and
>> SECURITY_SELINUX_BOOTPARAM_VALUE?
>
> Oh sure lets deal with my complaint about too many ways to configure
> this beast by adding yet another config option :P

This is what v3 already does: SEC...BOOTPARAM_VALUE trumps ...LSM_ENABLE.

> seriously though, please no. That just adds another layer of confusion
> even if it is only being foisted on the distro/builder

You've already sent a patch removing
SECURITY_APPARMOR_BOOTPARAM_VALUE. If SELinux is fine to do that too,
then I think we'll be sorted out. I'll just need to make "lsm.enable="
be an explicit list. (Do you have a problem with "lsm.disable=..." ?)

-Kees

-- 
Kees Cook
Pixel Security

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 94ED37DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 21:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbeIUDld (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 23:41:33 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:38288 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbeIUDld (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 23:41:33 -0400
Received: by mail-yw1-f68.google.com with SMTP id n21-v6so4405663ywh.5
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 14:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O7Ju11CnqlQ65JFs+cTZJv3B3c6e6mPVZbOA0gUwNI4=;
        b=ZH6YgTV35xB6RLGtVB9NFWyayApUadyAJZqoaXzB8L7jiyi7nZBjp9epd9ph4stATt
         HvmBCFP7BNeh5us4l8G4HQcdRRo5uUp0nIly2eTZw/zQiqc5mkI9F0aCTznwlp0QWeD/
         Ljw6PWcwqbB8gIYHo416NTf7opDyY+8sUmat0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O7Ju11CnqlQ65JFs+cTZJv3B3c6e6mPVZbOA0gUwNI4=;
        b=aYajmjRaF73PCtjAgWZ0+Q5bCLN4LDvWMNoWdPwcJhlwDbLKl+UmgTtiEcKz1Cl/1z
         ld39ZtJlzG4gRJymtD+3/8AtIUUrV95qNU+qDplZW5XRFgBkTvXgCmbATYuO5eV0e2gC
         NvKmRfKEBG7a2JcCFyi9vPZ5hjvPo+1KxoB/6uh6+nyO8EJW4wyAQqMWlR2zFnOyEbXs
         WfJXEgTofLDVPblsn3aySgfPdWnSsZercIhUsQjCZ1BNGWM8qkdYpzC3x2SNRET81IGO
         Hazrkjfr6Yr9WTZwQ1IS5PLL2VGSf9oaJsJ4eC79QVfc0MN4yQgSkF9BaDGY4D+m2b0C
         alNw==
X-Gm-Message-State: APzg51CegizVuMsAro4Tnkc6brTYkunaSaf5f+GDjQRmWCweUtdqFHgs
        L+Ze3jYc7aQccvNmSq4rFp9Db8OH/Ko=
X-Google-Smtp-Source: ANB0VdbslUBXx+8oxnDW2nZHWKqGDNaQZzLLBEj18M/cm1Sc9JA6AsF/w80+rz0Q5WI3ZDwq34jVyg==
X-Received: by 2002:a81:1b58:: with SMTP id b85-v6mr18342734ywb.63.1537480556877;
        Thu, 20 Sep 2018 14:55:56 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id f5-v6sm3866285ywd.53.2018.09.20.14.55.53
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 14:55:53 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id c4-v6so4602379ybl.6
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 14:55:53 -0700 (PDT)
X-Received: by 2002:a25:3617:: with SMTP id d23-v6mr12372664yba.141.1537480553100;
 Thu, 20 Sep 2018 14:55:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:5f04:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 14:55:52
 -0700 (PDT)
In-Reply-To: <1898403.NNy4ELVaME@merkaba>
References: <20180920162338.21060-1-keescook@chromium.org> <1898403.NNy4ELVaME@merkaba>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 20 Sep 2018 14:55:52 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJfp2ezmODaQgj_gROdpr=_Dc4_h=ujPeR-ggTZ8AUciQ@mail.gmail.com>
Message-ID: <CAGXu5jJfp2ezmODaQgj_gROdpr=_Dc4_h=ujPeR-ggTZ8AUciQ@mail.gmail.com>
Subject: Re: [PATCH security-next v2 00/26] LSM: Explict LSM ordering
To:     Martin Steigerwald <martin@lichtvoll.de>
Cc:     James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 20, 2018 at 1:14 PM, Martin Steigerwald <martin@lichtvoll.de> w=
rote:
> Kees Cook - 20.09.18, 18:23:
>> v2:
>> - add "lsm.order=3D" and CONFIG_LSM_ORDER instead of overloading
>> "security=3D" - reorganize introduction of ordering logic code
>>
>> Updated cover letter:
>>
>> This refactors the LSM registration and initialization infrastructure
>> to more centrally support different LSM types. What was considered a
>> "major" LSM is kept for legacy use of the "security=3D" boot parameter,
>> and now overlaps with the new class of "exclusive" LSMs for the future
>> blob sharing (to be added later). The "minor" LSMs become more well
>> defined as a result of the refactoring.
>>
>> Instead of continuing to (somewhat improperly) overload the kernel's
>> initcall system, this changes the LSM infrastructure to store a
>> registration structure (struct lsm_info) table instead, where metadata
>> about each LSM can be recorded (name, flags, order, enable flag, init
>> function). This can be extended in the future to include things like
>> required blob size for the coming "blob sharing" LSMs.
>
> I read the cover letter and still don=C2=B4t know what this is about. Now=
 I
> am certainly not engaged deeply with LSM. I bet my main missing piece
> is: What is a "blob sharing" LSM.
>
> I think it would improve the cover letter greatly if it explains briefly
> what is a major LSM, what is a minor LSM and what is a "blob sharing"
> LSM.
>
> Why those are all needed? What is the actual security or end user
> benefit of this work? The questions are not to question your work. I bet
> it makes all perfect sense. I just did not understand its sense from
> reading the cover letter.

Sure, thanks! I'll include more details for any later versions. This
is mainly related to some internal refactoring the LSM is doing to
support additional LSM that need more extensive "stacking" of the
kernel internals. I aimed this at linux-doc@ and linux-arch@ to get
feedback on the Documentation/ and linker script changes,
respectively. In theory, users don't need to know anything about
minor/major nor blob-sharing, as that should normally be all an
internal issue.

Thanks!

-Kees

--=20
Kees Cook
Pixel Security

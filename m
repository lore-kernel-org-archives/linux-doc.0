Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1186DEB64D7
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 11:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbjFTLdp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 07:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjFTLdl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 07:33:41 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DA1FE
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 04:33:39 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f866a3d8e4so4054030e87.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687260814; x=1689852814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVsib4qKyB82Osq6CfMX+p3Eul3U7zE2OWUFnDtEhvo=;
        b=PkVmSxkxBTKfOJoGCeY3MpFQDih6koxeOCQ14L+BpZCZ6kD0s2PK4WBKEjZ50gVvx9
         tDm5MO2zh+vUPqQtUMqEard3YaukFyV9rTD8o9U6ek/JzB8fLufmF4HixGFiJnWZ/h6E
         Lyx82E7hKSR0qnVKz+l7gF6f1sU15vY2D/C2vwiYp9kGbb+ge6YlzQQup20662JX3man
         vRAiHnQSro7U2xy1x7mRUyrFcwTVjEcFg4DnUgrv8S4FODS46xb1h7BpQ+PIz0f6co0l
         SCr41shFRago+35eQ234HzgUloxVacc+VWJEPu3EPp6zsdzuG7V+xVNBfazLkXQQdCuZ
         3CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687260814; x=1689852814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVsib4qKyB82Osq6CfMX+p3Eul3U7zE2OWUFnDtEhvo=;
        b=TVUyqqqsXoay6evzYm+mK6dq58IoGwga7rM80Lp8QcPVf13hs2Ez0n7noEbkjrEA4F
         8oGiiC1+iw9qAZhvIpIWGwPvDOYDzaM9qmMVXbGUNeG34hHBzD3lP+5ogOCttFXUd+f6
         s1Nsh6tomavpDyKyXAkcFvZNCARoJm69J7qzqqCEWTCPU7scN0f7lF8PEFWYmsp8HxgM
         vSUehs6m0Kc5bIWuRvX3FzRicfF0LL147gTUunF0GofCujSWUILj1mslHVlKTLN5eEQb
         pcFeB4BwL4V8dP0lAN3sbDJnGmC5wqqC6DFf2cnZz279aUNPjorh3WiD7uBZv/KQrwir
         gz9w==
X-Gm-Message-State: AC+VfDyxx5LCFu36xEzcU307KGDqON3H5p5kunGrASA2n8y/Ee42eN6v
        7wwFxtYS9yBy82fyZseKddtY3euH/Fb1dDUdAvITLg==
X-Google-Smtp-Source: ACHHUZ6i52O32LZigRCWsfh0agBf2LmLpUofUpFF51XMDq+fuNByYXQJL7Pt5SwRjcIXw5UxCzPhjHNhb3uSV71WwNo=
X-Received: by 2002:ac2:5b0c:0:b0:4f8:666b:9de8 with SMTP id
 v12-20020ac25b0c000000b004f8666b9de8mr5150573lfn.13.1687260814348; Tue, 20
 Jun 2023 04:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230614095158.1133673-1-elver@google.com> <CA+fCnZdy4TmMacvsPkoenCynUYsyKZ+kU1fx7cDpbh_6=cEPAQ@mail.gmail.com>
In-Reply-To: <CA+fCnZdy4TmMacvsPkoenCynUYsyKZ+kU1fx7cDpbh_6=cEPAQ@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Tue, 20 Jun 2023 13:32:57 +0200
Message-ID: <CANpmjNOSnVNy14xAVe6UHD0eHuMpxweg86+mYLQHpLM1k0H_cg@mail.gmail.com>
Subject: Re: [PATCH] kasan: add support for kasan.fault=panic_on_write
To:     Andrey Konovalov <andreyknvl@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Taras Madan <tarasmadan@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, kasan-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 20 Jun 2023 at 12:57, Andrey Konovalov <andreyknvl@gmail.com> wrote=
:
>
> On Wed, Jun 14, 2023 at 11:52=E2=80=AFAM Marco Elver <elver@google.com> w=
rote:
> >
> > @@ -597,7 +614,11 @@ void kasan_report_async(void)
> >         pr_err("Asynchronous fault: no details available\n");
> >         pr_err("\n");
> >         dump_stack_lvl(KERN_ERR);
> > -       end_report(&flags, NULL);
> > +       /*
> > +        * Conservatively set is_write=3Dtrue, because no details are a=
vailable.
> > +        * In this mode, kasan.fault=3Dpanic_on_write is like kasan.fau=
lt=3Dpanic.
> > +        */
> > +       end_report(&flags, NULL, true);
>
> Hi Marco,
>
> When asymm mode is enabled, kasan_report_async should only be called
> for read accesses. I think we could check the mode and panic
> accordingly.

How do we check the mode, and how do we prove it's only called for
read accesses?

> Please also update the documentation to describe the flag behavior wrt
> async/asymm modes.

Will do.

> On a related note, it looks like we have a typo in KASAN
> documentation: it states that asymm mode detects reads synchronously,
> and writes - asynchronously. Should be the reverse.

This says the documentation is correct, and it's actually called for
writes: https://docs.kernel.org/arm64/memory-tagging-extension.html#tag-che=
ck-faults

Who is right?

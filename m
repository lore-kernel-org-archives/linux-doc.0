Return-Path: <SRS0=TE/4=BO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444E7C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  4 Aug 2020 20:18:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 274E4207FC
	for <linux-doc@archiver.kernel.org>; Tue,  4 Aug 2020 20:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yeb/dQlV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgHDUSd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Aug 2020 16:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbgHDUSb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Aug 2020 16:18:31 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5EBC06179E
        for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2020 13:18:31 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id p1so23920667pls.4
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2020 13:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hzRXIsj1+SAs1tNlnSNXJanvh8FrwUG7dToFo76pgso=;
        b=Yeb/dQlVJPeL8Vx7ag5c0XCGsmI6B14mO/wfB4je5mHzE84Aurte2l0bCK6rN6ftOQ
         qiWBFA1NwEV85DMi2taxsi8Cf2xBN87c6islpm8jofcLJzirOXvI2tQaJAy8cqUpO/1g
         Qulj+Oto1t5n+WRVK4IQZIbwf6L1HIEdEsZv6SlQrBJvxGoc0biA8tqDCu43SCCpAlud
         qsYcX4lJa/218bfLRWcJcBpvRmp2yd0tFlo6LZH4rCQ1cM06SsI5jnnPyirAd8egQ1R+
         eVAd5M85sPA6sg0qtIuxiZcwx5qeeL9EdvdCbkdoA8bbdA8NbxhKZUPy20BrdS+dSyx9
         rzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hzRXIsj1+SAs1tNlnSNXJanvh8FrwUG7dToFo76pgso=;
        b=lLUtsS3wr7BTSXGXVu/m9vnFDGkmf2uyJoeztXK2CIv55NKZRh9aNiveSZIAxTetqo
         /1emSx76wUkcniyH4sYFZxIeuS3INjJaer7A/HLYzaU5CvwGYv30MhELCjnnHxye3jIO
         z5JQHFzg0Pclx7RTSYZbvF3EyZKz1eG/k9/UrmIdYVaMplHahhgK7Lv4AEs6pgskGgVd
         20Eug2omaT03c2//wKtVePiLl34z5HAZktA4bA2e1RwgLCmuN8JNpG39B8403E2ca2Dr
         hFDgORT4UZg6l87ufynsOEL1rg+TvqDBy7apdiQp+XdmVIFi2WtCt/gQSPjPFcxrYLpC
         QGnA==
X-Gm-Message-State: AOAM531GX4po1PTSF5mJL6/srgf3t0A0rIpACnssifi6O6G9M0jlxNGv
        rlObKn0Kd2HooTKtq6z0Iy+RgEnxCL11EhPVWj7Xxw==
X-Google-Smtp-Source: ABdhPJxnSyniAwB6YYkeKPYxsQa+/C3NgF4fGYr1Y0yjfcIUeDxlK/6SOOMgIdqAj4vaOhHA3Dvuz8zhsjCp2po3Iwo=
X-Received: by 2002:a17:902:161:: with SMTP id 88mr21097385plb.325.1596572306459;
 Tue, 04 Aug 2020 13:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-11-brendanhiggins@google.com> <202006261436.DEF4906A5@keescook>
In-Reply-To: <202006261436.DEF4906A5@keescook>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 4 Aug 2020 13:18:15 -0700
Message-ID: <CAFd5g47UYGByhbY+8-EuKDg7HBLGdF9fxsZACXAiTrJZC0kkAw@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] kunit: Add 'kunit_shutdown' option
To:     Kees Cook <keescook@chromium.org>
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Iurii Zaikin <yzaikin@google.com>,
        David Gow <davidgow@google.com>,
        Andrew Morton <akpm@linux-foundation.org>, rppt@linux.ibm.com,
        Frank Rowand <frowand.list@gmail.com>, catalin.marinas@arm.com,
        will@kernel.org, Michal Simek <monstr@monstr.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Chris Zankel <chris@zankel.net>, jcmvbkbc@gmail.com,
        Greg KH <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Logan Gunthorpe <logang@deltatee.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-arch@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 26, 2020 at 2:40 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 02:09:15PM -0700, Brendan Higgins wrote:
> > From: David Gow <davidgow@google.com>
> >
> > Add a new kernel command-line option, 'kunit_shutdown', which allows the
> > user to specify that the kernel poweroff, halt, or reboot after
> > completing all KUnit tests; this is very handy for running KUnit tests
> > on UML or a VM so that the UML/VM process exits cleanly immediately
> > after running all tests without needing a special initramfs.
> >
> > Signed-off-by: David Gow <davidgow@google.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >  lib/kunit/executor.c                | 20 ++++++++++++++++++++
> >  tools/testing/kunit/kunit_kernel.py |  2 +-
> >  tools/testing/kunit/kunit_parser.py |  2 +-
> >  3 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> > index a95742a4ece73..38061d456afb2 100644
> > --- a/lib/kunit/executor.c
> > +++ b/lib/kunit/executor.c
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> > +#include <linux/reboot.h>
> >  #include <kunit/test.h>
> >
> >  /*
> > @@ -11,6 +12,23 @@ extern struct kunit_suite * const * const __kunit_suites_end[];
> >
> >  #if IS_BUILTIN(CONFIG_KUNIT)
> >
> > +static char *kunit_shutdown;
> > +core_param(kunit_shutdown, kunit_shutdown, charp, 0644);
> > +
> > +static void kunit_handle_shutdown(void)
> > +{
> > +     if (!kunit_shutdown)
> > +             return;
> > +
> > +     if (!strcmp(kunit_shutdown, "poweroff"))
> > +             kernel_power_off();
> > +     else if (!strcmp(kunit_shutdown, "halt"))
> > +             kernel_halt();
> > +     else if (!strcmp(kunit_shutdown, "reboot"))
> > +             kernel_restart(NULL);
> > +
> > +}
>
> If you have patches that do something just before the initrd, and then
> you add more patches to shut down immediately after an initrd, people
> may ask you to just use an initrd instead of filling the kernel with
> these changes...
>
> I mean, I get it, but it's not hard to make an initrd that poke a sysctl
> to start the tests...
>
> In fact, you don't even need a initrd to poke sysctls these days.

True, but it is nice to not have to maintain an initramfs for each
architecture that you want to test. Still, I see your point. If we can
find a convenient way to distribute the needed dependencies for
running KUnit on each non-UML architecture then I think I can abandon
this change.

So how about this: I will drop this patch from this patchset and move
it up to the follow up patchset that adds multiarchitecture support to
kunit_tool. There we can address the problem of how to best track the
necessary dependencies including possibly intitramfss.

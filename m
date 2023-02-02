Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB11C05027
	for <linux-doc@archiver.kernel.org>; Thu,  2 Feb 2023 15:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbjBBPNx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Feb 2023 10:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbjBBPNu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 10:13:50 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F251043A
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 07:13:47 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id n13so1648432wmr.4
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 07:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A/2NI3lAioM2OTclBfdU2ZsaZSzkr/eN0mg0uuV+D60=;
        b=nsupH4Fi24wLtGHU5Dbw4Jh3WG9CfW4pqq9a1sHGB+javoh5dxGAuWRLXXNzMGzwqT
         FkCjcYVdn7SurKbB3MyukDy4UPGxC7UCLFNO20dWx6WpT77dqvpad0DF0YE886ADJHGz
         Mie3V4w/bfN7uj5pBVwGzyC/csxHJW08xkX1/r/QAEuU7bhkgd0c5RpuRslddtxDh2tw
         PNu4UqbA8M74OCpLBBLPq3SB3pVpExbt//65NUw2WBMsx5/lbO8FS2DBFsI0mtY5iZvN
         A2dmCG/Fzma51At3XYpS4wvWj8m8IKh6YEWilwPcyqx2jYqKawgnsgIz4d7oxvrt0moS
         bRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/2NI3lAioM2OTclBfdU2ZsaZSzkr/eN0mg0uuV+D60=;
        b=e1wBrxZA3yx9lHeragqdAaZxns27u3/K4VhJwcTkcA1qo5UePNltZUAsFRfkwWUfS8
         Act3IUdzX24YixIqbx6AQ1u0lWsBei1aA8TxTTKt3HAOO7ufffNt29DK9dkInfaRjqbE
         rmxTeYROoAtUfKVFr5dDCaCt4gtASfMsXDOCRVhROn9rzwBOXsNTAyMdsHkriR0akXdX
         fHM1ADn81exOhzx1Ku51F8t6uPn2/EkFD7Gu1ywmxLA6rGsW9VMSFRRcJTjHmCFd/JUN
         RXmEUnoGNQNPPSuJ7KGw5DrVJPkCSXdpGLlsgnoN0dUlI/xmaOyfMYoW9zDN/0rjHt+B
         X2Fg==
X-Gm-Message-State: AO0yUKXhHW0YCC+gmRRtSdoaHR6vXMH4KlEHDwuezfKuqfIGKb17uo8T
        3ufWVePhr1FW11e138yVxZkm6/NDR0uVEjmZLiY26g==
X-Google-Smtp-Source: AK7set+MR2UlC0HbNr/VBNUEc7Jc4dECbiMtMqU/kkRfKYcOE9yxeXWjbrfQfbAwZ/2UVZX6EZPD0mSApe0wXb9kOQk=
X-Received: by 2002:a05:600c:3c90:b0:3dd:1b76:2f8c with SMTP id
 bg16-20020a05600c3c9000b003dd1b762f8cmr205549wmb.5.1675350826411; Thu, 02 Feb
 2023 07:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20230131151115.1972740-1-alexghiti@rivosinc.com>
 <Y9lrB+RUBk1Njhaq@spud> <CAHVXubh+DgdgXZ-hHk5rxmQkXSBdk1AvTr3dvT80L5YXQZF=sw@mail.gmail.com>
In-Reply-To: <CAHVXubh+DgdgXZ-hHk5rxmQkXSBdk1AvTr3dvT80L5YXQZF=sw@mail.gmail.com>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Thu, 2 Feb 2023 16:13:35 +0100
Message-ID: <CAHVXubjeSMvfTPnvrnYRupOGx6+vUvUGfRS3piTeo=TH2cHKNg@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] riscv: Allow to downgrade paging mode from the
 command line
To:     Conor Dooley <conor@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ard Biesheuvel <ardb@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 2, 2023 at 4:07 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> Hi Conor,
>
> On Tue, Jan 31, 2023 at 8:25 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > Hey Alex,
> >
> > On Tue, Jan 31, 2023 at 04:11:14PM +0100, Alexandre Ghiti wrote:
> > > This new version gets rid of the limitation that prevented KASAN kernels
> > > to use the newly introduced parameters.
> >
> > What's the base commit for this version?

And to answer your question: this patch applies nicely on top of
v6.2-rc6 + my KASAN patchset
(https://patchwork.kernel.org/project/linux-riscv/list/?series=715388)

> > Fails to apply for me on top of for-next, fixes, rc1, and linux-next :/
> > I also tried it on top of your KASAN series, but no luck there either!
>
> Really sorry about that, that's the second time it happens, I'll
> improve my workflow: I'll include the base-commit sha1/tag + a link to
> all needed-but-not-yet-upstreamed patches.
>
> Thanks for your time,
>
> Alex
>
> >
> > Thanks,
> > Conor.
> >
> > > While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:
> > > avoid relocating the kernel twice for KASLR"): it allows to use the fdt
> > > functions very early in the boot process with KASAN enabled by simply
> > > compiling a new version of those functions without instrumentation.
> > >
> > > I had to change the handling of the command line parsing to make the
> > > code self-contained in kernel/pi/cmd_early.c to avoid calling too many
> > > __pi prefixed functions from outside this file.
> > >
> > > I'll use this approach like arm64 to handle the extraction of the random
> > > seedi from the device tree for KASLR.
> > >
> > > @Ard: I copied the "pi" name but I have to admit I don't know what it
> > > means.
> > >
> > > Alexandre Ghiti (1):
> > >   riscv: Allow to downgrade paging mode from the command line
> > >
> > >  .../admin-guide/kernel-parameters.txt         |  5 +-
> > >  arch/riscv/kernel/Makefile                    |  2 +
> > >  arch/riscv/kernel/pi/Makefile                 | 34 ++++++++++++
> > >  arch/riscv/kernel/pi/cmdline_early.c          | 52 +++++++++++++++++++
> > >  arch/riscv/lib/memcpy.S                       |  2 +
> > >  arch/riscv/lib/memmove.S                      |  2 +
> > >  arch/riscv/mm/init.c                          | 36 ++++++++++---
> > >  7 files changed, 126 insertions(+), 7 deletions(-)
> > >  create mode 100644 arch/riscv/kernel/pi/Makefile
> > >  create mode 100644 arch/riscv/kernel/pi/cmdline_early.c
> > >
> > > --
> > > 2.37.2
> > >

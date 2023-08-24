Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64636C7EE2C
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 16:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238153AbjHXQTt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 12:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242496AbjHXQTZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 12:19:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369C41BF2
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 09:18:57 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ff8a1746e0so10739063e87.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692893933; x=1693498733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcpmQIaJ3WGITlP80o7lHc82w8Vh9jMV1bqtDZL9154=;
        b=EXC13LqUOvbmnTJi9XvsU0ESFZpGRpEMW2KS6mmLkv4VGq3dGCVVWm62daPHEtxbhF
         Yk3fnUdtvTNpUJFHCg5dJDJY8qbDEpBiUDyuZ4ApwIuAJWGOCJ68pK5c5L7JY/WUQLlA
         S6qGHoMSvGwzwibAIpi5/Ma9NlIV0a3aaoYkhr82KOX4WO9tTTgGxXdZj4m96CCxIgdP
         DA4hS3gYlE/8wuKGA5Z1ZMuWdu5eXpnJQDu8Gu88MnmA0tnbXkv1/XaXMJoRQfhGAzqp
         i7JuHAKICWjJMNpf9Ia+itwQZU1MdidAyging9RnU9E267f7yRNndGIfIlLyaxIRf0G1
         iNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692893933; x=1693498733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcpmQIaJ3WGITlP80o7lHc82w8Vh9jMV1bqtDZL9154=;
        b=VFBHkElvYZVGcw9zi5CPWWZK42X+CCOjKO+WzZxKcNTJOm2BAnKM60JzclrT5uPQIY
         HhG6DS8NuUwFZyetOYb5sNUp29f52i7tmr1txOViWGpNy2WRNaj4xWNkSrituWEZMASR
         QwL/B5kmoafIxFShnwiT+l5NllNehxUDdgHfUGmhKKH582uBU13JOFtYaduaNUZrD61X
         LhPnskbqHfw2aXcDs2ukQPygTsWFY2+sfcHn4G/yzd5PvTbiyJBBzAmACegzW4z3XLiT
         7MnGNzGxxf+Pmxc2k6vcGecuM/qaT8XL3JL8yMqoaKc5SSOpojQjHVSL1E7S4Sm0Sr6R
         6rYg==
X-Gm-Message-State: AOJu0YyarX4r2qvxPq83udW0V19VorKgjO/V4+pAQRjayDfIjRSY1ZOK
        hnJgdW5NYt5SXZo/yBFyv6yvA1CB9OhBfGZ2Rhfmtw==
X-Google-Smtp-Source: AGHT+IFXb5yl9r0LvHVcSGU9TSK5ahTYdOzq873cOHNvKn7t08c6orKmlryauqOU6ndYqyidDX00WvT7bPnvGMaG1A4=
X-Received: by 2002:a19:5f19:0:b0:4ff:9a75:2106 with SMTP id
 t25-20020a195f19000000b004ff9a752106mr10946461lfb.39.1692893932613; Thu, 24
 Aug 2023 09:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230711201831.2695097-1-evan@rivosinc.com> <20230824-factual-jawed-2dddd2cf2bdd@wendy>
In-Reply-To: <20230824-factual-jawed-2dddd2cf2bdd@wendy>
From:   Evan Green <evan@rivosinc.com>
Date:   Thu, 24 Aug 2023 09:18:16 -0700
Message-ID: <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <apatel@ventanamicro.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 24, 2023 at 5:20=E2=80=AFAM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Tue, Jul 11, 2023 at 01:18:30PM -0700, Evan Green wrote:
> > In /proc/cpuinfo, most of the information we show for each processor is
> > specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> > compatible, and the mmu size. But the ISA string gets filtered through =
a
> > lowest common denominator mask, so that if one CPU is missing an ISA
> > extension, no CPUs will show it.
> >
> > Now that we track the ISA extensions for each hart, let's report ISA
> > extension info accurately per-hart in /proc/cpuinfo. We cannot change
> > the "isa:" line, as usermode may be relying on that line to show only
> > the common set of extensions supported across all harts. Add a new "har=
t
> > isa" line instead, which reports the true set of extensions for that
> > hart. This matches what is returned in riscv_hwprobe() when querying a
> > given hart.
> >
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > ---
> >
> > Changes in v4:
> >  - Documentation: Made the underline match the text line (Conor)
> >  - Documentation: hanged "in question" to "being described" (Andrew)
> >
> > Changes in v3:
> >  - Add some documentation (Conor)
> >
> > Changes in v2:
> >  - Added new "hart isa" line rather than altering behavior of existing
> >    "isa" line (Conor, Palmer)
> >
> >
> > I based this series on top of Conor's riscv-extensions-strings branch
> > from July 3rd, since otherwise this change gets hopelessly entangled
> > with that series.
> >
> > ---
> >  Documentation/riscv/uabi.rst | 10 ++++++++++
> >  arch/riscv/kernel/cpu.c      | 22 ++++++++++++++++++----
> >  2 files changed, 28 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rs=
t
> > index 8960fac42c40..afdda580e5a2 100644
> > --- a/Documentation/riscv/uabi.rst
> > +++ b/Documentation/riscv/uabi.rst
> > @@ -42,6 +42,16 @@ An example string following the order is::
> >
> >     rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> >
> > +"isa" vs "hart isa" lines in /proc/cpuinfo
> > +------------------------------------------
> > +
> > +The "isa" line in /proc/cpuinfo describes the lowest common denominato=
r of
> > +RISC-V ISA extensions understood by the kernel and implemented on all =
harts. The
> > +"hart isa" line, in contrast, describes the set of extensions understo=
od by the
> > +kernel on the particular hart being described, even if those extension=
s may not
> > +be present on all harts in the system. The "hart isa" line is consiste=
nt with
> > +what's returned by __riscv_hwprobe() when querying for that specific C=
PU.
>
> Thinking about this again, I don't think this is true. hwprobe uses
> has_fpu(), has_vector() etc that interact with Kconfig options but the
> percpu isa bitmap isn't affected by these.

Ugh yeah it's kind of a mishmash isn't it. hwprobe_isa_ext0() uses the
lowest common denominator for FD, C, V, but per-hart info for
Zba,Zbb,Zbs. Given the interface, per-hart info seems like what we
should have done there, and the FD, C, and V were my bad. The good
news is we can define new bits that do the right thing, though maybe
we should wait until someone actually wants them. For this patch we
should just remove this sentence. We can also correct the
documentation in hwprobe to mention the shortcoming in FD,C,V.

Palmer, do you want a spin of this patch or a followup on top to
remove the above sentence?

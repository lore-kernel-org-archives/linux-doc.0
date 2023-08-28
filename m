Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86B6C83F16
	for <linux-doc@archiver.kernel.org>; Mon, 28 Aug 2023 16:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjH1QZP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Aug 2023 12:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232370AbjH1QYp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Aug 2023 12:24:45 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3244DEB
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 09:24:41 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so51490851fa.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693239879; x=1693844679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlldpTbanhBesa2HwgrYZTO2yCgVrupDnCjl8t+UIT0=;
        b=fH3o2T8lRmzNqGEwHcJkF/eF6u8dFUHalpROE5gu+kpqL6koiK2lkRbB1Yv9Su3iWt
         +BS6BT69PdKIkqrNExqwQ8927+OCo87CUjD/dOaBKHSkFTXpLDI2YF+5ujRo5Xz+3J3z
         2EwNYeIGcP5qkjb63oxGwWwQzO27GQJnGO5tbkO94F1Zbi/nKLM0pJpCL84VKD4Vo4Pj
         8e4msuNHzLYKvHj4YUD2eoojDwJN8nWX6V946jcSVbNNzHHRQ1oZMeJRGfcHjs+MwkRE
         NTFTkW2zwLC+7LP2k2awqsWJr8WO2l4sdsgrXBt99cGSorsWlmlsXLjikPzSshcLJkTh
         CBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693239879; x=1693844679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlldpTbanhBesa2HwgrYZTO2yCgVrupDnCjl8t+UIT0=;
        b=BDrYovPWNoA22vIWmR2d7knmb5TqH13kZ/J73OjGWMWfvK2LvKuWQnvYGmlRvEMBHm
         w/mKf7uXu1COemopP4lxpGtTqgbm3CpuUgWwmZzWg+Vai2Y98C32YghAuLbJrMgBx7a0
         512OV1rMKasXomnl3UXBNYOKZNckX/sKNBBiMjCk8Hc4B8CXLR5V4Gciyh7+W6gvT+oX
         52/eR0x/aW+/dcfQOXjr9DUA/p9FqWxiUDbVVi4F6VOQbsc5ZVs56wc9Kuw2MvUb+lnn
         TY3EjlDEcbfUe4OVNGTvLT910cDLzSnD+C61ot7Vof4XuYoWd8WD6NWbSb87xRD38p72
         UGgQ==
X-Gm-Message-State: AOJu0YwjZ16SUUhp8IM9PLW+Q2WuJ75ETvV+oioTkex2dudTl6a68qad
        9SJUzff8qvvwtSHO7+qgJ9u+NF3G8mF/E5Pv+VpBuaYPiZB7ZySI
X-Google-Smtp-Source: AGHT+IGGDgol2nCV6HyRK80uVA5Lh6F2anWFcW9s8qh1HVDrHNl4x4LUfgUDyYqi39lcdoexD9CiBFHy6Uf6Yjf8Mdw=
X-Received: by 2002:a05:651c:cf:b0:2bc:bdbd:1542 with SMTP id
 15-20020a05651c00cf00b002bcbdbd1542mr16880301ljr.11.1693239879310; Mon, 28
 Aug 2023 09:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230825231139.1145522-1-evan@rivosinc.com> <20230826-anguished-tutu-81d63b3081a7@spud>
 <20230826-copper-suffocate-5f4f0e67f9a7@spud>
In-Reply-To: <20230826-copper-suffocate-5f4f0e67f9a7@spud>
From:   Evan Green <evan@rivosinc.com>
Date:   Mon, 28 Aug 2023 09:24:03 -0700
Message-ID: <CALs-HsvwLpcUMPeKEs3ZW3tOwLGeGRQSe=grxE5L14Tj8b+XHw@mail.gmail.com>
Subject: Re: [PATCH v5] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To:     Conor Dooley <conor@kernel.org>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org,
        Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 26, 2023 at 2:56=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Aug 26, 2023 at 12:26:25AM +0100, Conor Dooley wrote:
> > On Fri, Aug 25, 2023 at 04:11:38PM -0700, Evan Green wrote:
> > > In /proc/cpuinfo, most of the information we show for each processor =
is
> > > specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> > > compatible, and the mmu size. But the ISA string gets filtered throug=
h a
> > > lowest common denominator mask, so that if one CPU is missing an ISA
> > > extension, no CPUs will show it.
> > >
> > > Now that we track the ISA extensions for each hart, let's report ISA
> > > extension info accurately per-hart in /proc/cpuinfo. We cannot change
> > > the "isa:" line, as usermode may be relying on that line to show only
> > > the common set of extensions supported across all harts. Add a new "h=
art
> > > isa" line instead, which reports the true set of extensions for that
> > > hart.
> > >
> > > Signed-off-by: Evan Green <evan@rivosinc.com>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Can you drop this if you repost?

Will do.

> >
> > > +"isa" vs "hart isa" lines in /proc/cpuinfo
> > > +------------------------------------------
> > > +
> > > +The "isa" line in /proc/cpuinfo describes the lowest common denomina=
tor of
> > > +RISC-V ISA extensions recognized by the kernel and implemented on al=
l harts. The
> > > +"hart isa" line, in contrast, describes the set of extensions recogn=
ized by the
> > > +kernel on the particular hart being described, even if those extensi=
ons may not
> > > +be present on all harts in the system.
> >
> > > In both cases, the presence of a feature
> > > +in these lines guarantees only that the hardware has the described c=
apability.
> > > +Additional kernel support or policy control changes may be required =
before a
> > > +feature is fully usable by userspace programs.
> >
> > I do not think that "in both cases" matches the expectations of
> > userspace for the existing line. It's too late at night for me to think
> > properly, but I think our existing implementation does work like you
> > have documented for FD/V. I think I previously mentioned that it could
> > misreport things for vector during the review of the vector series but
> > forgot about it until now.
>
> I went and checked, and yes it does currently do that for vector. I
> don't think that that is what userspace would expect, that Google
> cpu_features project for example would draw incorrect conclusions.

I'm lost, could you explain a little more? My goal was to say that
there's no blanket guarantee that the feature is 100% ready to go for
userspace just because it's seen here. For some extensions, it may in
fact end up meaning just that (hence the "additional ... may be
required" rather than "is required"). This is true for FD (maybe,
depending on history?), or extensions whose minimal/zero kernel
support was unconditionally added at the same time as its parsing for
it. But it's not true solely by virtue of being in /proc/cpuinfo. In
other words, I'm trying to establish the floor of what /proc/cpuinfo
guarantees, without fully specifying the ceiling. Are you saying that
we need to spell out the guarantees for each extension? Or are you
saying the floor I've defined in general is incorrect or insufficient?
I'm also open to direct suggestions of wording if you've got something
in mind :)
-Evan

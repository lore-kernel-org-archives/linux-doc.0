Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A0AEB64DC
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jun 2023 19:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjF0TMU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jun 2023 15:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjF0TMT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jun 2023 15:12:19 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C23D1FC1
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 12:12:18 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f957a45b10so6692067e87.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687893137; x=1690485137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWPaWm/SbxNmO7KGYVPvx1QzoejjqxszCBE87FaJ0SI=;
        b=noqsKYKSyfXlrIAQfs8JJESxdmLsycA+cJDXOWLGOWTw7dpsRxk5p+iuPyy1WJmAzc
         ABpuTdx2zQlB2EF538pu0Ppg/oJw3ZuQVH0Dg9hcOxO/li/+pzkJxuoyS1CIArTczBh2
         +8aWbRPzQNctdM9avQQxMRalsFlx0FMpQ7Z0Xo5DKOolWZlOrx/iig53JK84eSElLpIQ
         BEpTrwFXr1SrEfhEGuwJFELTbMOfQhGk3/hlJn8tg37iHRBaDpBjCW9LatIDbVFnv0jT
         ZEExPdaY0T8VRwEosMBjjTYLCiJKPjdoG3xBkVRFwle9jAxFy6vKSht6vzikRWN1fqnN
         T3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687893137; x=1690485137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWPaWm/SbxNmO7KGYVPvx1QzoejjqxszCBE87FaJ0SI=;
        b=J3pHWb8iovhnkTIMhCL16TLFH4jkPeQXQ3vvxf4GVwH/fjcqIfdPWXhsoyw6J9XWUB
         SsSThq59kcC7twxJ6BkBpI5Vp9yj3brMF2UjGq+XNbxG/qNIa7Gj1stVOOgBYz0ZUv2t
         EO9W0KAgnnBm/FQtbS4SNj1cKtgBsqbtFFlSpAruXbFNoQLNt/GVlQ8hFUR1i7SBRdQr
         i4h3VaWjt6HsXKl9mSKVfm+jOFmLn7pQQjT/0zltPds8rYhJG7xx3Y6+swS/7u7RtDnS
         JbF172/th2VBnHOmCLWY12m72p2klJduioMOggfo7TLoUx9AyECCUuEzQW/mDkQqfAwB
         lR6A==
X-Gm-Message-State: AC+VfDwYyQQPsuYD+hscQsPP35LrVYvkV6kBELBp4E5h5HeoW+dhDm/U
        QLPr9NLp8CE0dqpqK3TjpT16/BrfUQtdxrvLn6Lzyw==
X-Google-Smtp-Source: ACHHUZ4L9AyGvHHgp1jvCv/pE7ALzx3atTvABCYDswQdNfcJmeP6c+6leOw9ULkc5e2G7l1YkS7Kgyk1Nvp7wralsQc=
X-Received: by 2002:a05:6512:32cb:b0:4fa:f1da:e6b9 with SMTP id
 f11-20020a05651232cb00b004faf1dae6b9mr5929372lfg.42.1687893136983; Tue, 27
 Jun 2023 12:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230623222016.3742145-1-evan@rivosinc.com> <20230623222016.3742145-2-evan@rivosinc.com>
 <64F2D853-61E5-49CF-BAB5-AAFB8697683E@jrtc27.com>
In-Reply-To: <64F2D853-61E5-49CF-BAB5-AAFB8697683E@jrtc27.com>
From:   Evan Green <evan@rivosinc.com>
Date:   Tue, 27 Jun 2023 12:11:40 -0700
Message-ID: <CALs-HssZG8daTJaRK8JPT0VRk=23CtO6B_5kq4Xa_DdLELjaZw@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Probe for unaligned access speed
To:     Jessica Clarke <jrtc27@jrtc27.com>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>, linux-doc@vger.kernel.org,
        Yangyu Chen <cyy@cyyself.name>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guo Ren <guoren@kernel.org>,
        Jisheng Zhang <jszhang@kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Xianting Tian <xianting.tian@linux.alibaba.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Greentime Hu <greentime.hu@sifive.com>,
        Simon Hosie <shosie@rivosinc.com>,
        Li Zhengyu <lizhengyu3@huawei.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Ley Foon Tan <leyfoon.tan@starfivetech.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Anup Patel <apatel@ventanamicro.com>,
        linux-kernel@vger.kernel.org,
        Sia Jee Heng <jeeheng.sia@starfivetech.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Andy Chiu <andy.chiu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 26, 2023 at 2:42=E2=80=AFPM Jessica Clarke <jrtc27@jrtc27.com> =
wrote:
>
> On 23 Jun 2023, at 23:20, Evan Green <evan@rivosinc.com> wrote:
> >
> > Rather than deferring misaligned access speed determinations to a vendo=
r
> > function, let's probe them and find out how fast they are. If we
> > determine that a misaligned word access is faster than N byte accesses,
> > mark the hardware's misaligned access as "fast".
>
> How sure are you that your measurements can be extrapolated and aren=E2=
=80=99t
> an artefact of the testing process? For example, off the top of my head:
>
> * The first run will potentially be penalised by data cache misses,
>   untrained prefetchers, TLB misses, branch predictors, etc. compared
>   with later runs. You have one warmup, but who knows how many
>   iterations it will take to converge?

I'd expect the cache penalties to be reasonably covered by a single
warmup. You're right about branch prediction, which is why I tried to
use a large-ish buffer size, minimize the ratio of conditionals to
loads/stores, and do the test for a decent number of iterations (on my
THead, about 1800 and 400 for words and bytes).

When I ran the test a handful of times, I did see variation on the
order of ~5%. But the comparison of the two numbers doesn't seem to be
anywhere near that margin (THead C906 was ~4x faster doing misaligned
word accesses, others with slow misaligned accesses also reporting
numbers not anywhere close to each other).

>
> * The code being benchmarked isn=E2=80=99t the code being run, so differe=
nces
>   in access patterns, loop unrolling, loop alignment, etc. may cause the
>   real code to behave differently (and perhaps change which is better).

I'm not trying to make statements about memcpy specifically, but
(only) about misaligned accesses, which is why I tried to write loops
that isolated that element as much as possible.

>
> The non-determinism that could in theory result from this also seems
> like a not great idea to have.

This is fair, if we have machines where this waffles from boot to boot
that's not great. In theory if misaligned word accesses come out to
being almost exactly equal to N byte accesses, then it doesn't matter
which you choose, though of course it could still make a difference in
practice. The alternative though of providing no info just pushes the
same problem out into userspace, which seems worse.
-Evan

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B2FC77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 14:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbjFEODd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 10:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233926AbjFEODU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 10:03:20 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53A410A
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 07:03:03 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-307d20548adso4023773f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Jun 2023 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685973782; x=1688565782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TpTdF2O/cApQ1f8cCRIskXNZxv29sK1ejd0fKQhf0A=;
        b=C0kOoFwZI7gBQMp/Tv/Ev346Vqn39Qz6k9uo241DZp0B0A3B9BKADk+fVB9WNfdZNz
         apwt9PWDETqF2SOX7E/h0q1yEiCJ/lx4vxtysqO9QvufT13mqG6uc1LJ+6uEsUavKEA1
         SKCzaEtMLdpl8bRC3mwCBzyvzw6lABO2K+NYuJAgZwZcqpH67c9AkVrba2xgjRAnv4a4
         eukbdi3aBYszu+O8ojl8ip3il+ThyIlWjjdQPsR674II8p5cem7ZA9GA6r/v3QSbS1XL
         brRQyn5j73kOhV36J8ELB34s5rit/+/9MGYyyMJFhDTBUjGVSRGszf7kbNe65ucMMfdA
         YGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685973782; x=1688565782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TpTdF2O/cApQ1f8cCRIskXNZxv29sK1ejd0fKQhf0A=;
        b=LsYTbI+6IFSRs4NDVDHeR/FG5ePlo7KF5WPIthhnCjNt4aW1FWHWMFPqOwsQl1vlxV
         4jQ5LSyG1COQYJcgoy74db3oUXeJpCFrfq68ykgCN5oEEfr1VB6p6n5mVxvgOm3f7Uil
         skHUSfeoC11Kbe1gdUbDbtV4WtdkyP0Ddup8Q89nWHpvVClZAdsJPaYtZq6mLwmR6kCy
         +76MN68VX3qkCP1wl9ryByJBELbb5m3VzLcO4+YGoPH1EGZ8tl+R1pGJQoyke5r8iW2w
         AQktprQ+fkOLlmIrEQDeiBJj6A+LwGVgNYs3344FCmNO55RzAHUsY7l23W86kMOKDhn4
         5JcA==
X-Gm-Message-State: AC+VfDyffCA4x6j7Ni+8sm/KKM9+EQPdebFp3EFJ8Lw/blneWHGJHUCY
        ChHQurz6zR+AIZfd00qQNxjFXhpKh/mslPGHThx/LQ==
X-Google-Smtp-Source: ACHHUZ7NakWJkFLD7elRYzpOCRLCQT0EUX48KZ9XktEDXyOh5eBAI+rcnWmdoAItU1aaYSTk+xTAlGnia4YfRKzxDzg=
X-Received: by 2002:a5d:5490:0:b0:30e:3e6f:3682 with SMTP id
 h16-20020a5d5490000000b0030e3e6f3682mr2185459wrv.5.1685973782326; Mon, 05 Jun
 2023 07:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-11-alexghiti@rivosinc.com> <20230531-31bd9ddeaca8cb338f81ed14@orel>
 <ZH3ovt4WnTJuTinF@kernel.org>
In-Reply-To: <ZH3ovt4WnTJuTinF@kernel.org>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Mon, 5 Jun 2023 16:02:51 +0200
Message-ID: <CAHVXubgr5=c0c7wMWTHjJw-TWE8vLtUEqcNRabNzdU4zZtnvvA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] perf: tests: Adapt mmap-basic.c for riscv
To:     Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Andrew Jones <ajones@ventanamicro.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atishp@atishpatra.org>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

(sorry mail client switched to html on its own)

On Mon, Jun 5, 2023 at 3:53=E2=80=AFPM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> Em Wed, May 31, 2023 at 05:15:15PM +0200, Andrew Jones escreveu:
> > On Fri, May 12, 2023 at 10:53:21AM +0200, Alexandre Ghiti wrote:
> > > riscv now supports mmaping hardware counters to userspace so adapt th=
e test
> > > to run on this architecture.
> > >
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >  tools/perf/tests/mmap-basic.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-ba=
sic.c
> > > index e68ca6229756..f5075ca774f8 100644
> > > --- a/tools/perf/tests/mmap-basic.c
> > > +++ b/tools/perf/tests/mmap-basic.c
> > > @@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] =3D {
> > >                      "permissions"),
> > >     TEST_CASE_REASON("User space counter reading of instructions",
> > >                      mmap_user_read_instr,
> > > -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> > > +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)=
 || __riscv_xlen =3D=3D 64
> > >                      "permissions"
> > >  #else
> > >                      "unsupported"
> > > @@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] =3D {
> > >             ),
> > >     TEST_CASE_REASON("User space counter reading of cycles",
> > >                      mmap_user_read_cycles,
> > > -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> > > +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)=
 || __riscv_xlen =3D=3D 64
> > >                      "permissions"
> > >  #else
> > >                      "unsupported"
> > > --
> > > 2.37.2
> > >
> >
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Was the kernel part merged upstream?

No, I still haven't answered the reviews :)

>
> - Arnaldo

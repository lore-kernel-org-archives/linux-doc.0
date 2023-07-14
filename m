Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD37C001DD
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 09:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235806AbjGNJaL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 05:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235801AbjGNJaK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 05:30:10 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830B62D63
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 02:30:09 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b700e85950so24816281fa.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 02:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689327008; x=1691919008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dosegy5s6S3Py/sYCBb7fr6YwHTMUrv8EM9f77WeMOc=;
        b=Xqcw23ipPcPee2KGDUUmScxC6YI+Lt+tpZLhyiWzpqBFRO340fdakn0xdVV1NlwZYo
         8LZbDjW6NUOsDs0GB/lm0oM1oxUlYm5/QtzGj1+yTps3jl6EW1l2EbnJeFvc6s69+PMu
         3etpZNsNrgUTw2j28xUGW6FsyP7PGWyvOkhIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689327008; x=1691919008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dosegy5s6S3Py/sYCBb7fr6YwHTMUrv8EM9f77WeMOc=;
        b=AxwzAcmCmZjWi5mY1wlhi4dXa3ijbQpcJdcCMtoACOr8qa0+B1uh2treIbs+tWltF3
         r8My0kZBN/EFoVsPNL7npKwit5PYi0Q0/qutPtH5+FAc4cU+BQedqxke1GL/nzMzi/ip
         69Vy8KUV9CA/5fV2wlk3j4rmFXlFUH58rwGbNfjDokzIv9aj1q+zUAvNOsvoeidB71IA
         V2L68Uylkta6uS29KtrdvFfyMDf4PzZak1+OcBmLqjrcN1DW0iHqMGNcsIwP514FsuV0
         wpXR93EqAiQ1/ObQAbPTV62dvJ4yjvrlo6Vu3J+zdf8xDZo1312kpd3oUM28/XyRxw62
         /EJQ==
X-Gm-Message-State: ABy/qLaLhj19TriYa/jDO5ZNDlnEBiM2XLfO2R8QgQnn22277Vn+zBsG
        3YWI879Cc5ZvgK/MR8o+TLavoijmIZ2Rf2oULkJD
X-Google-Smtp-Source: APBJJlEPgo1IICV+iHBqiUW+Vh3Nr2Vbvx10CePV36LNEMGHrNoz3v5ECTBa/vGZDHxkGoGYB97wfvhB3JFhCknlnkc=
X-Received: by 2002:a2e:a16f:0:b0:2b6:d57f:d81 with SMTP id
 u15-20020a2ea16f000000b002b6d57f0d81mr3198367ljl.53.1689327007925; Fri, 14
 Jul 2023 02:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com> <20230703124647.215952-11-alexghiti@rivosinc.com>
In-Reply-To: <20230703124647.215952-11-alexghiti@rivosinc.com>
From:   Atish Patra <atishp@atishpatra.org>
Date:   Fri, 14 Jul 2023 02:29:56 -0700
Message-ID: <CAOnJCUJcYAX3=h=O6nCjN+hAL9cT8Cmw5sgXa1MZpKEPCuyM-A@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] perf: tests: Adapt mmap-basic.c for riscv
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Andrew Jones <ajones@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 3, 2023 at 5:57=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc.=
com> wrote:
>
> riscv now supports mmaping hardware counters to userspace so adapt the te=
st
> to run on this architecture.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/perf/tests/mmap-basic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.=
c
> index e68ca6229756..f5075ca774f8 100644
> --- a/tools/perf/tests/mmap-basic.c
> +++ b/tools/perf/tests/mmap-basic.c
> @@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] =3D {
>                          "permissions"),
>         TEST_CASE_REASON("User space counter reading of instructions",
>                          mmap_user_read_instr,
> -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || =
__riscv_xlen =3D=3D 64
>                          "permissions"
>  #else
>                          "unsupported"
> @@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] =3D {
>                 ),
>         TEST_CASE_REASON("User space counter reading of cycles",
>                          mmap_user_read_cycles,
> -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || =
__riscv_xlen =3D=3D 64
>                          "permissions"
>  #else
>                          "unsupported"
> --
> 2.39.2
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
--=20
Regards,
Atish

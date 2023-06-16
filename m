Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCDBEB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 16 Jun 2023 08:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343614AbjFPIng (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jun 2023 04:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343610AbjFPInc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 04:43:32 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC172D7B
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 01:43:29 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b44420d0e6so6678251fa.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jun 2023 01:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686905008; x=1689497008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDKNwc2spJwBfD2I0zIbFW0EXN11ktfXXRri1gY5Wq4=;
        b=Q4BVOMxjOIj+1lvfbkrCmoferkJ4DrgoK2bY1m2+REfJQMIq1E8wARoLRu1Ucq0fch
         KW8AVDqi6q48jF0cCigWx4G9koByTKk0TO8dXqh6RQKVeUiQ5XlKID3vJ5479apMgKNj
         px0XvIXdo0H2dmHBJRA9CIMQt3MgDbcNsylek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686905008; x=1689497008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDKNwc2spJwBfD2I0zIbFW0EXN11ktfXXRri1gY5Wq4=;
        b=jwE5H19mxukCq299AN9OXaoF9o6hD3Ulgj2LPXbPHDHfuOdrk5VdOFPqYbOUMVfCB6
         OBv1vpf16n1risr2gXyXaBDK4Hod1/YwdamgB3ZFRnNLoaADh55e7qhEu2NL4uMtHh4b
         avw+PaIrG/EXEtGIHykkSUcJVD0jBj9hxtPfSzRR3BIwg97UKgvGOu5CsQWDyFrOA7/0
         e42xmmOERjbfxX49RzkFCE1pQy+eVNcCRAjFDj1ArZkAkccc3aSu3hkYkhyyHG6wIFnD
         R2bB/g0ZdFNn17Ivx+i7Z5ynJWFNz7+YCptdXAUW0ngSN1n/l1b0xSkZsnuy9UVZFz/y
         oZlA==
X-Gm-Message-State: AC+VfDwbFY994U4yW47mjd4MFlElBJw5DMcGA8PA9LTHVd0768xUAMi+
        i8YUtxS6HGfLFeWIk8AMBjmO5alJQzT3QIAJGIx7
X-Google-Smtp-Source: ACHHUZ588No8rZTW5BgVANgGiSevYvr7PcGyiQIzkpCtRm5EWtTsAu2/r8c06MBm/GyhWVIvHZI+/K/g+jEjYCbGYpk=
X-Received: by 2002:a05:651c:150:b0:2b0:919e:4265 with SMTP id
 c16-20020a05651c015000b002b0919e4265mr362266ljd.21.1686905008073; Fri, 16 Jun
 2023 01:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com> <20230512085321.13259-10-alexghiti@rivosinc.com>
In-Reply-To: <20230512085321.13259-10-alexghiti@rivosinc.com>
From:   Atish Patra <atishp@atishpatra.org>
Date:   Fri, 16 Jun 2023 01:43:16 -0700
Message-ID: <CAOnJCU+n0O9oQmd1Vs3kimaBai7vbaf5RiMRFyvphCCLCGMB1A@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] tools: lib: perf: Implement riscv mmap support
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

On Fri, May 12, 2023 at 2:03=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> riscv now support mmaping hardware counters so add what's needed to
> take advantage of that in libperf.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  tools/lib/perf/mmap.c | 65 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
> index 0d1634cedf44..65f250e0ef92 100644
> --- a/tools/lib/perf/mmap.c
> +++ b/tools/lib/perf/mmap.c
> @@ -392,6 +392,71 @@ static u64 read_perf_counter(unsigned int counter)
>
>  static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
>
> +#elif __riscv_xlen =3D=3D 64
> +

This is applicable for RV32 as well. No ?
otherwise, you won't need CSR_CYCLEH

> +#define CSR_CYCLE      0xc00
> +#define CSR_TIME       0xc01
> +#define CSR_CYCLEH     0xc80
> +
> +#define csr_read(csr)                                          \
> +({                                                             \
> +       register unsigned long __v;                             \
> +               __asm__ __volatile__ ("csrr %0, " #csr          \
> +                : "=3Dr" (__v) :                                 \
> +                : "memory");                                   \
> +                __v;                                           \
> +})
> +
> +static unsigned long csr_read_num(int csr_num)
> +{
> +#define switchcase_csr_read(__csr_num, __val)           {\
> +       case __csr_num:                                 \
> +               __val =3D csr_read(__csr_num);            \
> +               break; }
> +#define switchcase_csr_read_2(__csr_num, __val)         {\
> +       switchcase_csr_read(__csr_num + 0, __val)        \
> +       switchcase_csr_read(__csr_num + 1, __val)}
> +#define switchcase_csr_read_4(__csr_num, __val)         {\
> +       switchcase_csr_read_2(__csr_num + 0, __val)      \
> +       switchcase_csr_read_2(__csr_num + 2, __val)}
> +#define switchcase_csr_read_8(__csr_num, __val)         {\
> +       switchcase_csr_read_4(__csr_num + 0, __val)      \
> +       switchcase_csr_read_4(__csr_num + 4, __val)}
> +#define switchcase_csr_read_16(__csr_num, __val)        {\
> +       switchcase_csr_read_8(__csr_num + 0, __val)      \
> +       switchcase_csr_read_8(__csr_num + 8, __val)}
> +#define switchcase_csr_read_32(__csr_num, __val)        {\
> +       switchcase_csr_read_16(__csr_num + 0, __val)     \
> +       switchcase_csr_read_16(__csr_num + 16, __val)}
> +
> +       unsigned long ret =3D 0;
> +
> +       switch (csr_num) {
> +       switchcase_csr_read_32(CSR_CYCLE, ret)
> +       switchcase_csr_read_32(CSR_CYCLEH, ret)
> +       default:
> +               break;
> +       }
> +
> +       return ret;
> +#undef switchcase_csr_read_32
> +#undef switchcase_csr_read_16
> +#undef switchcase_csr_read_8
> +#undef switchcase_csr_read_4
> +#undef switchcase_csr_read_2
> +#undef switchcase_csr_read
> +}
> +
> +static u64 read_perf_counter(unsigned int counter)
> +{
> +       return csr_read_num(CSR_CYCLE + counter);
> +}
> +
> +static u64 read_timestamp(void)
> +{
> +       return csr_read_num(CSR_TIME);
> +}
> +
>  #else
>  static u64 read_perf_counter(unsigned int counter __maybe_unused) { retu=
rn 0; }
>  static u64 read_timestamp(void) { return 0; }
> --
> 2.37.2
>


--=20
Regards,
Atish

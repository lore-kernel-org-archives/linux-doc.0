Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A98C77B73
	for <linux-doc@archiver.kernel.org>; Wed, 31 May 2023 14:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237036AbjEaOMd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 May 2023 10:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236660AbjEaOMU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 May 2023 10:12:20 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70252D62
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 07:09:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f4b80bf93aso6732792e87.0
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685542098; x=1688134098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UleDEf3AixBo9U/UXpWY/ydRnuyv0U623659h0izsxQ=;
        b=lurfrXpWAGNgCdsq5lHgxP4TG/3bORyorzXjHAbyfKZk2wkkoGyqGnKDSZDnRW7vCh
         BaGf4I0Boi7XkjHKemAV5Vt/fMkWtW6R6EWWSE9jZ98eCPE8uhxqWP7v2VtRX7ZEUxwh
         1RyES1adW3ySuOls3iXTbHrqg+CimTq77Tb64Vmd2sQ1yps9mSQdvDvLTkG4CpiOx1PN
         ls8uC/7mheaU8PpXdFOnt1K3yKxpuDwwk04pNgUkpfrv2WuzE2VMZktra+Kv8ZLw9xKQ
         Kj29cLDTYyG1mE0CAZ2PvRYCre6YJxWkGXpCoMqGPoB7q5VU78TZ00+qvG7IhgQg+miv
         BOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685542098; x=1688134098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UleDEf3AixBo9U/UXpWY/ydRnuyv0U623659h0izsxQ=;
        b=hFO5vdgJr/0UgEVZKuisqL+jDxCg6SL1XehAvr9bKfHQkqCV6FX4J4JxBwxJ7RLtGE
         qFDZNNfBRuWdIA2K0SKGEm1xM1XYbMatO1qgfZrgyn8xLHTiutnnh7unrYkhoOKYg+bi
         hfQzxIu+d7eTzElN3TVxeiGuu0/Y9JbsI/KECD2+gsod21QptmMMHkdKTUyuAIE6+01d
         Q1e7hj/IlbRLASuZ8JbKQsbipq561tcSXsqLO7QRDPCloYoXrOPpuKhdTpyMkBjjHhlW
         RU2Y5nUf2m7v6e7Atwj8k1JfqEcumBBG+VZMbZfnf4hb+dFkb7tiwn4s6gu9EhPRFxYq
         mXPg==
X-Gm-Message-State: AC+VfDzYA/SMMw2fpdr8F1qHVV5wW6+f+Q5QU5ho+NyaQ8gVoACDL/si
        qlna809bMRU88YWZovQppq9hJRD8x+8uNBOxXbE=
X-Google-Smtp-Source: ACHHUZ73Q8q9IJwMsX7edY6y2EM+CFjk3itDAZXOWz2NI9uE9E+/V3YrQjB4Rf2f+g7r1cETzEjw8g==
X-Received: by 2002:a17:907:1c14:b0:968:2bb1:f39d with SMTP id nc20-20020a1709071c1400b009682bb1f39dmr6314966ejc.36.1685541371576;
        Wed, 31 May 2023 06:56:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id va15-20020a17090711cf00b0094ee99eeb01sm9041514ejb.150.2023.05.31.06.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 06:56:10 -0700 (PDT)
Date:   Wed, 31 May 2023 15:56:10 +0200
From:   Andrew Jones <ajones@ventanamicro.com>
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
        Atish Patra <atishp@atishpatra.org>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 02/10] include: riscv: Fix wrong include guard in
 riscv_pmu.h
Message-ID: <20230531-707d254be1238272fb2c182d@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-3-alexghiti@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 12, 2023 at 10:53:13AM +0200, Alexandre Ghiti wrote:
> The current include guard prevents the inclusion of asm/perf_event.h
> which uses the same include guard: fix the one in riscv_pmu.h so that it
> matches the file name.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  include/linux/perf/riscv_pmu.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index 43fc892aa7d9..9f70d94942e0 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -6,8 +6,8 @@
>   *
>   */
>  
> -#ifndef _ASM_RISCV_PERF_EVENT_H
> -#define _ASM_RISCV_PERF_EVENT_H
> +#ifndef _RISCV_PMU_H
> +#define _RISCV_PMU_H
>  
>  #include <linux/perf_event.h>
>  #include <linux/ptrace.h>
> @@ -81,4 +81,4 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
>  
>  #endif /* CONFIG_RISCV_PMU */
>  
> -#endif /* _ASM_RISCV_PERF_EVENT_H */
> +#endif /* _RISCV_PMU_H */
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

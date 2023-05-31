Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6707DC77B73
	for <linux-doc@archiver.kernel.org>; Wed, 31 May 2023 14:19:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236574AbjEaOTC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 May 2023 10:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237092AbjEaOSr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 May 2023 10:18:47 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EF31981
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 07:17:19 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2af2602848aso61981651fa.2
        for <linux-doc@vger.kernel.org>; Wed, 31 May 2023 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685542599; x=1688134599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pgpyzmnbNHAseyCM+s0XsB0KjofBbxw68PBCInlqrLM=;
        b=plJJIp0rTyTgyqmDU9npOz7fz/A56G8ZrYNcM6exA2190alD704Ja6JoXGfrB25mRn
         sZIU3ADU/LwWYhL0YeDjgsfSntAEdbhtVLR5Sl4wepP05jXoK1jLlT7W6svx+uKlOaj6
         GR0QFQmB5qOkBqQCXlSOm9dPkNZTZQJL3/f275RMqJ37MeIOjyp3Qj/FQVkCwbe6pVu3
         k0WzhoZJh7NpH/XUOjsuGR1xwsCODKZWUqx3FUL95BpwuMr4Dbz60TwlNUYPzSHOYyyN
         P1cY2QQbYdyxzPxTghWd0eiuO/GdHF/4sOkLy+VxYnjWkfxlVVIOpXOKHVVVDr/Adltq
         AM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685542599; x=1688134599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgpyzmnbNHAseyCM+s0XsB0KjofBbxw68PBCInlqrLM=;
        b=Jq6UPxw6g5jGKzuZKiED6Dk21uxrXdGpE1dQP1icMjMifshgNYNZQZS0F7gEBacXOA
         pURyWoBBdczjsnIBoKCVACdBd/GnZP3+MToNljXFpnJjmNF7TUS7ZRKTEdAk9GcHNPil
         9skoAoAI2F3766lcfdMidA/Ldn7leduRReg1kx9giIYJo6xMbGcCO6C46EpjDbPllzB8
         wkGXEiEuU/mKdM968uukUXaSScVKvuiAFTTmELFUvXoSQJIu6tKhVcZcAsGXeTPuEGl/
         Dtqwo6kc4eLfFDqThN/pKSfJ2OGF3yTC4+RlIa006A+d59akGczNaTuXrJpDqyaciYUu
         5+Mw==
X-Gm-Message-State: AC+VfDyl7k30PZ/DD4MsnE7zoy5MM0Y1LInKrbtjBs4/xTLJ13mcnIOu
        rEYR4tfkIuV3EzQN+E6wjvLdFjTFNDNEDv0bhxE=
X-Google-Smtp-Source: ACHHUZ6/5u1aIeEPR87Cph6/LuYqwzkXH6Ggsh21iSthCsoK8ecfPiKMDhYwuo0sJqTdGafvLc34yA==
X-Received: by 2002:a5d:526e:0:b0:309:50e7:7c3 with SMTP id l14-20020a5d526e000000b0030950e707c3mr4408962wrc.63.1685542170038;
        Wed, 31 May 2023 07:09:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d15-20020a056000114f00b0030af72bca98sm4800839wrx.103.2023.05.31.07.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 07:09:29 -0700 (PDT)
Date:   Wed, 31 May 2023 16:09:28 +0200
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
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 04/10] drivers: perf: Rename riscv pmu driver
Message-ID: <20230531-49ed4c2054db0abbacd03632@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-5-alexghiti@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 12, 2023 at 10:53:15AM +0200, Alexandre Ghiti wrote:
> In addition to being more pretty, it will be useful in upcoming commits
> to distinguish those pmu drivers from the other pmu drivers.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_legacy.c | 2 +-
>  drivers/perf/riscv_pmu_sbi.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> index 0d8c9d8849ee..ffe09d857366 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -95,7 +95,7 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
>  	pmu->ctr_clear_idx = NULL;
>  	pmu->ctr_read = pmu_legacy_read_ctr;
>  
> -	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
> +	perf_pmu_register(&pmu->pmu, RISCV_PMU_LEGACY_PDEV_NAME, PERF_TYPE_RAW);
>  }
>  
>  static int pmu_legacy_device_probe(struct platform_device *pdev)
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 70cb50fd41c2..3b0ee2148054 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -897,7 +897,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_unregister;
>  
> -	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
> +	ret = perf_pmu_register(&pmu->pmu, RISCV_PMU_PDEV_NAME, PERF_TYPE_RAW);

Should we include "sbi" in this name?

>  	if (ret)
>  		goto out_unregister;
>  
> -- 
> 2.37.2
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

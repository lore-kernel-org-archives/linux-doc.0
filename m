Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73033C001DE
	for <linux-doc@archiver.kernel.org>; Wed,  2 Aug 2023 09:32:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbjHBJcV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 05:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbjHBJcU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 05:32:20 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FEE12B
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 02:32:16 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52164adea19so8929319a12.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Aug 2023 02:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690968735; x=1691573535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qF0aEgee+FPFz+iaQY2LrH7Juz8N6fO4KHzo5d0J5po=;
        b=WK07xQ3FGA5WcpC5zdx0uDh/Lh1f8FHSywlLFabT48BunC8cffyAwiJnKW6W9ZHRhv
         bdiDZKh6i0P4XosyLhKvMsVWmygqgp4Nn80eYXDBOUZZTPbZk/2eUYXuKJaH7TpmOyts
         uouA7nAqrPVIUuVFeiYhOUUhrv3QHDWqOuZx2kCNJDNh2aH2eXWJ9YAiQWrdJMqwx2oh
         9t1va6KIgdxlTSaxnMg37rZ9D2boo1lpHhH6ebbDqA3WQFowchWEJzIXd+bS1suntkFe
         z/mJYKfIdrEi0/aoJC3VfeRW0y2kGAdMru/7TdNZy1piXEQ2WKmynJZBN+YHfGfUccEv
         Txrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690968735; x=1691573535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF0aEgee+FPFz+iaQY2LrH7Juz8N6fO4KHzo5d0J5po=;
        b=iEEErkCL8tfG0C15jAS/8MlJ++5KXPnDRi3acy3F4l5M2f4urDOtX++aFfSEmar4l7
         W4jZT/h6coEPqZ7sDqEdGdoKxTRqc90Lv2hhG3sLqmaYA9BqX+21R6TU8qw28Br00Z8+
         ao9IbvZU0SOm3vhh5cyECLDiPw481nPfzRam7yzKGpIIpgglnqZIS9T7+HbO+2LYs/wo
         zyU7qtmr1yiQ5h4z1fbanN11XXMY0O9p2HaVdxwcswQ84jyRjsQyK9QC0MPKdoSA+2qE
         kUTpIjKf9StCTmO8/IuBiP9Supg5z/gXakuNCoz68Jco/1xsAL+dCFIylZaCSyVLrLE5
         FMUg==
X-Gm-Message-State: ABy/qLZdj/XTmKBar2GSCmK1f2rQB7IXPi9XwB9ai8J+UD6Q6c/UX/Ok
        f1ujNWAMQ3jO6YTz9ksAqaKlxQ==
X-Google-Smtp-Source: APBJJlFF191bxevEKrX048Spx8AHXhdbVnhFYercC2XbYZV/VYGT7ptsY6UpNsEbfdmWvraciuM69A==
X-Received: by 2002:a17:907:2bd7:b0:96f:e5af:ac5f with SMTP id gv23-20020a1709072bd700b0096fe5afac5fmr4440341ejc.47.1690968735457;
        Wed, 02 Aug 2023 02:32:15 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090690c800b00997e99a662bsm8741929ejw.20.2023.08.02.02.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:32:15 -0700 (PDT)
Date:   Wed, 2 Aug 2023 12:32:12 +0300
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
        =?utf-8?B?UsOpbWk=?= Denis-Courmont <remi@remlab.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v6 09/10] tools: lib: perf: Implement riscv mmap support
Message-ID: <20230802-7c19a712ae071f68030ab5f2@orel>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
 <20230802080328.1213905-10-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802080328.1213905-10-alexghiti@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 02, 2023 at 10:03:27AM +0200, Alexandre Ghiti wrote:
> riscv now supports mmaping hardware counters so add what's needed to
> take advantage of that in libperf.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/lib/perf/mmap.c | 66 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
> index 0d1634cedf44..2184814b37dd 100644
> --- a/tools/lib/perf/mmap.c
> +++ b/tools/lib/perf/mmap.c
> @@ -392,6 +392,72 @@ static u64 read_perf_counter(unsigned int counter)
>  
>  static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
>  
> +/* __riscv_xlen contains the witdh of the native base integer, here 64-bit */
> +#elif defined(__riscv) && __riscv_xlen == 64
> +
> +/* TODO: implement rv32 support */
> +
> +#define CSR_CYCLE	0xc00
> +#define CSR_TIME	0xc01
> +
> +#define csr_read(csr)						\
> +({								\
> +	register unsigned long __v;				\
> +		__asm__ __volatile__ ("csrr %0, %1"		\
> +		 : "=r" (__v)					\
> +		 : "i" (csr) : );				\
> +		 __v;						\

nit: no need for the indentation or line wrap,

({
	register unsigned long __v;
	__asm__ __volatile__ ("csrr %0, %1" : "=r" (__v) : "i" (csr));
	__v;
})

Thanks,
drew

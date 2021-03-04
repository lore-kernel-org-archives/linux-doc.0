Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E502FC433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 02:27:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A849964E62
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 02:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhCDC12 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 21:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhCDC1U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Mar 2021 21:27:20 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91A3C06175F
        for <linux-doc@vger.kernel.org>; Wed,  3 Mar 2021 18:26:33 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id l18so5802968pji.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Mar 2021 18:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=jg9i1mPUq1K1Wcc5GInzffq6do0Ck3ej7ZHTvXvymaQ=;
        b=iwyZr437AFeZuoHsMpAywvQ7EexOwWoAL9bPOiX8EFjQymmFy/flAiAB6qSlKVJBLT
         Vpf6odJvr44WSLiAKN2koccO4JbjOxJxByBLRtDFzQAUAaB/rJ/f/sGdi1tpGSzp+965
         kjDbiv4wz5B+v5TF1sn1U+CGegHxTrhTXdko1J19OnjwcUxK6Xj6RLfxfJq61pYV1JSa
         FaxS0vRfQpQ1JgtlOPCOuof5YuWDzBZd1YMZdr5yhFBaHZZ5Ei32FgT1Zg0/c9LCfUo7
         AgnxvRka0D6ll2q2P66NwcESGNBa4CHWDY4IlMXx2PopWK+bU5A5PTA4rVNxBaI1JwUN
         TNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=jg9i1mPUq1K1Wcc5GInzffq6do0Ck3ej7ZHTvXvymaQ=;
        b=nMXXAWlOMbd/X6sowbFEKDTFmg2yOwfo/aJum4LZmXmwhqtbCX8KVksSrUOa6K4pgu
         yMErvlQrYkiCarDtf0D8estyPmCXumKIOWb7/p+cQhl8IdWc5diMBN0hf+cs/BhsW8k0
         W9gGnJh5GWylQboJAbdksM46odcWJISWcuOXgs6ZpW6z1KBIPyenmfJSIGgIYFJ60jfd
         8SxG6/avjaNPgS6oqOTzbufHg+3b9C74LQ38piJwsOLD7UH7Xcmo91tg9Jmg+voJqJDV
         ip9/qx1v4v2o19E5BqgLk/CYmHwHHb5zWdaLPbIwLO9rdRyKlzlteCxws009r5K7AMbT
         C0YQ==
X-Gm-Message-State: AOAM531uhYRC3ZMIqW1u5XUCg/b+2hGNyEa7diSWAUbFOC8rSlVEI4OL
        KeqrdWt5Ua1L/avuQoAdrX30MQ==
X-Google-Smtp-Source: ABdhPJxwx9njZKYS6LhVNn0HXdr1kMTRLK9xUdhIxjnFvsH7nM6Grh2Lg7goB5XLHYbemCIyNs6ZNA==
X-Received: by 2002:a17:902:a714:b029:e3:1cd:a033 with SMTP id w20-20020a170902a714b02900e301cda033mr1819123plq.27.1614824793472;
        Wed, 03 Mar 2021 18:26:33 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id 184sm27495857pfc.176.2021.03.03.18.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 18:26:32 -0800 (PST)
Date:   Wed, 03 Mar 2021 18:26:32 -0800 (PST)
X-Google-Original-Date: Wed, 03 Mar 2021 18:26:29 PST (-0800)
Subject:     Re: [PATCH] Documentation/admin-guide: kernel-parameters: correct the architectures for numa_balancing
In-Reply-To: <20210302084159.33688-1-song.bao.hua@hisilicon.com>
CC:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        song.bao.hua@hisilicon.com, mgorman@suse.de,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, paulmck@kernel.org, rdunlap@infradead.org,
        akpm@linux-foundation.org, tglx@linutronix.de,
        mchehab+huawei@kernel.org, viresh.kumar@linaro.org,
        mike.kravetz@oracle.com, peterz@infradead.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     song.bao.hua@hisilicon.com
Message-ID: <mhng-a06d1543-65b7-49fa-87c7-f437ec1d85ea@penguin>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 02 Mar 2021 00:41:59 PST (-0800), song.bao.hua@hisilicon.com wrote:
> X86 isn't the only architecture supporting NUMA_BALANCING. ARM64, PPC,
> S390 and RISCV also support it:
>
> arch$ git grep NUMA_BALANCING
> arm64/Kconfig:  select ARCH_SUPPORTS_NUMA_BALANCING
> arm64/configs/defconfig:CONFIG_NUMA_BALANCING=y
> arm64/include/asm/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
> powerpc/configs/powernv_defconfig:CONFIG_NUMA_BALANCING=y
> powerpc/configs/ppc64_defconfig:CONFIG_NUMA_BALANCING=y
> powerpc/configs/pseries_defconfig:CONFIG_NUMA_BALANCING=y
> powerpc/include/asm/book3s/64/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
> powerpc/include/asm/book3s/64/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
> powerpc/include/asm/book3s/64/pgtable.h:#endif /* CONFIG_NUMA_BALANCING */
> powerpc/include/asm/book3s/64/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
> powerpc/include/asm/book3s/64/pgtable.h:#endif /* CONFIG_NUMA_BALANCING */
> powerpc/include/asm/nohash/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
> powerpc/include/asm/nohash/pgtable.h:#endif /* CONFIG_NUMA_BALANCING */
> powerpc/platforms/Kconfig.cputype:      select ARCH_SUPPORTS_NUMA_BALANCING
> riscv/Kconfig:  select ARCH_SUPPORTS_NUMA_BALANCING
> riscv/include/asm/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
> s390/Kconfig:   select ARCH_SUPPORTS_NUMA_BALANCING
> s390/configs/debug_defconfig:CONFIG_NUMA_BALANCING=y
> s390/configs/defconfig:CONFIG_NUMA_BALANCING=y
> s390/include/asm/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
> x86/Kconfig:    select ARCH_SUPPORTS_NUMA_BALANCING     if X86_64
> x86/include/asm/pgtable.h:#ifdef CONFIG_NUMA_BALANCING
> x86/include/asm/pgtable.h:#endif /* CONFIG_NUMA_BALANCING */
>
> On the other hand, setup_numabalancing() is implemented in mm/mempolicy.c
> which doesn't depend on architectures.
>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 1 +
>  Documentation/admin-guide/kernel-parameters.txt | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 1132796a8d96..24302cad174a 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -140,6 +140,7 @@ parameter is applicable::
>  	PPT	Parallel port support is enabled.
>  	PS2	Appropriate PS/2 support is enabled.
>  	RAM	RAM disk support is enabled.
> +	RISCV	RISCV architecture is enabled.
>  	RDT	Intel Resource Director Technology.
>  	S390	S390 architecture is enabled.
>  	SCSI	Appropriate SCSI support is enabled.
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 04545725f187..371a02ae1e21 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3472,7 +3472,8 @@
>
>  	nr_uarts=	[SERIAL] maximum number of UARTs to be registered.
>
> -	numa_balancing=	[KNL,X86] Enable or disable automatic NUMA balancing.
> +	numa_balancing=	[KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
> +			NUMA balancing.
>  			Allowed values are enable and disable
>
>  	numa_zonelist_order= [KNL, BOOT] Select zonelist order for NUMA.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

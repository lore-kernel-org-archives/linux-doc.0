Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEEBC47090
	for <linux-doc@archiver.kernel.org>; Sat, 29 May 2021 22:57:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A21F6023E
	for <linux-doc@archiver.kernel.org>; Sat, 29 May 2021 22:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhE2Wqm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 May 2021 18:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhE2Wql (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 May 2021 18:46:41 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49AAC061574
        for <linux-doc@vger.kernel.org>; Sat, 29 May 2021 15:45:03 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id f8so4554579pjh.0
        for <linux-doc@vger.kernel.org>; Sat, 29 May 2021 15:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=fi0vV/kF+CsBKSccmeD5rhECNTR0UPRdkNUxlQCOu6o=;
        b=i6A/A7Wom+6pM1tUHC83JTgbW35vAvfXx8K69AJbPi1Hu/Vb0nH15InB2zoG8ZDzdQ
         wyTBY3U0HJRoTiWmeiELkZo8IlIEQpbtxhPLlDwbwTu5KrE2OZK6I9i4TquPmiDzLKaZ
         lWaUa6IiJZ4IdVi4mMrObXbQxU+uFt/0xoo6VREZafKrAi8RhlSA2l/0g0f1E7BQprVc
         LUBKUKXZVmPO42ZwXG36UdQdpYQDxr//afSU5dtEAOqeLHHGSGBSksTq3rke61+tSSdV
         TJUFnuj/q+8xLHDGp7pIK7VmhyuBz6JN3dgmiB2eMZZ8ib50W6AoMcDGRzX/zruYiNmO
         qKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=fi0vV/kF+CsBKSccmeD5rhECNTR0UPRdkNUxlQCOu6o=;
        b=GChMlSSbIh3wmKjRaC8nrEG2JH4P+BmVdnnX+BA7RXggHcR10o8S92+P+TrwcMQTPX
         kfgJLPsXAfSOn5+Rz3luAYd59i7HoXF6AHOeNGWkdB/lTe5ny5N5AqVzH/gCdZ7zlxqr
         JrlzfY8b+ULCr8rsrDG1Do49Fmi6DlUytPr6YrJbve7Y9hVE1Tw22uOh9Km/U2PJhVy7
         uNh9OUQSGP8GWmQA/A8U8k7sRBqerfqCPWn+lVUrmYnDO/37QQ2VUL5wft5QhINO+XtJ
         VeWn+V2sAlqFuZF5D7ZbuZHMwn2uIMT6lRw4cbLGo2mu6TNhvw6KjkcKxR8KBpf2Rxpe
         ZvJg==
X-Gm-Message-State: AOAM531L1BADlwa7XwQzBmBRBuckesMPduGh87Cdk7NBOTc6sXz4DdQH
        AxYWH0ZiaU5OhOfgb80KFv0YvQ==
X-Google-Smtp-Source: ABdhPJxEkcHSt/r0RUtDB7tfrUNpUFiVQ7CCqmPtNOJYrpOwquBntTt3/OkdihRXgW+frUet54s5gQ==
X-Received: by 2002:a17:90a:9411:: with SMTP id r17mr11310055pjo.49.1622328303013;
        Sat, 29 May 2021 15:45:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id m24sm7313476pfa.125.2021.05.29.15.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 15:45:02 -0700 (PDT)
Date:   Sat, 29 May 2021 15:45:02 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 15:37:56 PDT (-0700)
Subject:     Re: [PATCH] docs: kernel-parameters: mark numa=off is supported by a bundle of architectures
In-Reply-To: <20210524051715.13604-1-song.bao.hua@hisilicon.com>
CC:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, will@kernel.org, catalin.marinas@arm.com,
        linux-arm-kernel@lists.infradead.org, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org,
        linuxppc-dev@lists.ozlabs.org, song.bao.hua@hisilicon.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     song.bao.hua@hisilicon.com
Message-ID: <mhng-145d2f8a-0697-4fff-a579-bce952033f25@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 23 May 2021 22:17:15 PDT (-0700), song.bao.hua@hisilicon.com wrote:
> risc-v and arm64 support numa=off by common arch_numa_init()
> in drivers/base/arch_numa.c. x86, ppc, mips, sparc support it
> by arch-level early_param.
> numa=off is widely used in linux distributions. it is better
> to document it.
>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb89dbdedc46..a388fbdaa2ec 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3513,6 +3513,9 @@
>
>  	nr_uarts=	[SERIAL] maximum number of UARTs to be registered.
>
> +	numa=off 	[KNL, ARM64, PPC, RISCV, SPARC, X86] Disable NUMA, Only
> +			set up a single NUMA node spanning all memory.
> +
>  	numa_balancing=	[KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
>  			NUMA balancing.
>  			Allowed values are enable and disable

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

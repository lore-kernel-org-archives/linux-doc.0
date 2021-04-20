Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E96C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 04:19:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E857C611B0
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 04:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhDTEUL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 00:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhDTEUE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 00:20:04 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696D2C061763
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 21:19:31 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e5so7444931wrg.7
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6tOKXOtetoB5l502f6CwFsHmwD7mexR6F47nan+OthU=;
        b=zPHU77GKMzPEi4Z3USHsG2BRW0Zi4R9HfLDI9y7k4FXV1enRHFnEnDFpNblWfiBxmr
         do3ZkVZLdc8LojasG7YWO1dNz1M+r0AXaX9ZjzoEKYFZ8Z/wAxvxyRXTF1NwWMyZJd9B
         O5fNW1Sjd0U6Odjk1x3B8z6uEpc+pHXeBW7ltTAEQu0DpyfIOYhv/0zch1Kw6bX4oIQ1
         a7pVpXyJGsbA3HHIEyJnKH9+kMYJpHy7mGu0VNnpNFdJDPOJmwTEBmrQfuWaCldrzMNy
         nrk1Cd5+0YuXB7qga8FtlY298hCzN0WhhpVElJvtFP5cQ9ghiUqvfTB/LzYFPYwxnETO
         5Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6tOKXOtetoB5l502f6CwFsHmwD7mexR6F47nan+OthU=;
        b=tX/hDGX0ejoSZyGNGFD8XnclgeBx+JiX4DlZN3RgG0rDqprxyf6mjCv/QNjcydOXt1
         KpcjbsMUYMrFstlzI88y7oeuBmgrbQ5vACoLOEwxnyxoepHPeyuJI2axfjJq58dMYz85
         Vasj0z0ghkM393/tBDSFCnoshJPqhyxLJPFPu6o3XK/rJ2Qm6+wm7bN3P3kB3SPHu6TJ
         NmkQ07tnF5xWKup2tspXhw6HfgW2kDWeXFcM7BUizLM2b8CDAM6mCDZvitFb1tqOpOlP
         v6Nko48yv2O4uaTYdP6Mhba4j2T7lsmSsSq38XwCGnOpaVUk8x5jCt1yRgBhYBDKO4er
         ULaA==
X-Gm-Message-State: AOAM531peN4L4tLTXYur4GlVlZtfzb0U+tOSYm8o4S0drHu/aviTF2Me
        i8OwQQrrx277iaxUvG0KYBL02HAZhcJSlYu0GGQUJA==
X-Google-Smtp-Source: ABdhPJwyi59C/3tYFHMh5Y6vJynOO8jGTiBuy759HBjpadP75J9jtm+F/ANmSq07/Qd2xqFswBp4XEetGIu9IzB83DY=
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr17850344wrn.128.1618892370130;
 Mon, 19 Apr 2021 21:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210418112856.15078-1-alex@ghiti.fr>
In-Reply-To: <20210418112856.15078-1-alex@ghiti.fr>
From:   Anup Patel <anup@brainfault.org>
Date:   Tue, 20 Apr 2021 09:49:18 +0530
Message-ID: <CAAhSdy3csxeTiXgf8eKnRYhD7BM1LDLPddrn527AkA_-fiEGkw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove 32b kernel mapping from page table dump
To:     Alexandre Ghiti <alex@ghiti.fr>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>, linux-doc@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        kasan-dev@googlegroups.com,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 18, 2021 at 4:59 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> The 32b kernel mapping lies in the linear mapping, there is no point in
> printing its address in page table dump, so remove this leftover that
> comes from moving the kernel mapping outside the linear mapping for 64b
> kernel.
>
> Fixes: e9efb21fe352 ("riscv: Prepare ptdump for vm layout dynamic addresses")
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/mm/ptdump.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 0aba4421115c..a4ed4bdbbfde 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -76,8 +76,8 @@ enum address_markers_idx {
>         PAGE_OFFSET_NR,
>  #ifdef CONFIG_64BIT
>         MODULES_MAPPING_NR,
> -#endif
>         KERNEL_MAPPING_NR,
> +#endif
>         END_OF_SPACE_NR
>  };
>
> @@ -99,8 +99,8 @@ static struct addr_marker address_markers[] = {
>         {0, "Linear mapping"},
>  #ifdef CONFIG_64BIT
>         {0, "Modules mapping"},
> -#endif
>         {0, "Kernel mapping (kernel, BPF)"},
> +#endif
>         {-1, NULL},
>  };
>
> @@ -379,8 +379,8 @@ static int ptdump_init(void)
>         address_markers[PAGE_OFFSET_NR].start_address = PAGE_OFFSET;
>  #ifdef CONFIG_64BIT
>         address_markers[MODULES_MAPPING_NR].start_address = MODULES_VADDR;
> -#endif
>         address_markers[KERNEL_MAPPING_NR].start_address = kernel_virt_addr;
> +#endif
>
>         kernel_ptd_info.base_addr = KERN_VIRT_START;
>
> --
> 2.20.1
>

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D56AC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 23 May 2022 11:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbiEWLgV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 May 2022 07:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235000AbiEWLgF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 May 2022 07:36:05 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C35817E06
        for <linux-doc@vger.kernel.org>; Mon, 23 May 2022 04:36:04 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id p139so24823194ybc.11
        for <linux-doc@vger.kernel.org>; Mon, 23 May 2022 04:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tF17KcttwfrZZDuhNmcw5rzOUOKPy8INccyTUEw66VQ=;
        b=amSlBm/uc/xMHBMZc3G7j39TsLKI1Mduqpb+JgZy0P92GFoVgcIgKHcV9DxXns2STY
         IzrD/5Pk6sh4Uadx1BxEr8bPAkJm/5RpJrtNff4Pg9SBILOmyINTXdXodqkv5o97GNxB
         S3PETrQ9J02jk4k2/vmD2aK9olMKidbMm5Ao9OiyvJ7wefP3Pj0CXPO95NDmdLpX7OjB
         Y4E2p65txnMtk2sAfWc8dpEPcPjZSascf0ENyKEwO9+X3K2pDQSfK00dFfOCl8olMJ9/
         yBz5n46I/yL+ecweonrByoEpo7Lhn+qGcWRXfhmlIw9vnbwsaoxnATwJV+K0g+n2iPpn
         qmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tF17KcttwfrZZDuhNmcw5rzOUOKPy8INccyTUEw66VQ=;
        b=VdczMrkcusl7p/R162wPILmll3j1GaJ60nA5tvvYPQ/unG8kThlEPlcFaKMd/lack0
         h5EMJuGZCAjX2ZqJOIsotyayFxLGJOJ7A9SijEOQtJq7tXgehWOURQcNFFij1iy+ZSiD
         kqIU7iybjaWe0G9WzGWAp/P8RcPcAE27qnZwxFxsmw9d4LwXEIlQ6yo/9hawYkoe6Z4d
         AyGO9RhVqgMaIbsL8mZsxuvCNi16Kw2Ggl2wFQR9tDRa/uFVPW46GteGKPFsBMuo0lZ8
         75oquB9scWJFMQdSgL+zb2mbL+0QTx2mS/eBalpzxhqEOuUdazpquuR8NLGCGpuOH8+/
         WC+g==
X-Gm-Message-State: AOAM531B6plZyWwh9BJh9/K2OMrXCWjQcE0POXxA00OG844weFlf6xHg
        SxAIxOesg7a4f0U4YkpzaMB1MwIrS0I9jCP2f+oHzg==
X-Google-Smtp-Source: ABdhPJyyOIi/32W9/VUuNvG6ayr7w/tAhrpWHLlb1gpLQGl3caNR5OwdCDB8+Q1chrDERUA9UfyLPkwE6LXHFg/s+w4=
X-Received: by 2002:a5b:691:0:b0:64d:ab44:f12e with SMTP id
 j17-20020a5b0691000000b0064dab44f12emr21022017ybq.533.1653305763595; Mon, 23
 May 2022 04:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220523113126.171714-1-wangkefeng.wang@huawei.com> <20220523113126.171714-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20220523113126.171714-2-wangkefeng.wang@huawei.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 23 May 2022 13:35:27 +0200
Message-ID: <CANpmjNNPf5J2OcVxoMgVtFYjWJhJ2JE+UBFyqnt6+WrPobPOHQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] asm-generic: Add memory barrier dma_mb()
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, arnd@arndb.de,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 23 May 2022 at 13:21, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> The memory barrier dma_mb() is introduced by commit a76a37777f2c
> ("iommu/arm-smmu-v3: Ensure queue is read after updating prod pointer"),
> which is used to ensure that prior (both reads and writes) accesses
> to memory by a CPU are ordered w.r.t. a subsequent MMIO write.
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de> # for asm-generic
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  Documentation/memory-barriers.txt | 11 ++++++-----
>  include/asm-generic/barrier.h     |  8 ++++++++
>  2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
> index b12df9137e1c..832b5d36e279 100644
> --- a/Documentation/memory-barriers.txt
> +++ b/Documentation/memory-barriers.txt
> @@ -1894,6 +1894,7 @@ There are some more advanced barrier functions:
>
>   (*) dma_wmb();
>   (*) dma_rmb();
> + (*) dma_mb();
>
>       These are for use with consistent memory to guarantee the ordering
>       of writes or reads of shared memory accessible to both the CPU and a
> @@ -1925,11 +1926,11 @@ There are some more advanced barrier functions:
>       The dma_rmb() allows us guarantee the device has released ownership
>       before we read the data from the descriptor, and the dma_wmb() allows
>       us to guarantee the data is written to the descriptor before the device
> -     can see it now has ownership.  Note that, when using writel(), a prior
> -     wmb() is not needed to guarantee that the cache coherent memory writes
> -     have completed before writing to the MMIO region.  The cheaper
> -     writel_relaxed() does not provide this guarantee and must not be used
> -     here.
> +     can see it now has ownership.  The dma_mb() implies both a dma_rmb() and
> +     a dma_wmb().  Note that, when using writel(), a prior wmb() is not needed
> +     to guarantee that the cache coherent memory writes have completed before
> +     writing to the MMIO region.  The cheaper writel_relaxed() does not provide
> +     this guarantee and must not be used here.
>
>       See the subsection "Kernel I/O barrier effects" for more information on
>       relaxed I/O accessors and the Documentation/core-api/dma-api.rst file for
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index fd7e8fbaeef1..961f4d88f9ef 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -38,6 +38,10 @@
>  #define wmb()  do { kcsan_wmb(); __wmb(); } while (0)
>  #endif
>
> +#ifdef __dma_mb
> +#define dma_mb()       do { kcsan_mb(); __dma_mb(); } while (0)
> +#endif
> +
>  #ifdef __dma_rmb
>  #define dma_rmb()      do { kcsan_rmb(); __dma_rmb(); } while (0)
>  #endif
> @@ -65,6 +69,10 @@
>  #define wmb()  mb()
>  #endif
>
> +#ifndef dma_mb
> +#define dma_mb()       mb()
> +#endif
> +
>  #ifndef dma_rmb
>  #define dma_rmb()      rmb()
>  #endif
> --
> 2.35.3
>

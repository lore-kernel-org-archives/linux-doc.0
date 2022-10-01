Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12FEC433FE
	for <linux-doc@archiver.kernel.org>; Sat,  1 Oct 2022 19:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiJATAT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 1 Oct 2022 15:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiJATAQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Oct 2022 15:00:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C3C2D1C1
        for <linux-doc@vger.kernel.org>; Sat,  1 Oct 2022 12:00:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1ECB6B80817
        for <linux-doc@vger.kernel.org>; Sat,  1 Oct 2022 19:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180CDC433D6;
        Sat,  1 Oct 2022 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664650811;
        bh=g4PS4PGQJBvGxQS+muhT3nqQSmiyaQFW9X6VLT0SfSk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LqdQt4CO6xuIv0ntyDctjy7mqYLiWj0Zefm5nOmEcUaaT/fzRksPAKOVL9aZS2iUu
         GA4v38gxcQATJzoDmz/zyby+B1LoV2n1Yhfr17fISUWUK/WA6z3tXIRu4+xSNuDYTt
         87SKJWYGMzcuuxDMovwqr6mkhVGwKAQrfbMhNtBF5EMW8RpAOd35xk8ndUMWTkloV2
         e3kRtJDSpJKBwAWYmM4sB3aEixtxdMIvqtvEUc6oiOqgIYgnGhNZY7f692yCUQhD5s
         zGtXPx+SGvF2JS9REBkQpuC4/xE4rAEx4qXT4e0KLssQ9usTB+ie9tQe6zIn9ZBSx8
         cGbJKgfXMqtVg==
Date:   Sat, 1 Oct 2022 20:00:07 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 0/2] riscv: Support HAVE_ARCH_HUGE_VMAP and
 HAVE_ARCH_HUGE_VMALLOC
Message-ID: <YziON3JMobFOyaqV@spud>
References: <20220915065027.3501044-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915065027.3501044-1-liushixin2@huawei.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 15, 2022 at 02:50:25PM +0800, Liu Shixin wrote:
> Since riscv64 has already support SATP_MODE_57 by default, it is time to
> support more hugepage-related features. These two patches will enable
> HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC.
> 
> Liu Shixin (2):
>   riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
>   riscv: Enable HAVE_ARCH_HUGE_VMALLOC for 64BIT

Hey Liu Shixin,
As I'm sure you saw earlier today LKP randconfig testing of linux-next*
found a problem with your patchset, but looks like it should be
trivially fixable.

Thanks,
Conor.

* I accidentally added it to my dt-for-next branch, from which it is now
dropped.

> 
>  .../features/vm/huge-vmap/arch-support.txt    |  2 +-
>  arch/riscv/Kconfig                            |  2 +
>  arch/riscv/include/asm/vmalloc.h              | 18 ++++
>  arch/riscv/mm/Makefile                        |  1 +
>  arch/riscv/mm/pgtable.c                       | 83 +++++++++++++++++++
>  5 files changed, 105 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/mm/pgtable.c
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

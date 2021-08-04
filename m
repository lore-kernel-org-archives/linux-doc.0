Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B55C4320E
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 11:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD38360FC4
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 11:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236769AbhHDLN3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Aug 2021 07:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236584AbhHDLNZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 07:13:25 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5495EC06179B
        for <linux-doc@vger.kernel.org>; Wed,  4 Aug 2021 04:13:09 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id b138so800312vsd.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Aug 2021 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/dX/3b6FaOpNMT7IFaiEI2CzG67GUq50nJlfaoXU0vc=;
        b=p3UYl4lwRYQ8i6YCOMkHtc48l6wq9BUGMWtu2TO7tzj1xahiMx00Oos7dic6R6BbO+
         4cel/SAZhBaKH+iX3y23G1VudRcqzh7HoW4YrzHmF9QJMC84fC3xrrulPDTSlTD7UJy2
         FYoQf9R/6NS7CatGztyAxD612su759huCsMDs739/b+IJ5I3dW8a2Bvat8+WUXlKf1a9
         vQi8/OePC1Vl+Y9tKEGshTh1lBbL2UpR9yCIJIW3jBQS7GaE5Wlw5oUlXF7DafPq1RGY
         OkG2pKiuExUU2ELE9P/7zjN/yPHJliZ4CtZ8AXP7GuTO43GZUZY2bTr33Cq3u4eOuFvn
         7QWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/dX/3b6FaOpNMT7IFaiEI2CzG67GUq50nJlfaoXU0vc=;
        b=LvbNQYhYpmNa+6pzAMRMDWD6cms1p7Vn2jdOHxnCQJW9kYOv9vSG4HRYVypLnEC9Mi
         0Tpntx/jxNSef4RVl6ZXnNgCshNluafcK+iqIA/xEBP78Bhg93r59ClUNPYrW/+UYRuh
         /etPftO/EhbR6wDoYaXAO5sPGlq0T1a+BlGcG/6hvEm1VNql4om4uwuggM8vu+JbhzXD
         6/cXnFW3WgKZAhwovlUC0TSaX9S94eI45Wn1vF41Xv0f1FE/j/nR2W+M5ymQCB6kVzB0
         P2n4vtvq3hpm2LZNKRJs8N08DFWbp+LKPnC7H1UmhTpQkQLYvjTfOUnMoC2RwyrQsZ0H
         hT9g==
X-Gm-Message-State: AOAM531G3mDd+YYtEPY22vPSmRHb26HKrSnk/ll3xNWvYxcOoDaZZ5dl
        nbLT5tBa4eXncNGPsfwkXtj3nkG3Hrc30RZ0qPgmBg==
X-Google-Smtp-Source: ABdhPJwrTsv+EJti/ieeyYQU1ct+fkSyCA7cqQ3UPyE7N/qRbEbq7Ua3AgaG4AZzN10UYbosHfeOoqJNO5hws8N0JeY=
X-Received: by 2002:a67:f6d8:: with SMTP id v24mr18598001vso.48.1628075588257;
 Wed, 04 Aug 2021 04:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210712060928.4161649-1-hch@lst.de> <20210712060928.4161649-2-hch@lst.de>
In-Reply-To: <20210712060928.4161649-2-hch@lst.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 4 Aug 2021 13:12:31 +0200
Message-ID: <CAPDyKFq2hqPYR-m3+mo7Gwu1421f_faE0jRpK4nJ8CDe=jHsjw@mail.gmail.com>
Subject: Re: [PATCH 1/6] mmc: JZ4740: remove the flush_kernel_dcache_page call
 in jz4740_mmc_read_data
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Alex Shi <alexs@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>, linux-mm@kvack.org,
        Linux Documentation <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 12 Jul 2021 at 08:10, Christoph Hellwig <hch@lst.de> wrote:
>
> MIPS now implements flush_kernel_dcache_page (as an alias to
> flush_dcache_page).
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Apologies for the delay!

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/mmc/host/jz4740_mmc.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
> index 0db17bcc9c16..aa2240c83510 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -578,10 +578,6 @@ static bool jz4740_mmc_read_data(struct jz4740_mmc_host *host,
>                         }
>                 }
>                 data->bytes_xfered += miter->length;
> -
> -               /* This can go away once MIPS implements
> -                * flush_kernel_dcache_page */
> -               flush_dcache_page(miter->page);
>         }
>         sg_miter_stop(miter);
>
> --
> 2.30.2
>

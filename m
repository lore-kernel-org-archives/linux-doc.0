Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EA6C47089
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 04:26:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFFED613D4
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 04:26:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhE0E2J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 00:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhE0E2I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 May 2021 00:28:08 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5295C061574
        for <linux-doc@vger.kernel.org>; Wed, 26 May 2021 21:26:34 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id b13so5283991ybk.4
        for <linux-doc@vger.kernel.org>; Wed, 26 May 2021 21:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IQFbk5t9pZYoRE7n9yxGkSIBN+WDKidUoFj0ElfSfXY=;
        b=XUpZ7T/NIPSf2FsqwGvei07QQ7aOOKY1NHmctinoIZgSW+YVwCjUR6k4X8O4LAA5Vk
         wrzeUIqLd7uYu15A2npqojzy23HH/kjKjGt1NvZO8HJg06cKpEHTI9yDtwZCfDy/LPAc
         SVzxqpeK72WagIHfGDHfS294lNAkq+/xswxNSN4GYtOnlNUTLifmdFEwx6lKn3NutFT+
         tYAXnt1Q6yCxz5wyQwMQRVJeUuqyq3ihyT7x27AgFWmKRGbqPpvffE+LWdntDm7/QcHw
         li2ldbtJiAnET7j1yc+HKF72MJMMBvLVJEu5looohOYqVO5wuvc0dUUEG3VhIELugU8l
         L4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IQFbk5t9pZYoRE7n9yxGkSIBN+WDKidUoFj0ElfSfXY=;
        b=tJYgFEdzR0wb4nLsOtOMQPqTLcCS5sNCYc0np9n8ODb4zMZ05qXxo5/NqbA9q7zp3i
         SqNJTzz68EZJRKnHUzy5twySIsYRAjy2mmw+6ZrGDXMH1Kj0Wr3nUxAynchylwDikXG+
         7y0ILj/jCMgvSjHSn+2lo7CE/u+m8MRun1jtm6WpsVMWDgrO0PxJEMO7vnVAdrGuqe3k
         wQ3lhOhlC8HyuCt4hAIadxyvqjpQQOKJRr6dODDmUJvGu6JDi2aXxh0yn9Gcm4tjuk7q
         9Vc58sbxgsgVaylJhVA0QHSsP9+1kLc/4l2mTY7Y/h79pczWdoU5p7LCRPEJwT0aUB6f
         9L2Q==
X-Gm-Message-State: AOAM533+XLR9xN4FXTz0fNyP8e1j58qmZB2HCtNaBB+RzzQov0dBUQTY
        I2g1HLE9tk6EPVBNcDYu9HTND4ga98Tiwmr6pD1ElOikuT4=
X-Google-Smtp-Source: ABdhPJxH5AYwup1tgSJGCpK8CWoI78BEb41ckMmGju7hx0m9Kkh8odw0pl/Ra9MpE1NLV05hKmBNFdVPadC5TvzF2bc=
X-Received: by 2002:a25:69c7:: with SMTP id e190mr2067749ybc.91.1622089593985;
 Wed, 26 May 2021 21:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210527033937.3762394-1-siyanteng@loongson.cn>
In-Reply-To: <20210527033937.3762394-1-siyanteng@loongson.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 27 May 2021 12:26:23 +0800
Message-ID: <CAMU9jJq1Kfyg5_XaTzhMo7aSrpRkQeMS2-xXi2cjyhZpaP6Vdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/core-api: Fix a typo in cachetlb
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, akpm@linux-foundation.org,
        npiggin@gmail.com, peterz@infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

Sorry, there is only one patch for this set, no [patch 2/2], I will
re-post, please ignore it.>_<


Thanks,
Yanteng

Yanteng Si <siyanteng@loongson.cn> =E4=BA=8E2021=E5=B9=B45=E6=9C=8827=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8812:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Here should be the routine.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/core-api/cachetlb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/cachetlb.rst b/Documentation/core-api=
/cachetlb.rst
> index fe4290e26729..18c4008d5551 100644
> --- a/Documentation/core-api/cachetlb.rst
> +++ b/Documentation/core-api/cachetlb.rst
> @@ -203,7 +203,7 @@ Here are the routines, one by one:
>         the kernel virtual address range PKMAP_ADDR(0) to
>         PKMAP_ADDR(LAST_PKMAP).
>
> -       This routing should be implemented in asm/highmem.h
> +       This routine should be implemented in asm/highmem.h
>
>  6) ``void flush_cache_vmap(unsigned long start, unsigned long end)``
>     ``void flush_cache_vunmap(unsigned long start, unsigned long end)``
> --
> 2.27.0
>

Return-Path: <SRS0=YY78=5S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB37C43331
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 16:16:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3BEBA20737
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 16:16:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nIn3LkoF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389294AbgDBQQU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Apr 2020 12:16:20 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:35100 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389041AbgDBQQU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Apr 2020 12:16:20 -0400
Received: by mail-yb1-f196.google.com with SMTP id x63so2466641ybx.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2020 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mppzuVvkR9E8DAJEitiDTZCZNsDKuCu3MliWH/a1A80=;
        b=nIn3LkoFxsD4WS+G3uhvhkY9FbmqjE6gcWwSvrMe+H4xyUEHRPnqbHU0eIV3h9DdIa
         KY1wgCckbYq2lb3PnW0KIyyjFGpnWptqNkdDO+nhJzqR28XUnPOqeQimb8h4KrUzJGZV
         J0zvywcfs9bmrtsqkUfmlZT4O3Rr2IxMi/qNUaQsMmzM4nDFREVl8MwvGimHnWqHdB+f
         PucCcptam5MZYmJf4b5kzGuiMtgkmxTEJpDewPs8/Ttjj1M34eKBgr2RmcEw3q2Qwsxv
         llFtpk7N3FtlZK92SEc4SinjXYWqUQB348pAq0Ws28vXVAtLZhkyhtcMfz+899t5mVqg
         t1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mppzuVvkR9E8DAJEitiDTZCZNsDKuCu3MliWH/a1A80=;
        b=Xl7B4fjbmpQQwq3cayo7QhSBFGbzErzioYbLkzUtwn0RVAUVOAdzdEn0rKp2Dastjf
         j3E1zE0QboCPPprtmvUmofJKcLyTTLzaT1Yx+v/vh6GRvomJWAcrbT/pctLY5Ks+bNrd
         LJDu+qLqFUX4a8QqFdkwuSUzJGu4szShj5CzlYK+Mf1a/qQcf6+Fc2Kdj5ZjeNBBEFfN
         uIB0yo+6zD2kJgT0/mZVuefl6X3HdhBpfT1BkFSYhKgPkJtpUlx1tIwt2vts9iAMec+o
         V7IW6G0T0anen1q+Oz7lsbkFxgmnitsvtCZhpSAE1IL9uUAVoDzcIfha/9qOtizHKi/l
         qlLQ==
X-Gm-Message-State: AGi0PuYnPDBhMt6NRxisrA6PgMrrihu69WAlp0HazkgIlEsG4Z3Ldusv
        vwbLvHuUPIXORGb22sux8+RNADYUlxEslf0G/kXZaQ==
X-Google-Smtp-Source: APiQypIJl+2gM6C1mF10fYa+oL56osfXsBWaS0dl6cMyWlWNxIy18nhYvZ7TMAeVnFvOQvRR30ZV2yHYVgEaq649fUY=
X-Received: by 2002:a5b:4ce:: with SMTP id u14mr7142006ybp.518.1585844179029;
 Thu, 02 Apr 2020 09:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200401173343.17472-1-willy@infradead.org>
In-Reply-To: <20200401173343.17472-1-willy@infradead.org>
From:   Michel Lespinasse <walken@google.com>
Date:   Thu, 2 Apr 2020 09:16:06 -0700
Message-ID: <CANN689HOeM+XRzXPg3KWF1Fd1cgnY5BP1MTO5kt2MLvKmPw3wg@mail.gmail.com>
Subject: Re: [PATCH] docs: Add rbtree documentation to the core-api
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Looks fine to me :)

Acked-by: Michel Lespinasse <walken@google.com>

On Wed, Apr 1, 2020 at 10:33 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> This file is close enough to being in rst format that I didn't feel
> the need to alter it in any way.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/core-api/index.rst                  | 1 +
>  Documentation/{rbtree.txt => core-api/rbtree.rst} | 0
>  include/linux/rbtree.h                            | 2 +-
>  include/linux/rbtree_augmented.h                  | 2 +-
>  lib/Kconfig                                       | 2 +-
>  tools/include/linux/rbtree.h                      | 2 +-
>  tools/include/linux/rbtree_augmented.h            | 2 +-
>  7 files changed, 6 insertions(+), 5 deletions(-)
>  rename Documentation/{rbtree.txt => core-api/rbtree.rst} (100%)
>
> diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
> index 0897ad12c119..9499a4c47f4a 100644
> --- a/Documentation/core-api/index.rst
> +++ b/Documentation/core-api/index.rst
> @@ -34,6 +34,7 @@ Library functionality that is used throughout the kernel.
>     xarray
>     idr
>     circular-buffers
> +   rbtree
>     generic-radix-tree
>     packing
>     timekeeping
> diff --git a/Documentation/rbtree.txt b/Documentation/core-api/rbtree.rst
> similarity index 100%
> rename from Documentation/rbtree.txt
> rename to Documentation/core-api/rbtree.rst
> diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
> index 1fd61a9af45c..d7db17996322 100644
> --- a/include/linux/rbtree.h
> +++ b/include/linux/rbtree.h
> @@ -11,7 +11,7 @@
>    I know it's not the cleaner way,  but in C (not in C++) to get
>    performances and genericity...
>
> -  See Documentation/rbtree.txt for documentation and samples.
> +  See Documentation/core-api/rbtree.rst for documentation and samples.
>  */
>
>  #ifndef        _LINUX_RBTREE_H
> diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmented.h
> index 724b0d036b57..d1c53e9d8c75 100644
> --- a/include/linux/rbtree_augmented.h
> +++ b/include/linux/rbtree_augmented.h
> @@ -21,7 +21,7 @@
>   * rb_insert_augmented() and rb_erase_augmented() are intended to be public.
>   * The rest are implementation details you are not expected to depend on.
>   *
> - * See Documentation/rbtree.txt for documentation and samples.
> + * See Documentation/core-api/rbtree.rst for documentation and samples.
>   */
>
>  struct rb_augment_callbacks {
> diff --git a/lib/Kconfig b/lib/Kconfig
> index bc7e56370129..8653a8ab3c68 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -427,7 +427,7 @@ config INTERVAL_TREE
>
>           See:
>
> -               Documentation/rbtree.txt
> +               Documentation/core-api/rbtree.rst
>
>           for more information.
>
> diff --git a/tools/include/linux/rbtree.h b/tools/include/linux/rbtree.h
> index e03b1ea23e0e..30dd21f976c3 100644
> --- a/tools/include/linux/rbtree.h
> +++ b/tools/include/linux/rbtree.h
> @@ -11,7 +11,7 @@
>    I know it's not the cleaner way,  but in C (not in C++) to get
>    performances and genericity...
>
> -  See Documentation/rbtree.txt for documentation and samples.
> +  See Documentation/core-api/rbtree.rst for documentation and samples.
>  */
>
>  #ifndef __TOOLS_LINUX_PERF_RBTREE_H
> diff --git a/tools/include/linux/rbtree_augmented.h b/tools/include/linux/rbtree_augmented.h
> index 381aa948610d..570bb9794421 100644
> --- a/tools/include/linux/rbtree_augmented.h
> +++ b/tools/include/linux/rbtree_augmented.h
> @@ -23,7 +23,7 @@
>   * rb_insert_augmented() and rb_erase_augmented() are intended to be public.
>   * The rest are implementation details you are not expected to depend on.
>   *
> - * See Documentation/rbtree.txt for documentation and samples.
> + * See Documentation/core-api/rbtree.rst for documentation and samples.
>   */
>
>  struct rb_augment_callbacks {
> --
> 2.25.1
>


-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.

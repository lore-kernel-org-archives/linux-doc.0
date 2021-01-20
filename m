Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22AEC43381
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 20:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E46D23442
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 20:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389928AbhATOGP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 09:06:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390101AbhATNk2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 08:40:28 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F109C061757
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:39:48 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id h11so6979165ioh.11
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=FM37ipdlLykh82wOaMeonjfMEHwci4vUHpTC97P767A=;
        b=rOWwKG0ZAiK1X30AudSIn50Xfyklr+HXuFqGhgcR7QyAU2YMos1q33iV3Gmobqti7f
         t6JF6Z6yxq38b3JJUyQCpA/5DFtJ8OLar05WxCI/v229aZO+pwBPksLWH/rwyqhPskPx
         pZxkmXcSWZFlL/Zb3VPJxMTNNGhhbdfmiP6WCJbg59bpp1FjgSNnem6X/ZpQxBH/0/7m
         WetdLltV8lKJ6sdhuyaiv0EP0ZQ2zuvmQ8Cros/i9O+efQrCTE15lO5Ttm6xD8PvNsOx
         HVTq31Yur71rzgSIA7Fihj/oDjkKmCbLOk9MuePvSpMnOsAfrNvE3tt5NXdx3cUVRl6f
         DfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=FM37ipdlLykh82wOaMeonjfMEHwci4vUHpTC97P767A=;
        b=tC/i5vU3oJktLxYi8EBAuhhIZ05jIB6xU/iFC3Iya7g8HUkpF1sNcJs2/UF72LZY5e
         87KSuGSyeD5xqH53itJAAh4K9cbGfsvr6eJPaKe0y/GoP4FlewoCGxmb/QglWjpqRiYv
         qwnMApy+eWB3o/OMV8079ZnGbImdA+qThqNfwKT8lXOORNdIFg/eED15P7Dp4Wl3poxW
         3Om/zB0r0GpaY0ftvHb6+bkyM4paCzPr7vX3enLSjmivblJ2qq+t+gH0izIHWloUg618
         +e6veKer7nnuJxW7H6O7krvj87cSl70VUC+2kyjRBf2qOsCpFJxC5Amvpi+CDMvvN0uC
         kOCQ==
X-Gm-Message-State: AOAM533yZ6hI77Dr3mP2lEujKW+fVG3zsnJ9W0tLqG19Zgt7g5R3Vgkm
        P0SAQ+XldW7PTMtEm7E0mF98HH3NfyA9yJrBinDv3bfCKOVhYoopDgU=
X-Received: by 2002:a92:cccd:: with SMTP id u13mt8060866ilq.273.1611149987592;
 Wed, 20 Jan 2021 05:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20210120130233.15932-1-ericcurtin17@gmail.com>
In-Reply-To: <20210120130233.15932-1-ericcurtin17@gmail.com>
From:   Eric Curtin <ericcurtin17@gmail.com>
Date:   Wed, 20 Jan 2021 13:39:36 +0000
Message-ID: <CANpvso7mbc9C=xjxLDivb6Qm8_FDu2fLjA-StMw4Z-209PHLqw@mail.gmail.com>
Subject: Re: [PATCH] Increase limit of max_user_watches from 1/25 to 1/16
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:FILESYSTEMS (VFS and infrastructure)" 
        <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 20 Jan 2021 at 13:02, Eric Curtin <ericcurtin17@gmail.com> wrote:
>
> The current default value for  max_user_watches  is the 1/16 (6.25%) of
> the available low memory, divided for the "watch" cost in bytes.
>
> Tools like inotify-tools and visual studio code, seem to hit these
> limits a little to easy.
>
> Also amending the documentation, it referred to an old value for this.
>
> Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/fs.rst | 4 ++--
>  fs/eventpoll.c                          | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-guide/sysctl/fs.rst
> index f48277a0a850..f7fe45e69c41 100644
> --- a/Documentation/admin-guide/sysctl/fs.rst
> +++ b/Documentation/admin-guide/sysctl/fs.rst
> @@ -380,5 +380,5 @@ This configuration option sets the maximum number of "watches" that are
>  allowed for each user.
>  Each "watch" costs roughly 90 bytes on a 32bit kernel, and roughly 160 bytes
>  on a 64bit one.
> -The current default value for  max_user_watches  is the 1/32 of the available
> -low memory, divided for the "watch" cost in bytes.
> +The current default value for  max_user_watches  is the 1/16 (6.25%) of the
> +available low memory, divided for the "watch" cost in bytes.
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index a829af074eb5..de9ef8f6d0b2 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -2352,9 +2352,9 @@ static int __init eventpoll_init(void)
>
>         si_meminfo(&si);
>         /*
> -        * Allows top 4% of lomem to be allocated for epoll watches (per user).
> +        * Allows top 6.25% of lomem to be allocated for epoll watches (per user).
>          */
> -       max_user_watches = (((si.totalram - si.totalhigh) / 25) << PAGE_SHIFT) /
> +       max_user_watches = (((si.totalram - si.totalhigh) / 16) << PAGE_SHIFT) /
>                 EP_ITEM_COST;
>         BUG_ON(max_user_watches < 0);
>
> --
> 2.25.1
>

Please ignore this, this is the wrong limit (an epoll one), I sent
another patch just
to update the documentation to be correct. Weiman Long already kindly solved the
issue in 92890123749bafc317bbfacbe0a62ce08d78efb7

Separate patch is titled "[PATCH] Update
Documentation/admin-guide/sysctl/fs.rst"

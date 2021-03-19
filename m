Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A318BC433E0
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 02:24:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 643D564F18
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 02:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhCSCYQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 22:24:16 -0400
Received: from mail.parknet.co.jp ([210.171.160.6]:50168 "EHLO
        mail.parknet.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhCSCYH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Mar 2021 22:24:07 -0400
X-Greylist: delayed 407 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Mar 2021 22:24:07 EDT
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
        by mail.parknet.co.jp (Postfix) with ESMTPSA id 205F615F925;
        Fri, 19 Mar 2021 11:17:20 +0900 (JST)
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
        by ibmpc.myhome.or.jp (8.15.2/8.15.2/Debian-21) with ESMTPS id 12J2HIMp008059
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Fri, 19 Mar 2021 11:17:19 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
        by devron.myhome.or.jp (8.15.2/8.15.2/Debian-21) with ESMTPS id 12J2HIjx035198
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Fri, 19 Mar 2021 11:17:18 +0900
Received: (from hirofumi@localhost)
        by devron.myhome.or.jp (8.15.2/8.15.2/Submit) id 12J2HHGl035195;
        Fri, 19 Mar 2021 11:17:17 +0900
From:   OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] docs: filesystems: Fix a mundane typo
References: <20210319015848.19515-1-unixbhaskar@gmail.com>
Date:   Fri, 19 Mar 2021 11:17:17 +0900
In-Reply-To: <20210319015848.19515-1-unixbhaskar@gmail.com> (Bhaskar
        Chowdhury's message of "Fri, 19 Mar 2021 07:28:48 +0530")
Message-ID: <87r1kb6g5u.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:

> s/provisoned/provisioned/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Looks good.

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

> ---
>  Documentation/filesystems/vfat.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/vfat.rst b/Documentation/filesystems/vfat.rst
> index e85d74e91295..760a4d83fdf9 100644
> --- a/Documentation/filesystems/vfat.rst
> +++ b/Documentation/filesystems/vfat.rst
> @@ -189,7 +189,7 @@ VFAT MOUNT OPTIONS
>  **discard**
>  	If set, issues discard/TRIM commands to the block
>  	device when blocks are freed. This is useful for SSD devices
> -	and sparse/thinly-provisoned LUNs.
> +	and sparse/thinly-provisioned LUNs.
>
>  **nfs=stale_rw|nostale_ro**
>  	Enable this only if you want to export the FAT filesystem
> --
> 2.26.2
>

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

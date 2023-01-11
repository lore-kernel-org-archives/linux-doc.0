Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DB4C46467
	for <linux-doc@archiver.kernel.org>; Wed, 11 Jan 2023 08:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjAKIqe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Jan 2023 03:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbjAKIqc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jan 2023 03:46:32 -0500
Received: from out30-43.freemail.mail.aliyun.com (out30-43.freemail.mail.aliyun.com [115.124.30.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64810DF1F
        for <linux-doc@vger.kernel.org>; Wed, 11 Jan 2023 00:46:31 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VZMeQcA_1673426783;
Received: from 30.97.48.254(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VZMeQcA_1673426783)
          by smtp.aliyun-inc.com;
          Wed, 11 Jan 2023 16:46:24 +0800
Message-ID: <a7e50038-9054-d31f-2c3e-88ab3b74ed42@linux.alibaba.com>
Date:   Wed, 11 Jan 2023 16:46:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] erofs: add documentation for 'domain_id' mount option
To:     Jingbo Xu <jefflexu@linux.alibaba.com>, xiang@kernel.org,
        chao@kernel.org, linux-erofs@lists.ozlabs.org
Cc:     huyue2@coolpad.com, zhujia.zj@bytedance.com,
        linux-doc@vger.kernel.org
References: <20230111081547.126322-1-jefflexu@linux.alibaba.com>
 <20230111081547.126322-2-jefflexu@linux.alibaba.com>
From:   Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20230111081547.126322-2-jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2023/1/11 16:15, Jingbo Xu wrote:
> The share domain feature for fscache mode has been merged, and let's add
> documentation for 'domain_id' mount option.
Since the EROFS share domain feature for fscache mode has been available
since Linux v6.1, let's add documentation for 'domain_id' mount option.

Cc: linux-doc@vger.kernel.org

> 
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> ---
>   Documentation/filesystems/erofs.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
> index 067fd1670b1f..958cad2c4997 100644
> --- a/Documentation/filesystems/erofs.rst
> +++ b/Documentation/filesystems/erofs.rst
> @@ -120,6 +120,9 @@ dax={always,never}     Use direct access (no page cache).  See
>   dax                    A legacy option which is an alias for ``dax=always``.
>   device=%s              Specify a path to an extra device to be used together.
>   fsid=%s                Specify a filesystem image ID for Fscache back-end.
> +domain_id=%s           Specify a domain ID for Fscache back-end.  The blob
> +                       images are shared among filesystem instances in the same
> +                       domain.

domain_id=%s           Specify a domain ID in fscache mode so that different images
                        with the same blobs under a given domain ID can share storage.

Thanks,
Gao Xiang

>   ===================    =========================================================
>   
>   Sysfs Entries

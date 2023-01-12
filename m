Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504CEC54EBC
	for <linux-doc@archiver.kernel.org>; Thu, 12 Jan 2023 06:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjALG4P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Jan 2023 01:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjALG4O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 01:56:14 -0500
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEDFA440
        for <linux-doc@vger.kernel.org>; Wed, 11 Jan 2023 22:56:11 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R701e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VZQ6pQ5_1673506559;
Received: from 30.221.131.229(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0VZQ6pQ5_1673506559)
          by smtp.aliyun-inc.com;
          Thu, 12 Jan 2023 14:56:08 +0800
Message-ID: <d2c6aca7-b2ed-1df6-c97a-246256fd0e18@linux.alibaba.com>
Date:   Thu, 12 Jan 2023 14:55:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/2] erofs: add documentation for 'domain_id' mount
 option
From:   Jingbo Xu <jefflexu@linux.alibaba.com>
To:     xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org
Cc:     huyue2@coolpad.com, linux-doc@vger.kernel.org
References: <20230112065431.124926-1-jefflexu@linux.alibaba.com>
 <20230112065431.124926-2-jefflexu@linux.alibaba.com>
Content-Language: en-US
In-Reply-To: <20230112065431.124926-2-jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

cc: linux-doc@vger.kernel.org

On 1/12/23 2:54 PM, Jingbo Xu wrote:
> Since the EROFS share domain feature for fscache mode has been available
> since Linux v6.1, let's add documentation for 'domain_id' mount option.
> 
> Cc: linux-doc@vger.kernel.org
> Reviewed-by: Jia Zhu <zhujia.zj@bytedance.com>
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> ---
>  Documentation/filesystems/erofs.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
> index 067fd1670b1f..a43aacf1494e 100644
> --- a/Documentation/filesystems/erofs.rst
> +++ b/Documentation/filesystems/erofs.rst
> @@ -120,6 +120,8 @@ dax={always,never}     Use direct access (no page cache).  See
>  dax                    A legacy option which is an alias for ``dax=always``.
>  device=%s              Specify a path to an extra device to be used together.
>  fsid=%s                Specify a filesystem image ID for Fscache back-end.
> +domain_id=%s           Specify a domain ID in fscache mode so that different images
> +                       with the same blobs under a given domain ID can share storage.
>  ===================    =========================================================
>  
>  Sysfs Entries

-- 
Thanks,
Jingbo

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD034C4332F
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:07:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiLIHHs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLIHHr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:07:47 -0500
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7566E0B4
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:07:42 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:07:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670569660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yksenYM2OTfa9ESlMcrfth0ByHCwoi/nIS1dMkZtt9g=;
        b=HXXRFCMNKW11isgeBQs79sweC8AG5nw96d+IGAlol3G6mr78qtgF9Xm8XwuMlwznpsWZXP
        TdCRG9by4NlzxZ4VEaR5wrRsZmtHIY/XCzoG6PYamMLUpr6RamVrM4DVJ+bI/1OI1ncvJS
        Xij2RwdiQpyQBAeLoQhZAZMTLXl4ZPA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 09/13] docs/zh_CN: Update the translation of start to
 6.1-rc8
Message-ID: <Y5LetKIZEF0TUsOf@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <a357bd0a1e042b3ac11351de0bc5272b1681d151.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a357bd0a1e042b3ac11351de0bc5272b1681d151.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit 04cc7e4bf7c4 ("Docs/admin-guide/mm/damon/start:
> mention the dependency as sysfs instead of debugfs")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../zh_CN/admin-guide/mm/damon/start.rst             | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
> index 67d1b49481dc..bf21ff84f396 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
> @@ -34,16 +34,8 @@
>  https://github.com/awslabs/damo找到。下面的例子假设DAMO在你的$PATH上。当然，但
>  这并不是强制性的。
>  
> -因为DAMO使用的是DAMON的debugfs接口(详情请参考 :doc:`usage` 中的使用方法) 你应该
> -确保debugfs被挂载。手动挂载它，如下所示::
> -
> -    # mount -t debugfs none /sys/kernel/debug/
> -
> -或者在你的 ``/etc/fstab`` 文件中添加以下一行，这样你的系统就可以在启动时自动挂载
> -debugfs了::
> -
> -    debugfs /sys/kernel/debug debugfs defaults 0 0
> -
> +因为DAMO使用了DAMON的sysfs接口（详情请参考:doc:`usage`），你应该确保
> +:doc:`sysfs </filesystems/sysfs>` 被挂载。
>  
>  记录数据访问模式
>  ================
> -- 
> 2.31.1
> 
> 
> 

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E90C4332F
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiLIHGV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLIHGU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:06:20 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED7B38A9
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:06:19 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:06:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670569577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PodjcVProh+QBQ6/nIbgZPK8nmpxFIDzOvlUCAWsLAY=;
        b=f2jbOnAnytLYKLhxtVcWXdsErRGdWtXhCH/uednHEcgvzTGwwj4K1B+I7xFarxvcUvJSdv
        V+5u6RBhlXWVHc0p9VIT/hqHcCZC+5z9IB+oXabugYuFydPBSEIPb/jlQmJuGtS8Y9YEsa
        BU+zE4QmGlFVzmpKm3ZbkW9vKgUy4Bc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 08/13] docs/zh_CN: Update the translation of reclaim
 to 6.1-rc8
Message-ID: <Y5LeW0Op8ox+NQ1y@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <7cedb22f4c6a1201cb07421d7d21e9f1d0045a2e.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cedb22f4c6a1201cb07421d7d21e9f1d0045a2e.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit 205498012513 ("Docs/admin-guide/damon/reclaim:
> remove a paragraph that been obsolete due to online tuning support")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/admin-guide/mm/damon/reclaim.rst       | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
> index c976f3e33ffd..bb185b7a9b9c 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
> @@ -47,10 +47,6 @@ DAMON_RECLAIM找到在特定时间内没有被访问的内存区域并分页。
>  是说，你可以把 ``damon_reclaim.<parameter>=<value>`` 放在内核启动命令行上，或者把
>  适当的值写入 ``/sys/modules/damon_reclaim/parameters/<parameter>`` 文件。
>  
> -注意，除 ``启用`` 外的参数值只在DAMON_RECLAIM启动时应用。因此，如果你想在运行时应用新
> -的参数值，而DAMON_RECLAIM已经被启用，你应该通过 ``启用`` 的参数文件禁用和重新启用它。
> -在重新启用之前，应将新的参数值写入适当的参数值中。
> -
>  下面是每个参数的描述。
>  
>  enabled
> -- 
> 2.31.1
> 
> 
> 

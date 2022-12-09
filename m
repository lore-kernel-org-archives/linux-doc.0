Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B984FC4332F
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiLIHFs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbiLIHF1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:05:27 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95D931379
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:05:25 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:05:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670569524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tNAc1EnFpLD/flXiyyH6AkafagOkNgFhtp+BRwNcSeE=;
        b=kSc1Kv3DTvV1xxq/1Un5cFYbKEGHJQX09yDXiOuW/dYLo/VsFyEvw2JxCjTrk+7g3WaJD7
        fe3tvBG8bK3x+HXwAWcGjRspn+EZ+K8ekUSVkrCpdZIOu/Yz+vexFVES6XkSZRKkd74i/6
        OdtG/ni/d/Ym7jMPTw+FGJ8iaeobRJo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 07/13] docs/zh_CN: Update the translation of
 testing-overview to 6.1-rc8
Message-ID: <Y5LeLgzv4O6cn83+@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <8a99b6f6ac2bbc834aad551b464a3d4a27d82630.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a99b6f6ac2bbc834aad551b464a3d4a27d82630.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit a32d5c0fc12b ("Documentation: dev-tools:
> Enhance static analysis section with discussion")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/dev-tools/testing-overview.rst      | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> index d6f2c65ed511..d53a326de93a 100644
> --- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> @@ -132,3 +132,30 @@ Documentation/dev-tools/kcov.rst 是能够构建在内核之中，用于在每
>  
>   不过要注意的是，静态分析工具存在**假阳性**的问题。在试图修复错误和警
>   告之前，需要仔细评估它们。
> +
> +何时使用Sparse和Smatch
> +----------------------
> +
> +Sparse做类型检查，例如验证注释的变量不会导致无符号的错误，检测
> +``__user`` 指针使用不当的地方，以及分析符号初始化器的兼容性。
> +
> +Smatch进行流程分析，如果允许建立函数数据库，它还会进行跨函数分析。
> +Smatch试图回答一些问题，比如这个缓冲区是在哪里分配的？它有多大？这
> +个索引可以由用户控制吗？这个变量比那个变量大吗？
> +
> +一般来说，在Smatch中写检查比在Sparse中写检查要容易。尽管如此，
> +Sparse和Smatch的检查还是有一些重叠的地方。
> +
> +Smatch和Coccinelle的强项
> +------------------------
> +
> +Coccinelle可能是最容易写检查的。它在预处理器之前工作，所以用Coccinelle
> +检查宏中的错误更容易。Coccinelle还能为你创建补丁，这是其他工具无法做到的。
> +
> +例如，用Coccinelle你可以从kmalloc(x * size, GFP_KERNEL)到

``kmalloc(x * size, GFP_KERNEL)``

> +``kmalloc_array(x, size, GFP_KERNEL)`` 进行大规模转换，这真的很有用。
> +如果你只是创建一个Smatch警告，并试图把转换的工作推给维护者，他们会很恼火。
> +你将不得不为每个警告争论是否真的可以溢出。
> +
> +Coccinelle不对变量值进行分析，而这正是Smatch的强项。另一方面，Coccinelle
> +允许你用简单的方法做简单的事情。
> -- 
> 2.31.1
> 

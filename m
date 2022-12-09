Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C38BC4332F
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:33:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbiLIHda (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:33:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiLIHd3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:33:29 -0500
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E071DC8
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:33:27 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:33:17 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670571205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uXNhJUscAPq1D12p+3sVD9Tu1iKj+0+ViZwLVi5aHLA=;
        b=S7Lyb0XwGGqLFaUjgbx+e+b7tqdPeYDIsgWV0RDG/foNrxQzMqiLgnLQpjzBzxlY73YeU5
        kPwdpNiTA01eveviQ0n4bNHo+GxKi5kN01jEj/lkQzTGJkNzDz7GKQFVMI90yiRPe5bNzz
        4BGrxcs1JkQQrrI3aF6bX9pcCBToEB4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 06/13] docs/zh_CN: Update the translation of kasan to
 6.1-rc8
Message-ID: <Y5LkvRULM6N7EILs@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <bbb8e1702cb9739f43bf872428c130e90cfaf3b4.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbb8e1702cb9739f43bf872428c130e90cfaf3b4.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit cd36d84d2571 ("kasan: allow sampling
> page_alloc allocations for HW_TAGS")
> 
> Commit 80b92bfe3bb7 ("kasan: dynamically allocate
> stack ring entries")
> Commit 7ebfce331251 ("kasan: support kasan.stacktrace
> for SW_TAGS")
> Commit ca89f2a2e66d ("kasan: move boot parameters
> section in documentation")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/dev-tools/kasan.rst    | 77 +++++++++++--------
>  1 file changed, 44 insertions(+), 33 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> index fe76cbe77ad6..c645b1b6cc53 100644
> --- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> @@ -90,6 +90,50 @@ KASAN只支持SLUB。
>  ``CONFIG_STACKTRACE`` 。要包括受影响物理页面的分配和释放堆栈跟踪的话，
>  请启用 ``CONFIG_PAGE_OWNER`` 并使用 ``page_owner=on`` 进行引导。
>  
> +启动参数
> +~~~~~~~~
> +
> +KASAN受到通用 ``panic_on_warn`` 命令行参数的影响。当它被启用时，KASAN
> +在打印出错误报告后会使内核恐慌。
> +
> +默认情况下，KASAN只对第一个无效的内存访问打印错误报告。使用
> +``kasan_multi_shot``，KASAN对每一个无效的访问都打印一份报告。这有效地

有效地 => 会

> +禁用了KASAN报告的 ``panic_on_warn``。
> +
> +另外，独立于 ``panic_on_warn`` 、 ``kasan.fault=`` boot参数可以用
> +来控制恐慌和报告行为。
> +
> +- ``kasan.fault=report`` 或 ``=panic`` 控制是否只打印KASAN报告或
> +  同时使内核恐慌（默认： ``报告`` ）。即使 ``kasan_multi_shot`` 被

报告 => report

> +  启用，恐慌也会发生。
> +
> +基于软件和硬件标签的KASAN模式（见下面关于各种模式的部分）支持改变堆栈跟
> +踪收集行为：
> +
> +- ``kasan.stacktrace=off`` 或 ``=on`` 禁用或启用分配和释放堆栈痕
> +  迹的收集（默认： ``on`` ）。
> +
> +- ``kasan.stack_ring_size=<number of entries>`` 指定堆栈环的条
> +  目数（默认： ``32768`` ）。
> +
> +基于硬件标签的KASAN模式是为了在生产中作为一种安全缓解措施使用。因此，它
> +支持额外的启动参数，允许完全禁用KASAN或控制其功能。
> +
> +- ``kasan=off`` 或 ``=on`` 控制KASAN是否被启用（默认： ``on`` ）。
> +
> +- ``kasan.mode=sync``, ``=async`` or ``=asymm`` 控制KASAN是否
> +  被配置为同步、异步或非对称的执行模式（默认： ``同步`` ）。
> +  同步模式：当标签检查异常发生时，会立即检测到不良访问。
> +  异步模式：不良访问的检测是延迟的。当标签检查异常发生时，信息被存储在硬
> +  件中（对于arm64来说是在TFSR_EL1寄存器中）。内核周期性地检查硬件，并\
> +  且只在这些检查中报告标签异常。
> +  非对称模式：读取时同步检测不良访问，写入时异步检测。
> +
> +- ``kasan.vmalloc=off`` or ``=on`` 禁用或启用vmalloc分配的标记（默认： ``on`` ）。
> +
> +- ``kasan.page_alloc.sample=<sampling frequency>`` 使得KASAN
> +  只对每N次page_alloc分配进行标记，其中N是参数的值（默认值： ``1`` ）。

Remove previous paragraph.

> +
>  错误报告
>  ~~~~~~~~
>  
> @@ -194,39 +238,6 @@ slab对象的描述以及关于访问的内存页的信息。
>  通用KASAN还报告两个辅助调用堆栈跟踪。这些堆栈跟踪指向代码中与对象交互但不直接
>  出现在错误访问堆栈跟踪中的位置。目前，这包括 call_rcu() 和排队的工作队列。
>  
> -启动参数
> -~~~~~~~~
> -
> -KASAN受通用 ``panic_on_warn`` 命令行参数的影响。启用该功能后，KASAN在打印错误
> -报告后会引起内核恐慌。
> -
> -默认情况下，KASAN只为第一次无效内存访问打印错误报告。使用 ``kasan_multi_shot`` ，
> -KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告的 ``panic_on_warn`` 。
> -
> -另外，独立于 ``panic_on_warn`` , ``kasan.fault=`` 引导参数可以用来控制恐慌和报
> -告行为:
> -
> -- ``kasan.fault=report`` 或 ``=panic`` 控制是只打印KASAN报告还是同时使内核恐慌
> -  (默认: ``report`` )。即使启用了 ``kasan_multi_shot`` ，也会发生内核恐慌。
> -
> -基于硬件标签的KASAN模式（请参阅下面有关各种模式的部分）旨在在生产中用作安全缓解
> -措施。因此，它支持允许禁用KASAN或控制其功能的附加引导参数。
> -
> -- ``kasan=off`` 或 ``=on`` 控制KASAN是否启用 (默认: ``on`` )。
> -
> -- ``kasan.mode=sync`` 、 ``=async`` 或 ``=asymm`` 控制KASAN是否配置
> -  为同步或异步执行模式(默认:``sync`` )。
> -  同步模式：当标签检查错误发生时，立即检测到错误访问。
> -  异步模式：延迟错误访问检测。当标签检查错误发生时，信息存储在硬件中（在arm64的
> -  TFSR_EL1寄存器中）。内核会定期检查硬件，并且仅在这些检查期间报告标签错误。
> -  非对称模式：读取时同步检测不良访问，写入时异步检测。
> -
> -- ``kasan.vmalloc=off`` 或 ``=on`` 禁用或启用vmalloc分配的标记（默认：``on`` ）。
> -
> -- ``kasan.stacktrace=off`` 或 ``=on`` 禁用或启用alloc和free堆栈跟踪收集
> -  (默认: ``on`` )。
> -
> -
>  实施细则
>  --------
>  
> -- 
> 2.31.1
>

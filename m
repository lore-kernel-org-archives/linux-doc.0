Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072E0C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 17 Oct 2022 16:36:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiJQQgX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Oct 2022 12:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiJQQgV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 12:36:21 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92D2642EE
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 09:36:19 -0700 (PDT)
Date:   Tue, 18 Oct 2022 00:36:02 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666024577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RCUmxApn/UbMYJTFPf0HxJChrmYlRgLkamk4cTybaiQ=;
        b=qDoBZZ3+Zou61wUPLutCyEvQMHeBLQZhzXsbNsMYFic5P6jA0E6wCLq6Q8Z7rcdIhrjp4i
        Kb15/QF+JSM+4oNeTjvqIXwCLW6hwiYzy5xTFunXJKVozkHnZxG95RcXfIidEdDpZKP3md
        DTS4G1yM7li6nDWizYZ3KTG+4ICHvJE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH 2/3] docs/zh_CN: core-api: Add timekeeping Chinese
 translation
Message-ID: <Y02EcgD3E0/lML5H@bobwxc.mipc>
References: <cover.1665130536.git.zhoubinbin@loongson.cn>
 <d52639f0fb22ae941137d5c478cd021799182b5f.1665130536.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d52639f0fb22ae941137d5c478cd021799182b5f.1665130536.git.zhoubinbin@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Translate core-api/timekeeping.rst into Chinese.
> 
> Last English version used:
> 
> commit 3dc6ffae2da2 ("timekeeping: Introduce fast accessor to clock tai").
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../zh_CN/core-api/timekeeping.rst            | 172 ++++++++++++++++++
>  2 files changed, 173 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 21d0b25bc580..d08091036066 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -49,12 +49,12 @@
>     generic-radix-tree
>     packing
>     this_cpu_ops
> +   timekeeping
>  
>  Todolist:
>  
>  
>  
> -   timekeeping
>     errseq
>  
>  并发原语
> diff --git a/Documentation/translations/zh_CN/core-api/timekeeping.rst b/Documentation/translations/zh_CN/core-api/timekeeping.rst
> new file mode 100644
> index 000000000000..e7f9adf2525c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/timekeeping.rst
> @@ -0,0 +1,172 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/timekeeping.rst
> +
> +:翻译:
> +
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +ktime访问器
> +===========
> +
> +设备驱动程序可以使用ktime_get()和linux/timekeeping.h中声明的许多相关函数读取当前
> +时间。根据经验，如果两者都同样适合特定用例，则使用名称较短的访问器优于名称较长的
> +访问器。

如果两个访问器都适用于某一用例，则使用名称较短的那个。

> +
> +基于ktime_t的基础接口
> +---------------------
> +
> +推荐的最简单形式返回不透明的ktime_t，其变体返回不同时钟参考的时间：
> +
> +.. c:function:: ktime_t ktime_get( void )
> +
> +	CLOCK_MONOTONIC
 ^
 tab

> +
> +        对可靠的时间戳和准确测量短的时间间隔很有用。在系统启动时启动，但在挂起时
> +        停止。
 ^^^^^^^^
 spaces
 check all of them

> +
> +.. c:function:: ktime_t ktime_get_boottime( void )
> +
> +	CLOCK_BOOTTIME
> +
> +        与ktime_get()类似，但在挂起时不会停止。这可以用于例如需要在挂起操作中与其
> +        他计算机同步的密钥过期时间。
> +
> +.. c:function:: ktime_t ktime_get_real( void )
> +
> +	CLOCK_REALTIME
> +
> +        使用协调世界时(UTC)返回相对于1970年开始的UNIX纪元的时间，与用户空间的
> +        gettimeofday()相同。该函数用于所有需要在重启时持续存在的时间戳，比如
> +        inode时间，但应避免在内部使用，因为它可能由于闰秒更新和来自用户空间的NTP
> +        调整settimeofday()操作而向后跳转。
> +
> +.. c:function:: ktime_t ktime_get_clocktai( void )
> +
> +	 CLOCK_TAI
> +
> +        与ktime_get_real()类似，但使用国际原子时(TAI)作为参考而不是UTC，以避免在
> +        闰秒更新时跳转。这在内核中很少有用。
> +
> +.. c:function:: ktime_t ktime_get_raw( void )
> +
> +	CLOCK_MONOTONIC_RAW
> +
> +        与ktime_get()类似，但以与硬件时钟源相同的速率运行，无需针对时钟漂移进行调
> +        整(NTP)。这在内核中也很少需要。

没有针对时钟漂移进行的调整(NTP)。

> +
> +纳秒，timespec64和秒钟的输出
> +----------------------------
> +
> +对于上述所有情况，以下函数变体会根据用户的要求以不同的格式返回时间：
> +
> +.. c:function:: u64 ktime_get_ns( void )
> +		u64 ktime_get_boottime_ns( void )
> +		u64 ktime_get_real_ns( void )
> +		u64 ktime_get_clocktai_ns( void )
> +		u64 ktime_get_raw_ns( void )
> +
> +        与普通的ktime_get函数相同，但返回各自时钟参考中的u64纳秒数，这对某些调用
> +        者来说可能更方便。
> +
> +.. c:function:: void ktime_get_ts64( struct timespec64 * )
> +		void ktime_get_boottime_ts64( struct timespec64 * )
> +		void ktime_get_real_ts64( struct timespec64 * )
> +		void ktime_get_clocktai_ts64( struct timespec64 * )
> +		void ktime_get_raw_ts64( struct timespec64 * )
> +
> +        同上，但返回的是'struct timespec64'中的时间，分为秒和纳秒。这可以避免在打
> +        印时间时，或在将其传递到期望有'timespec'或'timeval'结构的外部接口时，进行

结构 -> 结构体

Thanks,
	Wu

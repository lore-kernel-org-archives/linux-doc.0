Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E53CC4332F
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiLIHEr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbiLIHET (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:04:19 -0500
Received: from out-30.mta0.migadu.com (out-30.mta0.migadu.com [IPv6:2001:41d0:1004:224b::1e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317AD1E3E1
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:03:17 -0800 (PST)
Date:   Fri, 9 Dec 2022 14:55:48 +0800
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 01/13] docs/zh_CN: Update the translation of
 delay-accounting to 6.1-rc8
Message-ID: <Y5Lb9JKt35KvjBhR@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <c8e34775309a85114a49b3f291e960d13332d9ce.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8e34775309a85114a49b3f291e960d13332d9ce.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit f347c9d2697f ("filemap: make the accounting
> of thrashing more consistent").
> 
> Commit 662ce1dc9caf ("delayacct: track delays from write-protect copy").
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/accounting/delay-accounting.rst     | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/accounting/delay-accounting.rst b/Documentation/translations/zh_CN/accounting/delay-accounting.rst
> index f1849411018e..71a3c1f2b07a 100644
> --- a/Documentation/translations/zh_CN/accounting/delay-accounting.rst
> +++ b/Documentation/translations/zh_CN/accounting/delay-accounting.rst
> @@ -17,8 +17,9 @@ a) 等待一个CPU（任务为可运行）
>  b) 完成由该任务发起的块I/O同步请求
>  c) 页面交换
>  d) 内存回收
> -e) 页缓存抖动
> +e) 抖动
>  f) 直接规整
> +g) 写保护复制
>  
>  并将这些统计信息通过taskstats接口提供给用户空间。
>  
> @@ -42,7 +43,7 @@ f) 直接规整
>       include/uapi/linux/taskstats.h
>  
>  其描述了延时计数相关字段。系统通常以计数器形式返回 CPU、同步块 I/O、交换、内存
> -回收、页缓存抖动、直接规整等的累积延时。
> +回收、页缓存抖动、直接规整、写保护复制等的累积延时。
>  
>  取任务某计数器两个连续读数的差值，将得到任务在该时间间隔内等待对应资源的总延时。
>  
> @@ -100,6 +101,8 @@ getdelays命令的一般格式::
>  	                    0              0              0ms
>  	COMPACT         count    delay total  delay average
>  	                    0              0              0ms
> +    WPCOPY          count    delay total  delay average
^^^^^^
a Tab

> +	                    0              0              0ms
>  
>  获取pid为1的IO计数，它只和-p一起使用::
>  	# ./getdelays -i -p 1
> -- 
> 2.31.1
> 
> 
> 

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3649DC4332F
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiLIHKJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiLIHKI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:10:08 -0500
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BFAD3207E
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:10:07 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:09:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670569806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Vl7Jrex+ZS9x544IAVtxnpwDExyL+IhtcIRVAL+KV8=;
        b=nDgoYJ4/Tor0ubaS0xownGXk4n+0h95+Gu42vh0C+PVIsnHTKH1XlJ/cZePUyF5od3mim8
        d4l92wWJAjiU0nUr039eh/F9r2hPbCkATB2E+FsHKeUuwyukMleo1NeANqLyco8Q1LQS/F
        Q2wuaoV4FY28zbQ+L+cafB3aXeSNsvk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 11/13] docs/zh_CN: Update the translation of ksm to
 6.1-rc8
Message-ID: <Y5LfP5oGiSCpYYP8@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <ebb3d10b22f0b11305a819ad03e6a0a531ec6678.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebb3d10b22f0b11305a819ad03e6a0a531ec6678.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit 21b7bdb504ae ("ksm: add profit monitoring
> documentation")
> 
> commit 94bfe85bde18 ("mm/vmstat: add events for ksm cow")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/admin-guide/mm/ksm.rst | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
> index 4829156ef1ae..e27806aa90dc 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
> @@ -146,3 +146,53 @@ stable_node_dups
>  
>  比值 ``pages_sharing/pages_shared`` 的最大值受限制于 ``max_page_sharing``
>  的设定。要想增加该比值，则相应地要增加 ``max_page_sharing`` 的值。
> +
> +监测KSM的好处

好处 => 收益

> +=============
> +
> +KSM可以通过合并相同的页面来节省内存，但也会消耗额外的内存，因为它需要生成一些rmap_items
> +来保存每个扫描页面的简要rmap信息。其中有些页面可能会被合并，但有些页面在被检查几次
> +后可能无法被合并，这些都是无益的内存消耗。
> +
> +1) 如何确定KSM在全系统范围内是节省内存还是消耗内存？这里有一个简单的近似计算方法供参考::
> +
> +       general_profit =~ pages_sharing * sizeof(page) - (all_rmap_items) *
> +                         sizeof(rmap_item);
> +
> +   其中all_rmap_items可以通过对 ``pages_sharing`` 、 ``pages_shared`` 、 ``pages_unshared``
> +   和 ``pages_volatile`` 的求和而轻松获得。
> +
> +2) KSM的好处在一个单一的进程中也可以通过以下近似的计算得到::

单一进程中KSM的收益

> +
> +       process_profit =~ ksm_merging_pages * sizeof(page) -
> +                         ksm_rmap_items * sizeof(rmap_item).
> +
> +   其中ksm_merging_pages显示在 ``/proc/<pid>/`` 目录下，而ksm_rmap_items
> +   显示在 ``/proc/<pid>/ksm_stat`` 。
> +
> +从应用的角度来看， ``ksm_rmap_items`` 和 ``ksm_merging_pages`` 的高比例意
> +味着不好的madvise-applied策略，所以开发者或管理员必须重新考虑如何改变madvis策
> +略。举个例子供参考，一个页面的大小通常是4K，而rmap_item的大小在32位CPU架构上分
> +别是32B，在64位CPU架构上是64B。所以如果 ``ksm_rmap_items/ksm_merging_pages``
> +的比例在64位CPU上超过64，或者在32位CPU上超过128，那么应用程序的madvise策略应
> +该被放弃，因为ksm好处大约为零或负值。

好处 => 收益

> +
> +监控KSM事件
> +===========
> +
> +在/proc/vmstat中有一些计数器，可以用来监控KSM事件。KSM可能有助于节省内存，这是
> +一种权衡，因为它可能会在KSM COW或复制中的交换上遭受延迟。这些事件可以帮助用户评估
> +是否或如何使用KSM。例如，如果cow_ksm增加得太快，用户可以减少madvise(, , MADV_MERGEABLE)
> +的范围。
> +
> +cow_ksm
> +        在每次KSM页面触发写时拷贝（COW）时都会被递增，当用户试图写到KSM页面时，

写到 => 写入

> +        我们必须做一个拷贝。
> +
> +ksm_swpin_copy
> +        在换入时，每次KSM页被复制时都会被递增。请注意，KSM页在换入时可能会被复
> +        制，因为do_swap_page()不能做所有的锁，而需要重组一个跨anon_vma的KSM页。
> +
> +--
> +Izik Eidus,
> +Hugh Dickins, 2009年11月17日。
> -- 
> 2.31.1
> 

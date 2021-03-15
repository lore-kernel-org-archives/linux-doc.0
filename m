Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7C5C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 03:33:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE57764DD8
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 03:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhCODcV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 14 Mar 2021 23:32:21 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:54841 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229704AbhCODcG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 14 Mar 2021 23:32:06 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0URu2tPr_1615779123;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0URu2tPr_1615779123)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 15 Mar 2021 11:32:04 +0800
Subject: Re: [PATCH] docs: zh_CN: arm64 : memory : convert to rst and add into
 index
To:     brandon.jiang.a@outlook.com, harryxiyou@gmail.com, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, catalin.marinas@arm.com, wefu@redhat.com
References: <MWHPR22MB0894F1A30CA37246B083A949AC6E9@MWHPR22MB0894.namprd22.prod.outlook.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <b9130865-34c7-76d0-9efc-968567bf1e05@linux.alibaba.com>
Date:   Mon, 15 Mar 2021 11:32:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <MWHPR22MB0894F1A30CA37246B083A949AC6E9@MWHPR22MB0894.namprd22.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

CC Catalin & Fu Wei,

It's a old doc, Maybe something worth to update for new arm64/kvm?

Thanks
Alex

在 2021/3/13 下午2:32, brandon.jiang.a@outlook.com 写道:
> From: Brandon Jiang <brandon.jiang.a@outlook.com>
> 
> convet the old arm64 memory doc into rst format and add it into index
> 
> Signed-off-by: Brandon Jiang <brandon.jiang.a@outlook.com>
> ---
>  Documentation/translations/zh_CN/arm64/index.rst  |   1 +
>  Documentation/translations/zh_CN/arm64/memory.rst |  98 +++++++++++++++++++
>  Documentation/translations/zh_CN/arm64/memory.txt | 114 ----------------------
>  3 files changed, 99 insertions(+), 114 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/arm64/memory.rst
>  delete mode 100644 Documentation/translations/zh_CN/arm64/memory.txt
> 
> diff --git a/Documentation/translations/zh_CN/arm64/index.rst b/Documentation/translations/zh_CN/arm64/index.rst
> index 57dc5de..299ab3c 100644
> --- a/Documentation/translations/zh_CN/arm64/index.rst
> +++ b/Documentation/translations/zh_CN/arm64/index.rst
> @@ -17,3 +17,4 @@ ARM64 架构
>      hugetlbpage
>      perf
>      elf_hwcaps
> +    memory
> diff --git a/Documentation/translations/zh_CN/arm64/memory.rst b/Documentation/translations/zh_CN/arm64/memory.rst
> new file mode 100644
> index 0000000..4fa0db6
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/arm64/memory.rst
> @@ -0,0 +1,98 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :ref:`Documentation/arm64/memory.rst <amu_index>`
> +
> +Translator: 傅炜  Fu Wei <wefu@redhat.com>
> +
> +本文翻译提交时的 Git 检出点为： bc465aa9d045feb0e13b4a8f32cc33c1943f62d6
> +
> +
> +==================================
> +Linux 在 AArch64 中的内存布局
> +==================================
> +
> +作者: Catalin Marinas <catalin.marinas@arm.com>
> +
> +本文档描述 AArch64 Linux 内核所使用的虚拟内存布局。此构架可以实现
> +页大小为 4KB 的 4 级转换表和页大小为 64KB 的 3 级转换表。
> +
> +AArch64 Linux 使用 3 级或 4 级转换表，其页大小配置为 4KB，对于用户和内核
> +分别都有 39-bit (512GB) 或 48-bit (256TB) 的虚拟地址空间。
> +对于页大小为 64KB的配置，仅使用 2 级转换表，有 42-bit (4TB) 的虚拟地址空间，但内存布局相同。
> +
> +用户地址空间的 63:48 位为 0，而内核地址空间的相应位为 1。TTBRx 的
> +选择由虚拟地址的 63 位给出。swapper_pg_dir 仅包含内核（全局）映射，
> +而用户 pgd 仅包含用户（非全局）映射。swapper_pg_dir 地址被写入
> +TTBR1 中，且从不写入 TTBR0。
> +
> +
> +AArch64 Linux 在页大小为 4KB，并使用 3 级转换表时的内存布局：
> +
> +起始地址			结束地址			大小		用途
> +-----------------------------------------------------------------------
> +0000000000000000	0000007fffffffff	 512GB		用户空间
> +ffffff8000000000	ffffffffffffffff	 512GB		内核空间
> +
> +
> +AArch64 Linux 在页大小为 4KB，并使用 4 级转换表时的内存布局：
> +
> +起始地址			结束地址			大小		用途
> +-----------------------------------------------------------------------
> +0000000000000000	0000ffffffffffff	 256TB		用户空间
> +ffff000000000000	ffffffffffffffff	 256TB		内核空间
> +
> +
> +AArch64 Linux 在页大小为 64KB，并使用 2 级转换表时的内存布局：
> +
> +起始地址			结束地址			大小		用途
> +-----------------------------------------------------------------------
> +0000000000000000	000003ffffffffff	   4TB		用户空间
> +fffffc0000000000	ffffffffffffffff	   4TB		内核空间
> +
> +
> +AArch64 Linux 在页大小为 64KB，并使用 3 级转换表时的内存布局：
> +
> +起始地址			结束地址			大小		用途
> +-----------------------------------------------------------------------
> +0000000000000000	0000ffffffffffff	 256TB		用户空间
> +ffff000000000000	ffffffffffffffff	 256TB		内核空间
> +
> +
> +更详细的内核虚拟内存布局，请参阅内核启动信息。
> +
> +
> +4KB 页大小的转换表查找：
> +
> ++--------+--------+--------+--------+--------+--------+--------+--------+
> +|63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
> ++--------+--------+--------+--------+--------+--------+--------+--------+
> + |                 |         |         |         |         |
> + |                 |         |         |         |         v
> + |                 |         |         |         |   [11:0]  页内偏移
> + |                 |         |         |         +-> [20:12] L3 索引
> + |                 |         |         +-----------> [29:21] L2 索引
> + |                 |         +---------------------> [38:30] L1 索引
> + |                 +-------------------------------> [47:39] L0 索引
> + +-------------------------------------------------> [63] TTBR0/1
> +
> +
> +64KB 页大小的转换表查找：
> +
> ++--------+--------+--------+--------+--------+--------+--------+--------+
> +|63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
> ++--------+--------+--------+--------+--------+--------+--------+--------+
> + |                 |    |               |              |
> + |                 |    |               |              v
> + |                 |    |               |            [15:0]  页内偏移
> + |                 |    |               +----------> [28:16] L3 索引
> + |                 |    +--------------------------> [41:29] L2 索引
> + |                 +-------------------------------> [47:42] L1 索引
> + +-------------------------------------------------> [63] TTBR0/1
> +
> +
> +当使用 KVM 时, 管理程序（hypervisor）在 EL2 中通过相对内核虚拟地址的
> +一个固定偏移来映射内核页（内核虚拟地址的高 24 位设为零）:
> +
> +起始地址			结束地址			大小		用途
> +-----------------------------------------------------------------------
> +0000004000000000	0000007fffffffff	 256GB		在 HYP 中映射的内核对象
> diff --git a/Documentation/translations/zh_CN/arm64/memory.txt b/Documentation/translations/zh_CN/arm64/memory.txt
> deleted file mode 100644
> index be20f82..0000000
> --- a/Documentation/translations/zh_CN/arm64/memory.txt
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -Chinese translated version of Documentation/arm64/memory.rst
> -
> -If you have any comment or update to the content, please contact the
> -original document maintainer directly.  However, if you have a problem
> -communicating in English you can also ask the Chinese maintainer for
> -help.  Contact the Chinese maintainer if this translation is outdated
> -or if there is a problem with the translation.
> -
> -Maintainer: Catalin Marinas <catalin.marinas@arm.com>
> -Chinese maintainer: Fu Wei <wefu@redhat.com>
> ----------------------------------------------------------------------
> -Documentation/arm64/memory.rst 的中文翻译
> -
> -如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
> -交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
> -译存在问题，请联系中文版维护者。
> -
> -本文翻译提交时的 Git 检出点为： bc465aa9d045feb0e13b4a8f32cc33c1943f62d6
> -
> -英文版维护者： Catalin Marinas <catalin.marinas@arm.com>
> -中文版维护者： 傅炜  Fu Wei <wefu@redhat.com>
> -中文版翻译者： 傅炜  Fu Wei <wefu@redhat.com>
> -中文版校译者： 傅炜  Fu Wei <wefu@redhat.com>
> -
> -以下为正文
> ----------------------------------------------------------------------
> -		     Linux 在 AArch64 中的内存布局
> -		     ===========================
> -
> -作者: Catalin Marinas <catalin.marinas@arm.com>
> -
> -本文档描述 AArch64 Linux 内核所使用的虚拟内存布局。此构架可以实现
> -页大小为 4KB 的 4 级转换表和页大小为 64KB 的 3 级转换表。
> -
> -AArch64 Linux 使用 3 级或 4 级转换表，其页大小配置为 4KB，对于用户和内核
> -分别都有 39-bit (512GB) 或 48-bit (256TB) 的虚拟地址空间。
> -对于页大小为 64KB的配置，仅使用 2 级转换表，有 42-bit (4TB) 的虚拟地址空间，但内存布局相同。
> -
> -用户地址空间的 63:48 位为 0，而内核地址空间的相应位为 1。TTBRx 的
> -选择由虚拟地址的 63 位给出。swapper_pg_dir 仅包含内核（全局）映射，
> -而用户 pgd 仅包含用户（非全局）映射。swapper_pg_dir 地址被写入
> -TTBR1 中，且从不写入 TTBR0。
> -
> -
> -AArch64 Linux 在页大小为 4KB，并使用 3 级转换表时的内存布局：
> -
> -起始地址			结束地址			大小		用途
> ------------------------------------------------------------------------
> -0000000000000000	0000007fffffffff	 512GB		用户空间
> -ffffff8000000000	ffffffffffffffff	 512GB		内核空间
> -
> -
> -AArch64 Linux 在页大小为 4KB，并使用 4 级转换表时的内存布局：
> -
> -起始地址			结束地址			大小		用途
> ------------------------------------------------------------------------
> -0000000000000000	0000ffffffffffff	 256TB		用户空间
> -ffff000000000000	ffffffffffffffff	 256TB		内核空间
> -
> -
> -AArch64 Linux 在页大小为 64KB，并使用 2 级转换表时的内存布局：
> -
> -起始地址			结束地址			大小		用途
> ------------------------------------------------------------------------
> -0000000000000000	000003ffffffffff	   4TB		用户空间
> -fffffc0000000000	ffffffffffffffff	   4TB		内核空间
> -
> -
> -AArch64 Linux 在页大小为 64KB，并使用 3 级转换表时的内存布局：
> -
> -起始地址			结束地址			大小		用途
> ------------------------------------------------------------------------
> -0000000000000000	0000ffffffffffff	 256TB		用户空间
> -ffff000000000000	ffffffffffffffff	 256TB		内核空间
> -
> -
> -更详细的内核虚拟内存布局，请参阅内核启动信息。
> -
> -
> -4KB 页大小的转换表查找：
> -
> -+--------+--------+--------+--------+--------+--------+--------+--------+
> -|63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
> -+--------+--------+--------+--------+--------+--------+--------+--------+
> - |                 |         |         |         |         |
> - |                 |         |         |         |         v
> - |                 |         |         |         |   [11:0]  页内偏移
> - |                 |         |         |         +-> [20:12] L3 索引
> - |                 |         |         +-----------> [29:21] L2 索引
> - |                 |         +---------------------> [38:30] L1 索引
> - |                 +-------------------------------> [47:39] L0 索引
> - +-------------------------------------------------> [63] TTBR0/1
> -
> -
> -64KB 页大小的转换表查找：
> -
> -+--------+--------+--------+--------+--------+--------+--------+--------+
> -|63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
> -+--------+--------+--------+--------+--------+--------+--------+--------+
> - |                 |    |               |              |
> - |                 |    |               |              v
> - |                 |    |               |            [15:0]  页内偏移
> - |                 |    |               +----------> [28:16] L3 索引
> - |                 |    +--------------------------> [41:29] L2 索引
> - |                 +-------------------------------> [47:42] L1 索引
> - +-------------------------------------------------> [63] TTBR0/1
> -
> -
> -当使用 KVM 时, 管理程序（hypervisor）在 EL2 中通过相对内核虚拟地址的
> -一个固定偏移来映射内核页（内核虚拟地址的高 24 位设为零）:
> -
> -起始地址			结束地址			大小		用途
> ------------------------------------------------------------------------
> -0000004000000000	0000007fffffffff	 256GB		在 HYP 中映射的内核对象
> 

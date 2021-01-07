Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2124C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 14:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6291208A9
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 14:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbhAGOVx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Jan 2021 09:21:53 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:44446 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728925AbhAGOVw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jan 2021 09:21:52 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UL-rxaq_1610029262;
Received: from IT-FVFX43SYHV2H.lan(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UL-rxaq_1610029262)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 07 Jan 2021 22:21:04 +0800
Subject: Re: [PATCH v3] doc/zh_CN: add mips booting.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>
References: <20210107125043.3873317-1-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <a97a21db-bc8f-662b-f699-67755c7226e7@linux.alibaba.com>
Date:   Thu, 7 Jan 2021 22:20:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210107125043.3873317-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2021/1/7 下午8:50, Yanteng Si 写道:
> This patch translates Documentation/mips/booting.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/mips/booting.rst       | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/mips/booting.rst
> 
> diff --git a/Documentation/translations/zh_CN/mips/booting.rst b/Documentation/translations/zh_CN/mips/booting.rst
> new file mode 100644
> index 000000000000..3099d0fff7a6
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/mips/booting.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :ref:`Documentation/mips/booting.rst <booting>`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_booting:
> +
> +BMIPS设备树引导
> +------------------------
> +
> +  一些bootloaders只支持在内核镜像开始地址处的单一入口点。而其它
> +  bootloaders将跳转到ELF的开始地址处。两种方案都支持的；因为
> +  CONFIG_BOOT_RAW=y and CONFIG_NO_EXCEPT_FILL=y, 所以第一条指令
> +  会立即跳转到kernel_entry()入口处执行。
> +
> +  与arch/arm情况(b)类似，dt感知的引导加载程序需要设置以下寄存器:
> +
> +         a0 : 0
> +
> +         a1 : 0xffffffff
> +
> +         a2 : RAM中指向设备树块的物理指针(在chapterII中定义)。
> +              设备树可以位于前512MB物理地址空间(0x00000000 -
> +              0x1fffffff)的任何位置，以64位边界对齐。
> +
> +  传统bootloaders不会使用这样的约定，并且它们不传入DT块。
> +  在这种情况下，Linux将通过选中CONFIG_DT_*查找DTB。
> +
> +  以上约定只在32位系统中定义，因为目前没有任何64位的BMIPS实现。
> 

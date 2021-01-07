Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0DDC433E6
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 03:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 118AE23123
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 03:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbhAGDZQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jan 2021 22:25:16 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:33251 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725803AbhAGDZQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jan 2021 22:25:16 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UKyF.h4_1609989872;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UKyF.h4_1609989872)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 07 Jan 2021 11:24:33 +0800
Subject: Re: [PATCH v2 2/2] docs/zh_CN: add Chinese booting file
To:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>
References: <20210107022337.1791010-1-siyanteng@loongson.cn>
 <20210107022337.1791010-2-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <45db18b6-f471-4f9d-5ffe-9ab7ee45469e@linux.alibaba.com>
Date:   Thu, 7 Jan 2021 11:24:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210107022337.1791010-2-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/1/7 上午10:23, Yanteng Si 写道:
> This is the Chinese version of booting file


Uh, I guess more clear and detailed commit log and subject will help
user understand your changes.

like this:

subject: doc/zh_CN: add mips booting.rst translation

This patch translates Documentation/mips/booting.rst into Chinese.


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

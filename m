Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1CEC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 03:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77C2A64E77
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 03:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbhBXDmp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Feb 2021 22:42:45 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:37877 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233252AbhBXDmo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Feb 2021 22:42:44 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UPPdMyg_1614138120;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UPPdMyg_1614138120)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Feb 2021 11:42:00 +0800
Subject: Re: [PATCH v2 3/5] docs/zh_CN: add riscv patch-acceptance.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210224031149.15179-1-siyanteng@loongson.cn>
 <20210224031149.15179-4-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <4bbb0e30-9719-bd88-69fa-08a9ac768d19@linux.alibaba.com>
Date:   Wed, 24 Feb 2021 11:41:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210224031149.15179-4-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2021/2/24 上午11:11, Yanteng Si 写道:
> This patch translates Documentation/riscv/patch-acceptance.rst into Chineae.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/riscv/patch-acceptance.rst          | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/riscv/patch-acceptance.rst
> 
> diff --git a/Documentation/translations/zh_CN/riscv/patch-acceptance.rst b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
> new file mode 100644
> index 000000000000..75446871559f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../riscv/patch-acceptance`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_riscv_patch-acceptance:
> +
> +
> +arch/riscv 开发者维护指南
> +=========================
> +
> +概述
> +----
> +RISC-V指令集体系结构是公开开发的：
> +正在进行的草案可供所有人查看和测试实现。新模块或者扩展草案可能会在开发过程中发
> +生更改---有时以不兼容的方式对以前的草案进行更改。这种灵活性可能会给RISC-V Linux
> +维护者带来挑战。Linux开发过程更喜欢经过良好检查和测试的代码，而不是试验代码。我
> +们希望推广同样的规则到即将被内核合并的RISC-V相关代码。
> +
> +提交补遗清单
> +-------------------------
> +如果RISC-V基金会将这些模块或扩展的规范列为“冻结”或“已批准”，则我们仅接受新模块
> +或扩展的补丁。 （爱好者当然可以维护自己的Linux内核树，其中包含所需代码扩展草案
> +的代码。）
> +
> +此外，RISC-V规范允许爱好者创建自己的自定义扩展。这些自定义拓展不需要通过RISC-V
> +基金会的任何审核或批准。为了避免将爱好者一些特别的RISC-V拓展添加进内核代码带来
> +的维护复杂性和对性能的潜在影响，我们将只接受RISC-V基金会正式冻结或批准的的扩展
> +补丁。（爱好者当然可以维护自己的Linux内核树，其中包含他们想要的任何自定义扩展
> +的代码。）
> 

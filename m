Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F579C433DB
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 03:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15DBF230F9
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 03:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbhAGDUy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jan 2021 22:20:54 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:41804 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725803AbhAGDUy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jan 2021 22:20:54 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UKxiurl_1609989610;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UKxiurl_1609989610)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 07 Jan 2021 11:20:10 +0800
Subject: Re: [PATCH v2 1/2] docs/zh_CN: add Chinese index file
To:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>
References: <20210107022337.1791010-1-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <7d8fa581-ac34-921f-a53f-53678b727ac6@linux.alibaba.com>
Date:   Thu, 7 Jan 2021 11:20:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210107022337.1791010-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I didn't apply/build with the patch, with the contents,

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2021/1/7 上午10:23, Yanteng Si 写道:
> This is the Chinese version of index file
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/mips/index.rst         | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/mips/index.rst
> 
> diff --git a/Documentation/translations/zh_CN/mips/index.rst b/Documentation/translations/zh_CN/mips/index.rst
> new file mode 100644
> index 000000000000..2c7b836a3da5
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/mips/index.rst
> @@ -0,0 +1,29 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :ref:`Documentation/mips/index.rst <index>`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_index:
> +
> +
> +===========================
> +MIPS特性文档
> +===========================
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :numbered:
> +
> +   booting
> +   ingenic-tcu
> +
> +   features
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> 

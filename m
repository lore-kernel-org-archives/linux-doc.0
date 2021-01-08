Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3DDC433DB
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 02:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D57792343B
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 02:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbhAHCA1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Jan 2021 21:00:27 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:5345 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726477AbhAHCA1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jan 2021 21:00:27 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UL1N17s_1610071173;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UL1N17s_1610071173)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 08 Jan 2021 09:59:34 +0800
Subject: Re: [PATCH v3] doc/zh_CN: add mips index.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>
References: <20210108012738.4040056-1-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <9e0f27cb-780c-9b20-2ccb-7de2d2c9e3f8@linux.alibaba.com>
Date:   Fri, 8 Jan 2021 09:59:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210108012738.4040056-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2021/1/8 上午9:27, Yanteng Si 写道:
> This patch translates Documentation/mips/index.rst into Chinese.
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

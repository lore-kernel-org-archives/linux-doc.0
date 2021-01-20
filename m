Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0298C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 03:04:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 987AD23109
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 03:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389548AbhATDEX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 22:04:23 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:52397 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388263AbhATDEO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 22:04:14 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R601e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UMI0Xb1_1611111761;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UMI0Xb1_1611111761)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 20 Jan 2021 11:02:43 +0800
Subject: Re: [PATCH 2/3] doc/zh_CN: add mips ep93xx_adc.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210119074617.3109276-1-siyanteng@loongson.cn>
 <20210119074617.3109276-2-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <0d47bd3e-e208-0ac6-aa31-75e5029b35d6@linux.alibaba.com>
Date:   Wed, 20 Jan 2021 11:02:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210119074617.3109276-2-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/1/19 下午3:46, Yanteng Si 写道:
> This patch translates Documentation/iio/ep93xx_adc.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/iio/ep93xx_adc.rst     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/iio/ep93xx_adc.rst
> 
> diff --git a/Documentation/translations/zh_CN/iio/ep93xx_adc.rst b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
> new file mode 100644
> index 000000000000..727a48d09090
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
> @@ -0,0 +1,46 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../iio/ep93xx_adc`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_ep93xx_adc:
> +
> +
> +======================================
> +Cirrus Logic EP93xx 模拟数字转换器驱动
> +======================================
> +
> +1. 概述
> +=======
> +
> +该驱动同时适用于具有5通道模拟数字转换器的低端 (EP9301, Ep9302) 设备和10通道
> +触摸屏/模拟数字转换器的高端 (EP9307, EP9312, EP9315)设备。
> +
> +2. 通道编号
> +===========
> +
> +EP9301和EP9302数据表定义了通道0..4的编号方案。虽然EP9307, EP9312和EP9315多
> +了3个通道（一共8个），但是编号并没有定义。所以说最后三个通道是随机编号的。
> +
> +假设ep93xx_adc是IIO设备0，您将在以下位置找到以下条目
> +/sys/bus/iio/devices/iio:device0/:
> +
> +  +-----------------+---------------+
> +  | sysfs entry     | ball/pin name |

better translate 'entry' and 'name' here?

Thanks

> +  +=================+===============+
> +  | in_voltage0_raw | YM            |
> +  +-----------------+---------------+
> +  | in_voltage1_raw | SXP           |
> +  +-----------------+---------------+
> +  | in_voltage2_raw | SXM           |
> +  +-----------------+---------------+
> +  | in_voltage3_raw | SYP           |
> +  +-----------------+---------------+
> +  | in_voltage4_raw | SYM           |
> +  +-----------------+---------------+
> +  | in_voltage5_raw | XP            |
> +  +-----------------+---------------+
> +  | in_voltage6_raw | XM            |
> +  +-----------------+---------------+
> +  | in_voltage7_raw | YP            |
> +  +-----------------+---------------+
> 

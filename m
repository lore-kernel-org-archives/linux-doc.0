Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9484EC433FE
	for <linux-doc@archiver.kernel.org>; Wed, 16 Nov 2022 10:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbiKPKFB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Nov 2022 05:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbiKPKFA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 05:05:00 -0500
Received: from mail-sz.amlogic.com (mail-sz.amlogic.com [211.162.65.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43A98F;
        Wed, 16 Nov 2022 02:04:03 -0800 (PST)
Received: from [10.88.19.158] (10.88.19.158) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 16 Nov 2022
 17:48:57 +0800
Message-ID: <ccc924e6-8626-c95a-1be8-c2280fa06f3a@amlogic.com>
Date:   Wed, 16 Nov 2022 17:49:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v10 1/2] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        John Garry <john.garry@huawei.com>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Chris Healy <cphealy@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Kelvin Zhang <kelvin.zhang@amlogic.com>,
        Chris Healy <healych@amzon.com>
References: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
 <Y3SjuC6xHn1uz2zX@debian.me>
From:   Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <Y3SjuC6xHn1uz2zX@debian.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.88.19.158]
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> What about this description below?
>
> ```
> Add support for Amlogic Meson G12 Series SOC - DDR bandwidth PMU driver
> framework and interfaces. The PMU can not only monitor the total DDR
> bandwidth, but also individual IP module bandwidth.
> ```
Thanks, Your description looks like much better. I agree with you.
>> Example usage:
>>
>>   $ perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
>>
>> - or -
>>
>>   $ perf stat -a -e \
>>     meson_ddr_bw/total_rw_bytes/,\
>>     meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 \
>>     sleep 10
>>
>> g12 SoC support 4 channels to monitor DDR bandwidth
>> simultaneously. Each channel can monitor up to 4 IP modules
>> simultaneously.
>>
>> For Instance, If you want to get the sum of DDR bandwidth
>> from CPU, GPU, USB3.0 and VDEC. You can use the following
>> command parameters to display.
>>
>>   $ perf stat -a -e \
>>     meson_ddr_bw/chan_2_rw_bytes,arm=1,gpu=1,usb3_0=1,nna=1/ -I 1000 \
>>     sleep 10
>>
>> Other events are supported, and advertised via perf list.
> The demo example should have been outside the patch description, though
> (more appropriate documentation as in patch [2/2]).
>
> Thanks.
Okay, I will modify it in the next version.

-- 
Thanks,
Jiucheng


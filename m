Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99719C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 16 Nov 2022 09:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233420AbiKPJMK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Nov 2022 04:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbiKPJMJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 04:12:09 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C492B2
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 01:12:07 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id i186-20020a1c3bc3000000b003cfe29a5733so1099451wma.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 01:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AFKNffFtY5kVNiVAk/P0FpVr/0HH1RSFq3GyOsjl5tQ=;
        b=h9qTz0llQJKd8Wu07bgW3+OinYebUJT1kws3CflBy0DNuJf4Rya9Cpt1UAtMK89Amb
         Q+ClwmcMcnNa2lQPccb1DN/6HvGO/QBoTlrzx/ZRZB7x8luevj5fbpwfcKgNW1FkqsJC
         Id+p0MSsktBYab/asVWJRalJpmiXUiZfTmAVvtHIldmoMqJV9+yI9x3O/K9XJ8RTvUND
         nxMcu/HDMnQmEGu7WEnnNtxi3KCzwIoZc2IokOLO9Uvr9yVzlyvwlD295oLAiDZjBzWz
         3DYzeOGpfFCKGYT7RQooACVRgsnCizqPDC8DXfb9VkDw1JCE1ECjQPgRPdSurY2NtURj
         Mmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFKNffFtY5kVNiVAk/P0FpVr/0HH1RSFq3GyOsjl5tQ=;
        b=PvM7qU61KfdxIehoCSrLPstdH0/YD55w9lc5ohYiAlKjCMGjvwkOSkOKQeodI/NCKH
         bBuaxxAvr7M+vV8iqSmgjE2huw5XkjUujPRoubiAyVvnHhLabLOXr2Y8J3anSxWN/ikL
         wwNkcN9Do+Y9872GPCMG2R/FF1sBLy1wyGZYFXA5WpNxXJC4Fvh+yWDJMDkukkDKu6vM
         HfJ3FUFfpI4vbm3h+6b6KN4B9E93gbxhybXRvXy/OqyzeOWPrh6xyUMpS5bIFMLFXK17
         jgpAfl+Hpzm1JAcuyR4uek7JyYruj+qHj9dp0c8uvx9vFRhpEygILHuLtBvND0cyfh3I
         Vrqg==
X-Gm-Message-State: ANoB5plZ+c3BswOqqHefDorJR+2oGtKNYJTl4WqWHArSwj8fRN78iAvP
        k9/dDKiDy+GFZnkygxp+BHAmEQ==
X-Google-Smtp-Source: AA0mqf5t46DwNbPq/deiJj7VX2YDZydyiPZU7UHc+HERaqziYQW+JqmhZ7bXP+3FVESs9hZnwo+K8w==
X-Received: by 2002:a05:600c:5116:b0:3cf:8d52:a216 with SMTP id o22-20020a05600c511600b003cf8d52a216mr1436895wms.77.1668589926468;
        Wed, 16 Nov 2022 01:12:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2a03:71a6:7a9d:9c71? ([2a01:e0a:982:cbb0:2a03:71a6:7a9d:9c71])
        by smtp.gmail.com with ESMTPSA id bv13-20020a0560001f0d00b0022cce7689d3sm11683820wrb.36.2022.11.16.01.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:12:06 -0800 (PST)
Message-ID: <c2d96d4d-eb0b-afaf-3a44-23e48de4d40c@linaro.org>
Date:   Wed, 16 Nov 2022 10:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v10 1/2] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Content-Language: en-US
To:     Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
Organization: Linaro Developer Services
In-Reply-To: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16/11/2022 01:31, Jiucheng Xu wrote:
> This patch adds support Amlogic meson G12 series SoC
> DDR bandwidth PMU driver framework and interfaces.
> 
> The PMU not only can monitor the total DDR bandwidth,
> but also the bandwidth which is from individual IP module.
> 
> Example usage:
> 
>   $ perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
> 
> - or -
> 
>   $ perf stat -a -e \
>     meson_ddr_bw/total_rw_bytes/,\
>     meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 \
>     sleep 10
> 
> g12 SoC support 4 channels to monitor DDR bandwidth
> simultaneously. Each channel can monitor up to 4 IP modules
> simultaneously.
> 
> For Instance, If you want to get the sum of DDR bandwidth
> from CPU, GPU, USB3.0 and VDEC. You can use the following
> command parameters to display.
> 
>   $ perf stat -a -e \
>     meson_ddr_bw/chan_2_rw_bytes,arm=1,gpu=1,usb3_0=1,nna=1/ -I 1000 \
>     sleep 10
> 
> Other events are supported, and advertised via perf list.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> Tested-by: Chris Healy <healych@amzon.com>
> ---

Why did you drop the bindings patch ?
I only applied the DT patch.

Neil


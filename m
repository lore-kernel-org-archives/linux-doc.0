Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6109CC4708E
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 16:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbiLBQlp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 11:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbiLBQlo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 11:41:44 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04663C7243
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 08:41:43 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id cf42so2454797lfb.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 08:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BAq+fVHmIhCdKS7zABOm6n+xbqhaX7I/kqj6V6QJRdA=;
        b=cEvbPinNNHFoSzYYRCjmu+dZle00/Om99aGXDsuGwJtsjH0kcHXB3AbG7Fln+3Xe7f
         9Ed2Du4oJ5VfR09EEqhaFLIbzhnk5sWAK2MB+M56NYEEraFEowoahozwZZ+OWMDVj1va
         L3Fg4QmE2KsZEk3e5XZTI18U4ZDwDAMHxKNUEHD60Tr1hOTIjff3AcLWl8/9JxEzCjsJ
         hshnf+ycPMcOSSBoCJEZB4FCrFbyo2cmXpZ01qt7NDSqa2HT1ZL+dnv0wVUdbSFfwf7K
         PssCqh2six1PYS51W4kh3lg7t4NDp5FR8oEOeim1Ak1FoxS0jWbXqIjzYU8OsSt7oW3Z
         3QRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAq+fVHmIhCdKS7zABOm6n+xbqhaX7I/kqj6V6QJRdA=;
        b=OR/p430h2BQEWfgMniNI5JXZpZxh7vMFAknw+oW9DLlxNlx9mOu105CO4LqNQkd3Z6
         UHzk+emnTjWZkUnVlKOwVyKRj2FJ8G/Rlk+d/n9TrWMYZwR50gKX1yWXq5E8v3EZapaU
         Sg6HgLPhWgQrQ9j14c9o6+2//L+274Nt7vGZ2IUKhfid+ED7hJBlmijdhFfSqf2SgVhH
         9tf2w4vwuf363G/n/4vxr4Sb3uhVmwCeVV6sEdsl2AEBWN98poVCBu21hchaEvzFgXH0
         X9YghytNCp7iYGLk3Nc41gzhk/saxuRBnmKwRVnRtEwXCqN53tv0wtw8sF4FO72vG09b
         Ul1Q==
X-Gm-Message-State: ANoB5pl+YcTdI0/yU24Huno3At895BCGUperab2GA64lsUgr8jvCqOSL
        s+M/AWbTFksUDuI1Sje19hfyFg==
X-Google-Smtp-Source: AA0mqf6oea5Kvs0FUDDil6DVjGdcz2bh7/d3UarMFl9jl+UoVskWak6MPuASvv0rchDNa4BGdJu6aA==
X-Received: by 2002:a05:6512:484:b0:4a2:33f8:2d0f with SMTP id v4-20020a056512048400b004a233f82d0fmr23443294lfq.140.1669999301382;
        Fri, 02 Dec 2022 08:41:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f27-20020a19381b000000b004a25468d86asm1075351lfa.68.2022.12.02.08.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 08:41:39 -0800 (PST)
Message-ID: <620b19f5-2202-21a5-7e3b-816dcd42d1b4@linaro.org>
Date:   Fri, 2 Dec 2022 17:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/2] dt-bindings: leds: add binding for aw200xx
Content-Language: en-US
To:     Martin Kurbanov <MMKurbanov@sberdevices.ru>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        kernel <kernel@sberdevices.ru>
References: <20221124204807.1593241-1-mmkurbanov@sberdevices.ru>
 <20221124204807.1593241-2-mmkurbanov@sberdevices.ru>
 <bb12ea88-b416-7e32-93b9-730b6f009b98@linaro.org>
 <0a9e7d65-4ad7-b753-ec9b-8e58a549b5db@sberdevices.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0a9e7d65-4ad7-b753-ec9b-8e58a549b5db@sberdevices.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/11/2022 18:43, Martin Kurbanov wrote:
> Hi. Thank you for quick reply. 
> 
> On 25.11.2022 11:29, Krzysztof Kozlowski wrote:
>>> +
>>> +  imax:
>>> +    maxItems: 1
>>> +    description:
>>> +      Maximum supply current, see dt-bindings/leds/leds-aw200xx.h
>>
>> No. Use existing properties from common.yaml. This looks like
>> led-max-microamp and it is per LED, not per entire device.
> 
> The AW200XX LED chip does not support imax setup per led.
> Imax is the global parameter over the all leds. I suppose, it's better
> to add vendor prefix or take minimum from all subnodes?
> How do you think?

Have in mind that led-max-microamp is a required property in some cases,
so skipping it and using per-device properties does not solve the
problem of adjusting proper currents. What if each LED you set for
something which in total gives more than your imax?

> 
> 
>>> +/* Global max current (IMAX) */
>>> +#define AW200XX_IMAX_3_3MA  8
>>> +#define AW200XX_IMAX_6_7MA  9
>>
>> No. Bindings are not for storing register constants. Feel free to store
>> here IDs (ID start from 0 or 1 and is incremented by 1)... but how the
>> IMAX even matches any need for "ID"?
> 
> IMAX can be chosen from the predefined values in the
> datasheet (10mA, 20mA, etc). Do you mean the IMAX should be round down
> to nearest supported value in the driver?

What Linux driver support does not matter here. Bindings should reflect
hardware and the same time not store register constants but logical
values (for current this is in uA).

Best regards,
Krzysztof


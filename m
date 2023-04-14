Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E39C77B6E
	for <linux-doc@archiver.kernel.org>; Fri, 14 Apr 2023 08:52:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjDNIwF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Apr 2023 04:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjDNIwE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Apr 2023 04:52:04 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F54110E7
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 01:52:02 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id ud9so43668119ejc.7
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681462321; x=1684054321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftuw3UMilu8l2b5dRswcK+6i7A7X4UnxqGe15PT1fxE=;
        b=T52l6eQLvfn2sr/g3hmgUKtS5XsQv8MDNpk0D5Aou7STdMVuIFWxuR/M6OENureCtE
         fY2UcWDkb6mzBiX7xvw5Eo63dENC+invb044pfJxP9Pucg+XuSo22M54Jayq0Y6uZPee
         kWaIQHHFoS3BfYv7JPmAIJfbfdy4TuFsOO+aW8HUStOgqdtPAtSCHfhcfmxuyS4VSISN
         OTWzhYKSGqMHbQqHv9Y+pJpNrYvb3ZFgcwj1FmkRi5iMDw4YnwD7rtzNaX3evvATTlS+
         vNsV4eU/FLo+o15n3AQ5AtZdKsg5GPRjx0mZX7F90Eqg/Vp6UXioXM8TbKOyIjOQsp4y
         YjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681462321; x=1684054321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftuw3UMilu8l2b5dRswcK+6i7A7X4UnxqGe15PT1fxE=;
        b=kbjNOoGmfi8aoz9l2FVV8Ze1JZ04ZfcYuxQBIvUQ8vAdw6AqnNYV+mvqXFN0LOhjoU
         L/lDk7kEKx4vEgNd0p7B9JG53+zK1NJ92r4pO6uyqAHzzVJv1QiqjLA0hKjcsTD/FM/y
         uBtKTLfIfXeIaJ70uJUBfKGEvfnr5ycEhcZwk/4RdNShUf2/mJte0/oZOeGfm0O2jxof
         UdM1iIPK2LZ8pojZQKRGMM6TVApwNV046Qq9jzlwUruQN4LiawqyHJwzASWdjOquINs+
         QYlhyUPJP+J9+5zoRIgsQYSmrDJyWLUxBdF1/IpN2oH2pxI7VXx1yhG1N1qnRm/jZUKj
         idoQ==
X-Gm-Message-State: AAQBX9dUVipnsw2lHcYHJc/UMB6zifKFKRWBIifS7j/jn10iH+3i9zX+
        KYdEZvKGrJKpVhi+f/gA7RnYWg==
X-Google-Smtp-Source: AKy350ZGMQqG6EaGl3Xlc4WmAQP09GFYq2Qn4E1EDRefqvbMGtKVMeeI2wcHlp3lEbsd7lTJ4PjXmw==
X-Received: by 2002:a17:907:8b98:b0:870:d9a:9ebb with SMTP id tb24-20020a1709078b9800b008700d9a9ebbmr5778987ejc.38.1681462320945;
        Fri, 14 Apr 2023 01:52:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id m9-20020a1709062b8900b0094a9b9c4979sm2162123ejg.88.2023.04.14.01.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:52:00 -0700 (PDT)
Message-ID: <7256414b-5553-e025-334f-b8df48f40c31@linaro.org>
Date:   Fri, 14 Apr 2023 10:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 3/6] soc: mediatek: virt: geniezone: Introduce
 GenieZone hypervisor support
Content-Language: en-US
To:     =?UTF-8?B?WWktRGUgV3UgKOWQs+S4gOW+tyk=?= <Yi-De.Wu@mediatek.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?B?WWluZ3NoaXVhbiBQYW4gKOa9mOepjui7kik=?= 
        <Yingshiuan.Pan@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>,
        "will@kernel.org" <will@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        =?UTF-8?B?TVkgQ2h1YW5nICjojormmI7ouo0p?= <MY.Chuang@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?UTF-8?B?UGVpTHVuIFN1ZWkgKOmai+WfueWAqyk=?= 
        <PeiLun.Suei@mediatek.com>,
        =?UTF-8?B?TGlqdS1jbHIgQ2hlbiAo6Zmz6bqX5aaCKQ==?= 
        <Liju-clr.Chen@mediatek.com>,
        =?UTF-8?B?SmFkZXMgU2hpaCAo5pa95ZCR546oKQ==?= 
        <jades.shih@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2hhd24gSHNpYW8gKOiVreW/l+elpSk=?= 
        <shawn.hsiao@mediatek.com>,
        =?UTF-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?= 
        <Miles.Chen@mediatek.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        =?UTF-8?B?SXZhbiBUc2VuZyAo5pu+5b+X6LuSKQ==?= 
        <ivan.tseng@mediatek.com>,
        =?UTF-8?B?WmUteXUgV2FuZyAo546L5r6k5a6HKQ==?= 
        <Ze-yu.Wang@mediatek.com>
References: <20230413090735.4182-1-yi-de.wu@mediatek.com>
 <20230413090735.4182-4-yi-de.wu@mediatek.com>
 <1aa701cc-92ca-71be-0663-df4bfae66c2f@linaro.org>
 <5c1d69c8-d973-fa7b-1f14-c72729ff5594@gmail.com>
 <533a1a9b653cf63f1e5df7f95d1b23902809561d.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <533a1a9b653cf63f1e5df7f95d1b23902809561d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14/04/2023 10:43, Yi-De Wu (吳一德) wrote:
> On Thu, 2023-04-13 at 19:08 +0200, Matthias Brugger wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 13/04/2023 14:55, Krzysztof Kozlowski wrote:
>>> On 13/04/2023 11:07, Yi-De Wu wrote:
>>>> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
>>>>
>>>> GenieZone is MediaTek proprietary hypervisor solution, and it is
>>>> running
>>>> in EL2 stand alone as a type-I hypervisor. This patch exports a
>>>> set of
>>>> ioctl interfaces for userspace VMM (e.g., crosvm) to operate
>>>> guest VMs
>>>> lifecycle (creation, running, and destroy) on GenieZone.
>>>>
>>>> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
>>>> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
>>>> ---
>>>>   arch/arm64/include/uapi/asm/gzvm_arch.h       |  79 ++++
>>>>   drivers/soc/mediatek/Kconfig                  |   2 +
>>>>   drivers/soc/mediatek/Makefile                 |   1 +
>>>>   drivers/soc/mediatek/virt/geniezone/Kconfig   |  17 +
>>>
>>> Hypervisor drivers do not go to soc. Stop shoving there everything
>>> from
>>> your downstream. Find appropriate directory, e.g. maybe
>>> drivers/virt.
>>
>> Acked, what is the reason you want to add this to drivers/soc instead
>> of
>> drivers/virt?
>>
>> Regards,
>> Matthias
>>
> Noted. We would take your advice and move it from
> drivers/soc/mediatek/virt to /drivers/virt on next version.
> 
> The reason we put it under our soc/ is that the drver is highly
> propietary for mediatek's product and for aarch64 only. Maybe it's not
> general enough to put in under /drivers/virt.

If virt folks reject the driver, because it is highly proprietary, then
it is not suitable for soc/mediatek either.

Your argument is actually not helping you. It's rather a proof that this
driver might not be suitable for Linux kernel at all.

>
https://android-review.googlesource.com/c/kernel/common/+/2447547/1..2/drivers/virt/geniezone/gzvm.h#b91

I don't see there anything suggesting moving to soc/mediatek. Comment
from Trilok (+Cc) suggests that your code is simply not portable. Write
code which is portable and properly organized.

Best regards,
Krzysztof


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169A4C77B6E
	for <linux-doc@archiver.kernel.org>; Fri, 14 Apr 2023 08:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjDNImj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Apr 2023 04:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjDNImh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Apr 2023 04:42:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018357692
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 01:42:35 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id xd13so9897637ejb.4
        for <linux-doc@vger.kernel.org>; Fri, 14 Apr 2023 01:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461754; x=1684053754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHq+EupaWK5MJtpxLFtvDP9vBRUE48Hn964Cl/uitPU=;
        b=Ep7aohUyYcWRl/kaTHamdzHff2u5f5xcZ4Iw5ooCnS7pkFckU+HODvocte84UBAcEj
         B1qq0r+9M6SeYwxDKaYx3kTNnUiqZkTtdf6EKjZLQ+BGWxs+5+723Emh57fV0rGZplgn
         4GFWscqRr2bPu4rdn+ro8jCf2djKEocC3bsBn5c0OvTSpj6m6fRuFtShyHyofArr4rn7
         GFodPaUxzuP4ddXKJeyzjJf05HpbEvZQADKGP+QROzeHGCg9nKHKcVKjss9jeuXdX/EB
         lUoQPyX61cB8TvYJD+YQlGsANyOJfOQ9urNlf2lJa9kLbGatI6BJw/9rezk8eUTv5NRC
         3H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461754; x=1684053754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHq+EupaWK5MJtpxLFtvDP9vBRUE48Hn964Cl/uitPU=;
        b=XaGaypRfZpVwmSiQzUnwZ4Pe4OZ8PC3a2CJqzIZv1LkAS3ws5lfcwNNcUGrG58jkik
         3YHcL8ziYzi5dsWSmts5NV2ZzJfCthIuAAaTlI1Kw3N5gcWsHjps94y6bQxDyfXAGHFO
         svEI7BtLr6NEFGcT+zFzSZI3zldI9pgUUisoJCHujRKrLkP7bRjqpHbh2C94w7r8pN57
         Aoek9ARvc7d96z4qjyDOTAEfbmlWz3G17aiYe5fvDtTaZJSadE4SytbmfQWf8oD5Wpv8
         pSYiFOmDolZitYkxuWJZ9IPn8ttvU2AUFmvLVi1Q8fwUilgJMVcrbJRct1SfFAWFl07u
         cE+g==
X-Gm-Message-State: AAQBX9epNqdip2Ih/FBOLDdgmdZwnHo/5o8wb06hE0yLQw5MxMhE7dxB
        OChB1XwxiGQbydISnjwJKl/SZw==
X-Google-Smtp-Source: AKy350ZPDeveGvHXCmasWX26jHul6oEoRldmgbv23zwBWv8n/OHBKJ910AjH/aWaKTzDvBSS1nAuXQ==
X-Received: by 2002:a17:906:da8c:b0:94e:aa09:1b4d with SMTP id xh12-20020a170906da8c00b0094eaa091b4dmr4495805ejb.36.1681461754336;
        Fri, 14 Apr 2023 01:42:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7dbcf000000b00501d51c23fbsm1878762edt.6.2023.04.14.01.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:42:33 -0700 (PDT)
Message-ID: <759c3b60-07f8-99c8-6ac2-73256538370e@linaro.org>
Date:   Fri, 14 Apr 2023 10:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 2/6] dt-bindings: hypervisor: Add binding for MediaTek
 GenieZone hypervisor
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
        "will@kernel.org" <will@kernel.org>
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
        "dbrazdil@google.com" <dbrazdil@google.com>,
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
 <20230413090735.4182-3-yi-de.wu@mediatek.com>
 <8ace9b0f-742a-7ebc-555f-1f8be04a5955@linaro.org>
 <7b4492efa4a1becbdfb79d23a0a0c0fe11dba5f4.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7b4492efa4a1becbdfb79d23a0a0c0fe11dba5f4.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14/04/2023 10:35, Yi-De Wu (吳一德) wrote:
>> I don't know if we actually want to support proprietary hypervisors.
>> There can be hundreds of them, one per each SoC manufacturer, and
>> they
>> can come with many ridiculous ideas.
>>
> MediaTek, as a partner of Android, our GenieZone hypervisor has been
> one of the backend options under Android Virtualization Framework(AVF)
> now.
> Thus, we'd like to donate these patches for better supporting the
> Linux/Android ecosystem.

If it is proprietary, I don't have much interests in it. Make it
open-source. :)

Best regards,
Krzysztof


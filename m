Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF7CC32774
	for <linux-doc@archiver.kernel.org>; Tue, 23 Aug 2022 07:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241434AbiHWH5g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Aug 2022 03:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237982AbiHWH5f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Aug 2022 03:57:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20C565808
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 00:57:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bt10so5596728lfb.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 00:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=KvtgSh2phbbynB84y9pIsoa+hK1Rxnm5EOo+8e1zaQQ=;
        b=FKu6fUrh8ERK9Kar36H0EJFuWiUWwUh+uOhcwDUbLVAc5WMoOauQtfQWMe23dhct00
         lmGJEJnPSyv1IbAWfATsOD9rc4DG5Ct7jOqilD70Xr/7HSCzZECxqkzcw+h9YIiqN7sG
         58i5MtI3FsVAE/D1dsLNzUx760hNG1/3nVKyS8T9PygbhCRn/mWdbsVI0hRqOOabRqHA
         2j5y3QqFeO+YuhdXbeGWp8Lvo+GHFrN2CJ5+O7cZ8rP3Vcca3pTE0KCffDLhJYYfo+ZE
         MS89w6e/mK2YaF8FPzwFOQC0PmWywYIvfu5KnQN63ZYeHZRlejN6gr2QWBicv7zb3jBh
         OcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KvtgSh2phbbynB84y9pIsoa+hK1Rxnm5EOo+8e1zaQQ=;
        b=aiJuIojm4esnNwwWf11Z7VBWnrABgkDAUmWXIuuTAUG3BZf6YBqa7lN8CgyXASt+Lb
         8gj+W6AA4A4fdnGUSfOb4FwOv6JTj8xPyZQEUMVCjBQBVq+ln+FQPHi9E9x3S3pUlYda
         pNPL2HXyez/Q4TGMI0DmRY1d8L7khp6DxXtHuiUYtFdggu4ConqrmwvUP5Pq4FJKfuR/
         5PsTsDE+ojyT2pAcpUTdHa8S0zJhAHoDbyXuC/LfS1Z8iFTm5As3Ht82CXLKvPJ3BMAo
         VAfdaZfo1IlcQabd5QBUrDcvg91396+p3JMCKXYHxOtQy970DyUKhVUf/A1GxkGAAJIz
         1zKA==
X-Gm-Message-State: ACgBeo1h+krymySEU1Ptj799MfpwpAeK9BsGA1Tl9hTUfNWOIx97HGRg
        Z5x5GjrbwCxbMc77/rmTJmSQHQ==
X-Google-Smtp-Source: AA6agR5WcQZdOG+6fsE/UGT3A1jCQIfDZk5hX4VOpGeZ4eyBtqp1rmejXmnAdp6unePtuhDydK9YLw==
X-Received: by 2002:a05:6512:3984:b0:492:da1b:9683 with SMTP id j4-20020a056512398400b00492da1b9683mr4680226lfu.58.1661241452127;
        Tue, 23 Aug 2022 00:57:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o11-20020ac24e8b000000b00492dadd8143sm1412135lfr.168.2022.08.23.00.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 00:57:31 -0700 (PDT)
Message-ID: <b8213d5f-b1ba-6576-e9f5-3511c57b2def@linaro.org>
Date:   Tue, 23 Aug 2022 10:57:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 07/11] gunyah: msgq: Add Gunyah message queues
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-8-quic_eberman@quicinc.com>
 <250945d2-3940-9830-63e5-beec5f44010b@linaro.org>
 <6fa6c86d-5b4c-4048-2df8-49a36c86e7d6@quicinc.com>
 <87zggdven5.wl-maz@kernel.org>
 <68e241fd-16f0-96b4-eab8-369628292e03@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <68e241fd-16f0-96b4-eab8-369628292e03@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/08/2022 19:50, Elliot Berman wrote:
> 
> 
> On 8/9/2022 4:29 AM, Marc Zyngier wrote:
>> On Mon, 08 Aug 2022 23:22:48 +0100,
>> Elliot Berman <quic_eberman@quicinc.com> wrote:
>>>
>>> In a future series, I'll add the support to load other virtual
>>> machines. When running other virtual machines, additional gunyah
>>> devices are needed for doorbells (e.g. to emulate interrupts for
>>> paravirtualized devices) and to represent the vCPUs of that other
>>> VM. Other gunyah devices are also possible, but those are the
>>> immediate devices coming over the horizon.
>>
>> Can you elaborate on this "doorbell" aspect? If you signal interrupts
>> to guests, they should be signalled as actual interrupts, not as some
>> hypervisor-specific events, as we rely on the interrupt semantics for
>> most things.
>>
>> Or are you talking about injecting an interrupt from a guest into
>> another, the doorbell representing an interrupt source?
>>
> 
> Doorbells can operate either of these modes:
>   1. As simple interrupt sources. The doorbell sender makes a hypercall
>      and an interrupt is raised on the receiver. The hypervisor can be
>      configured to raise a specific SPI on the receiver VM and simply
>      acknowledging the SPI is enough to clear the interrupt assert. No
>      hypervisor-specific code is needed on the receiver to handle these
>      interrupts. This is the mode one would expect to use for
>      paravirtualized devices.

This sounds good.

>   2. As hypervisor-specific events which must be acknowledged using
>      hypercalls. We aren't currently using this advanced use-case and no
>      plans currently to post these. However, I can try to briefly
>      explain: These doorbells can operate on a bitfield and the sender
>      can assert flags on the bitmask; the receiver can decide which bits
>      should trigger the interrupt and which SPI the doorbell "runs" on.
>      The "user story" for this doorbell is to support multiple sender
>      using the same doorbell object. Each sender has a few designated
>      bits they should set. The receiver can choose which events it wants
>      an interrupt to be raised for and then can process all the pending
>      events. To re-iterate, we don't have an interesting use-case for
>      this yet, so don't plan on post patches for this second mode of
>      doorbell.

Well. For me this sounds like 'we have such capability, no real usecase, 
but we want to support it anyway' kind of story. As history has shown 
multiple times, the order should be the opposite one. First you have the 
use case, then you create the API for it. Otherwise it is very easy to 
end up with the abstraction that looks good on the API side, but is very 
hard to fit into the actual user code.

I would suggest to drop the second bullet for now and focus on getting 
the simple doorbells done and accepted into mainline.

-- 
With best wishes
Dmitry


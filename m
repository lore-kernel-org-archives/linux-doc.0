Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C23ECAAA1
	for <linux-doc@archiver.kernel.org>; Thu, 27 Oct 2022 19:55:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236736AbiJ0Tz5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Oct 2022 15:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236723AbiJ0Tz4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Oct 2022 15:55:56 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12BA440E31
        for <linux-doc@vger.kernel.org>; Thu, 27 Oct 2022 12:55:54 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id x26so1932539qki.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Oct 2022 12:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phTE8Hb2ngpgKiU4qEw9Lxs4Tg0Q1IriLkNiuUxWbrA=;
        b=SLiZgtBtLeK+zXz2D/eNY1D1zV3xsgNeksFqjPCbsKNbPzMla/jRUDugiePENX73ip
         P/2mXeFdNEpaJrZlcZUZvNsyAuPAnIrZAiC5ALBMHFJUrQ0Rb9CQYk773GYs0q3iGqvh
         B2WM4HerpmMxEQiSda7hzKWhdXNhkW38WHwUdtBmW2ffVcRHwAL61jvG1h9IwIDmO2vX
         oor1QPHbN8jVVVS0IvkJKvwW6oaLAZuh1ob7nE2lo9Ot33KloW/Lef7rBSbbH2rf8d7d
         aE64Y6HQZxtQsonfMDH1nnrRRvM9sIZvb5UWzuvgLq8ZtAJuCbLn9llNBDxt4LydG89z
         apDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phTE8Hb2ngpgKiU4qEw9Lxs4Tg0Q1IriLkNiuUxWbrA=;
        b=5W8xzVeWqI49gwZ8boIWopa4wbfgWRc9gr1ImBidbPEnaj5jMY9cbk/o29L/+7ZwYj
         h1nIFrCNPdClXtHw+rO6osixwmAQW2NAOSQMtve2WEKq5/nFgtVPY9/J3/5XmRYbRyqP
         bX96vWK91UBgkCCxbZBLS5090Mvp2LAuGuFK8JS6pCdK4E/G/iF+sIH6LlLjGpXqhOo+
         PUA9VG5AvWftQ4dp0EJyYW5BxqMwx+BF1ybMWxLFPOP3352i9aWrAw1KBK6AMDXDHa+W
         jXxQdPBFxz6SpC1I3t4m7zaCpYPQFon0AtUEk+rrTUTiAGJmLngLnSMFXexU6hfKVSCN
         SOBg==
X-Gm-Message-State: ACrzQf2rXe5QTCzk830CcDwKVpwlt4cfbHznwm/AK81A1+Iw3ICGTP9F
        MuoSTDRxP0lOZgZESalcKCgUQA==
X-Google-Smtp-Source: AMsMyM5FXOg6GzFfIF0AuRgweoogKXQKTmdDgZJ2PVbtcQn8m9jGg9sXOm3QaqOPYu4qR9rZ5hVLrg==
X-Received: by 2002:a37:b041:0:b0:6eb:cc8c:e9a9 with SMTP id z62-20020a37b041000000b006ebcc8ce9a9mr34662885qke.573.1666900553202;
        Thu, 27 Oct 2022 12:55:53 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id n14-20020a05620a294e00b006eed094dcdasm1585036qkp.70.2022.10.27.12.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 12:55:52 -0700 (PDT)
Message-ID: <79673829-a079-201f-91e1-790eb7cc3a4b@linaro.org>
Date:   Thu, 27 Oct 2022 15:55:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 02/13] dt-bindings: Add binding for gunyah hypervisor
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221011000840.289033-1-quic_eberman@quicinc.com>
 <20221011000840.289033-3-quic_eberman@quicinc.com>
 <20221012155645.GA2173829-robh@kernel.org>
 <ca13eb92-9b5b-19fd-27a5-f91f5048b142@quicinc.com>
 <CAL_Jsq+cR5AEa5i1u-_L6sP6nYXS6qgaVWZ=KwxpUbxV3ZW-BA@mail.gmail.com>
 <75ef3cc5-3b19-9eab-b3eb-56fa254d92bd@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <75ef3cc5-3b19-9eab-b3eb-56fa254d92bd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27/10/2022 12:17, Elliot Berman wrote:
> Hi Rob,
> 
> On 10/26/2022 2:16 PM, Rob Herring wrote:
>> On Thu, Oct 13, 2022 at 6:59 PM Elliot Berman <quic_eberman@quicinc.com> wrote:
>>>
>>>
>>> On 10/12/2022 8:56 AM, Rob Herring wrote:
>>>> On Mon, Oct 10, 2022 at 05:08:29PM -0700, Elliot Berman wrote:
>>>>> When Linux is booted as a guest under the Gunyah hypervisor, the Gunyah
>>>>> Resource Manager applies a devicetree overlay describing the virtual
>>>>> platform configuration of the guest VM, such as the message queue
>>>>> capability IDs for communicating with the Resource Manager. This
>>>>> information is not otherwise discoverable by a VM: the Gunyah hypervisor
>>>>> core does not provide a direct interface to discover capability IDs nor
>>>>> a way to communicate with RM without having already known the
>>>>> corresponding message queue capability ID. Add the DT bindings that
>>>>> Gunyah adheres for the hypervisor node and message queues.
>>>>>
>>>>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>>>>> ---
>>>>>    .../bindings/firmware/gunyah-hypervisor.yaml  | 87 +++++++++++++++++++
>>>>>    MAINTAINERS                                   |  1 +
>>>>>    2 files changed, 88 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..f0a14101e2fd
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
>>>>> @@ -0,0 +1,87 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/firmware/gunyah-hypervisor.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Gunyah Hypervisor
>>>>> +
>>>>> +maintainers:
>>>>> +  - Murali Nalajala <quic_mnalajal@quicinc.com>
>>>>> +  - Elliot Berman <quic_eberman@quicinc.com>
>>>>> +
>>>>> +description: |+
>>>>> +  On systems which support devicetree, Gunyah generates and overlays a deviceetree overlay which
>>>>
>>>> How you end up with the node (applying an overlay) is not relavent to
>>>> the binding.
>>>>
>>>>> +  describes the basic configuration of the hypervisor. Virtual machines use this information to determine
>>>>> +  the capability IDs of the message queues used to communicate with the Gunyah Resource Manager.
>>>>
>>>> Wrap at 80. That is the coding standard still though 100 is deemed
>>>> allowed. And yamllint only complains at 110 because I didn't care to fix
>>>> everyones lines over 100.
>>>>
>>>>> +  See also: https://github.com/quic/gunyah-resource-manager/blob/develop/src/vm_creation/dto_construct.c
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - const: gunyah-hypervisor-1.0
>>>>> +      - const: gunyah-hypervisor
>>>>
>>>> 2 compatibles implies a difference between the 2. What's the difference?
>>>> Where does '1.0' come from?
>>>>
>>>
>>> There's no difference. I thought the convention was to have
>>> device-specific compatible and the generic compatible. "device-specific"
>>> here would be specific to version of Gunyah since it's software.
>>
>> No, that's just what people do because "vendor,new-soc",
>> "vendor,old-soc" seems to bother them for some reason. At the end of
>> the day, it's just a string identifier that means something. If
>> there's no difference in that 'something', then there is no point in
>> having more than one string.
>>
>> You only need something specific enough to discover the rest from the
>> firmware. When that changes, then you add a new compatible. Of course,
>> if you want existing OSs to work, then better not change the
>> compatible.
>>
> 
> Thanks for the info, I'll drop the "-1.0" suffix.

You still did not answer from where does 1.0 come from... Compatibles
are usually expected to be specific.

Best regards,
Krzysztof


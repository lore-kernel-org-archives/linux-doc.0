Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C72C74A5B
	for <linux-doc@archiver.kernel.org>; Tue, 21 Mar 2023 10:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjCUKdD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Mar 2023 06:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbjCUKdB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Mar 2023 06:33:01 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78D934334
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 03:32:26 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id o12so57670297edb.9
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679394743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aM4pMbd9h+3fIjUzyTPRMWqM3P8Ga6/igv7ENNsFFog=;
        b=EYxGPFIIMxiCXWI/mEd7m/ehNebVcC2dyioRpdXbL/OmnKz90GKfT1Unb3HDim+QHG
         FaMYLF6JjzSZtRqyYBBPZyG7BA3pSF4EKLnPwZf0tKRNrIoEE4UI0qng9tz71RYxezAM
         4yUaLfDgzLi9aavAXPyLDeSIWfqUSNYhC3sGtt74weOp5gKdiDLnlSrKVA1b2x57ybtW
         I/Xl+IFpw5Ijihrj9Liyzd/ieeOuF4x9Pz12KA9JNxbmy7MeEkyqR7IEMW+q3ewAYNDQ
         oJpOb2BtanT970Ke56ROtHePygR1/0KkesMhUAyoIxZaRuZV3hfTSAQ66hNY0pGTolxE
         Axqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679394743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aM4pMbd9h+3fIjUzyTPRMWqM3P8Ga6/igv7ENNsFFog=;
        b=dKDoT/+eaMJCJbRRXQDZL2WgaOgW40crwMn5OyV2QT8jODVujefVbUnDFvRwlYjXaP
         BjIgYgqCCFRCCve0HGeqihrFrjX7MvlJyUyegx3XrJzXSpKcESmlPdoSXSrtIYx8R4IH
         OMy1YrgL4ZN75zKG2S2M/3R39XwbExO0B+wNKKjCZjsaR5MFueqz0+h82/mpwZWDTFut
         L6dBH4/4e+kzO8gz0tTooTnU66hmQHBoF3qnyTiGTqil/gMIyFpfPIrdtnUXODXsadcB
         PAv5xOAGQ9b2cLcaotzZ3wUcRGu4wfA8+gtov98HaaYl5TXNEcY820gQQCNCLim3dydc
         VcsQ==
X-Gm-Message-State: AO0yUKUhxCF9WM1AIKvm5Kr8/p8vTtuc8nmGijQuandcLWPXE4roZEu3
        vH7IWr5yOP0dUEGvpgrPUPy9Aw==
X-Google-Smtp-Source: AK7set/hfAAEy8OKfBMea9CyBR/XCE2LmXd/fOMAlwfdbQAwHsc+rxmMel4Tjo+wXxAliWG8CWwHvg==
X-Received: by 2002:a17:906:7ccf:b0:8f4:809e:faee with SMTP id h15-20020a1709067ccf00b008f4809efaeemr11116908ejp.19.1679394742958;
        Tue, 21 Mar 2023 03:32:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id lz24-20020a170906fb1800b009334309eda5sm3774000ejb.196.2023.03.21.03.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 03:32:22 -0700 (PDT)
Message-ID: <2aeb47d6-0577-f8e4-6070-331af15b1f83@linaro.org>
Date:   Tue, 21 Mar 2023 11:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: Add TI TPS6594 PMIC
Content-Language: en-US
To:     Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>
Cc:     lee@kernel.org, krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
        eric.auger@redhat.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, davem@davemloft.net,
        christian.koenig@amd.com, contact@emersion.fr,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, sterzik@ti.com, u-kumar1@ti.com,
        eblanc@baylibre.com, jneanne@baylibre.com
References: <20230315110736.35506-1-jpanis@baylibre.com>
 <20230315110736.35506-2-jpanis@baylibre.com>
 <20230320155354.GB1733616-robh@kernel.org>
 <04914464-2bc2-9d86-e9e2-8a716b929f28@baylibre.com>
 <2dcfd9dc-6c43-20b7-e27b-8ec2883be237@linaro.org>
 <887d5e71-334c-b206-08e6-2cc822df9eda@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <887d5e71-334c-b206-08e6-2cc822df9eda@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 21/03/2023 10:03, Julien Panis wrote:
> 
> 
> On 3/21/23 08:36, Krzysztof Kozlowski wrote:
>> On 20/03/2023 17:35, Julien Panis wrote:
>>>
>>> On 3/20/23 16:53, Rob Herring wrote:
>>>> On Wed, Mar 15, 2023 at 12:07:33PM +0100, Julien Panis wrote:
>>>>> TPS6594 is a Power Management IC which provides regulators and others
>>>>> features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
>>>>> PFSM (Pre-configurable Finite State Machine) managing the state of the
>>>>> device.
>>>>> TPS6594 is the super-set device while TPS6593 and LP8764X are derivatives.
>>>> As mentioned, the binding needs to be complete. It's missing GPIO at
>>>> least. RTC and watchdog may or may not need binding changes.
>>> Thank you for your feedback.
>>>
>>> About GPIO, do you speak about 'gpio-controller'
>>> and/or '#gpio-cells' properties ?
>> Yes.
>>
>>> For RTC (and for watchdog, once the driver will be
>>> implemented), our driver do not require any node
>>> to work. What could make an explicit instantiation
>>> necessary in DT ?
>> Properties from RTC schema, e.g. start-year, wakeup etc.
> 
> TPS6594 RTC driver is being reviewed (this is another patch
> series, not merged yet). These properties are not used by our
> driver, that's why we did not have to add some RTC node in
> the DT (until now, using such properties in our driver was not
> requested by RTC sub-system maintainers).

Bindings should be complete, regardless whether you now need this in
driver or not. Does your comment mean that you will never need these,
because hardware does not support them, and never going to add?
Otherwise I don't get why you refer to driver when we talk about bindings...


Best regards,
Krzysztof


Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA21C00140
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 13:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236745AbiHBNe5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Aug 2022 09:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbiHBNe4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 09:34:56 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3261A384
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 06:34:55 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a13so15601839ljr.11
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=nNai4kk6GSyRg35ry6/3rcAAL8QUIwFfkg5aBxpvgRo=;
        b=s7haoVVb3TUIlA5nt6ol7cpgAQENhCjuDQnHQ2ZKUrQ9vEjoJdSfJHTDeKOMen1FI3
         L5oOh8tqTzvnLGqHsU09X30OXZpwxrldo1djzgFnJGhshODXlfzyD5K06YE9Br3iw9Bz
         7ozBKhIrBncj6MJKqg9K+8u/t79OE4MG02g8pHTSKJB17UMSJV/6EXa/h/NX6PzzNx3/
         uPiM7vjN1YrAmZBodfD7zfdP1aivDHRX5ghMhvgjvbJVbWz1XVPM6OEr8r6GLBmE2sPt
         1m0f/Lgetq7tuN9dGjKMQajzjFr5sGerfOs/mJ0e7gvYK8u2kXif2KD08q+Mxd20UIvx
         OE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=nNai4kk6GSyRg35ry6/3rcAAL8QUIwFfkg5aBxpvgRo=;
        b=m0NZOjP3m+c+HOgH3keIeHURsEZYIIlWPYhYBLIj9uR5Q1FW1QR0ryiP9HXkAb/vrM
         L8l14H2EvAIyE4ShaJx9B3wNRG7pHasoILIDvyHRugpi2sAFmGKjfZ9qxv0w/LmNkJqk
         SsLtJhva85ZWtIjgW+NlPBw4N84FkUIrgZ/FADkYq4SE/FPJRRz/frxSrayHmi23LqmS
         VLdD7Q8Znz9UcSzWaDw8j+wZgmXCowMStO67XTmVKKKZ2GRbYbzTwI4wH8/G0ALOT2Fz
         t6i03mcog26xwWPe8Z6d+mmKG+6jQLurNgZXs1ZUKOvp/fvCnFzM4vHr/MeWAq69eekA
         abdg==
X-Gm-Message-State: ACgBeo0vO46zgbcaW8M2TXUv8stsrf0QxeiTt1tlVeyUlfrW4u6ceCUh
        9Pi0DUk0UgKrLfKQFCh5E9LKKA==
X-Google-Smtp-Source: AA6agR6FHfoDDIX+DCnXnvVw/xwd1D4GXoDur6F1uMqCd665QBSkF6srJfl9wDEgN7NuQo1/4xz/AQ==
X-Received: by 2002:a2e:bd0d:0:b0:25e:48f0:5d4e with SMTP id n13-20020a2ebd0d000000b0025e48f05d4emr4485950ljq.192.1659447293659;
        Tue, 02 Aug 2022 06:34:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 10-20020ac25f0a000000b0048ae484c10bsm1575104lfq.89.2022.08.02.06.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 06:34:53 -0700 (PDT)
Message-ID: <e1a93490-7deb-8221-f3f8-83546946c61a@linaro.org>
Date:   Tue, 2 Aug 2022 16:34:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/11] arm64: gunyah: Add Gunyah hypercalls ABI
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-4-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220801211240.597859-4-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/08/2022 00:12, Elliot Berman wrote:
> Add initial support to perform Gunyah hypercalls. The arm64 ABI for
> Gunyah hypercalls generally follows the SMC Calling Convention.

Seeing a c&p (or c&rework) from arm-smccc.h, could you please describe:

1) Why can't you use the existing arm_smccc_1_1_hvc()? I checked, you 
don't seem to be getting more than 4 values back.

2) If #1 is not possible, why can't you add necessary glue code to the 
arm-smccc.h (as your code to support nargs/multiple return values is 
generic enough) and use corresponding macro in asm/gunyah.h ?

-- 
With best wishes
Dmitry

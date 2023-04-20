Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC321C77B72
	for <linux-doc@archiver.kernel.org>; Thu, 20 Apr 2023 10:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234730AbjDTKOn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Apr 2023 06:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjDTKOI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Apr 2023 06:14:08 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535111735
        for <linux-doc@vger.kernel.org>; Thu, 20 Apr 2023 03:12:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4edc114c716so447219e87.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Apr 2023 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985529; x=1684577529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1gg5qH9FVKEIvZx9IgwaMQ/p/pcxPmbM2nNSvflA+Y=;
        b=oGF+NGmUcuKNfYKptKRvcA/mqBwJP3vVKuFesYiVXRdyTFgOoercusxcIZm6AB4RE8
         /wRmO/0CDcuj9QTn+vHkn6mrx/DuytmBsRSzskfwvb0UDt3Gf6H0c3kE9rOL763teqFl
         IeHCZIap55eiRWQFwdNU9nDGVj5cWc/nVmvjIM7tqxBkrRWdCoSm3HSMHPCo3tLuyUB+
         zNZLX5K8573+XXXjDBREn7WlXbSCjv2O153I2thYxjoJ1PFi5xTmzksQv0SF2vk28b0+
         u0gJwnTPdUCAKmZgt637xMuWdIqW6AgN2R4HzYxUXecvTMz9WyYgRVksLixG7kmkYWnJ
         RiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985529; x=1684577529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1gg5qH9FVKEIvZx9IgwaMQ/p/pcxPmbM2nNSvflA+Y=;
        b=N42/gXDmmeCQl7+gW1Vg2SmkTtPU4Wp4hXk9q07R1WeXGci2KU2penhU1JUx14S/u6
         9HgkdaMmorwBkrllLZ3oxllQGKUgyzNr3he4DEp7nSfu3IZJJb+jviW9tupknprDRPUc
         w4+V/AWepX88/DR99SA2wDQwabv+ziuyRFP9tKgptrgz1ri/mSlke6y1gVtlSy4Hl8kr
         fClSVeolOMDlGQqv9dgHs2q3ucG2UVt8VUFYTsoZgyTl8H+UVtlBstihXWpxJ98nRFPZ
         pmuXq27oGjw32wfiqzhvuUjXiC2XCrOZGKTb5NQVzmzns5y7sNFr8JpdUGDlNw06KC6k
         Ix0g==
X-Gm-Message-State: AAQBX9c9R2ghkbNe1lhN2ve8AcNVDTFhy9x6AXrYqHifZ0SJ86BkyFmj
        hBOGU94PXJA1PzlOp+JQ9m2h3vOU+Plc8tCvHpQ=
X-Google-Smtp-Source: AKy350ZLeDAg/Z65XdnFNNxyJxECDLyd0G1w1LAFz9U3aeC7C/mcAJ4Bbx0in4YxGwlg5oYVk58TSQ==
X-Received: by 2002:a05:6512:204:b0:4ed:befc:9b4e with SMTP id a4-20020a056512020400b004edbefc9b4emr363243lfo.3.1681985529604;
        Thu, 20 Apr 2023 03:12:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f21-20020ac251b5000000b004cb45148027sm166060lfk.203.2023.04.20.03.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:12:09 -0700 (PDT)
Message-ID: <d757326e-9dd1-36ea-9340-2a95c3cce70c@linaro.org>
Date:   Thu, 20 Apr 2023 13:12:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/8] pinctrl: qcom: spmi-gpio: Add PMI632 support
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230414-pmi632-v2-0-98bafa909c36@z3ntu.xyz>
 <20230414-pmi632-v2-2-98bafa909c36@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230414-pmi632-v2-2-98bafa909c36@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18/04/2023 19:43, Luca Weiss wrote:
> Add support for the 8 GPIOs found on PMI632.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


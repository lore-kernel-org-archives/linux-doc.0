Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28B4C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 11:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233587AbiI2LPN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Sep 2022 07:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234740AbiI2LPM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Sep 2022 07:15:12 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C292758DC9
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 04:15:09 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a3so1709988lfk.9
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 04:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=llQA2gLNCc2d4HEow4TpeRHEJ5+62j9pkjl4MachT58=;
        b=qhb8B+kOBX2pgpF4oVAMYha0qjBvIvF/258CLWiA/nbGuRaA3PQ3v9kGCvQ8Urrq7G
         1G/GYUUMFwZHro0T47u7eKtT2qYGhFedkCmC14OQB1UEsruNjsC22BmU2bjNfu2Cjzye
         BNlMZBk7Uk1a7HukB7GwPK/wvNdUaratbb4g4XM0kXIh/uq+/sH6NEcHdHSJHk40L1d4
         xjWxo9ZaefRr7rtSo7URIVnstve8a7xzLPUsVvfzQxqE/fNXyMn0+rPO2PLK/HSN/VGQ
         5gCL4EnYRjuwg4423c+oOksGSi87uP5WnCJqdfz+y7IQ7E7CkQrcqrYpNnYflynp+6fq
         3KRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=llQA2gLNCc2d4HEow4TpeRHEJ5+62j9pkjl4MachT58=;
        b=zE0Jjvd7SkdPSJGrB/dZaTQd2WzkBq1AHlSLZ70COJ1QxNjdka3QSFpxVCH/YsOzR8
         Yegd04eDxcGGmveOkvk47PVUs8662lGG3D8whc6yK8l3yHjk4fhSrUnpu/x4rWGQedG/
         OS4c92yV1sQ7vI7bAODM5kaS35Mtb3s4PXmVfnCHmBvhp0SI/Cn2luXVksBJ6y6dwiRx
         42aUGWKUwwhsejozN8aPdsgPGZBF1JSXu2PjpkjxtuK1BvmccsXs+jXIsTIdG6p9tgnO
         iPS4PhKAS/xGQhikjijUuxIVihjQTJmZaIGvWjUDED76hndh4tpwH5qkeeXobTnsj3v/
         Ym9A==
X-Gm-Message-State: ACrzQf1rt64v0y+kFelvAmyaf6gsLbO4clhNEmAgEzUrYS9djhKrFcph
        fuzQa68s4NTr/4DmPvOEYKXRysw81BiaDg==
X-Google-Smtp-Source: AMsMyM4WYyCpb05WmvkjmQdNPSJVQHLcZkQDiSV+zvECWVXmgKMpa4hdVNUSHDRCnwblcxjwJe9HOA==
X-Received: by 2002:a05:6512:3612:b0:499:aea7:8bed with SMTP id f18-20020a056512361200b00499aea78bedmr1103047lfs.26.1664450108204;
        Thu, 29 Sep 2022 04:15:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j14-20020a05651231ce00b0047f7722b73csm753859lfe.142.2022.09.29.04.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 04:15:07 -0700 (PDT)
Message-ID: <4820a854-5d73-d6f1-fd77-7a7f5dc7f67b@linaro.org>
Date:   Thu, 29 Sep 2022 13:15:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 2/2] Documentation/process: Add text to indicate
 supporters should be mailed
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, corbet@lwn.net,
        linux@leemhuis.info, konstantin@linuxfoundation.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20220929002500.283481-1-bryan.odonoghue@linaro.org>
 <20220929002500.283481-3-bryan.odonoghue@linaro.org>
 <54a19490-aa0d-2dcd-8407-319d6167add4@linaro.org>
 <b36887f5-ffb8-1665-f959-be1e632e5206@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b36887f5-ffb8-1665-f959-be1e632e5206@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/09/2022 12:33, Bryan O'Donoghue wrote:
> On 29/09/2022 08:29, Krzysztof Kozlowski wrote:
>> As I said before, this still ignores reviewers. I don't think it is
>> going to good direction. The submitter is expected to CC
>> everyone/everything which is pointed by get_maintainers.pl except the
>> Git-fallback entries.
> 
> Isn't LKML considered optional at this point though ?

No, it's the only list for certain subsystems. If you do not cc it, the
patch might never get public.

Best regards,
Krzysztof


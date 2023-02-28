Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B357CC64ED6
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 00:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjB1AwH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Feb 2023 19:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjB1AwH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Feb 2023 19:52:07 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB80825E22
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 16:52:05 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id m3-20020a17090ade0300b00229eec90a7fso465993pjv.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 16:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8s5UkFxN0XyIVbUTdsw9LuY++h2yrQIvwFytCMmrlw=;
        b=c0/r4xm3kIsQ2Jwpl2m192HxOi7kIuvxJlwpCw38u+VEwUoONxMx+2qs1uLXOCjydX
         2LbhnU8dywiojN74erI1KyXuyFYPRJdsQl1goK7DcPl5Sipb0qRBq5ulFnzZ1VzKVgYT
         8YPGredZ0oHAq6gSDQ9HKIe8bmBQEaON4yWej2GQseOoXtPfUMGDLMq73zvuQ38uFJcR
         +BwmQdvaHbPp+i4V5Uhi+fAu7EjF7hT7zMOBPxFM/t6yrAcWlgcbT5J7Et/hI7nS+BVO
         9LFuQtJersMA2qTjc4ezrLiEjKxaf2ZzBG3t3F0fnhSAnFnQ3tngo1g16dXdohdHqIq/
         fWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8s5UkFxN0XyIVbUTdsw9LuY++h2yrQIvwFytCMmrlw=;
        b=LHwcfIaH24JN/+wLSG1p6sRZFPRCIVQdfOuLNWIlkmhQhcWIND5Hl+D/r5cYZYAXm7
         56vvUofKFKL9tixfvE7ZOSR1W8PiqifZ/Dc/A/OEqq50VXgdVyJrr1GGSI416ji+ketF
         CEqfqDrXDqOnLBpFR6UUxUXDPgt9zUXpJU33+hL0xZyblXNB8UruXIsI2ntX/MzqjC5+
         sHiot9qiYmA8XoPcU89TM9EHF3NDBkTuTMa+P8tXcmkdcWHQ+TpkoXoyhsmYnnNPjAsQ
         pQUrs/gA1WdzHXHmTZAhAStN+CAsJV3GlP/d0JWqVehtnZRhVNRF7BWCljdK+Z5yMfGe
         e4Kw==
X-Gm-Message-State: AO0yUKWGC8azzsEsbgChLuT0tgGg3cfCvGVAuv4KFz5vOgNmN6QsEkDy
        xQO6C3p0dw9sPviuR92w1qsybQ==
X-Google-Smtp-Source: AK7set+TQtVs8/qCCbDkDc4YM5iQhgpDnJ+EIymGMdWMWy3GdNnv8VYRETrDicOK331w/rirpzr9GA==
X-Received: by 2002:a17:902:d4cd:b0:19c:d7a9:8bf0 with SMTP id o13-20020a170902d4cd00b0019cd7a98bf0mr1618653plg.10.1677545525332;
        Mon, 27 Feb 2023 16:52:05 -0800 (PST)
Received: from [10.211.55.3] (h112.92.137.40.static.ip.windstream.net. [40.137.92.112])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902780500b0019a8530c063sm5176304pll.102.2023.02.27.16.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 16:52:04 -0800 (PST)
Message-ID: <e75b8b9e-c870-6342-f7e4-32492d5f77be@linaro.org>
Date:   Mon, 27 Feb 2023 18:52:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 08/26] gunyah: rsc_mgr: Add resource manager RPC core
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230214211229.3239350-1-quic_eberman@quicinc.com>
 <20230214212327.3310128-1-quic_eberman@quicinc.com>
 <d69f9699-b4d9-7a3a-71b1-7e6fe72c4f82@linaro.org>
 <94ebe2f0-0baf-21c0-45d5-c5bc4df9ad94@quicinc.com>
 <44a59ea4-da6e-e96a-5e89-dfd41db72823@linaro.org>
 <cd61963d-eb4c-9a4f-d48f-7a633bfd4be3@quicinc.com>
From:   Alex Elder <alex.elder@linaro.org>
In-Reply-To: <cd61963d-eb4c-9a4f-d48f-7a633bfd4be3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/23/23 5:13 PM, Elliot Berman wrote:
>> TBH, gunyah.c should be merged as part of resource manager, and check 
>> if uuids and features in probe before proceeding further.
>>
> 
> 
> Ah -- gunyah_rsc_mgr.ko has symbol dependency on gunyah-msgq.ko. 
> gunyah-msgq.ko has symbol dependency on gunyah.ko. gunyah.ko doesn't 
> have any probe and does all its work on module_init.
> 
> In order to merge gunyah.c with resource manager, I would need to 
> incorporate message queue mailbox into resource manager. IMO, this 
> rapidly moves towards a mega-module which was discouraged previously.

I missed this discussion; why was it discouraged?

I can think of some reasons why I guess.  But I don't see what
problem comes from linking together a "mega module" that's made
up of well-isolated source files that expose minimal APIs to
one another.  All inter-dependent modules will required at once
anyway; I don't understand the benefit of implementing them
separately.  Can you explain, or provide some context?  Thanks.

					-Alex


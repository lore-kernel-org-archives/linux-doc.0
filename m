Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D581FC6FA82
	for <linux-doc@archiver.kernel.org>; Tue, 13 Sep 2022 08:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbiIMIk7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Sep 2022 04:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbiIMIke (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Sep 2022 04:40:34 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46BE3DF26
        for <linux-doc@vger.kernel.org>; Tue, 13 Sep 2022 01:40:32 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id bo13so3045119wrb.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Sep 2022 01:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0zoWuvCgWu4ls1SKokP2SbGe8xuUJikmfcWhPEHtPYA=;
        b=EepqB84lbNoqzWAIP+E+fTAyWgXpANMPOYwlMBKfYNiOFsC3LJ+dd9aR7XtNLMYoW6
         4rLMYrNZIDFKecIG1YUlMgZT4OM+9nPKqVydK/uuj5KpG7bkpZIBoytccfVDe4G7pb39
         gWSp7xJdhwy9D6eYH8iZczD5yzrhE6cRuKadjUqtjvnQCwdChiOo5f3kFPuTm53P+rZU
         DQZ0mXN5sBtK/i4bOAX7iGVunuld/XnoH8pFNLzrIUZjjUn4pwNAeyKOrI/B81vxusjs
         50lirQO4lh4yznWi/s31sXl5IjU30MyfjxBGIWGZJmXsiiKCOd/vyVGQ5BkoHxHCCoWk
         9wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0zoWuvCgWu4ls1SKokP2SbGe8xuUJikmfcWhPEHtPYA=;
        b=L3fuPBal0xNBEQnXEak+hXwJ/lKrKqm//yrhuzEgfKQurPnIHU/V2uczafPZZN6rhz
         eGg/4EEpMFtJwidWalgsMs+WSEVfGpl2V+bTeeR7CQEqVizOfu8m9WKrnChErJXJWAUV
         yJRDe/0ngq1H59HcHQ8uLbHdol3nuFzhyufmt6+mw/+kWDeZATMIGCQ7HONrGlMbkUPe
         ywvyTb+nXmJPE7D1lDuFjNSQ8Ogj9vKEWDKwzoXW/O5f5plQBAGyPSaD5Wfx8lRe2dkQ
         guHK6tZrR+p9jxo3GaPoXv5gv4JyZxZarhb1LniJPNr+mVzznDfy/6ZwoNkZ0Eu1pLXT
         PDbg==
X-Gm-Message-State: ACgBeo1xSV/OZCoj9zxxKGciyav91xoJ88EVRJb8wsz/9nVjV0IW5Oah
        J7pvcP/TugBSLSBWUBLoH10c0Q==
X-Google-Smtp-Source: AA6agR4wjHWTsVfVYAgYeb4n3rmhbDY2maDTSxTXR5Pv3YiPF33VSRisqICPlujHBunO3GiXhY2Atw==
X-Received: by 2002:a5d:5987:0:b0:22a:46f5:1d95 with SMTP id n7-20020a5d5987000000b0022a46f51d95mr9254546wri.608.1663058431247;
        Tue, 13 Sep 2022 01:40:31 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id cc17-20020a5d5c11000000b0022ac119fcc5sm975613wrb.60.2022.09.13.01.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 01:40:30 -0700 (PDT)
Message-ID: <cc102d14-77a8-f97d-60c1-f0918656905f@linaro.org>
Date:   Tue, 13 Sep 2022 10:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] Documentation: process/submitting-patches: misspelling
 "mesages"
Content-Language: en-US
To:     Rong Tao <rtoax@foxmail.com>, corbet@lwn.net
Cc:     kernel test robot <lkp@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Erik Ekman <erik@kryo.se>, Jiri Kosina <jkosina@suse.cz>,
        Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_6A928C02229619E8099167DD5CCAA8D8BF0A@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_6A928C02229619E8099167DD5CCAA8D8BF0A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13/09/2022 07:11, Rong Tao wrote:
> Fix spelling mistakes, "mesages" should be spelled "messages".
> 
> Signed-off-by: Rong Tao <rtoax@foxmail.com>
> Reported-by: kernel test robot <lkp@intel.com>

What is here exactly reported by lkp?

Didn't you send a patch like that already or is this a v1? I saw
something similar...

Best regards,
Krzysztof

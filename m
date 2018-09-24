Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D06D07DE6F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 24 Sep 2018 05:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbeIXLfc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 24 Sep 2018 07:35:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52298 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727414AbeIXLfc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Sep 2018 07:35:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id l7-v6so3483707wme.2
        for <linux-doc@vger.kernel.org>; Sun, 23 Sep 2018 22:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z9R1aXWDdyaRlMfRGrp94QSZu/fyz5EfI5I6L2UcPxw=;
        b=F0A+IgX8KvCefyU4euLvooaN8cO+Z0pYMbkFBYMrjwVARWC0azKYZ4SdpFTUhsaGi8
         A6VyP3FiL1qHpmaymEvzUYH5q0i9Op5xgMz9NNjpzE4EgPk3xgJVKNwepYUgAc/kjLea
         jWMawZ9ALhUyFVxk/Osw8W0qusXqQ0HqRAh9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z9R1aXWDdyaRlMfRGrp94QSZu/fyz5EfI5I6L2UcPxw=;
        b=LrymWlwJvaYTmhc5FqfJxAej+nAQ73k63eipox/eZguNsvlfd6ADuaJQpbT5grPPdb
         IZztiinvr0W+4h5FZU+vTUWdAcnwiutg3Kn8xfuKItSm7zE+HTcz8Kdt4AgFUNaqr5jp
         yxjNxOKIzC0HSTTalLlQ0bwNpJqLaA+3XCw0hhB/pG9eQJn5BlF2WU0GuisHCaXww1ZF
         /W2PFtZWjGLiLmTLUMxplZyilKqFKe53pdmICT07kUneH94oMnmsdPtRE1+uT8MA6qHa
         wZhBavwXBtrmATXjodkCtKwnSASNOmQg5eO4WSAMB2U/FeebINcrN8emveIW5OtfViFq
         sruA==
X-Gm-Message-State: APzg51CIBxEo/szmNvAZtTwETfEBQnlBdZXwwi+TgoHXDswXG8elAXo6
        frC3D9LXffzbGp4Rx8BUQxGBoQ==
X-Google-Smtp-Source: ACcGV60TeS+4vcb6rH4dZXvnDjrJlrphbSBaoBASF7zbDuvGACWs16RYgXPlwsoESjE1xZsta9UP8g==
X-Received: by 2002:a1c:f210:: with SMTP id s16-v6mr4263888wmc.36.1537767307505;
        Sun, 23 Sep 2018 22:35:07 -0700 (PDT)
Received: from [192.168.0.41] (89.154.136.77.rev.sfr.net. [77.136.154.89])
        by smtp.googlemail.com with ESMTPSA id g2-v6sm2558997wmh.16.2018.09.23.22.35.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Sep 2018 22:35:06 -0700 (PDT)
Subject: Re: [PATCH v7 05/24] clocksource: Add a new timer-ingenic driver
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Mathieu Malaterre <malat@debian.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        od@zcrc.me, linux-mips@linux-mips.org,
        Paul Burton <paul.burton@mips.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org
References: <5ba8750a.1c69fb81.501e8.d0f0SMTPIN_ADDED_MISSING@mx.google.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <58645f14-aec2-4f66-3a39-34beeabdb035@linaro.org>
Date:   Mon, 24 Sep 2018 07:35:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5ba8750a.1c69fb81.501e8.d0f0SMTPIN_ADDED_MISSING@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/09/2018 07:24, Paul Cercueil wrote:
> Hi Daniel,
> 
> Le 24 sept. 2018 05:12, Daniel Lezcano <daniel.lezcano@linaro.org> a écrit :
>>
>> On 21/08/2018 19:16, Paul Cercueil wrote: 
>>> This driver handles the TCU (Timer Counter Unit) present on the Ingenic 
>>> JZ47xx SoCs, and provides the kernel with a system timer, and optionally 
>>> with a clocksource and a sched_clock. 
>>>
>>> It also provides clocks and interrupt handling to client drivers. 
>>
>> Can you provide a much more complete description of the timer in order 
>> to make my life easier for the review of this patch? 
> 
> See patch [03/24], it adds a doc file that describes the hardware.

Thanks, I went through but it is incomplete to understand what the timer
do. I will reverse-engineer the code but it would help if you can give
the gross approach. Why multiple channels ? mutexes and completion ?


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


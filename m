Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E63C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 16:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbiI3Qe2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 12:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbiI3Qe1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 12:34:27 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F50C14BB
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 09:34:26 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r6so7665714wru.8
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IOj8MIvs6pCG7xXKXbmV7p1W5+v6njgOUPKcDz49m4k=;
        b=pVmL8dBXSm4Lp6ViL6BaGqM6X4qvLQOoRsnv5ZsONOFiz9sOFT3cR4wjyz+mscsiZO
         VKxFdkGCmC4dIgF1lHCPH3HrTI4pCswtJWxBOwt+xRzdBKlG4mF1HDAOD/nxegNgnatE
         hrMIa+shyuZw4T54Q8cSN8hvoHx+qusYAkAtf9vS2FAdF6qWhuiUQbUeTAdXdLh6wnJI
         pP72Qe+odXYi249GEodS8u5Q25iPp29Fc56rR4AYsYYiPro4hXE7WzpUlHgIunKAFdkk
         5EJYWJD9PrTc7MbyzitucOuQ285VB/8J5LpL8I3u5bVm/VejGUHl7vSeELkVgIEvkIOI
         JdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IOj8MIvs6pCG7xXKXbmV7p1W5+v6njgOUPKcDz49m4k=;
        b=lWffAHfflWo02syS0Ir5LcD5wgXRZl9L7nIilQRAM3YgrHhPFd8wMfL4F/jpCS0PVq
         zyiXgjpq1JUfxCtAwaH/Lv7cJaHfBmG1mtDbiXBAFuvL1QJGX8ZHYI43CSYan9HDch4z
         vnne+C1BO1qqjGhq9E2Umx0V4W7PRarw+6oTzCPB1d2sGqyLy3tpccqWp/1zAT6DK2Hy
         jgRlT4FsUcFUy/SzNa7icS2bJXoQZtR5hOuDZU8qG0ezCUGcfRtsJDWlmcQfm3vXit4M
         bYruECcz/r7ZGWZJLsVHXnuDjH1Aed9CiHDcPdKCYhSMyM4GYCitT0bqTJG7tCVgbus/
         VI4A==
X-Gm-Message-State: ACrzQf0l+8rztXeVZELB7RCinVX7/DPPF5Gej59MWq4m59aufa5gQfnH
        U+0KstQ/6IwHJ20bTCF7ZOgQvw==
X-Google-Smtp-Source: AMsMyM4TQSpXmbz8VhmBdk9K2mkV5fYjpfglsjTdDgqWure4FATv6fee5pfir2IJikz/s5pEazZzXw==
X-Received: by 2002:a05:6000:2aa:b0:22b:1dd4:f72d with SMTP id l10-20020a05600002aa00b0022b1dd4f72dmr6898011wry.616.1664555665192;
        Fri, 30 Sep 2022 09:34:25 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d10-20020a5d6dca000000b0022917d58603sm2359777wrz.32.2022.09.30.09.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 09:34:24 -0700 (PDT)
Message-ID: <2be9c226-fe38-20f3-d620-6ea57d168c33@linaro.org>
Date:   Fri, 30 Sep 2022 17:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] Documentation/process: Add text to indicate supporters
 should be mailed
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     corbet@lwn.net, konstantin@linuxfoundation.org,
        krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@leemhuis.info, tytso@mit.edu
References: <20220930064629.329514-2-bryan.odonoghue@linaro.org>
 <21f8d79a-0ad4-b28b-15d8-f4be0cfd9730@gmail.com>
 <b119fee5-807f-1940-3378-f5ad638794f5@linaro.org>
In-Reply-To: <b119fee5-807f-1940-3378-f5ad638794f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/09/2022 17:18, Bryan O'Donoghue wrote:
> I guess all you need would be just a short notice along the lines of:
> 
>       "supporter" in the output from get_maintainer.pl means "maintainer
>       of a supported subsystem".
> 
> No?

Ah I see you are suggesting a document not a get_maintainer.pl edit, my 
mistake.

Yes, I'm fine to change the text to something like this if you feel it 
reads better that way.

I'd still appreciate some more eloboration/rationale on what you don't 
like about giving an example.

Is it the example in general you dislike ? Personally I find an example 
a useful thing but, that's just a personal preference.

---
bod

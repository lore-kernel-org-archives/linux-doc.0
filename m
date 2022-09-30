Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEA7C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 18:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbiI3SlU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 14:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiI3SlT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 14:41:19 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A9C110EC5
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 11:41:17 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r6so8137875wru.8
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 11:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=K/wUM4ocxdPQPd4OIa/gI/hhYcWvE/v6SP9Mth96aEI=;
        b=eUNAnTqIsSwB10rJdReAw+Wf9aSVB6pQEoXQnFIffMaicLIc1PQQJ4wRvDag2WLmet
         p9rFZ2FxBGoeNdBw/9fGeI9KkOECQpIY3KDSHW4fyTRFHigmCn6ojMSiMszAOJVP1Xb8
         34O4sToDM3S3evERRo9muFZdGjqkrNC/8p3hr1drWHJnib/h8JjdjGMQvA1fqVkin2yC
         67JhGoUpv4iXGBorK89iKfnWbhb5Ldg5VjkhCrA/7c3TQBzWGRCflKtO/8+33keccTYI
         K2TeUgF+MbNpjPSHm0O7dG6erasIRWYnTXMCwpzAy3xJF34Qtz0PD5ReviQ7DBFcovQT
         rG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=K/wUM4ocxdPQPd4OIa/gI/hhYcWvE/v6SP9Mth96aEI=;
        b=qYuILflfGzKi1uLqTiyO4wFOI7ldUG1pkjnH+Y1dexdHpci8dFLBfX2oApLM87USnH
         AMrSrpqzOaai/pB/8jicNhNmS0pLSdbcmRM2ZGKfxypGejjshLJXXS+cT2WzJkEiWMAM
         0+ffAWV+EEAEoRZFXZA1ExBUaMAwr142DzZ26rpRmbJlzCBELz7fm3LiU+p2r5EcZMhg
         0qlvEKB0LdyntpctoY6oye+qHzV6jKZ3S9K0bMc/pUON8AX+pyDYDOe1f/vI+AhqVnWm
         6L2Z1GYxpCs8zKU/n4Trzp8hWnk2PWtTfAVzbV6654e2hi1m9AFSEOM3g56aW+mS/4/I
         vq6Q==
X-Gm-Message-State: ACrzQf2BwkQz5Co1KYV8ZIO7FoMGqqqWUaMfW6WswIW2V56q9Ir2Ro1U
        uPXcgSkAAiE0YVEf1EVBZYzJOw==
X-Google-Smtp-Source: AMsMyM6blaLJoCHa+v9NEv7b/MCHAiEmhwrH2splatl9f8XphUZ2pA/KdZiwcDqpWzNmKSFJNZN+Dw==
X-Received: by 2002:a5d:6da9:0:b0:22a:f828:73b5 with SMTP id u9-20020a5d6da9000000b0022af82873b5mr6449997wrs.229.1664563276038;
        Fri, 30 Sep 2022 11:41:16 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c4b8600b003b482fbd93bsm7122132wmp.24.2022.09.30.11.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 11:41:15 -0700 (PDT)
Message-ID: <02223d7e-d514-bedb-2f74-f42482468fd2@linaro.org>
Date:   Fri, 30 Sep 2022 19:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] Documentation/process: Add text to indicate supporters
 should be mailed
Content-Language: en-US
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     corbet@lwn.net, konstantin@linuxfoundation.org,
        krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@leemhuis.info, tytso@mit.edu
References: <20220930064629.329514-2-bryan.odonoghue@linaro.org>
 <21f8d79a-0ad4-b28b-15d8-f4be0cfd9730@gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <21f8d79a-0ad4-b28b-15d8-f4be0cfd9730@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/09/2022 15:47, Akira Yokosawa wrote:
> I guess all you need would be just a short notice along the lines of:
> 
>      "supporter" in the output from get_maintainer.pl means "maintainer
>      of a supported subsystem".
> 
> No?

Oh and I forgot to say, Krzysztof suggesting listing the entire set of 
those who should be mailed and not confining to maintiners and 
supporters only and TBH I think he was right.

Reviewers, sub arch mailing lists, and in some cases LKML are all required.

We should state that more clearly.

---
bod

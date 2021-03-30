Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B804CC433DB
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 08:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DC9261989
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 08:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbhC3Ivf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Mar 2021 04:51:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37064 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbhC3IvR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Mar 2021 04:51:17 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lRA5k-0004tW-ND
        for linux-doc@vger.kernel.org; Tue, 30 Mar 2021 08:51:16 +0000
Received: by mail-wm1-f71.google.com with SMTP id i14so417073wmq.7
        for <linux-doc@vger.kernel.org>; Tue, 30 Mar 2021 01:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=djVlT/RAmq6AwtihToV3c2qx0PjKLnFe2UuBJ80EzkM=;
        b=VuszKKPevqLI22sRwY0oFRXTQ97qTFh8ZVUN+XPfvIuaUdZmXX06K+4o9wwlUvMEH6
         vLmEYH4GdqNd9Hg+tJbGRn6XvB/bSSHF50jle2ratyuZXwvaDMr8IorkE9FgtIt6Eez0
         mM0/NzZGV9fEls9QAEzkQV/hEfCeUSMn0rbFOJ+wOX9I+vhKSQ69/aMokE9ZsVuVSug0
         c/20smZynrq2ubUrYLKSsXvE+dfpI5KLeYNkhsF2dvwyO3FRd7Gp5kz1OSWEjfBZnGxa
         PA2PrFf3gGuLUoF+D9dndqniQ1475g5I+OlvEDqAqT8LJrJjT57Qj+JqBqAkB1fCrzV5
         tbhg==
X-Gm-Message-State: AOAM530rsgIEN0qOyAANEsScgZ6dv+RIjnrcybCJ7frRY6vrGTgkwxIh
        SVoIEyVbZiRP4cOGz/1lIT/VOsF6PEhOjvz4E9tlHe2RJtEpZOZi4K7fBYHgxV8+hRuu0tK11uB
        JMJi9cJaHgYW1vZVK4g/nAWScKHY1I4B5QU4KIw==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr2898595wmc.90.1617094276514;
        Tue, 30 Mar 2021 01:51:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMM+kQaqpCWb0b7OW+orw77+hmaUElyaV7pasIVj3HsWg6jELlm0lBduYBq4l8/WLCYe23Ww==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr2898587wmc.90.1617094276417;
        Tue, 30 Mar 2021 01:51:16 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id l6sm34969120wrn.3.2021.03.30.01.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 01:51:16 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc3: exynos: fix incorrect kernel-doc comment
 syntax
To:     Aditya Srivastava <yashsri421@gmail.com>, balbi@kernel.org
Cc:     lukas.bulwahn@gmail.com, gregkh@linuxfoundation.org,
        rdunlap@infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329140318.27742-1-yashsri421@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b341b0a5-4f78-d986-d038-8e067bf5d34e@canonical.com>
Date:   Tue, 30 Mar 2021 10:51:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329140318.27742-1-yashsri421@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/03/2021 16:03, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/usb/dwc3/dwc3-exynos.c follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> "warning: expecting prototype for dwc3(). Prototype was for DWC3_EXYNOS_MAX_CLOCKS() instead"
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.

One sentence with error log would be enough for such trivial change. Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof

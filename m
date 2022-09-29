Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1083BC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 09:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbiI2JnL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Sep 2022 05:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbiI2JnL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Sep 2022 05:43:11 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9360F122A7D
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 02:43:09 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x18so1277071wrm.7
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 02:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=urTVIrWloEhuN9BRo3MjHeH2nBIGra4s73hlS3mUcXs=;
        b=BAE+FtXdUy+seg9gFStYIDEyQ8AeUSklQB9i6hVLbqDDZ1+ldY/ZbFFLfwNKhD5QtY
         kElCX0Air2B/jaqt6J690g0Ayz0tBBSH9pWwJJuwfjbr+N5nLBaYZ2twetXtARBa53N8
         5iTL7r2t+D4/I+RCwm+0X43DyhpKvgmtmHKn8FHXsN0oDI9MMHEENHUkIneEJVCMucan
         uXvdtR0VGJY5EALLixmjB7qpTSLO8CZQdbMeSMARrl/0e3hGPbxZMS5kh4rdT/a4x7Qx
         dYuDHkLHai6y7xsX4Lt4DCjrDZaJ/jSP8C014IxdQUkwvj+HyoXXnhRSe6mVqWWksvLZ
         tcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=urTVIrWloEhuN9BRo3MjHeH2nBIGra4s73hlS3mUcXs=;
        b=1IZpG2iKaTjwY5nAUZ8GPf/+tVKm5l8HlkVOir+38e5RSErjDCAOQAMzg2ikgFNQzY
         0iZqVZUkv4oubNvQosp/1yCRcyQCzYYfUcUG+5c66YQIFOg3iEuysRkoYxhm5XBFSi+B
         G7ELvfPQOQwjFBg3UnA4o7PmnnA4r+nKVvVFZtU4tiJqAWKasbiSiNskqfDb7+BAJrjh
         QwOV5ExK6LOKh4305rl8j7VoWNNLzLgbCPJJOwjk9VwmM1z+5ooD8+6fKzigJcYb4u6Z
         HlYFgCCRa6bq9Qev/VyFK0fH4Ba38kev7dU83hPkj6w5Li1arE/DY5bjmx+M1Owofe1i
         Ik9Q==
X-Gm-Message-State: ACrzQf3XfCFBrtOQwUXExojjjtN2/LzJyiyPymg9P8aYY4KMlyfg5ixL
        Qgeh2HYzochZgWgdEdRj1SBrtA==
X-Google-Smtp-Source: AMsMyM7xAkmOivq3RrYULkpZFdERGOaKNGhBNFZyKYoMpD3aPZKwAb1MSzF90ilJ+I79JHbnC6Z6Lg==
X-Received: by 2002:adf:f8ca:0:b0:226:e456:1896 with SMTP id f10-20020adff8ca000000b00226e4561896mr1548503wrq.177.1664444588108;
        Thu, 29 Sep 2022 02:43:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:c9dd:4896:ac7a:b9e1? ([2a01:e0a:b41:c160:c9dd:4896:ac7a:b9e1])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c3b8200b003a540fef440sm3966571wms.1.2022.09.29.02.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:43:07 -0700 (PDT)
Message-ID: <06ab9e40-8a90-6c87-81fa-515a9c6c2290@6wind.com>
Date:   Thu, 29 Sep 2022 11:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next 1/6] docs: add more netlink docs (incl. spec
 docs)
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        robh@kernel.org, johannes@sipsolutions.net, ecree.xilinx@gmail.com,
        stephen@networkplumber.org, sdf@google.com, f.fainelli@gmail.com,
        fw@strlen.de, linux-doc@vger.kernel.org, razor@blackwall.org,
        gnault@redhat.com
References: <20220929011122.1139374-1-kuba@kernel.org>
 <20220929011122.1139374-2-kuba@kernel.org>
From:   Nicolas Dichtel <nicolas.dichtel@6wind.com>
Organization: 6WIND
In-Reply-To: <20220929011122.1139374-2-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Le 29/09/2022 à 03:11, Jakub Kicinski a écrit :
> Add documentation about the upcoming Netlink protocol specs.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

[snip]

> +Attribute enums
> +---------------
> +
> +Older families often define "null" attributes and commands with value
> +of ``0`` and named ``unspec``. This is supported (``type: unspec``)
> +but should be avoided in new families. The ``unspec`` enum values are
> +not used in practice, so just set the value of the first attribute to ``1``.

[snip]

> +The payload of the attribute is the integer in host order unless ``byte-order``
> +specifies otherwise.
> +
> +.. _pad_type:
> +
> +pad
> +---
> +
> +Special attribute type used for padding attributes which require alignment
> +bigger than standard 4B alignment required by netlink (e.g. 64 bit integers).
> +There can only be a single attribute of the ``pad`` type in any attribute set
> +and it should be automatically used for padding when needed.
This answers my question.

Nice job!

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DB7C6FA82
	for <linux-doc@archiver.kernel.org>; Wed, 28 Sep 2022 06:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbiI1G7X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 02:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233391AbiI1G7E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 02:59:04 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F517C77D
        for <linux-doc@vger.kernel.org>; Tue, 27 Sep 2022 23:58:56 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id b6so13288792ljr.10
        for <linux-doc@vger.kernel.org>; Tue, 27 Sep 2022 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Qu/VhJX92VKSX7l7z4v5PEDwp2MN2vUwxA8YDbW68bI=;
        b=huE5HIYJVftNh0Ht149pZrcZeVpIRE7lwIVErV+J8poZ0DN6ypAtmdgke01Au2FIsM
         V3lQMuxJwd6/tjGrUhFMPNu0xVPkjIWDDkzrX/NyjvCkVZ5f6nuGbBlILnLk5pMzRHlb
         RDlmtN/FyP79gtSnkhf5uMbkaFXcOo0AhhbK7/YXVhdg6rcQy1sOvH3FFRdw4oUEdzTc
         8KjDuJBjO9uCKLXvxbWnDrJF2Tm3Me6ZHXfc0FRo0SQ2GF3++ApWiTX1xcwcJWaBYwwi
         Yz4DXEDYhxDsUkaegv4rY8awqArRT9xXXgIlTC7oNk6TF2vXVCBDOWl9wShz3houGgzQ
         ddBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Qu/VhJX92VKSX7l7z4v5PEDwp2MN2vUwxA8YDbW68bI=;
        b=hdVwCEw3ATmH7OQnfCunPlDHnxYH4AtP6I/RymxApPatUUnK7h5p4s0rYeH2elGI6b
         SM/MBR8rUP49OhZKsrFYUufCzt8SZUG4NwcXLdXYeL3arlsoQEyh1sI1sLj1wiclbQzY
         x9LsCUtCHnsoMFnV8uWsIYE4A8GaqBsS/l2hoezH11Z8U6gzxdxAnbkmBPWvsj0S8VlW
         JB2gq1kVI36M90dyVhuFKtxl14yA41ZV9jsKvf/PvT3irUQB4Isxospco/SC23PPhOse
         1H/G2XG+tCRyPFojDMWHptd5sXTI6s9Vqep3CnSkuJK/H5h96H04NgR8LeT7Y1nLGsDo
         Bd3g==
X-Gm-Message-State: ACrzQf0qnC+SxWmub1ylCfNIYyNLv7CfrRnjRD4ytvHiRc2q8WaqF/5q
        ehrB1jwigJVfu8coQtTjQXF4LumFc6DBbA==
X-Google-Smtp-Source: AMsMyM5EQEAIm3/ZUzrpf8ztO/R91GxLCmyhIVlFSiK9YN6SkEdDDvuYoxqffnMejtH1y+ttQwmvXw==
X-Received: by 2002:a05:6512:c0f:b0:49b:1e8c:59fd with SMTP id z15-20020a0565120c0f00b0049b1e8c59fdmr11920138lfu.426.1664347987465;
        Tue, 27 Sep 2022 23:53:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020a2e84cc000000b0026c41574790sm358109ljh.30.2022.09.27.23.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 23:53:07 -0700 (PDT)
Message-ID: <f74a9883-3a9b-8606-b20d-f046835fb827@linaro.org>
Date:   Wed, 28 Sep 2022 08:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] Documentation/process: Add text to indicate supporters
 should be mailed
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, corbet@lwn.net,
        linux@leemhuis.info, konstantin@linuxfoundation.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20220928003006.230103-1-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928003006.230103-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/09/2022 02:30, Bryan O'Donoghue wrote:
> Recently when submitting a yaml change I found that I had omitted the
> maintainer whose tree the change needed to go through.

Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index be49d8f2601b4..5f97379da41da 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -227,9 +227,11 @@ You should always copy the appropriate subsystem maintainer(s) on any patch
>  to code that they maintain; look through the MAINTAINERS file and the
>  source code revision history to see who those maintainers are.  The
>  script scripts/get_maintainer.pl can be very useful at this step (pass paths to
> -your patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
> -maintainer for the subsystem you are working on, Andrew Morton
> -(akpm@linux-foundation.org) serves as a maintainer of last resort.
> +your patches as arguments to scripts/get_maintainer.pl).  You should mail
> +everyone who appears as "maintainer" or "supporter" in the
> +scripts/get_maintainer.pl output.  If you cannot find a maintainer for the
> +subsystem you are working on, Andrew Morton (akpm@linux-foundation.org) serves
> +as a maintainer of last resort.

That's still a bit misleading, because you should also send the patch to
reviewers and mailing lists. :)

Best regards,
Krzysztof


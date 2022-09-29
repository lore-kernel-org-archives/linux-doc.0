Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8357C07E9D
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 07:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbiI2HaA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Sep 2022 03:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235248AbiI2H35 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Sep 2022 03:29:57 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27C11EAF1
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 00:29:51 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id l12so585043ljg.9
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JPYvy93CWgU2khSZYKN1aQzD3T4YNwYIBEs2RfQWO6s=;
        b=eflHmrY61qGstkuuycwzkkokq1KLWpHwYjIMMlKpXiQ8GqSNY+CEOoVDZXH8Dee3Ai
         kGXlIJZ6FoR35MldQu5RlYEHE1SEl9muYv9gU75bTZytOVlCCmTzHr7UkyXWsdo6Z7sg
         GpgwIM6kvLDGICTMggA5vL/0eyYL/lQS0tdAtDsVLyEVqL/4cGMmIqQO29eKV0JKXVd7
         cxl2swx7EYJNb3cq8YQDG+l/N6KHirAjHs7HiBwX+a60rypw5/S6WWOXdPZhw0SLbWHL
         YZBnk8I2GJKpDWnnU/N18yWjd1cycSfkylV18XBS5xInDdx2jLOdKBymyEtgfx7dr7kQ
         +4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JPYvy93CWgU2khSZYKN1aQzD3T4YNwYIBEs2RfQWO6s=;
        b=jzn40N2itBhAHi4nnS6GTUuLFb3aclx4YX60vRHHjzJBU4pTpvIMR1l/gkc/HnEpwg
         r0wLJTjJyzGfzH0ZEZyaO3P4RZG3eoVxY0ZQPPDuFLh/advnbmEbrsELu52C6IlSp4Sq
         +BpZpy5W6l8Ww0C9dKVa6zAxEWuAwsHkputbmpQWoKRsROYZ8TAsmRDAIGyxBIBuCgqq
         b4sL1XwiX1JB56UMS7dCCK70Ad6Z8NFz04qCXZIblvmdjeXSpkh5sGTEYsvarU5YUH7W
         NF++A23+3UMySd2QO0EYnFh3yrjN8T/ir3gd/jhW91vPLqwOdCOhmlozSzN/tQ/6nAH7
         h5tA==
X-Gm-Message-State: ACrzQf3g4OoMU58HWt84bb7ZbtctRB4ffeqYB9+BHHiCWCEd7j8k6EMg
        /F8/u3oaqC7tcxTODNL5cKnj2g==
X-Google-Smtp-Source: AMsMyM6yXJn7Jim8QVPeAMyRjqVkElY9pE5G2ZV9AlrnuwNiIJ7ihQSMZWBVmIMkk6jjwxJhA1+nNw==
X-Received: by 2002:a2e:9d94:0:b0:26b:de12:7c9 with SMTP id c20-20020a2e9d94000000b0026bde1207c9mr634387ljj.244.1664436589835;
        Thu, 29 Sep 2022 00:29:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e2-20020ac25462000000b0049fe6f36880sm706195lfn.51.2022.09.29.00.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 00:29:49 -0700 (PDT)
Message-ID: <54a19490-aa0d-2dcd-8407-319d6167add4@linaro.org>
Date:   Thu, 29 Sep 2022 09:29:48 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929002500.283481-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/09/2022 02:25, Bryan O'Donoghue wrote:
> Recently when submitting a yaml change I found that I had omitted the
> maintainer whose tree the change needed to go through.
> 
> The reason for that is the path in MAINTAINERS is marked as Supported not
> Maintained. Reading MAINTAINERS we see quote:
> 
>            Supported:   Someone is actually paid to look after this.
>            Maintained:  Someone actually looks after it.
> 
> The current submitting-patches.rst only says to mail maintainers though not
> supporters. When we run scripts/get_maintainer.pl anybody who is denoted a
> paid maintainer will appear as a supporter.
> 
> Let's add some text to the submitting-patches.rst to indicate that
> supporters should similarly be mailed so that you can't do as I did and
> mail every maintainer get_maintainer.pl tells you to, without actually
> mailing the one supporter you need to.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/process/submitting-patches.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index be49d8f2601b4..aabccaea93375 100644
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
> +everyone who appears as "maintainer[volunteer]" or "maintainer[supporter]" as

As I said before, this still ignores reviewers. I don't think it is
going to good direction. The submitter is expected to CC
everyone/everything which is pointed by get_maintainers.pl except the
Git-fallback entries.

Best regards,
Krzysztof


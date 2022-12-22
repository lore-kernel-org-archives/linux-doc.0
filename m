Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D50AC001B2
	for <linux-doc@archiver.kernel.org>; Thu, 22 Dec 2022 14:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbiLVOUs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Dec 2022 09:20:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiLVOUr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Dec 2022 09:20:47 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658A7110F
        for <linux-doc@vger.kernel.org>; Thu, 22 Dec 2022 06:20:45 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id x22so5195440ejs.11
        for <linux-doc@vger.kernel.org>; Thu, 22 Dec 2022 06:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0VrLN7ReTiwyFyH6raxJVPW+7ZqprbBaTbgFuBLlhM=;
        b=FNQNThLxl6dYeyRcypE1Wb/0gAAdVIup4nGRAQFlKXw8GsLHJxFTiv3rZh/dSGtNpj
         UoSBUSvs01CFyVaRG5I3hnbEGjtL5C1MaL9pVYSj6N0TZ2RQTM3X3c4uxyJTYpBM31sW
         /v1DktRiKjecXCs9U7gbxS6RxnAlabfTbJ7GNkzgSoYlqAtus3pr+ZXj+VwkJmmfYCFJ
         uXcfdYcLvmRHvTkiz4tyAc9cP4OjsHG8mVAiO3OO7v27YN0p7+mt9WMlPI0kcA7TywCN
         Ndjg6WaPX8hoSexAXMQUFiWHBjaNSVbRm38REOjDzbfXoXFPSGv5XNuDU8ZVPzVkagkw
         f4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0VrLN7ReTiwyFyH6raxJVPW+7ZqprbBaTbgFuBLlhM=;
        b=rrb76cbJSRdpW0oaJEuoAiBHootstmDCL3965fXDxJKJJ/vRjoh6wpq12e/9sGo0FI
         KjVyclPsmJGKMC1KyNyFpRp6ffDp/1NXYyhgfc0PjxUGVXOEgaLIJHAVNzFj2KbO+iIZ
         CTTiYhtG8Am6g4/hgzHOyQKgmq0S4UqVoYqAHqiXDiyo+Xpg8LBKfQYTCfapS0jP6+JJ
         iu0Q/H+tBtDIpuBU7Z0tgeQzdO6PixeyF9/xrdK2iGMvKOacEihi8qrQrdtGTP6I4jcY
         MnXSje27c4/An9AsBHg3pk8/UrBVDVqS7ru/4+CuNQUGF99ktFmVabHSZ96rFsX9fOuz
         cpPQ==
X-Gm-Message-State: AFqh2ko06hTmKtFm45QPqYPaapHqQ087eBKNbInSk5pEkifTySGFVx/N
        ad8tDMnpC3YvYVW9r/X6iJwCZurZkxl2pavw
X-Google-Smtp-Source: AMrXdXuCxILt4Fs1n68sHksTQWcVTaD7koX4UFAdmbC4PzMLB6vMG1r8Uldc8TuybgNHW7U4PRDX6Q==
X-Received: by 2002:a17:907:d681:b0:7c0:eb38:f8af with SMTP id wf1-20020a170907d68100b007c0eb38f8afmr4881131ejc.2.1671718843921;
        Thu, 22 Dec 2022 06:20:43 -0800 (PST)
Received: from [192.168.0.104] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id x20-20020aa7d6d4000000b0047b252468a4sm415718edr.78.2022.12.22.06.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 06:20:43 -0800 (PST)
Message-ID: <86b513b7-b65f-4948-7c09-789844f0d90d@linaro.org>
Date:   Thu, 22 Dec 2022 16:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] Documentation: stable: Add rule on what kind of patches
 are accepted
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     sashal@kernel.org, corbet@lwn.net, stable@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        joneslee@google.com
References: <20221222091658.1975240-1-tudor.ambarus@linaro.org>
 <Y6RchEaXUvg+9nKv@kroah.com>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Y6RchEaXUvg+9nKv@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 22.12.2022 15:32, Greg KH wrote:
> On Thu, Dec 22, 2022 at 11:16:58AM +0200, Tudor Ambarus wrote:
>> The list of rules on what kind of patches are accepted, and which ones
>> are not into the “-stable” tree, did not mention anything about new
>> features and let the reader use its own judgement. One may be under the
>> impression that new features are not accepted at all, but that's not true:
>> new features are not accepted unless they fix a reported problem.
>> Update documentation with missing rule.
>>
>> Link: https://lore.kernel.org/lkml/fc60e8da-1187-ca2b-1aa8-28e01ea2769a@linaro.org/T/#mff820d23793baf637a1b39f5dfbcd9d4d0f0c3a6
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>   Documentation/process/stable-kernel-rules.rst | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/process/stable-kernel-rules.rst b/Documentation/process/stable-kernel-rules.rst
>> index 2fd8aa593a28..266290fab1d9 100644
>> --- a/Documentation/process/stable-kernel-rules.rst
>> +++ b/Documentation/process/stable-kernel-rules.rst
>> @@ -22,6 +22,7 @@ Rules on what kind of patches are accepted, and which ones are not, into the
>>      maintainer and include an addendum linking to a bugzilla entry if it
>>      exists and additional information on the user-visible impact.
>>    - New device IDs and quirks are also accepted.
>> + - New features are not accepted unless they fix a reported problem.
> 
> No need to call this out, it falls under the "fixes a problem" option,
> right?
> 
> The goal is not to iterate every single option here, that would be
> crazy.  Let's keep it short and simple, our biggest problem is that
> people do NOT read this document, not that it does not list these types
> of corner cases.
> 

When I read the document I thought that new features are not accepted
at all, so I took into consideration making a custom fix for stable.
But that would have been worse, as it implied forking the stable and
would have made backporting additional fixes harder. An explicit rule
like this would have saved me few emails changed and few hours spent on
looking for an alternative fix. But maybe others find this a
common sense implied rule and you won't have to be summoned for it
anymore.

> So thanks for the patch, but I will not accept it.
> 

Okay, as you prefer.

Cheers,
ta

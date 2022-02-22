Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250FFC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 22 Feb 2022 18:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbiBVS73 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Feb 2022 13:59:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbiBVS73 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Feb 2022 13:59:29 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0564A151344
        for <linux-doc@vger.kernel.org>; Tue, 22 Feb 2022 10:59:03 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id l20-20020a0568302b1400b005af8c95bbe4so422895otv.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Feb 2022 10:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sr0bZ/IYx5fNgYIhrtES2Y53AQkSGkgSrNO7ZdZIC3Q=;
        b=ZhqRZL1lIFwgAvx2B1EAPpwJgojg1Hi42R0xhoNL9F+8ADtR+J+GLx8Dyemeyz07bb
         AKCjA1lLb6wiFn0GLKn2i3cUZpz9QhYKsXQb2P3c0cF5wyU9nt1sdZKqoWYXpR5HGLV0
         cTFEGK5CmTSsZ2zEhqU4IKtoLYMINfiFDTJr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sr0bZ/IYx5fNgYIhrtES2Y53AQkSGkgSrNO7ZdZIC3Q=;
        b=j7OBFQvtk/tgT/94BfLUMKh0/2W7dCv872NHo0y89UtuQHDqe3fUj1qGWzOQJkh7rD
         asibSvKVeopwOZKdb2zi6JAQC+nctMUIH6zDyVkQ2v8hzG5zvZfg1gLsl32HRVRmOA6M
         vY1mtwjcL/OCY7k/iP1XBMg6aB4nh2fBxeCwA5FO7nzN9asoB1/uooY3juHF68vla3T2
         vSSYYlARgZ86LS486vswHuo3fATjf4O8N+dDLKTRA7XdBbR3Ory3rYYJAYE5tPUzs6K2
         4u0ZBUEqpmkFbYndGVQjhV1+C50VkJ1O/53hFFgwI1eeiVFLT879JY+Tf+0Nr+kPRaHq
         w4Jw==
X-Gm-Message-State: AOAM533kHCJmxQOX2obncPQQx7cVooGNphLAgmGlsrvHjTwcUNTqNjzI
        T7nUuvy8LayZBGwZ31W402P93A==
X-Google-Smtp-Source: ABdhPJx43lTtrcAsV/EG4qlYsVml8Jq/qj9Hd4Y/C+i0e4zg3+UpdjivGCQxjYv7vBO59tVaan2CtA==
X-Received: by 2002:a9d:715c:0:b0:5ad:3858:4d54 with SMTP id y28-20020a9d715c000000b005ad38584d54mr6872077otj.214.1645556342321;
        Tue, 22 Feb 2022 10:59:02 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id p13sm8964946oiv.23.2022.02.22.10.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 10:59:02 -0800 (PST)
Subject: Re: [PATCH 2/2] Documentation/vm/page_owner.rst: fix a phrase
To:     Yixuan Cao <caoyixuan2019@email.szu.edu.cn>, corbet@lwn.net
Cc:     akpm@linux-foundation.org, sfr@canb.auug.org.au,
        hanshenghong2019@email.szu.edu.cn, vbabka@suse.cz,
        georgi.djakov@linaro.org, weizhenliang@huawei.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220220082932.2808-1-caoyixuan2019@email.szu.edu.cn>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f27d2965-bd4d-bad3-4137-09c7f4214bd9@linuxfoundation.org>
Date:   Tue, 22 Feb 2022 11:59:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220220082932.2808-1-caoyixuan2019@email.szu.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/20/22 1:29 AM, Yixuan Cao wrote:
> I think that using "by default" will be better.
> 
> Signed-off-by: Yixuan Cao <caoyixuan2019@email.szu.edu.cn>

While you are at it could you fix others as well:

> ---
>   Documentation/vm/page_owner.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
> index 2b54e82b9fe1..5ac1c12fcfc2 100644
> --- a/Documentation/vm/page_owner.rst
> +++ b/Documentation/vm/page_owner.rst
> @@ -26,7 +26,7 @@ fragmentation statistics can be obtained through gfp flag information of
>   each page. It is already implemented and activated if page owner is
>   enabled. Other usages are more than welcome.
>   
> -page owner is disabled in default. So, if you'd like to use it, you need
> +page owner is disabled by default. So, if you'd like to use it, you need
>   to add "page_owner=on" into your boot cmdline. If the kernel is built

page owner is disabled by default. So, if you'd like to use it, you need
to add "page_owner=on" to your boot cmdline.

>   with page owner and page owner is disabled in runtime due to no enabling

with page owner and page owner is disabled in runtime due to not enabling

>   boot option, runtime overhead is marginal. If disabled in runtime, it
> 

With these fixed:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

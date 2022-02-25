Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D21C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 25 Feb 2022 21:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiBYVpt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Feb 2022 16:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiBYVps (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Feb 2022 16:45:48 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18391EF35E
        for <linux-doc@vger.kernel.org>; Fri, 25 Feb 2022 13:45:15 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id c14so5371110ilm.4
        for <linux-doc@vger.kernel.org>; Fri, 25 Feb 2022 13:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GlfIBSqlGvtgBv75Rg1rA8MquMPJgcWiel0j8isuYbQ=;
        b=HLrWX91wZAju9leNV7HFPStLOTDTKTykc0vJTupccN3o3/OiwP19YNo6Qzp1zeF9iD
         ySamRLGUmUYo7kRYhJG/V0jfmkCyf0d/RpuJNgm+9j17cf7ewVM5FPh3eQ84me4uAq3l
         S8XVO2DI41apmljHGwvmrhoJMRDM4MwtWny+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GlfIBSqlGvtgBv75Rg1rA8MquMPJgcWiel0j8isuYbQ=;
        b=Aocof3GC6nu6T+PpaQdK6KoUmiyBXGjaqgGcYzVuYzDsGQBdElQDap5agH54BFDbcg
         Nv2hihMj4l38wCKG+KJKTFQWGhAuFZguSNV8ydVsqwBa7HELQaBbryNYFrMhtic/+p7b
         UMuwDxDaR2gPu3gea07latO7j/bAl5ojnO49JP7iY8C/yPaTZlUjXP1zkKYYxIBp+Biv
         yA1dwfuoCwhOxku76rkt9+rU+UWxamWNTCxBur0DzWOg0Km8WUcvhsSSU3gEI/CSZ3pi
         QP7bI1ra4v/XYZ8XMNKhpOjDQkTOwHtnry/wlFBvzxNmJn/t5MzT0tT+e00ixZcInnyo
         LLtg==
X-Gm-Message-State: AOAM533HJXydJSUnGRMIgI1xnkpPMyWnJbXWscJR3BReeVnY5+mwX6QM
        CXGGLxogFB3BpHj1e8aBPOQZtQ==
X-Google-Smtp-Source: ABdhPJzjQSzxBomZ267t53/TYFeVaTmMzeMKuCTgGRpRcjfFDZWL3xDvV1iuoyl5WamEe6X7iVBpaA==
X-Received: by 2002:a05:6e02:12c1:b0:2bf:2a61:9848 with SMTP id i1-20020a056e0212c100b002bf2a619848mr8166860ilm.109.1645825515032;
        Fri, 25 Feb 2022 13:45:15 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id o4-20020a92c044000000b002c1e884226asm2313784ilf.12.2022.02.25.13.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:45:14 -0800 (PST)
Subject: Re: [PATCH] Documentation/vm/page_owner.rst: fix the description of
 "-f"
To:     Yixuan Cao <caoyixuan2019@email.szu.edu.cn>, corbet@lwn.net
Cc:     akpm@linux-foundation.org, broonie@kernel.org,
        weizhenliang@huawei.com, georgi.djakov@linaro.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        hanshenghong2019@email.szu.edu.cn,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220225090824.2343-1-caoyixuan2019@email.szu.edu.cn>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <73c74276-3c29-e662-cb96-c09fbba0d2b1@linuxfoundation.org>
Date:   Fri, 25 Feb 2022 14:45:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220225090824.2343-1-caoyixuan2019@email.szu.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/25/22 2:08 AM, Yixuan Cao wrote:
> Few days ago,
> I noticed that in tools/vm/page_owner_sort.c,
> there is a comment that need to be fixed.
> 
> In function usage():
> "-f Filter out the information of blocks whose memory has
> not been released."
> 
> This comment does not match the actual function, the "not"
> should be removed. As a result, I submitted a patch to fix it.
> 
> Similarly, this document should also do the same
> modification, that's why I submit this patch.
> 

Please refer to a few change logs to write them so maintainers
don't have to fix them. This can be written as:

"Fix function usage information for -f option"

> Signed-off-by: Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
> ---
>   Documentation/vm/page_owner.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
> index aec1906976f4..32ca54757d3f 100644
> --- a/Documentation/vm/page_owner.rst
> +++ b/Documentation/vm/page_owner.rst
> @@ -78,7 +78,7 @@ Usage
>   
>   2) Enable page owner: add "page_owner=on" to boot cmdline.
>   
> -3) Do the job what you want to debug
> +3) Do the job what you want to debug.
>   
>   4) Analyze information from page owner::
>   
> @@ -126,4 +126,4 @@ Usage
>   		-c		Cull by comparing stacktrace instead of total block.
>   
>   	Filter:
> -		-f		Filter out the information of blocks whose memory has not been released.
> +		-f		Filter out the information of blocks whose memory has been released.
> 

I can't find this in Linux 5.17-rc5 - is this patch based on linux-next?

thanks,
-- Shuah

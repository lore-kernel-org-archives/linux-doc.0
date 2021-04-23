Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A177C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 18:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F06936145A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 18:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243809AbhDWSzB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Apr 2021 14:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243785AbhDWSy6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Apr 2021 14:54:58 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78D7C06174A
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 11:54:21 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id e12-20020a056820060cb02901e94efc049dso5936767oow.9
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 11:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=abyxrDpf8quP494cqGplvRwk8yBbw5wFz8NguBxzYzM=;
        b=Bc40y+tLssiVJSMxu7nVGKBEnRyOtQ0AMSx911TMe/HR+aVEUHSEZeJ/tV1oZmpBxT
         SHiKK/b70jZ9d+6Ckulm9RmU1pjpVauHC3CUkvTcomG6d2nbCmi1q0j4f2SK9fN0NiLb
         cJ9zK7bXOGFX7NT3y8r7wTPgj5Ox6SlcIDLy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=abyxrDpf8quP494cqGplvRwk8yBbw5wFz8NguBxzYzM=;
        b=PPCvNV6wgjz8+0200HG/MRUWox5+zec1XOFQAnjmpHSuSpD1Y6n+yXaQG4jmSueifY
         5QWYyf2aAmXyoT/2NzCtIipPGwd7/j6QZZIYXyWMQmijAcPxV7L2nHc/dTtTqMnlrN7Q
         oPe9y0Z/KOsFe6s+uSGrmIhkbcvrubWlEVIewg4o8S+wOFdM6efMkcs2mpKHeRRQjmna
         Z6u/W5UHF6b3q6Kjt6IR3Hj9Oe9qh7/JHOGT+ikcgzBJpQngt6zU7G0Ki44sAjGQb0hr
         mdTDfl6cr2NAmqS/l9ASC6WylGYycZGL1vcZOq/6K+kmP2IdXbnw/Gkea9ocix4nltNu
         ztAQ==
X-Gm-Message-State: AOAM532DwawRkK+fcgCkF+YWvz5KWHapWH+D6+pPUjVnB/rClb+JH+LJ
        XggacKPftkN5v1onl4hPV9NI4w==
X-Google-Smtp-Source: ABdhPJwBuukCWk7nXWI6PtZx09xWNW2kDOc8ciyxEiIbG6FkGrdUIs/Qaa5HsRBb2lwjouFeCIdY+w==
X-Received: by 2002:a4a:8247:: with SMTP id t7mr4005165oog.53.1619204061208;
        Fri, 23 Apr 2021 11:54:21 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id k8sm1439582oig.6.2021.04.23.11.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 11:54:20 -0700 (PDT)
Subject: Re: [PATCH] coding-style.rst: trivial: fix location of driver model
 macros
To:     Trevor Woerner <twoerner@gmail.com>, linux-kernel@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <trivial@kernel.org>,
        Joe Perches <joe@perches.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Yorick de Wid <yorickdewid@users.noreply.github.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210423184012.39300-1-twoerner@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <616ec71e-8ca1-c31d-80e2-c064864678a9@linuxfoundation.org>
Date:   Fri, 23 Apr 2021 12:54:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423184012.39300-1-twoerner@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/23/21 12:40 PM, Trevor Woerner wrote:
> The dev_printk()-like functions moved to include/linux/dev_print.h in
> commit af628aae8640 ("device.h: move dev_printk()-like functions to
> dev_printk.h").
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   Documentation/process/coding-style.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 42969ab37b34..44f796ba52c4 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -855,7 +855,7 @@ Kernel messages do not have to be terminated with a period.
>   
>   Printing numbers in parentheses (%d) adds no value and should be avoided.
>   
> -There are a number of driver model diagnostic macros in <linux/device.h>
> +There are a number of driver model diagnostic macros in <linux/dev_printk.h>
>   which you should use to make sure messages are matched to the right device
>   and driver, and are tagged with the right level:  dev_err(), dev_warn(),
>   dev_info(), and so forth.  For messages that aren't associated with a
> 

Looks good to me. Thanks for catching this.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

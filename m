Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4E1C6FD1F
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 08:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjCPIXe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Mar 2023 04:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjCPIXd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Mar 2023 04:23:33 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B974E5CF
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 01:23:31 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x3so4242920edb.10
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678955010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joYaMiwjQcZM9mnHSr+tmfvxuPw0FiEwz0p0pt8qIwU=;
        b=DylcSuB3JZSeiV3whNRz9aSwIoLkLgsisV7Th+D5ZQpWTsEbdV8Gf6K0HLrCJ9kntb
         sASccw/M8ObP510zuPB5itxRX+jEUAsDceGY99L9PhDnd8fn9fiTcL5Elmvl01kYOfzI
         kmh/bspG4xoROXwvOhQk+Tot3PHre2d/ZnwA62/0yKLZetddYewTlQss1SEEZj6CFORf
         A/qSq7jy0OtrfD4qEPB6sOkL22h4I2ff+I0fnN4HMWa71oDSxPxY3ZvKsofE2bqUB1bL
         OeXmhaC3oSDDg8DBVkSL0bXiRn6xYM/FcGCUbE8vzv+9qytgILkaQgw4OKdapCdCzJ8k
         cHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678955010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joYaMiwjQcZM9mnHSr+tmfvxuPw0FiEwz0p0pt8qIwU=;
        b=4UIbA22H3GAjjp7wxTLpsrKL7JIEj0S1suaBsOGbMZ6PaoQMzrL0MLelHmtd/rM2Do
         fHr2LIxpFMmMzskbIVCDZg3Af2Hr7D/evQkuxriqhNwgWR+JGM4aMzmavkdrHLcBSGko
         oPfRjuoM2/XT6eSgv1KBVVfSvmM87tQ8ipHv92k+7s3XxfN5TRxOzelC864/vKCqaB9/
         9rU5pz0EE3rrypIQgoTnrhxOikxedqA69BwpQZHHRgVQBPqJ614N0Wxe+R2vVci2Su2F
         fTDC2koMUe86iZmvum2Z3Uw+rIv+1ZxhjT+zlU9d0N7xv6vVVhuwJ6IMVwUXYFtlTGzE
         2Vmg==
X-Gm-Message-State: AO0yUKUkRcOzTVQN9NYxGybPvU+VhbfwFeoldkyI2LrFoGhCJxW0LkBi
        uInohbrHg0QIXUigKkWqLFCoZQ==
X-Google-Smtp-Source: AK7set+kNZwALILY2NO7RKbYUDJYg5DcYoLdgrV0P3eoIaD/c2pobEmAb1fkvoJq74X1yqKgVSiY1Q==
X-Received: by 2002:a17:906:4e92:b0:878:72d0:2817 with SMTP id v18-20020a1709064e9200b0087872d02817mr9074870eju.29.1678955009994;
        Thu, 16 Mar 2023 01:23:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id op13-20020a170906bced00b008c607dd7cefsm3543392ejb.79.2023.03.16.01.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 01:23:29 -0700 (PDT)
Message-ID: <fe15da9c-d03f-ccc3-ea6a-2b6401496aad@linaro.org>
Date:   Thu, 16 Mar 2023 09:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Documentation: submitting-patches: Disqualify style fixes
 from Fixes: tag
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Outreachy <outreachy@lists.linux.dev>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Kloudifold <cloudifold.3125@gmail.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
References: <20230316082034.14191-1-bagasdotme@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316082034.14191-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16/03/2023 09:20, Bagas Sanjaya wrote:
> An interpretation of submitting-patches.rst regarding Fixes: tag
> interprets that the tag can be attributed to all kinds of issues
> (including coding style ones). However, from the discussion on Outreachy
> mailing list [1], Greg noted that the tag should not be meant for
> patches that fix coding style issues.
> 
> Clarify the position on the doc.
> 
> Link: https://lore.kernel.org/outreachy/ZBFPnZbvdI46Ah6r@kroah.com/ [1]
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/process/submitting-patches.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 69ce64e03c70f8..564418e42ffc01 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -568,6 +568,9 @@ process nor the requirement to Cc: stable@vger.kernel.org on all stable
>  patch candidates. For more information, please read
>  Documentation/process/stable-kernel-rules.rst.
>  
> +Note: Fixes: tag is appropriate only for real issues (e.g. reported bugs
> +or compiler warnings). Coding style fixes should not bear this tag.

I think it is pretty clear already. The doc says:
"If your patch fixes a bug in a specific commit,"

and you are now repeating this.

Coding style is not a bug, but that's obvious.

Best regards,
Krzysztof


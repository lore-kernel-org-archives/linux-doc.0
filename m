Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E47C43334
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jul 2022 16:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239410AbiGHQwE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Jul 2022 12:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239422AbiGHQvt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Jul 2022 12:51:49 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A3B7478E
        for <linux-doc@vger.kernel.org>; Fri,  8 Jul 2022 09:51:43 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id y3so1620898iof.4
        for <linux-doc@vger.kernel.org>; Fri, 08 Jul 2022 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YVbA5kJPpRyIxTtw0oRvwhHjq4HhLwWNl4x41X1Nw/0=;
        b=GEZJ3uFcU/SI5PU0Cqabw2GMig+Ouoh8ntsVxK6QKR7GfsdfxXZUAUDtyTOvgAAxrB
         Osv4nfw+iUs5YvBNMRxFwAPMluBfmF+J28IgJvgRAHpTLdQ1wkR+zbWgZangj7W/LPB1
         NLtVMme+1vZrbaLHwaynnLli8SvWmVhISiVXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YVbA5kJPpRyIxTtw0oRvwhHjq4HhLwWNl4x41X1Nw/0=;
        b=Kj+G0QmWWAToMAlDRWGgGWLETdE+Vbi8NHvtsaOi6x3dun01OsPsXsXHa1GIExDnEL
         OFb4smHrJWK+RQ3FZdb8oSKljvwDfG5PLflMd5/DQo3lwFX84EASl6O7353h+GnO8u0A
         Wre8qoPdaOlm4hjoZIvsvIwLg0ocKnr2kK1oMCCpQMipJBX5PDMlis5QQA5BCzcLx9AK
         C6YLTNY6HynccV8WzqAmPJye6FxgStPMBLpcyM8pgpFNh5ru2pot+su2D880eDs5mF/X
         fjzqzgnCIc7YaDOAYWxSi7mowfsvu8HbpbAORkNPORDBpfbTCsyZ7XhqlI+wBWVUNb7C
         s0SA==
X-Gm-Message-State: AJIora+BiEzhm3SAaWFZzfOLf9ABKOCxeiWvtgaHmPz12UXGHwlS6PCv
        Ts6IybLGax4blJ2go6dd2nZnqQ==
X-Google-Smtp-Source: AGRyM1sTFQ4I6JSicDmJK2DXm8th1grclkWYK5LII+hpjwWSEh2RPJ28k04G2awPdDg5E0RHlAR24A==
X-Received: by 2002:a05:6638:25c4:b0:33e:a176:c227 with SMTP id u4-20020a05663825c400b0033ea176c227mr2531074jat.61.1657299102336;
        Fri, 08 Jul 2022 09:51:42 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id cn22-20020a0566383a1600b0033171dafaa0sm10410108jab.178.2022.07.08.09.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 09:51:41 -0700 (PDT)
Subject: Re: [PATCH] docs/kselftest: Fix build commands in guidelines
To:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     kernel@collabora.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220704083426.1867401-1-usama.anjum@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <58aad5c5-339f-85b9-8f48-0ffbd133b0cb@linuxfoundation.org>
Date:   Fri, 8 Jul 2022 10:51:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220704083426.1867401-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/4/22 2:34 AM, Muhammad Usama Anjum wrote:
> Build commands start with "make". It is missing. Add "make" to the start
> of the build command.
> 
> Fixes: 820636106342 ("docs/kselftest: add more guidelines for adding new tests")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>   Documentation/dev-tools/kselftest.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index ee6467ca8293..9dd94c334f05 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -255,9 +255,9 @@ Contributing new tests (details)
>   
>    * All changes should pass::
>   
> -    kselftest-{all,install,clean,gen_tar}
> -    kselftest-{all,install,clean,gen_tar} O=abo_path
> -    kselftest-{all,install,clean,gen_tar} O=rel_path
> +    make kselftest-{all,install,clean,gen_tar}
> +    make kselftest-{all,install,clean,gen_tar} O=abs_path
> +    make kselftest-{all,install,clean,gen_tar} O=rel_path
>       make -C tools/testing/selftests {all,install,clean,gen_tar}
>       make -C tools/testing/selftests {all,install,clean,gen_tar} O=abs_path
>       make -C tools/testing/selftests {all,install,clean,gen_tar} O=rel_path
> 

Looks like it depends on a patch already in doc tree?

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

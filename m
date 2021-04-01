Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A70C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:51:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBF4A610CA
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbhDAEvD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 00:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhDAEup (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:50:45 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FA0C0613E6
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:50:44 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q10so804085pgj.2
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PQmQ+T6JKQJYKyH3YmqFn3FDdKIS3NiG7xSNUtAkJrI=;
        b=nBFFnYUbyiitJmRzZHYfhTSK81SigQIcvZOkikWMWMQ8o5P5ojRVasGZcXdMqbpiot
         4rDn1EOk3SRPHy3YLZhHfg3AoM1D+013kwTp2c6QM4N6Lo2DXDcCGhShjmXBlPJkzJj3
         Rup3q+MxXkn9wDPFhoNGP+Gy/vdGUHv3nmAiXsQ2ffYf8UXqa7AAzECsnNicsCEVOcXh
         N7M0QEsNkVfZDqLZgc5Zod96BHFnSEjATtw3eXLXBQZzYk1u9CE7omUCqsctiI6LQpm6
         NiIdLhUEa1WZaPn/NYBKjhHYF5vNVL4cZ25Gd6n4u9nY1VoJTPsLNHNti5kU8i2HVSTj
         saiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PQmQ+T6JKQJYKyH3YmqFn3FDdKIS3NiG7xSNUtAkJrI=;
        b=QE8k2xH1CAvSjygbtPBBqrnjZNbxsJx4+peILp2ggqtuVuKk2rfTQGJdhgk+GbPztf
         LJp9TmMY2YQFPXJA0T684SiuAoYa+71qfiAcDt9hFHmqpi99pChpooFr4FQpJaQ17e2m
         5VyfFbBkIsvXBI6qURWNwivqy4tlm14jAo1HHBKISb8y2UHnEuDN/GJMIeyUppjnT9md
         Vceei5fJCePkcW2H1QFrGnlWiH4nfTQEtsVkuxLAuem10wjfrLX6ufTWqyWMMQLW9A4O
         fH5ezYXIUaq9N+psY52fRUmnSP2r/pnhD946iwIVn/AzUPmRo+QbyUXeTRFqgVizg+7V
         hKUg==
X-Gm-Message-State: AOAM5301FPAUQsSndROzF37JrBaM5hK+UO2wb+OFgU/UGLqJP8LxY5jL
        Zpo9pWwzQ16OIGiab4kVclA=
X-Google-Smtp-Source: ABdhPJxuWH66S2xm2vToPuCQa3fHxeqaRqRDiQnJHFDr/Xmh6TNRSYmRIg/CITIJ8ltpOlp0kzQYUQ==
X-Received: by 2002:a05:6a00:1350:b029:227:7a8b:99c9 with SMTP id k16-20020a056a001350b02902277a8b99c9mr5922937pfu.73.1617252644576;
        Wed, 31 Mar 2021 21:50:44 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id v14sm3862528pju.19.2021.03.31.21.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:50:44 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] docs/zh_CN: add cpu-freq to zh_CN index
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <20210330114728.2680-1-siyanteng@loongson.cn>
 <20210330114728.2680-6-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <43f1c0ee-7900-d9d2-5465-7652fcd2a458@gmail.com>
Date:   Thu, 1 Apr 2021 12:50:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330114728.2680-6-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/3/30 下午7:47, Yanteng Si wrote:
> All the files in the cpu-freq directory have been translated into
> Chinese and it is time to add them to the zh_CN index.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 2767dacfe86d..cd55c1aea604 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -21,6 +21,7 @@
>     filesystems/index
>     arm64/index
>     sound/index
> +   cpu-freq/index
>  
>  目录和表格
>  ----------
> 

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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E188DC43461
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:53:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9AD960FED
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:53:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhDAEwk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 00:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhDAEwi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:52:38 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60AEC061786
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:52:26 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so4123148pjb.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=82WcigJN+xYvXGxPHprmg4KpvcKq9MQtuve4SS/T8Dk=;
        b=GVIs1j7OtDVESfJeOh0uUjv4WOiaZK1hULdsjzkq+ECcLi7GiPV4fGTf3ehJLykNfh
         VQDKeyt1neaO54l3mRnRG16lVMKu4RiNvKXHDqtkptjS/7WC97HGiRFdECjvSO3JMvJd
         nf6C1qKnOxnTmFNieM2qf5L2v3g6fGI99KAPXabajWQomZjvkKGvZCGpRf1rabQmDRP9
         viHDLo5pgASBXBZyt89WjTwFvV9gTbqVmYDB8cD2z9bFGRG+nYVpq9Xtkbcnq+dZGJ9d
         m7KA5LkL+U6dRNc3g5ftMdz/r8fshwz+d1F9cK9EB8mLhdNAYxxapIcLdBYqhveAu+yk
         PWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=82WcigJN+xYvXGxPHprmg4KpvcKq9MQtuve4SS/T8Dk=;
        b=b/PkUsCYwx9ridONYKdi5OPvJtJfStChY1pCccwkjd1+/Mp2PS5iqM6UeBqsFahHpB
         9DRdK70fAAdh5i6dHhVM67VgaDae6A3Xo9iJ1/ECBgOOBwjBlLkCGMcYhoHX8kEdRUSk
         EjZPtmj21CBepaFXevSbdt7KCMEfuNpGxRA5WouC+84m+//ct7r9D3UB++dlaVGmeUgp
         fe5zHyhpA2rjNmUdhyGac4XctfA2LRHrMueIskynoX9JhtfbaCgVUndit8txXFAO5g6q
         rxTEqSxw1eoG4nBoBn98J/cCw4n/f4DCHFCKCsG4+xn8lu7WGYaTKHE5UePLOTuWbZzo
         +RuA==
X-Gm-Message-State: AOAM5303+WzIJo22N1FKjg/Iap+91lswEuzo2OWbSkcsoESQrWH+8YyH
        gXuNDOJcC4G/NzZqUaAa73E=
X-Google-Smtp-Source: ABdhPJyhmvu5jtlbfabiOgrzLex+MNTjYKBZ0v1zPix2C98vTGUPbhQVYGUN9UQ5jyVmsfvu6Ea93A==
X-Received: by 2002:a17:90a:f184:: with SMTP id bv4mr6806913pjb.43.1617252746521;
        Wed, 31 Mar 2021 21:52:26 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id a13sm3791533pgm.43.2021.03.31.21.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:52:26 -0700 (PDT)
Subject: Re: [PATCH v3 8/8] docs/zh_CN: add riscv to zh_CN index
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <20210330114728.2680-1-siyanteng@loongson.cn>
 <20210330114728.2680-9-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <4e95c167-fb83-f757-8ce0-00a934052ba7@gmail.com>
Date:   Thu, 1 Apr 2021 12:52:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330114728.2680-9-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/3/30 下午7:47, Yanteng Si wrote:
> All the files in the riscv directory have been translated into
> Chinese and it is time to add them to the zh_CN index.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 51c50f319487..892b6e85a8aa 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -24,6 +24,7 @@
>     cpu-freq/index
>     mips/index
>     iio/index
> +   riscv/index
>  
>  目录和表格
>  ----------
> 

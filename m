Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAC3C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 11:06:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5247761458
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 11:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhD3LHH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Apr 2021 07:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhD3LHG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Apr 2021 07:07:06 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FF8C06174A
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 04:06:18 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id p17so8357372pjz.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2MEFbp6KPTYqgIUMgYJXiZoUbzUO0jUr7RYqY21a9nI=;
        b=iPEWEfmJylg/WXG3j9lVU8KT3ITMcD1Js2Zv/3x2ebNPZO2umwN+Vde+aY7417NnOp
         QBEg8b9OOiUiVeeplo6w+K4EL33g3CyhQYcNRoffuPeM43e+G93vvSfir5AAYBUcn75w
         OVxIogqEGAcpIqZ1OF43GWUtFmJWI/G747SGObEbXphSMfRL2CzyYcN/4NQn+PmDPEzS
         0Zm81a+CrYT45FOiqGKXpDN24Ve01CLxPS9JHRIg4yCYjb2bMjK8prOU57JR+ru/m92c
         zVmXlUD3n9p2xGIC7EHcJW9mci7e6mZHrcWa7NVcLvYsZ6XvEeTEM7gxUnc+NB4LY6u6
         r03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2MEFbp6KPTYqgIUMgYJXiZoUbzUO0jUr7RYqY21a9nI=;
        b=mKD6Hb9lwKpUlExal9r+1f8rBLuxqlPd55SO/X9/WTMWHh+dw6KH0wHUcp5CiNBhXq
         f+dA4Pk8VcSKroXwPaLkMEJkUfPprpHNhdMh83SdXFSmQphKlz6RvKlgIkQQ1r8C1L6n
         iarPxbmuTPsIR2maGGF79J03+iCitU9gVdO1rfbmJV1IBtK9h0hagpz7poZEmH8wlB3y
         5TPECx5RmHFPb0ok/reCCI8dfy/xEN+fTvBark+V78kGCf6PC61dpDGj595ZJ/VPspaF
         egY0RTdNd2w38iQK734XjpW53oG2gARA1U/OmjDb8MCYt5eC018YIyW4ytZIVmhR8qVn
         5nCg==
X-Gm-Message-State: AOAM5330cGy91h902EoE++8ho//p/813Wq2kIXalBKeczCeWcRV35XAW
        f5c2CpNecGFcUGYVjKzw1c4=
X-Google-Smtp-Source: ABdhPJxf1g7mJXRPaiF8j102JlTf6gH2AwsaGU9dXZsjXmpYGX0UZGgB/MIdakziW9LIdhJ7p0uA0w==
X-Received: by 2002:a17:90a:1284:: with SMTP id g4mr4921229pja.66.1619780778420;
        Fri, 30 Apr 2021 04:06:18 -0700 (PDT)
Received: from [127.0.0.1] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id e10sm1820644pfc.40.2021.04.30.04.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 04:06:17 -0700 (PDT)
Subject: Re: [PATCH 1/3] docs/zh_CN: add core-api kernel-api.rst translation
To:     Matthew Wilcox <willy@infradead.org>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com
References: <cover.1618836460.git.siyanteng@loongson.cn>
 <301caca03324dd367830a50ff84e250882b91957.1618836460.git.siyanteng@loongson.cn>
 <20210419133526.GB2531743@casper.infradead.org>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <77f0e536-9458-5ef2-6cd8-6d47f0452e14@gmail.com>
Date:   Fri, 30 Apr 2021 19:06:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210419133526.GB2531743@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/4/19 下午9:35, Matthew Wilcox wrote:
> On Mon, Apr 19, 2021 at 09:10:55PM +0800, Yanteng Si wrote:
>> This patch translates Documentation/core-api/kernel-api.rst into Chinese.
> 
> I don't speak one word of Chinese, but this can't be right?
> 
>> +列表管理函数
>> +============
>> +
>> +Todolist:
>> +
>> +   :internal:
> 
> The corresponding section in English is:
> 
> List Management Functions
> =========================
> 
> .. kernel-doc:: include/linux/list.h
>    :internal:
> 
> and surely you need a '.. kernel-doc' to have the ':internal:' make sense?
> 
> Then, I wonder how useful it is to bring kernel-doc written in English
> into a Chinese document?  Wouldn't we be better off admitting that we
> don't provide Chinese documentation for kernel APIs and referring to
> the English documents?
> 
> (I would love nothing more than to provide Chinese documentation for
> kernel APIs, but we don't have any kind of system for providing that
> today)
> 

I wouldn't reject the Chinese version of kernel-api, but a bit concern
of the subtle of the doc could be kept in translation. It would be a
big challenge. :)

Thanks
Alex

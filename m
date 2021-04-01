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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF7BC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:51:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F043661006
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbhDAEvD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 00:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhDAEu6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:50:58 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61D5C0613E6
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:50:58 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id v23so384520ple.9
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BNhnx+YHhs8tH/pj9QD72Lhn3WrXUvAiea+xkauqTAA=;
        b=VfaTyiE2ptpxaH472ReSuJSZKhdj6m3BZrPUHuR9uXBjOgW1mZYiBMchb4J9MhTqb4
         w6pNQJGLKYmpmeOrYATb37koibVrSepKoFNHH8eweVSVx2VnRuKSCPqVtDkkBv7pZfUT
         6euiFcfA4vBnfqfgq/cuACHKKAL4uXuk0mUD5yX9988oY8ZYJGByginDqWOfiU4hha+X
         FzdrUrQnIETF7rBd4tgvDX75kc8TuoGdBHc58k10VGL56X7msULyVa66Q+v9ix5Fz9/5
         J0IaTXspX2PL6ZD3K6p46CYNRw+Ll3Uhjbs+nY2UqvlJ2AMt49Jf+6eBFedCedaRG0Xj
         S/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BNhnx+YHhs8tH/pj9QD72Lhn3WrXUvAiea+xkauqTAA=;
        b=V5hHlkMAKxEK3hg40uF9PsSXzgxzHgHixWho2/ajkopPIJGaBjzK0bUBjt0VZTETQ/
         c9hkmjtcqnyLCFxe3N6aiJPfKeVoQBDEMNuvCqmGYu5w/6ndi0SEix2eG/1lK7gvAkcZ
         6k1FgiAkOAPCULmOfP2KKuTQ1tYxBNz4rHFZXKxoiculztCicPXvqFjOZOdf5Zc/Psx/
         Aej0l04lMNhyMJIROid1auRcjc/Gbgfy0zxeo+XIG/Doy6nF++FUzdh6E+ATyTxSf28j
         7I/m0gBX3XImhqQfqx2huyyJgZZb/1D7bOJR/u69L523y0Q0ycQO5w3rxJTmE2KToOPO
         Euyg==
X-Gm-Message-State: AOAM531ziIDp4Ib2MQejoaf9UFy8oAZU/pIfBViWouqRfscXwcHXPf7F
        wBe/6EFD3pCRuzTgIMWVxvc=
X-Google-Smtp-Source: ABdhPJx4JTZdjulJ3lLu/V/CJM7yT5CbSBFJXXRMuYYn4z5DpHzUJ97n3Mg51VlIZQ6LSkmnUsLTxg==
X-Received: by 2002:a17:90a:f005:: with SMTP id bt5mr7169031pjb.127.1617252658296;
        Wed, 31 Mar 2021 21:50:58 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id o134sm3828697pfd.113.2021.03.31.21.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:50:58 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] docs/zh_CN: add mips to zh_CN index
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <20210330114728.2680-1-siyanteng@loongson.cn>
 <20210330114728.2680-7-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <e55cc1a7-ea1d-6ce6-01f7-ede978982c5f@gmail.com>
Date:   Thu, 1 Apr 2021 12:50:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330114728.2680-7-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/3/30 下午7:47, Yanteng Si wrote:
> All the files in the mips directory have been translated into
> Chinese and it is time to add them to the zh_CN index.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index cd55c1aea604..16641203dc88 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -22,6 +22,7 @@
>     arm64/index
>     sound/index
>     cpu-freq/index
> +   mips/index
>  
>  目录和表格
>  ----------
> 

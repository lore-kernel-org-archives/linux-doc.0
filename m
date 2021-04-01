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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1294C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:53:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95A8461041
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:53:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhDAEwk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 00:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhDAEwi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:52:38 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCC6C0613E6
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:52:16 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id f3so829440pgv.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UhwdD2gO8nOO5tCisCra55ciclH3EOXOGC4jrUducKI=;
        b=hdfHC7QTmuGTQw16+4IoCNmVizFFqyOy9/DiE411SYTWdUz3zvNnNR5mA1zg+BMrGG
         7cr+NZUlaxnRwgisBTGpMKb76RQnqnfaNSA978opBv1FFKUifkWnmQsNzWya3ojBym8A
         mqjYq1PMFW3rd8swwa7PjdQJGiWKvh+M+l1sEu2g1zM4Y13h3asbh0IAv5laKPCY7snu
         pRk7zpTSralFtxUFl4GrZ///bQPir/u7lOyFoVyi4dAYbKQHyWEkWGhv18plEvxBqXsX
         wfSi1S8hsUPJMMIFN4rh15vH7ow0sXSXKa/+JOT7/oYcrzROpdE4/IA2HyaWEgj8rRKw
         z0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UhwdD2gO8nOO5tCisCra55ciclH3EOXOGC4jrUducKI=;
        b=WvCGkkJOg4shlsM9AjP0tIxc5tHH3hyxVwXj2Of9JcqOmSaLZiG0mznI/smiUGUNm5
         vS89iWtXX9kXGmZ1ZxXCwkwSWwk6qCX/3jVVjLc3DbcFSMY6dQ6oJz71kb7d4px9QYNN
         XwxjcooXmkCVKeLmWKw3NcbgL3gR8yxcA8YAKISOVL5myYV3Mxh8i+eYufnymdyRel/O
         C0M7KajDIDl2PZ10KpgfkQWj08TpEJhN4RZLyDjjafZRy0yUwzRurHOtDitH4g7Wvdet
         V+lT98MPG4KSClK+Nu5vWcECIQVMtzJLTV6fNEIMAaptF5mEGgWHpzVbH+rTO1ujDsfF
         VNVg==
X-Gm-Message-State: AOAM530eibyxynxOQxbG10pM+zUztaRMsT3aqOZWnBYrGyS9Vvfonvh3
        tx2ZNU6PLG/BZtZt44L1IO4=
X-Google-Smtp-Source: ABdhPJzK9d3cQgEbTrM2PkMgUVbNCHbqdL3x0Vge0sXvx0ovAbUUB3XuX27QvLbCgRIhNwkNWehazA==
X-Received: by 2002:a63:41c6:: with SMTP id o189mr6050655pga.118.1617252736439;
        Wed, 31 Mar 2021 21:52:16 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id 138sm3800672pfv.192.2021.03.31.21.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:52:16 -0700 (PDT)
Subject: Re: [PATCH v3 7/8] docs/zh_CN: add iio to zh_CN index
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <20210330114728.2680-1-siyanteng@loongson.cn>
 <20210330114728.2680-8-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <e2f17519-acce-1587-4893-4f4b8be2a0be@gmail.com>
Date:   Thu, 1 Apr 2021 12:52:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330114728.2680-8-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/3/30 下午7:47, Yanteng Si wrote:
> All the files in the iio directory have been translated into
> Chinese and it is time to add them to the zh_CN index.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 16641203dc88..51c50f319487 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -23,6 +23,7 @@
>     sound/index
>     cpu-freq/index
>     mips/index
> +   iio/index
>  
>  目录和表格
>  ----------
> 

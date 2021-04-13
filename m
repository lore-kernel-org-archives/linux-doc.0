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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAC9C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 08:49:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8A9A610FC
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 08:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243555AbhDMIt5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 04:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhDMIt4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 04:49:56 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C160EC061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 01:49:37 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id 20so3884628pll.7
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n4fpq6Mn4EKGzHTWBgjn/2WQIJUkTK9YWH4OJgkIXTA=;
        b=GKDMpMEeaFEHKtEdYhcaEbHCzShv17T0JWrtxKL/VIMwzD3czkOFulzgQkfIyn+48k
         iJjFEm2kFYlWMKBP31J+mTBQqZncPRi5JJf1n1qHSh64YZafAh8YT5wCVhZQG+Jr/eoQ
         QnoM4cCiGgYI5c+oj4U1WiXrBlJFZnx4ksP4qKKx6O18PVPtRu4NuwvsxPtJJfXodaxW
         g6+u07Zj4ZzALKrnFnHtqPogFaDI4qzaaBPLWGoctKYCaJ98A3xro6/OiGLj+N8XwWsa
         m2+Yo+JosIo4FfhBLkJrSzp64kSXI5fjq290o623b1rIzPyTkHVGa7eJr4JswXV2oYvB
         p3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n4fpq6Mn4EKGzHTWBgjn/2WQIJUkTK9YWH4OJgkIXTA=;
        b=Ae1Gily6qgna6ZLZGS5//Rrpnwf8EC3al3QSWS4hpVvbos3vdckWlspeVxxpkuKbsg
         CRIXtOG/bkn70gtQ1ZV1YZjolNocpYpwAIVt7Kwj4rx6jF3l95Gvyb+rpQZ0/JbmIQkw
         TKt/ZkRTVr69Xf5PFQjYZZMcXq/+0XP0hGheIBk8YKtkcRLf+/Szr9HVYI043O00l45s
         SRYgkWroBsB07YQILe/RhATA2anf/BIqUUNOevBT0tsn63wXBbPezd7tt1LZM1w+dIYT
         zY3NbyAOesSZbPfB65KnuhtbOM/JMpl7jex5uJtzR0U5l7S+HzH1d0Ju6jINFmshCrsY
         n8+A==
X-Gm-Message-State: AOAM5321WJEoWU+Di409nTIwjvA4R9VbOtR5SbtShb4/lNQxnE/6DzUz
        B9teQwk5DJCKiWP1UkIdIFATTSSHxy1Pgg==
X-Google-Smtp-Source: ABdhPJyhp1EK9VWNblbTkxV+3j/HFDF4loFSNVayvNWaNm4m09yJGHVpesv5qgEWVp4bDuQITLlMVQ==
X-Received: by 2002:a17:902:b589:b029:e6:2875:aa4c with SMTP id a9-20020a170902b589b02900e62875aa4cmr31112103pls.71.1618303777144;
        Tue, 13 Apr 2021 01:49:37 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id h29sm14012159pgb.3.2021.04.13.01.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 01:49:36 -0700 (PDT)
Subject: Re: [PATCH v5 7/7] docs/zh_CN: Link zh_CN/doc-guide to
 zh_CN/index.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
References: <cover.1618295149.git.bobwxc@email.cn>
 <8738b39c1b54e15477a937c861f114165a8c0648.1618295149.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <6e224b87-c55f-9180-e972-06ca06ebeefd@gmail.com>
Date:   Tue, 13 Apr 2021 16:49:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8738b39c1b54e15477a937c861f114165a8c0648.1618295149.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/4/13 下午3:13, Wu XiangCheng wrote:
> Add zh_CN/doc-guide entry in zh_CN/index.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 4fdd57417ffb..4258006f4763 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -18,6 +18,7 @@
>  
>     admin-guide/index
>     process/index
> +   doc-guide/index
>     kernel-hacking/index
>     filesystems/index
>     arm64/index
> 

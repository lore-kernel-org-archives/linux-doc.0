Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BBEC47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 06:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2453E61287
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 06:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhFHG3I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 02:29:08 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:38427 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHG3I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 02:29:08 -0400
Received: by mail-pg1-f181.google.com with SMTP id 6so15719211pgk.5
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pAhF+TGbTqODZvWLskGp2EGHjbdw3GWWDo4iN5KwucA=;
        b=hEGKDSnS5MggIjOwAJJDkAfMNDEQ54uEO9Q8HMO96xjJPU52Cys2xflQHz7m90QvI+
         6/QOMWadeMssBvWhMrUCaGgngIkruPxsB4L7N+OMwsjQaKw+sk3qz9ylBytXZxPsv1i+
         lm3dK7UpAk1vIzUb3f+eo4qw8Ept8BpRbLaoXJyplHQLuBv2lvyYRN75HpZz/UHz7pHF
         ROP+lfG5RCxJoL9tcNqH7G7P3cEo4k8Qn1PNTOSOhI8P3j2g3I3Y+eayR/0hlYYP23QK
         Jfn7T/U4Y+TXa95D8G2bfxNqFY4ZS+BEtFyL3UOv61dYN2JtIr+MAWmxH32NPO7/wHsB
         puFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pAhF+TGbTqODZvWLskGp2EGHjbdw3GWWDo4iN5KwucA=;
        b=rjwRxy5LBKkT6KXPaEgqqjw1zSPk7lX9TI2+EPXmdCdh/4TGuXafU0+qDO+vGhFUnH
         2tTnfUBwZF8DfdCSim/BMb7l8XlSget1x4shK0CusqgAvjmwcZmVWjiaD2E+kDWohsMT
         tpqFvH9kr1ju2I/yw6aEHRQ4vaOPxUHxjzT4snxNeed76FsYD4DfAFE1ORcd4ITJJ+D4
         5ual1On4JK1t3XNopYcCMC/AzVIxdE/cLbmxbFvlFcSdhmWkCDjFzYvDkhWNETyxYQo4
         N4sroAxwBPXvtU/iZniFlrnRD09y3/pHEDWtSeUBWqHgLXrmhS6A/uwbOVlyjIZ4Xz20
         pzAQ==
X-Gm-Message-State: AOAM533lPeE8OE9UAAbeo4txLCQBwZ/JRjyAs/iw1S49/SL/3ogotklX
        d2M/kIiAbC/yM9huOBGZIUA=
X-Google-Smtp-Source: ABdhPJxCxDLn6034eaiMSEGx5w7nqgipLG0G3VSuX2/u8CJyqQD0J9foQo/WNLX4XGsnla5+FKbnuw==
X-Received: by 2002:a63:4d0:: with SMTP id 199mr21689633pge.423.1623133559863;
        Mon, 07 Jun 2021 23:25:59 -0700 (PDT)
Received: from [10.104.8.180] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id o20sm14018261pjq.4.2021.06.07.23.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 23:25:59 -0700 (PDT)
Subject: Re: [PATCH] Documentation/translations/zh_CN: switch LWN links to
 https
To:     Sanjeev Gupta <ghane0@gmail.com>, linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, Alex Shi <alexs@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Wu XiangCheng <bobwxc@email.cn>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <19db70b6.AU0AADJwA04AAAAAAAAAAKAiBvEAAAAAAMcAAAAAAA6qeABgvvZE@mailjet.com>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <5294d79d-56fc-7d55-6cc9-54a9ff7baa8f@gmail.com>
Date:   Tue, 8 Jun 2021 14:25:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <19db70b6.AU0AADJwA04AAAAAAAAAAKAiBvEAAAAAAMcAAAAAAA6qeABgvvZE@mailjet.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This looks fine. But actually much of links don't work for me.
I am not sure it's a server issue or a region issue.

Thanks
Alex

On 6/8/21 12:17 PM, Sanjeev Gupta wrote:
> -（http://lwn.net/articles/131776/）
> +（https://lwn.net/articles/131776/）
>  
>  实际情况却是不同的；与特定模块相比，内核开发人员更关心系统稳定性、长期维护
>  以及找到问题的正确解决方案。这个故事的寓意是把重点放在问题上——而不是具体的
> diff --git a/Documentation/translations/zh_CN/process/4.Coding.rst b/Documentation/translations/zh_CN/process/4.Coding.rst
> index 94f7f866f103..b277895c6d2d 100644
> --- a/Documentation/translations/zh_CN/process/4.Coding.rst
> +++ b/Documentation/translations/zh_CN/process/4.Coding.rst
> @@ -149,7 +149,7 @@ Linus对这个问题给出了最佳答案:
>  	所以我们不会通过引入新问题来修复错误。这种方式是靠不住的，没人知道
>  	是否真的有进展。是前进两步、后退一步，还是前进一步、后退两步？
>  
> -（http://lwn.net/articles/243460/）
> +（https://lwn.net/articles/243460/）
>  
>  特别不受欢迎的一种回归类型是用户空间ABI的任何变化。一旦接口被导出到用户空间，
>  就必须无限期地支持它。这一事实使得用户空间接口的创建特别具有挑战性：因为它们
> diff --git a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
> index 6d0dadae13b1..668f4fe680f0 100644
> --- a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
> +++ b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
> @@ -98,7 +98,7 @@ Git提供了一些强大的工具，可以让您重写开发历史。一个不
>     你可以给我发补丁，但当我从你那里拉取一个Git补丁时，我需要知道你清楚
>     自己在做什么，我需要能够相信事情而 *无需* 手动检查每个单独的更改。
>  
> -（http://lwn.net/articles/224135/）。
> +（https://lwn.net/articles/224135/）。
>  
>  为了避免这种情况，请确保给定分支中的所有补丁都与相关主题紧密相关；“驱动程序
>  修复”分支不应更改核心内存管理代码。而且，最重要的是，不要使用Git树来绕过
> diff --git a/Documentation/translations/zh_CN/process/8.Conclusion.rst b/Documentation/translations/zh_CN/process/8.Conclusion.rst
> index 71c3e30efc6f..b0b6cc270aec 100644
> --- a/Documentation/translations/zh_CN/process/8.Conclusion.rst
> +++ b/Documentation/translations/zh_CN/process/8.Conclusion.rst
> @@ -27,7 +27,7 @@
>  不同的网站在各个细节层次上讨论内核开发。本文作者想谦虚地建议用 https://lwn.net/
>  作为来源；有关许多特定内核主题的信息可以通过以下网址的 LWN 内核索引找到：
>  
> -  http://lwn.net/kernel/index/
> +  https://lwn.net/kernel/index/
>  
>  除此之外，内核开发人员的一个宝贵资源是：
>  
> @@ -38,7 +38,7 @@
>  关于内核开发有很多书：
>  
>    《Linux设备驱动程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）
> -  线上版本在 http://lwn.net/kernel/ldd3/
> +  线上版本在 https://lwn.net/kernel/ldd3/
>  
>    《Linux内核设计与实现》（Robert Love）

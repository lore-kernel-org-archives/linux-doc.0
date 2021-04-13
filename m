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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA766C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 08:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A000E610FC
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 08:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243324AbhDMIts (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 04:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhDMItr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 04:49:47 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFBCC061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 01:49:28 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id a85so10550308pfa.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8S48lwoYpY6IUu1fsUeQ7HcUPqT4fmBP4csVJoCLjz0=;
        b=uQR3vb+lpQpG3rviXmFmrBw3dfRKRSa6BhkHcaZu7V/dHtzmSMtHGmuivT2LHjWsfs
         nL5nvg0sCbIYYh0+3TfW6GmmB/B6fO8YKXkz1lx7HYrXWkt0tGBYRyqI4lHOGM8DRe8v
         NytQxv96s2Q8gVDhBxLt9WoWFqq8r0ASVNzRHdOnyDyi1lnVJ6fQ7BoNCYSYWQXdchMy
         CwJyC30HsnYCKVev4oHeYlGmsliRmtucaKJCahC6ZQCYu3mEWVNrqloPla3kzeIBZ7dp
         WgmvThdlkBRZoiZlpWxhbwOYjDav0G1EtBjijdxQVMtlli3UQXs+9hQRgGCzTc7KqkTV
         l1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8S48lwoYpY6IUu1fsUeQ7HcUPqT4fmBP4csVJoCLjz0=;
        b=tGNYVsZYVMz82TCWZZJv5sNXrShomoTH2sfM6QqyimqhBlORXEHyg6DqZIantYOp2e
         /XlXfRjbcn59v2a/1m35hquM1Znzup2ga0rfAUBaC5dcxhzjmKQgq9muDOCbC+5Cc8NJ
         t8wLEz/6UCrIuTheqz3/vhL3wqR6PJiV9LRlSEwZeGozim2X71aBO5gUKHSbEoIbTQQB
         oX8885fZuxtBrYQft5KNK0X+Rr+qOnpYfEpChTMBeCyYcqnKytMC4jufA6R/sPFML0Iw
         k9YSkZU5Geaik3dJF6uaXBG06K7gLU7vCmP9FIFw0g11nUvRNr6/+3k4TJMxNhF+GFXa
         QXrw==
X-Gm-Message-State: AOAM533Zt10M6kAO9so3x1xXDoj74TPWZ1c+Mt4ni+LqffwaThn4KaVx
        MAgpteZxyf7ywX2pCfLdsajGD7mSUia7KQ==
X-Google-Smtp-Source: ABdhPJyzItcWUDUUbJseddcqMFE75Ib1MPvENikFyDW5QLdx/BV4hSm4DiwJpH8W+66JvjW0SdY8Lw==
X-Received: by 2002:a05:6a00:1651:b029:241:afa4:92b1 with SMTP id m17-20020a056a001651b0290241afa492b1mr28538550pfc.12.1618303767522;
        Tue, 13 Apr 2021 01:49:27 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id g24sm6526802pfh.164.2021.04.13.01.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 01:49:27 -0700 (PDT)
Subject: Re: [PATCH v5 6/7] docs/zh_CN: Add translation
 zh_CN/doc-guide/index.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
References: <cover.1618295149.git.bobwxc@email.cn>
 <4a01400c3d65b2f7eb1c1bebd3a0e102ed29208f.1618295149.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <13b05484-c0e4-4923-b466-f92d9ddd8ddf@gmail.com>
Date:   Tue, 13 Apr 2021 16:49:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a01400c3d65b2f7eb1c1bebd3a0e102ed29208f.1618295149.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/4/13 下午3:13, Wu XiangCheng wrote:
> Add new translation
>   Documentation/translations/zh_CN/doc-guide/index.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/doc-guide/index.rst    | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rst
> 
> diff --git a/Documentation/translations/zh_CN/doc-guide/index.rst b/Documentation/translations/zh_CN/doc-guide/index.rst
> new file mode 100644
> index 000000000000..5151953c196f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/doc-guide/index.rst
> @@ -0,0 +1,27 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/doc-guide/index.rst
> +
> +:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +.. _doc_guide_zh:
> +
> +================
> +如何编写内核文档
> +================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   sphinx
> +   kernel-doc
> +   parse-headers
> +   contributing
> +   maintainer-profile
> +
> +.. only::  子项目与HTML
> +
> +   目录
> +   ====
> +
> +   * :ref:`genindex`
> 

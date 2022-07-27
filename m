Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67976C19F2B
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 02:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240075AbiG0CSi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240121AbiG0CSh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 22:18:37 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDEE3C17E
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:18:36 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10d8880d055so20959330fac.8
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4m+Ht42LNDeBf9+wk+cZaIA46arDo9q5SjJr/sO7lEQ=;
        b=ASqjiBZdH9RjH3kouGtAf5+Vyqu7qu8KMS0Cpt3e7iyuZc4UXcEjHm54GUmPfbKF/3
         OqLtbUTBG8EktwHZvkDMTfKUlLW41gE5kL1tjVCv9SvdHrcBO7fcWP9qmPexz+f17umQ
         FBD4A0RK/NVdvjlpH+Zay/exqOYSLuMyNW2Wj0UzfVe3+3LkQMUIz9t97LGw5E47UkLR
         hgXppzokh4DEGqWdntGa6nEsTb5XwAOnREgNT/ZQJaK7PEJXW+cS3ZgoMUpUCayvM/Ub
         Eye3Iyqb/xQ1eyttks4Ya96ZrKSSQupRbzVitE08HHVLqIo8YVh5oe41UJmOxJmc1PTe
         d1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4m+Ht42LNDeBf9+wk+cZaIA46arDo9q5SjJr/sO7lEQ=;
        b=kYfvkog0UXmFl62gDOwCzyrd8uDGGkMQ4nif7FCXneZF4gR7HtXR5tsH8+xBfiF+3T
         ZQujvNMrNYJ5LGKlGZNpvuBtuidsasuHhNNyJxTJOFJUhYlurEO4BcKFIm2GD6MaDNKg
         suXNFjwMNj6jMoANhb2s+17DXViL2Xm/bI6qTxvV7EeF14T+jQ2rBLSpbUlr2utjMwRC
         QZ5UZ8R8ya0NjvajeFL2SD1WcZR5FXFd229sjrgcVas6CI3jt9Kzt5rHrSDqpCdGz8lZ
         ByVyWhpketVbVkwBqVl6gfIuFw+qG8TePWETKmCRDf/C7BZVzK8fr/R95/+5GVDF8xsx
         6t2w==
X-Gm-Message-State: AJIora+eZ8pWt1lBVW/S5Xr1eISyWMnzsrZEfCdFMcAG37BJbO3QG+yp
        tyXNoCmP+NSjeHNIP+c+Ku8=
X-Google-Smtp-Source: AGRyM1vv07HXSGef1H6mJrPFYjavr2fTkWyDWzgEbInXxGQumdBaZv9S66bWi2Nk5/Eo0Wj6K6A1Tw==
X-Received: by 2002:a05:6870:828c:b0:10d:847e:1caf with SMTP id q12-20020a056870828c00b0010d847e1cafmr1070551oae.270.1658888316101;
        Tue, 26 Jul 2022 19:18:36 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id u12-20020a056871058c00b000f342d078fasm8575811oan.52.2022.07.26.19.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 19:18:35 -0700 (PDT)
Message-ID: <c0de2854-7b1a-cc02-5ae3-b7a3714c5838@gmail.com>
Date:   Wed, 27 Jul 2022 10:18:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/8] Docs/zh_CN: Update the translation of usage to
 5.19-rc8
Content-Language: en-US
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn
Cc:     corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <59c1792d8a9cdf8fd6a83301efa955de4657346b.1658740151.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <59c1792d8a9cdf8fd6a83301efa955de4657346b.1658740151.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 7/25/22 17:24, Yanteng Si wrote:
> Update to commit b57e39a743e4 ("Docs/admin-guide
> /damon/sysfs: document 'LRU_DEPRIO' scheme action")
> 
> 0bcba960b1fa ("Docs/admin-guide/damon/sysfs: document 'LRU_PRIO' scheme action")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
> index cd41ada4fdad..aeae2ab65dd8 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
> @@ -210,6 +210,8 @@ schemes/<N>/
>   - ``pageout``: 为具有 ``MADV_PAGEOUT`` 的区域调用 ``madvise()`` 。
>   - ``hugepage``: 为带有 ``MADV_HUGEPAGE`` 的区域调用 ``madvise()`` 。
>   - ``nohugepage``: 为带有 ``MADV_NOHUGEPAGE`` 的区域调用 ``madvise()``。
> + - ``lru_prio``: 在其LRU列表上对区域进行优先排序。
> + - ``lru_deprio``: 对区域的LRU列表进行降低优先处理。
>   - ``stat``: 什么都不做，只计算统计数据
>  
>  schemes/<N>/access_pattern/

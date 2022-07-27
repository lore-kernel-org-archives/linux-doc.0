Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010F3C00144
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 02:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239918AbiG0CSS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiG0CSR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 22:18:17 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F9D3C8C3
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:18:17 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id o14-20020a17090a4b4e00b001f2f2b61be5so766828pjl.4
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hVAG+Ebgbz7nQvgXqNkge6THL7tU/IyC9UIjfVkt+I4=;
        b=WoSa6+BP74z54iVXJ0Z9pRkCAyQ2U58uTzKl5EvwdZqJ3KNvkFtxhVaE2GS/RA4WS8
         dwGBMRW3Rjqi5Yf5Rp2iQVWDz86ufihjxgRYm0qKhRkgjq/X1+vn2/0kkS6v6CqAFjbL
         Ac6kxoe4ZcayL2RAGv1qiEXNqwwwSxuJE9F9jJUGG/G//zfYuTxU5HhGMNN2kh+XJ/rS
         prijH9ee0YkqqPYZB7NqxVlP9Sgpz1m+TRoExtma/tO4aRK/p8n+zr8gQ/UVpTN8rmhN
         i00tRRX2VSU2vxVK+m8v4PFbXVSyruo+ZcbQ93zx9BUlIOKbSG9z3WjQzszbmXFptO6y
         zraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hVAG+Ebgbz7nQvgXqNkge6THL7tU/IyC9UIjfVkt+I4=;
        b=S+CzYGBO/TPskKo1iZL18WcgVZuD+vQ0P76JmgLfStI7UlRlwRsj9bfjL9EMfrZInL
         mOLxlpF959uE0nlHDjZvKwC8LugZlw7ZB3ptWySJF3G+KI/xeAzlBqIiZEADS/t8LcGz
         YuGpoVdfGQedpdnLd1SWlcxWZHZDJXmDpjqExSND/F7tA7BajdEMOhiv9rDqdju1FJGM
         L4seJAcWHJNHMPLbg5sAsCP3ChZO7qUpFlRCYy9tUKHkTpD0pyEDvgKwhk58QB854R/o
         Of1nxidytI9lbAQUrzxx2Uj0fhZpt6DwJb82C/0MdyoxSulsCJWRYNlDexhehgZevGT2
         sZpw==
X-Gm-Message-State: AJIora8FOZdbZ5lyX9q70BdQF1436gC1ej9GFquKRi1ApQy2gHGm1fTV
        uUljZJG9MCscuifRTcAdpt0=
X-Google-Smtp-Source: AGRyM1tDMqt6m6jlz3/hmQoEtzgl2pwlmGVICF3aMpDKQjVWzqecjl+leuNVLiB08pRNcMZduQ5lZg==
X-Received: by 2002:a17:903:11d1:b0:16c:defc:a098 with SMTP id q17-20020a17090311d100b0016cdefca098mr19616142plh.50.1658888296517;
        Tue, 26 Jul 2022 19:18:16 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902c94c00b0016c16648213sm12569543pla.20.2022.07.26.19.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 19:18:15 -0700 (PDT)
Message-ID: <49e9c2c2-0cc0-de41-c7dc-03d866cb38ee@gmail.com>
Date:   Wed, 27 Jul 2022 10:18:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/8] Docs/zh_CN: Update the translation of
 testing-overview to 5.19-rc8
Content-Language: en-US
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn
Cc:     corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <61d805454b69bebfcba7b6df1b94d3811edefddc.1658740151.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <61d805454b69bebfcba7b6df1b94d3811edefddc.1658740151.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 7/25/22 17:23, Yanteng Si wrote:
> Update to commit 12379401c000 ("Documentation: dev-tools:
> Add a section for static analysis tools")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/dev-tools/testing-overview.rst      | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> index b7a1d13da6c6..d6f2c65ed511 100644
> --- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> @@ -107,3 +107,28 @@ Documentation/dev-tools/kcov.rst 是能够构建在内核之中，用于在每
>  之后你就能确保这些错误在测试过程中都不会发生了。
>  
>  一些工具与KUnit和kselftest集成，并且在检测到问题时会自动打断测试。
> +
> +静态分析工具
> +============
> +
> +除了测试运行中的内核，我们还可以使用**静态分析**工具直接分析内核的源代
> +码（**在编译时**）。内核中常用的工具允许人们检查整个源代码树或其中的特
> +定文件。它们使得在开发过程中更容易发现和修复问题。
> +
> + Sparse可以通过执行类型检查、锁检查、值范围检查来帮助测试内核，此外还
> + 可以在检查代码时报告各种错误和警告。关于如何使用它的细节，请参阅
> + Documentation/translations/zh_CN/dev-tools/sparse.rst。
> +
> + Smatch扩展了Sparse，并提供了对编程逻辑错误的额外检查，如开关语句中
> + 缺少断点，错误检查中未使用的返回值，忘记在错误路径的返回中设置错误代
> + 码等。Smatch也有针对更严重问题的测试，如整数溢出、空指针解除引用和内
> + 存泄漏。见项目页面http://smatch.sourceforge.net/。
> +
> + Coccinelle是我们可以使用的另一个静态分析器。Coccinelle经常被用来
> + 帮助源代码的重构和并行演化，但它也可以帮助避免常见代码模式中出现的某
> + 些错误。可用的测试类型包括API测试、内核迭代器的正确使用测试、自由操
> + 作的合理性检查、锁定行为的分析，以及已知的有助于保持内核使用一致性的
> + 进一步测试。详情请见Documentation/dev-tools/coccinelle.rst。
> +
> + 不过要注意的是，静态分析工具存在**假阳性**的问题。在试图修复错误和警
> + 告之前，需要仔细评估它们。

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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF798C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 08:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 962B2610CB
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 08:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243617AbhDMItk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 04:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243555AbhDMItj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 04:49:39 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507C1C061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 01:49:20 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id a12so10984630pfc.7
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 01:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9j8etQBqBaN2HI/SuiiSVCsYC7blCiieglu0VtdDVTw=;
        b=TT8o0brGMUB1+UDecR7HwAvL9nmMVK4J+oLAdZo9s9QYTmOBiSg9HKs8xtpr/yj06P
         oK2+v7o0qJeCdJp7VL2hW1pLByDUZoF5zlJ7UElMUqSixSMKTc/vmhsKPTG7fqbpH1Fj
         w8dplRnMb6ND4aot3vvwRt/2cZjep1W4Hd+hYtVVIMRDqod2KXv8EGWf484jOAt+eIYh
         zqWmA5zi/fs0AoMmq6nfm9837DAA2SSs9SjfpvdfL8yMk91zQ6NrVCNHORUZqJMfkgBQ
         eXkcPTd/5Jxa2CpJIZIswOSOtgxgtq5HkiFvPutex18JG1ZVeiwkPWbcm5cHkvRchPMm
         rssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9j8etQBqBaN2HI/SuiiSVCsYC7blCiieglu0VtdDVTw=;
        b=ZaA/1cAH9EUbEfkO3C0HmByVXHVJ/2Br2tgxodsI8XXhT9HVVyMJcR32XW+XfWdpdm
         bPPaEMABXWYWzNvawGtrSN8o6qCGtdPzgimOV/WD+tVkesvCPbes3N/3QbC0AdBNYpFW
         o+Yb18V6IyquHX715EmAquow9B2ewMxgS+fKojhSJWjcnpcMr4HXjptngrChGWiuLFOC
         M4N/eNVlMcbJWCzZeJYy6nXb44MOQRwoKfSQpTu4tnf/nu4bgof+hcwgYyVIcjj9gITy
         r5mwARvsQbQoIsF7ZKzNrFENV+Gc7XFNWUpxoyKt2WcbMhsLVHSZZ5EZtxBmDv40Z014
         sGxQ==
X-Gm-Message-State: AOAM530Qd2zUOnDP2WDAXsNinjCFBb+O/i56DWcghuEfovvgFRyI2TRr
        6QL4o4j/bygIu+VLZn22tc3pF4GKsaFOGw==
X-Google-Smtp-Source: ABdhPJwoNPWtJODIj40oHyTzm+d2OVnr1UHg096uATWec7e94+sqRZSrSyFEolV11CpX7u1d+uou7A==
X-Received: by 2002:a65:4082:: with SMTP id t2mr31175676pgp.396.1618303759653;
        Tue, 13 Apr 2021 01:49:19 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id gw19sm886489pjb.4.2021.04.13.01.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 01:49:19 -0700 (PDT)
Subject: Re: [PATCH v5 5/7] docs/zh_CN: Add translation
 zh_CN/doc-guide/maintainer-profile.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
References: <cover.1618295149.git.bobwxc@email.cn>
 <0ea1acfd30e8a0f2676981100e27513178cde06b.1618295149.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <7cd5afbb-1b33-a45e-84ef-5f6b917f23ff@gmail.com>
Date:   Tue, 13 Apr 2021 16:49:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ea1acfd30e8a0f2676981100e27513178cde06b.1618295149.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/4/13 下午3:13, Wu XiangCheng wrote:
> Add new translation
>   Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/doc-guide/maintainer-profile.rst    | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> 
> diff --git a/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst b/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> new file mode 100644
> index 000000000000..35c88e5b3d83
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> @@ -0,0 +1,43 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/doc-guide/maintainer-profile.rst
> +
> +:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +文档子系统维护人员条目概述
> +==========================
> +
> +文档“子系统”是内核文档和相关基础设施的中心协调点。它涵盖了 Documentation/ 下
> +的文件层级（Documentation/devicetree 除外）、scripts/ 下的各种实用程序，并且
> +在某些情况下的也包括 LICENSES/ 。
> +
> +不过值得注意的是，这个子系统的边界比通常更加模糊。许多其他子系统维护人员需要
> +保持对 Documentation/ 某些部分的控制，以便于可以更自由地做更改。除此之外，
> +许多内核文档都以kernel-doc注释的形式出现在源代码中；这些注释通常（但不总是）
> +由相关的子系统维护人员维护。
> +
> +文档子系统的邮件列表是<linux-doc@vger.kernel.org>。
> +补丁应尽量针对docs-next树。
> +
> +提交检查单补遗
> +--------------
> +
> +在进行文档更改时，您应当构建文档以测试，并确保没有引入新的错误或警告。生成
> +HTML文档并查看结果将有助于避免对文档渲染结果的不必要争执。
> +
> +开发周期的关键节点
> +------------------
> +
> +补丁可以随时发送，但在合并窗口期间，响应将比通常慢。文档树往往在合并窗口打开
> +之前关闭得比较晚，因为文档补丁导致回归的风险很小。
> +
> +审阅节奏
> +--------
> +
> +我（译注：指Jonathan Corbet <corbet@lwn.net>）是文档子系统的唯一维护者，我在
> +自己的时间里完成这项工作，所以对补丁的响应有时会很慢。当补丁被合并时（或当我
> +决定拒绝合并补丁时），我都会发送通知。如果您在发送补丁后一周内没有收到回复，
> +请不要犹豫，发送提醒就好。
> +
> 

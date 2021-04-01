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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74904C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AD79610CA
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhDAEub (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 00:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhDAEuP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:50:15 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03410C0613E6
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:50:15 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so333839pjg.5
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DbKxgZHakLb/Lx1muV22F3nQX3mlIIEOvmFgH3Hd1cU=;
        b=sGCtP1wHRN6UCuOVz7MfpLfHivaXwZaSmzlTfI3Or6GlbZ7E8NO8mh+mUcZuMs0pkY
         qYBl2D0xZhsAopapSurbMoBYSqufVTx3hkvEx7QE1TMOIIvECHhn/TtViGbHKyx22sLF
         LP1HN/iS/+WlqrsHzS39Y3mzXk7PxjOzTLKV3WiWQdIUlvbdJKb5U9PrLGlJiT2mEWzB
         D2JnKYjfz1nSW5WoB+0ZpSgKj3dTpuDTlsIzkD9iMO2oXoXiL52L13VH+2iDOxUIBvUv
         Jq6lnaNedgQ9wjj2s9E50GlR6qanULdRhFTKTK+JJNE32o+TKp5baHZ2WfwKlwdwBqlp
         0Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DbKxgZHakLb/Lx1muV22F3nQX3mlIIEOvmFgH3Hd1cU=;
        b=e9cLfXB5oBMYmVElfrA6uPz0c1Fo8aHaQ+pS2hjxU2ykCbi6u2QLI5IT/SI5Ly+WPw
         4mDYk3+O4LrONSydW477Bd8xHYlwhWLh777tAEwEN7fMgRQaDrY14ah4i2PuU1Mta5Ft
         egyEcTdVEASCo76KAX6AHsOZduOzMUk7hhlqmO9PzS0hQo7rOKSB2LCIpIKmuvewWGxB
         P4X1A/YEK2RRSQvNQtje/m+4FuUrNa8z8svzQq743Y7zdt7Xexv/rDBkyW6B37gFrdUb
         hKvrDI6naW/kURlkffDJi1wSKwsFPlkqzcDUzv7o+vRtJ0WQJHfVSfcJnYF9Jcqzfruj
         tXRw==
X-Gm-Message-State: AOAM5312gSfYErFldtER73Wo8uwhNuSPx3bvqe5V5Luiu87xnSb8w0NL
        g+8KdTMRwx30eOzWp1AlIsIb3aZab7EwUw==
X-Google-Smtp-Source: ABdhPJwl9OIwW1LJ9LEi2sjp9R3XrO9X81stWG3YgPN1FYkNiPl4CJ7Ek5FwhuVPf9NDm/8gBrpTcg==
X-Received: by 2002:a17:90b:1044:: with SMTP id gq4mr6873012pjb.232.1617252614603;
        Wed, 31 Mar 2021 21:50:14 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id r1sm4333127pfh.153.2021.03.31.21.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:50:14 -0700 (PDT)
Subject: Re: [PATCH v3 4/8] docs/zh_CN: add cpu-freq index.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, bobwxc@email.cn
References: <20210330114728.2680-1-siyanteng@loongson.cn>
 <20210330114728.2680-5-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <3d2eb42a-2ff3-3984-253e-397eea64c227@gmail.com>
Date:   Thu, 1 Apr 2021 12:50:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330114728.2680-5-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

Cc: Wu X.C. <bobwxc@email.cn>

On 2021/3/30 下午7:47, Yanteng Si wrote:
> This patch translates Documention/cpu-freq/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/cpu-freq/index.rst     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/cpu-freq/index.rst
> 
> diff --git a/Documentation/translations/zh_CN/cpu-freq/index.rst b/Documentation/translations/zh_CN/cpu-freq/index.rst
> new file mode 100644
> index 000000000000..39d4b058fd7f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/cpu-freq/index.rst
> @@ -0,0 +1,45 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../cpu-freq/index`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_index.rst:
> +
> +
> +=======================================================
> +Linux CPUFreq - Linux(TM)内核中的CPU频率和电压升降代码
> +=======================================================
> +
> +Author: Dominik Brodowski  <linux@brodo.de>
> +
> +      时钟升降允许你在运行中改变CPU的时钟速度。这是一个很好的节省电池电量的方法，因为时
> +      钟速度越低，CPU消耗的电量越少。
> +
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   core
> +   cpu-drivers
> +   cpufreq-stats
> +
> +邮件列表
> +------------
> +这里有一个 CPU 频率变化的 CVS 提交和通用列表，您可以在这里报告bug、问题或提交补丁。要发
> +布消息，请发送电子邮件到 linux-pm@vger.kernel.org。
> +
> +链接
> +-----
> +FTP档案:
> +* ftp://ftp.linux.org.uk/pub/linux/cpufreq/
> +
> +如何访问CVS仓库:
> +* http://cvs.arm.linux.org.uk/
> +
> +CPUFreq邮件列表:
> +* http://vger.kernel.org/vger-lists.html#linux-pm
> +
> +SA-1100的时钟和电压标度:
> +* http://www.lartmaker.nl/projects/scaling
> 

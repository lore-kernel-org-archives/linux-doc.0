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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20882C43460
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF947610CA
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhDAEjY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 00:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbhDAEjI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:39:08 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81B1C0613E6
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:39:07 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id w8so463469pjf.4
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3+g3Z9KkCAIi+cFSPXogW9hwhQ//iAptsTxGYa5pVH8=;
        b=eviDLLtrtU3txI+Ffo7/0jwwtE98EmtwvF6ZSHawwlBxKEhh741SBPB2Rpc9X4ABxe
         NM5TG+NZQMN5w33yRdacktms2lzoJp9X27//tHUDkts9zLewD2YohCpqFv/5KB3sa3Fm
         D//IskFvMjFTE0lfvoooQIOv1T0xZ3ueKkzVTQ9Es6Q+LBLz4rmb4kHsLzf5Or9/GfHJ
         zGEHA4if6z2HNpcfFgCVW+NulzDAb1eI/TtPRFrhruAV87QtHE1M1c9a8+5mpYeQs5JT
         IE1l//SRRl4TIYhXNpMcvhfpyThBusT8MtI0/EbFj3XSd7ESGcLKKvKsTZyxqQURb5tl
         mG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3+g3Z9KkCAIi+cFSPXogW9hwhQ//iAptsTxGYa5pVH8=;
        b=e+b5VmDsx77EdeSgqVIXcl+J/AlBU0NI0IWXanZjoWRi5wQBxZKbKTRpff90cpuIpK
         5hoY9TP7mRdUGVbK43yllcYKohT61Z4Gqpz14TKzem9j9Mc/p2AIaDl5iGjtZtkCgbr3
         kmi9Xa5IBqfRXtQSCvmFERZ0X56yXf7Tf12GIYYTeGm4wRXwKDUa/qlB+aO86SgfcFbd
         QSwjgoUYSAp4fo8u9x6Lm7VCFl/vf97lg9vYNQCX4/RGAX0+7PYBXo7aPJ2So4faBQDp
         fS2zTkGJWsw3Pekfq39zmc8kwEHzVSwEL9nZiiw5+CpUA9taOS/PdF2jBUjRnY4ZNgOW
         1V3A==
X-Gm-Message-State: AOAM531swQruQZbcTDcDcpwxAhlpCt3offrkBd26FicHWyo/q2Qbhoj0
        9ArC61hopux4xRCPSc9Xgms8LeAWqHlwRA==
X-Google-Smtp-Source: ABdhPJw20ndOOqtbRnYJOovVjDnQjSd/wCu8ZDrnbLq5XIbPYgW1UejDjEUAmK7Fpt39wiXNCClBgA==
X-Received: by 2002:a17:90a:8083:: with SMTP id c3mr6670299pjn.134.1617251947396;
        Wed, 31 Mar 2021 21:39:07 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id gf20sm3789492pjb.39.2021.03.31.21.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:39:06 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] docs/zh_CN: add cpu-freq cpufreq-stats.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <20210330114728.2680-1-siyanteng@loongson.cn>
 <20210330114728.2680-4-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <3dd6f551-131f-91f1-9787-b94c7d294244@gmail.com>
Date:   Thu, 1 Apr 2021 12:39:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330114728.2680-4-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/3/30 下午7:47, Yanteng Si wrote:
> This patch translates Documention/cpu-freq/cpufreq-stats.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/cpu-freq/cpufreq-stats.rst          | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
> 
> diff --git a/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
> new file mode 100644
> index 000000000000..d21a317d9659
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
> @@ -0,0 +1,130 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../cpu-freq/cpufreq-stats`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_cpufreq-stats.rst:
> +
> +
> +==========================================
> +sysfs CPUFreq Stats的一般说明
> +==========================================
> +
> +用户信息
> +
> +
> +作者: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
> +
> +.. Contents
> +
> +   1. 简介
> +   2. 提供的统计数据(举例说明)
> +   3. 配置cpufreq-stats
> +
> +
> +1. 简介
> +===============
> +
> +cpufreq-stats是一个为每个CPU提供CPU频率统计的驱动。
> +这些统计数据在/sysfs中以一堆只读接口的形式提供。这个接口（在配置好后）将出现在
> +/sysfs（<sysfs root>/devices/system/cpu/cpuX/cpufreq/stats/）中cpufreq下的一个单
> +独的目录中，提供给每个CPU。
> +各种统计数据将在此目录下形成只读文件。
> +
> +此驱动是独立于任何可能运行在你所用CPU上的特定cpufreq_driver而设计的。因此，它将与所有
> +cpufreq_driver一起工作。
> +
> +
> +2. 提供的统计数据(举例说明)
> +=====================================
> +
> +cpufreq stats提供了以下统计数据（在下面详细解释）。
> +
> +-  time_in_state
> +-  total_trans
> +-  trans_table
> +
> +所有的统计数据将从统计驱动被载入的时间（或统计被重置的时间）开始，到某一统计数据被读取的时间为止。
> +显然，统计驱动不会有任何关于统计驱动载入之前的频率转换信息。
> +
> +::
> +
> +    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # ls -l
> +    total 0
> +    drwxr-xr-x  2 root root    0 May 14 16:06 .
> +    drwxr-xr-x  3 root root    0 May 14 15:58 ..
> +    --w-------  1 root root 4096 May 14 16:06 reset
> +    -r--r--r--  1 root root 4096 May 14 16:06 time_in_state
> +    -r--r--r--  1 root root 4096 May 14 16:06 total_trans
> +    -r--r--r--  1 root root 4096 May 14 16:06 trans_table
> +
> +- **reset**
> +
> +只写属性，可用于重置统计计数器。这对于评估不同调节器下的系统行为非常有用，且无需重启。
> +
> +
> +- **time_in_state**
> +
> +此项给出了这个CPU所支持的每个频率所花费的时间。cat输出的每一行都会有"<frequency>
> +<time>"对，表示这个CPU在<frequency>上花费了<time>个usertime单位的时间。这里的
> +usertime单位是10mS（类似于/proc中输出的其他时间）。
> +
> +::
> +
> +    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # cat time_in_state
> +    3600000 2089
> +    3400000 136
> +    3200000 34
> +    3000000 67
> +    2800000 172488
> +
> +
> +- **total_trans**
> +
> +给出了这个CPU上频率转换的总次数。cat的输出将有一个单一的计数，这就是频率转换的总数。
> +
> +::
> +
> +    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # cat total_trans
> +    20
> +
> +- **trans_table**
> +
> +这将提供所有CPU频率转换的细粒度信息。这里的cat输出是一个二维矩阵，其中一个条目<i, j>（第
> +i行，第j列）代表从Freq_i到Freq_j的转换次数。Freq_i行和Freq_j列遵循驱动最初提供给cpufreq
> +核的频率表的排序顺序，因此可以排序（升序或降序）或不排序。 这里的输出也包含了每行每列的实际
> +频率值，以便更好地阅读。
> +
> +如果转换表大于PAGE_SIZE，读取时将返回一个-EFBIG错误。
> +
> +::
> +
> +    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # cat trans_table
> +    From  :    To
> +	    :   3600000   3400000   3200000   3000000   2800000
> +    3600000:         0         5         0         0         0
> +    3400000:         4         0         2         0         0
> +    3200000:         0         1         0         2         0
> +    3000000:         0         0         1         0         3
> +    2800000:         0         0         0         2         0
> +
> +3. 配置cpufreq-stats
> +============================
> +
> +要在你的内核中配置cpufreq-stats::
> +
> +	Config Main Menu
> +		Power management options (ACPI, APM)  --->
> +			CPU Frequency scaling  --->
> +				[*] CPU Frequency scaling
> +				[*]   CPU frequency translation statistics
> +
> +
> +"CPU Frequency scaling" (CONFIG_CPU_FREQ) 应该被启用以配置cpufreq-stats。
> +
> +"CPU frequency translation statistics" (CONFIG_CPU_FREQ_STAT)提供了包括
> +time_in_state、total_trans和trans_table的统计数据。
> +
> +一旦启用了这个选项，并且你的CPU支持cpufrequency，你就可以在/sysfs中看到CPU频率统计。
> 

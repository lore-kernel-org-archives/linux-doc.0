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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00FBC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98C826108F
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbhDAEjX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 00:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhDAEiv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:38:51 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76043C061786
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:38:39 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id y32so754482pga.11
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/Vam1fJLjxNtJZu/f/AMR3CCz+8yAdtAg7Xv/X29pVU=;
        b=b8W1uXMuwYrJSL5CWVAhCeffazKyTt9mj95hupU/81+5/0lENLkD1jTn+b7S5Lm4fU
         Iqn10qSf5Z3T9n2aUisaiW7MSlwRdg20m0hRlvJmnxLau38QuuNRfsB47HcTdVt6JRf4
         gKE76fxnf0BZJ28HO7f1VzPHaflhWgSApa86HuzHX9YsL7peMyEOz9llOUO/gOaV1+D7
         N6qLpicqSXtJURY4AvB9xk0xS1jhcAzSmnSbKggOwEr8f8IjB2Pxrf7El2c/OQr540eC
         fd3+QILZB9Xlgn9HGEYFFAe23uJh7FYjXPHp5HnBTjtWeBTw4df+lBbo9JZPX0q4PWM2
         4jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/Vam1fJLjxNtJZu/f/AMR3CCz+8yAdtAg7Xv/X29pVU=;
        b=XMD1y5OBP+F+ah3/CD0uamt0aTxDJ9GO+fvzRpfoCzdXvuoPxhUcsPKRTPTrZBJTf5
         cI5LDdRrZo+0DMSXUYB7yz8KoXzYRiy14eSi+IDlPo2VdfImUk09v4ppqReGtfy7fLgm
         pInNMbFbMsiyOUMv0jA8kbp6ZgxU5SiZHJ68UpiBqR+bAdNTU5f34ndMgFm+hJqTxmqX
         vAVLYZZSt9fM8XLAcGj3Knt706N5X1dC15dLdna4IKvY7CYN6hhhx49WR/2YJSjDrmfn
         oacCjFIbEx7b+T67vSXvIgZxYVIAwRaobE6UxFgaAgVABs82nG6FGd0KutWAv4zFyW/N
         smFw==
X-Gm-Message-State: AOAM5303lyHww8M3LzRpJ6HEvVxL+WW/0VCWPxyGnapNXdQm70WE2Mzx
        1XxWHiiOXURLxpPHwnstcBY=
X-Google-Smtp-Source: ABdhPJzyZIUejpbSOjuK62d+1CtxCERoPnoFdqoL94o2SJvO4YRrcVXrR6rPkZRTHanujgSWWuD9vg==
X-Received: by 2002:a65:6645:: with SMTP id z5mr5847130pgv.273.1617251918999;
        Wed, 31 Mar 2021 21:38:38 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id n10sm3735560pjo.15.2021.03.31.21.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:38:38 -0700 (PDT)
Subject: Re: [PATCH v3 1/8] docs/zh_CN: add cpu-freq core.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <20210330114728.2680-1-siyanteng@loongson.cn>
 <20210330114728.2680-2-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <eee8d1b5-6f47-7398-60f5-b74d5ab09034@gmail.com>
Date:   Thu, 1 Apr 2021 12:38:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330114728.2680-2-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 2021/3/30 下午7:47, Yanteng Si wrote:
> This patch translates Documention/cpu-freq/core.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/cpu-freq/core.rst      | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/cpu-freq/core.rst
> 
> diff --git a/Documentation/translations/zh_CN/cpu-freq/core.rst b/Documentation/translations/zh_CN/cpu-freq/core.rst
> new file mode 100644
> index 000000000000..1571087c2581
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/cpu-freq/core.rst
> @@ -0,0 +1,105 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../cpu-freq/core`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_core.rst:
> +
> +
> +====================================
> +CPUFreq核心和CPUFreq通知器的通用说明
> +====================================
> +
> +作者:
> +	- Dominik Brodowski  <linux@brodo.de>
> +	- David Kimdon <dwhedon@debian.org>
> +	- Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> +	- Viresh Kumar <viresh.kumar@linaro.org>
> +
> +.. 目录:
> +
> +   1.  CPUFreq核心和接口
> +   2.  CPUFreq通知器
> +   3.  含有Operating Performance Point (OPP)的CPUFreq表的生成
> +
> +1. CPUFreq核心和接口
> +======================
> +
> +cpufreq核心代码位于drivers/cpufreq/cpufreq.c中。这些cpufreq代码为CPUFreq架构的驱
> +动程序（那些操作硬件切换频率的代码）以及 "通知器 "提供了一个标准化的接口。
> +这些是设备驱动程序或需要了解策略变化的其它内核部分（如 ACPI 热量管理）或所有频率更改（除
> +计时代码外），甚至需要强制确定速度限制的通知器（如 ARM 架构上的 LCD 驱动程序）。
> +此外， 内核 "常数" loops_per_jiffy会根据频率变化而更新。
> +
> +cpufreq策略的引用计数由 cpufreq_cpu_get 和 cpufreq_cpu_put 来完成，以确保 cpufreq 驱
> +动程序被正确地注册到核心中，并且驱动程序在 cpufreq_put_cpu 被调用之前不会被卸载。这也保证
> +了每个CPU核的cpufreq 策略在使用期间不会被释放。
> +
> +2. CPUFreq 通知器
> +====================
> +
> +CPUFreq通知器符合标准的内核通知器接口。
> +关于通知器的细节请参阅 linux/include/linux/notifier.h。
> +
> +这里有两个不同的CPUfreq通知器 - 策略通知器和转换通知器。
> +
> +
> +2.1 CPUFreq策略通知器
> +----------------------------
> +
> +当创建或移除策略时，这些都会被通知。
> +
> +阶段是在通知器的第二个参数中指定的。当第一次创建策略时，阶段是CPUFREQ_CREATE_POLICY，当
> +策略被移除时，阶段是CPUFREQ_REMOVE_POLICY。
> +
> +第三个参数 ``void *pointer`` 指向一个结构体cpufreq_policy，其包括min，max(新策略的下限和
> +上限（单位为kHz）)这几个值。
> +
> +
> +2.2 CPUFreq转换通知器
> +--------------------------------
> +
> +当CPUfreq驱动切换CPU核心频率时，策略中的每个在线CPU都会收到两次通知，这些变化没有任何外部干
> +预。
> +
> +第二个参数指定阶段 - CPUFREQ_PRECHANGE or CPUFREQ_POSTCHANGE.
> +
> +第三个参数是一个包含如下值的结构体cpufreq_freqs：
> +
> +=====	====================
> +cpu	受影响cpu的编号
> +old	旧频率
> +new	新频率
> +flags	cpufreq驱动的标志
> +=====	====================
> +
> +3. 含有Operating Performance Point (OPP)的CPUFreq表的生成
> +==================================================================
> +关于OPP的细节请参阅 Documentation/power/opp.rst
> +
> +dev_pm_opp_init_cpufreq_table -
> +	这个功能提供了一个随时可用的转换程序，用来将OPP层关于可用频率的内部信息翻译成一种容易提供给
> +	cpufreq的格式。
> +
> +	.. Warning::
> +
> +		不要在中断上下文中使用此函数。
> +
> +	例如::
> +
> +	 soc_pm_init()
> +	 {
> +		/* Do things */
> +		r = dev_pm_opp_init_cpufreq_table(dev, &freq_table);
> +		if (!r)
> +			policy->freq_table = freq_table;
> +		/* Do other things */
> +	 }
> +
> +	.. note::
> +
> +		该函数只有在CONFIG_PM_OPP之外还启用了CONFIG_CPU_FREQ时才可用。
> +
> +dev_pm_opp_free_cpufreq_table
> +	释放dev_pm_opp_init_cpufreq_table分配的表。
> 

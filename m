Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59035C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 06:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1410E61968
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 06:24:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhC2GYE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 02:24:04 -0400
Received: from [43.250.32.171] ([43.250.32.171]:14342 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229711AbhC2GXw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 29 Mar 2021 02:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=jFUyXgjvns418Jx2fGzisnUKjcD9uEKJha4yr
        JRUHIg=; b=Gr0PAQVJCpe0epgNpjyYCF2jLzg8BoFakGniEuaBGLYAwP+3032pg
        5EbVG3h+kbF5Cvc9JDwvVs3Mo/0oWEVcAqpqbg4EuqxAHUe2emWOK7Ew/zupVCrb
        TFrfCs7c2xdXk6ch3Df2PFkJyHroopXp4NimPshatKn3q9p9xhGSGk=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAXi9FucmFg1yBAAA--.13437S2;
        Mon, 29 Mar 2021 14:23:44 +0800 (CST)
Date:   Mon, 29 Mar 2021 14:23:42 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 3/8] docs/zh_CN: add cpu-freq cpufreq-stats.rst
 translation
Message-ID: <20210329062342.GB8845@mipc>
References: <20210329025144.9776-1-siyanteng@loongson.cn>
 <20210329025144.9776-4-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210329025144.9776-4-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgAXi9FucmFg1yBAAA--.13437S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1fKw17Xr4kWw4kGr18AFb_yoW5Gw48pr
        1qgrWIkr4xtryDJ3ZxKr1UKw1DAFs7AwnrCrn7Jrn0qF1UJw4qqF1UKFyDCrW5W39rAFW8
        Zr4rJrW0krWUC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUymb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1U
        JwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
        vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
        x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
        xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
        wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07U4a0PUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 29, 2021 at 10:51:39AM +0800, Yanteng Si wrote:
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

You changed 'insert' in this sentence.
And next?

> +显然，统计驱动不会有任何关于统计驱动插入之前的频率转换信息。
                                       ^^^^
All others are look good to me.

Thanks!

Wu X.C.


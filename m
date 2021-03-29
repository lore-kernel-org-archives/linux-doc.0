Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FE6C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 06:23:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 319356196D
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 06:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhC2GWY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 02:22:24 -0400
Received: from [43.250.32.171] ([43.250.32.171]:14146 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229441AbhC2GVw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 29 Mar 2021 02:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=tBfQG9dYtXoLOF7i1yHjoOy0gIgn67R7FdmFQ
        RUVVm4=; b=aMxXP/aEl1xh9C440HpLcMj6XOso8j//+g8mYo5lzbhXk+UBsXOUn
        3i+kxL98I3ABu4JPAMhUBno6DkQjpPVq6mvBsx+y3DqqF2Z7ZGsqMdU5zO+pF9L6
        MchLLtvOVA2zYorZagt/6g+lfWRdjBYLBhG88FndZYo9LVR/xRT32Y=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB36tD0cWFgOSBAAA--.12921S2;
        Mon, 29 Mar 2021 14:21:41 +0800 (CST)
Date:   Mon, 29 Mar 2021 14:21:39 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 2/8] docs/zh_CN: add cpu-freq cpu-drivers.rst
 translation
Message-ID: <20210329062139.GA8845@mipc>
References: <20210329025144.9776-1-siyanteng@loongson.cn>
 <20210329025144.9776-3-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210329025144.9776-3-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB36tD0cWFgOSBAAA--.12921S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw17AF4xGry5GryfCrW7Jwb_yoW8XFWrpF
        4fKrWayr48tw47Cw1fCF47Xryfuan3uayjkwsFg3Z5W3W7AFnYqFyDt3929FWDJryxGFy0
        qFsxtrZ8CF1UA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyvb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1U
        JwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
        vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
        x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
        xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
        wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUj2Nt7UUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Mar 29, 2021 at 10:51:38AM +0800, Yanteng Si wrote:
> This patch translates Documention/cpu-freq/cpu-drivers.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/cpu-freq/cpu-drivers.rst            | 259 ++++++++++++++++++
>  1 file changed, 259 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
> 
> diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
[...]
> +1.5. target/target_index
> +------------------------
> +
> +target_index调用有两个参数/：``struct cpufreq_policy * policy``和``unsigned int``

"s/。/：/" means use '：' to replace '。' ;
aka "s/{0}/{1}/" means use {1} to replace {0}, this is a sed command.
So, please delete the '/' .

[...]
> +
> +如果你需要在driver_freq_table中处理pos的位置，不要减去指针，因为它的代价相当高。相反，使用宏
> +  cpufreq_for_each_entry_idx() 和 cpufreq_for_each_valid_entry_idx() 。

The spaces in the begin are also redundant.

And one more thing:
  The numbers of columns are very random, if someone read the rst files
  <http://fars.ee/sqoL.png>
  instead of html files, that may cause difficulties. Please use a
  monospaced font to fix the problem, try to keep in 74-80 columns
  except meet a long English word, one Chinese character use 2 columns.

  This comment is for all patches.

Thanks!

Wu X.C.


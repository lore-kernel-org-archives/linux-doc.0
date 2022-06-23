Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AF1C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 13:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiFWNPZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 09:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbiFWNOi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 09:14:38 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C7371387A0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 06:14:36 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9c6Z7Rij6pWAA--.417S3;
        Thu, 23 Jun 2022 21:14:34 +0800 (CST)
Message-ID: <e6d4c469-24dc-8a18-ad6a-7745992cc732@loongson.cn>
Date:   Thu, 23 Jun 2022 21:14:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 8/9] docs/zh_CN: core-api: Update the translation of
 workqueue.rst to 5.19-rc3
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <d045cb5623b5ae703c2296d3caa05017d5d225bd.1655863769.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <d045cb5623b5ae703c2296d3caa05017d5d225bd.1655863769.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr9c6Z7Rij6pWAA--.417S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1UAFy8Ar4ktrW7Xw4ruFg_yoW8KF13pr
        9akr97GF4xA34a93Z3KF4UGr13GFyxWFsFga1ftas8Aa9Yq398tr45tF98W34fXryvvFyr
        XrZYkrWkCF4YyFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
        IFyTuYvjfUeYL9UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/22 18:19, Binbin Zhou 写道:
> Synchronous translation from upstream commit f9eaaa82b474
> ("workqueue: doc: Call out the non-reentrance conditions")
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>

> ---
>   .../translations/zh_CN/core-api/workqueue.rst | 21 +++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/core-api/workqueue.rst b/Documentation/translations/zh_CN/core-api/workqueue.rst
> index e372fa5cf101..f6567cf9d3fb 100644
> --- a/Documentation/translations/zh_CN/core-api/workqueue.rst
> +++ b/Documentation/translations/zh_CN/core-api/workqueue.rst
> @@ -6,6 +6,7 @@
>   :翻译:
>   
>    司延腾 Yanteng Si <siyanteng@loongson.cn>
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
>   
>   .. _cn_workqueue.rst:
>   
> @@ -178,10 +179,6 @@ workqueue将自动创建与属性相匹配的后备工作者池。调节并发
>   
>     这个标志对于未绑定的wq来说是没有意义的。
>   
> -请注意，标志 ``WQ_NON_REENTRANT`` 不再存在，因为现在所有的工作
> -队列都是不可逆的——任何工作项都保证在任何时间内最多被整个系统的一
> -个工作者执行。
> -
>   
>   ``max_active``
>   --------------
> @@ -328,6 +325,22 @@ And with cmwq with ``@max_active`` >= 3, ::
>   
>   工作项函数在堆栈追踪中应该是微不足道的。
>   
> +不可重入条件
> +============
> +
> +工作队列保证，如果在工作项排队后满足以下条件，则工作项不能重入：
> +
> +
> +        1. 工作函数没有被改变。
> +        2. 没有人将该工作项排到另一个工作队列中。
> +        3. 该工作项尚未被重新启动。
> +
> +换言之，如果上述条件成立，则保证在任何给定时间最多由一个系统范围内的工作程序执行
> +该工作项。
> +
> +请注意，在self函数中将工作项重新排队（到同一队列）不会破坏这些条件，因此可以安全
> +地执行此操作。否则在破坏工作函数内部的条件时需要小心。
> +
>   
>   内核内联文档参考
>   ================


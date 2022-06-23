Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB868C43334
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 13:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbiFWNPZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 09:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbiFWNO2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 09:14:28 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 12A5F42EC1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 06:13:53 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39oPZ7RiJqpWAA--.448S3;
        Thu, 23 Jun 2022 21:13:52 +0800 (CST)
Message-ID: <aec53587-2595-0fe9-a4da-37c3f0081650@loongson.cn>
Date:   Thu, 23 Jun 2022 21:13:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 9/9] docs/zh_CN: core-api: Update the translation of
 xarray.rst to 5.19-rc3
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <b7d5f3ca914667ec14ba35a7c0db3ec3506e670d.1655863769.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <b7d5f3ca914667ec14ba35a7c0db3ec3506e670d.1655863769.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx39oPZ7RiJqpWAA--.448S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1UXr47tw15Xw48Xr4xWFg_yoW8Zw1rpF
        97KryxA3ZrZry09rnrury8Kr1UGFWfKa1Uua97Jwn7Z3WDJa9ayrs0yF9rCrZ2qryIvay2
        vr4Skry0ga1jkrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
> Synchronous translation from upstream commit ac23d1a96460
> ("XArray: Document the locking requirement for the xa_state")
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>

> ---
>   Documentation/translations/zh_CN/core-api/xarray.rst | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/core-api/xarray.rst b/Documentation/translations/zh_CN/core-api/xarray.rst
> index ff2d9bcb7c34..fb19324966ce 100644
> --- a/Documentation/translations/zh_CN/core-api/xarray.rst
> +++ b/Documentation/translations/zh_CN/core-api/xarray.rst
> @@ -6,6 +6,7 @@
>   :翻译:
>   
>    司延腾 Yanteng Si <siyanteng@loongson.cn>
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
>   
>   :校译:
>   
> @@ -254,7 +255,8 @@ __xa_set_mark() 和 __xa_clear_mark() 函数也适用于你查找一个条目并
>   
>   高级API是基于xa_state的。这是一个不透明的数据结构，你使用XA_STATE()宏在堆栈中声明。这个宏初始化了
>   xa_state，准备开始在XArray上移动。它被用作一个游标来保持在XArray中的位置，并让你把各种操作组合在一
> -起，而不必每次都从头开始。
> +起，而不必每次都从头开始。xa_state的内容受rcu_read_lock()或xas_lock()的保护。如果需要删除保护状态
> +和树的这些锁中的任何一个，你必须调用xas_pause()以便将来的调用不会依赖于状态中未受保护的部分。
>   
>   xa_state也被用来存储错误(store errors)。你可以调用xas_error()来检索错误。所有的操作在进行之前都
>   会检查xa_state是否处于错误状态，所以你没有必要在每次调用之后检查错误；你可以连续进行多次调用，只在


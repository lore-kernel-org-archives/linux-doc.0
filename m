Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A625C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 13:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbiFWNNb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 09:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiFWNN3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 09:13:29 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4EB3F33A14
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 06:13:27 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT0z0ZrRi9qlWAA--.398S3;
        Thu, 23 Jun 2022 21:13:25 +0800 (CST)
Message-ID: <333c92ec-00a0-7d93-00e5-21e5fdc831e8@loongson.cn>
Date:   Thu, 23 Jun 2022 21:13:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/9] docs/zh_CN: core-api: Update the translation of
 mm-api.rst to 5.19-rc3
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <0bd7b03a5d38dd1599715343360bef4289b7c0fb.1655863769.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <0bd7b03a5d38dd1599715343360bef4289b7c0fb.1655863769.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT0z0ZrRi9qlWAA--.398S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tF18XrWrJFW3AFWrWF48Zwb_yoW8Ww4kpF
        97Cw1xJF47A34UCrn7Wr9FkF13WFZ7Gay7Kay2q3s8ZF13tan7KrZ8tryS9rZ7Ar1vyFW0
        qFZ7GFZ09FyjyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
        IFyTuYvjfUeYL9UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/22 18:18, Binbin Zhou 写道:
> Synchronous translation from the following commits(Latest in front):
>
> [1]: commit 84dacdbd5352("mm: document and polish read-ahead code")
>
> [2]: commit 2f52578f9c64("mm/util: Add folio_mapping() and
>       folio_file_mapping()")
>
> [3]: commit 889a3747b3b7("mm/lru: Add folio LRU functions")
>
> [4]: commit c24016ac3a62("mm: Add folio reference count functions")
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>

> ---
>   .../translations/zh_CN/core-api/mm-api.rst    | 23 ++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst
> index 0ea43dc67953..a732b0eebf16 100644
> --- a/Documentation/translations/zh_CN/core-api/mm-api.rst
> +++ b/Documentation/translations/zh_CN/core-api/mm-api.rst
> @@ -5,6 +5,7 @@
>   :翻译:
>   
>    司延腾 Yanteng Si <siyanteng@loongson.cn>
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
>   
>   :校译:
>   
> @@ -66,12 +67,24 @@ mm/vmalloc.c
>   
>   该API在以下内核代码中:
>   
> -mm/readahead.c
> +文件映射
> +--------
>   
>   mm/filemap.c
>   
> +预读
> +----
> +
> +mm/readahead.c
> +
> +回写
> +----
> +
>   mm/page-writeback.c
>   
> +截断
> +----
> +
>   mm/truncate.c
>   
>   include/linux/pagemap.h
> @@ -105,6 +118,14 @@ mm/mempolicy.c
>   
>   include/linux/mm_types.h
>   
> +include/linux/mm_inline.h
> +
> +include/linux/page-flags.h
> +
>   include/linux/mm.h
>   
> +include/linux/page_ref.h
> +
>   include/linux/mmzone.h
> +
> +mm/util.c


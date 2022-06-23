Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5327C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 13:12:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiFWNMt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 09:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiFWNMs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 09:12:48 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7236231535
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 06:12:47 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx307NZrRiqalWAA--.419S3;
        Thu, 23 Jun 2022 21:12:45 +0800 (CST)
Message-ID: <2ac5154b-2009-0e9c-7c45-2207062c6648@loongson.cn>
Date:   Thu, 23 Jun 2022 21:12:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/9] docs/zh_CN: core-api: Update the translation of
 kernel-api.rst to 5.19-rc3
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <9173878562404f4518fecc7c55032fe815f87fd9.1655863769.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <9173878562404f4518fecc7c55032fe815f87fd9.1655863769.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx307NZrRiqalWAA--.419S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKr47tr45AF43Cw1fWF4rZrb_yoWDCwc_XF
        s2qF4SkFWvyr1ftr18JF1kJr1Y9F1S9w1F9w1Dt39Fy34Dtw4DJw1DZasYqFs8JFs8urs8
        Ga9rurna9rnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbsxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6ry8MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2
        jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
        ZFpf9x0JUSJP_UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/22 18:18, Binbin Zhou 写道:
> Synchronous translation from upstream commit 640d1930bef4
> ("block: Add bio_for_each_folio_all()")
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>

> ---
>   Documentation/translations/zh_CN/core-api/kernel-api.rst | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> index e45fe80d1cd8..120c051f6fcb 100644
> --- a/Documentation/translations/zh_CN/core-api/kernel-api.rst
> +++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> @@ -5,6 +5,7 @@
>   :翻译:
>   
>    司延腾 Yanteng Si <siyanteng@loongson.cn>
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
>   
>   .. _cn_kernel-api.rst:
>   
> @@ -282,6 +283,8 @@ kernel/acct.c
>   
>   该API在以下内核代码中:
>   
> +include/linux/bio.h
> +
>   block/blk-core.c
>   
>   block/blk-core.c


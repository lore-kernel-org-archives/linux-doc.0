Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486AEC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jun 2022 03:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiF2Dwd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 23:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiF2Dwc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 23:52:32 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96C811F622
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 20:52:31 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.112.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39l6zLtiuv5iAA--.10425S3;
        Wed, 29 Jun 2022 11:52:26 +0800 (CST)
Message-ID: <5a8a77a9-7873-2065-c868-0ca24787cd8d@loongson.cn>
Date:   Wed, 29 Jun 2022 11:52:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] docs/zh_CN: Show the Chinese translation of
 spinlocks
To:     yizhou.tang@shopee.com, alexs@kernel.org, seakeel@gmail.com,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, robin.lubin@shopee.com, huangh@sea.com,
        bobwxc@email.cn
References: <20220629013240.65386-1-yizhou.tang@shopee.com>
 <20220629013240.65386-2-yizhou.tang@shopee.com>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <20220629013240.65386-2-yizhou.tang@shopee.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx39l6zLtiuv5iAA--.10425S3
X-Coremail-Antispam: 1UD129KBjvdXoWruFWUtry7KFy8ZF1DCw18Grg_yoWDCrb_Ca
        4kXa1kArW3XF4fJr1rJF1UAF4FkFWIkF18Crn5trZ8J34UAwsxG3WDZw1kJa15WFZI9rn0
        krZ5Zryrur17XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbIAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
        MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
        026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
        Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
        vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv
        67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
        uYvjxUcQJ5DUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/29 9:32, yizhou.tang@shopee.com 写道:
> From: Tang Yizhou <yizhou.tang@shopee.com>
>
> Last time I forgot to edit locking/index.rst so the Chinese translation
> of spinlocks hasn't been shown on web yet.
>
> Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>

Thanks,

Yanteng

> ---
>   Documentation/translations/zh_CN/locking/index.rst | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
> index 700df8a2bb70..76a8be9bf78b 100644
> --- a/Documentation/translations/zh_CN/locking/index.rst
> +++ b/Documentation/translations/zh_CN/locking/index.rst
> @@ -14,6 +14,8 @@
>   .. toctree::
>       :maxdepth: 1
>   
> +    spinlocks
> +
>   TODOList:
>   
>       * locktypes
> @@ -24,7 +26,6 @@ TODOList:
>       * rt-mutex-design
>       * rt-mutex
>       * seqlock
> -    * spinlocks
>       * ww-mutex-design
>       * preempt-locking
>       * pi-futex


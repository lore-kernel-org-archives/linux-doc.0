Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D0CC001B0
	for <linux-doc@archiver.kernel.org>; Mon, 14 Aug 2023 07:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbjHNH1i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 03:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbjHNH1K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 03:27:10 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 51831E75
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 00:27:07 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.245])
        by gateway (Coremail) with SMTP id _____8BxJvFK19lkowYYAA--.50100S3;
        Mon, 14 Aug 2023 15:27:06 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.109.245])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjiNI19lk05NZAA--.49421S3;
        Mon, 14 Aug 2023 15:27:06 +0800 (CST)
Message-ID: <454e0802-7912-4a1d-83b3-70713ddb1360@loongson.cn>
Date:   Mon, 14 Aug 2023 15:27:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: correct regi_chg(),regi_add() to
 region_chg(),region_add()
To:     Xueshi Hu <xueshi.hu@smartx.com>
Cc:     corbet@lwn.net, alexs@kernel.org, linux-doc@vger.kernel.org
References: <20230813132417.815036-1-xueshi.hu@smartx.com>
Content-Language: en-US
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <20230813132417.815036-1-xueshi.hu@smartx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxjiNI19lk05NZAA--.49421S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFWrKF4xWF17AF4kCr1UCFX_yoW8tFykpa
        47KFyfW3WxAr1jgr1UK34jvrnYkan7Ja1DCrn7J3yfJwn3J3sF9rZxG39rKan2qr97Aay7
        W3y0gFZ7CryIkFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
        sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
        0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
        IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
        e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
        xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
        1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
        67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
        0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2023/8/13 21:24, Xueshi Hu 写道:
> Minor typo fix in translations.
>
> Signed-off-by: Xueshi Hu <xueshi.hu@smartx.com>

Acked-by: Yanteng Si <siyanteng@loongson.cn>


Thanks,

Yanteng

> ---
>   Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst b/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
> index b7a0544224ad..45048a30f736 100644
> --- a/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
> +++ b/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
> @@ -296,7 +296,7 @@ COW和预留
>      调用代码执行全局检查和分配，以确定是否有足够的巨页使操作成功。
>   
>   2)
> -  a) 如果操作能够成功，regi_add()将被调用，以实际修改先前传递给regi_chg()的相同范围
> +  a) 如果操作能够成功，region_add()将被调用，以实际修改先前传递给region_chg()的相同范围
>        [f, t]的预留映射。
>     b) 如果操作不能成功，region_abort被调用，在相同的范围[f, t]内中止操作。
>   
> @@ -307,7 +307,7 @@ COW和预留
>   如上所述，region_chg()确定该范围内当前没有在映射中表示的页面的数量。region_add()返回添加
>   到映射中的范围内的页数。在大多数情况下， region_add() 的返回值与 region_chg() 的返回值相
>   同。然而，在共享映射的情况下，有可能在调用 region_chg() 和 region_add() 之间对预留映射进
> -行更改。在这种情况下，regi_add()的返回值将与regi_chg()的返回值不符。在这种情况下，全局计数
> +行更改。在这种情况下，region_add()的返回值将与region_chg()的返回值不符。在这种情况下，全局计数
>   和子池计数很可能是不正确的，需要调整。检查这种情况并进行适当的调整是调用者的责任。
>   
>   函数region_del()被调用以从预留映射中移除区域。


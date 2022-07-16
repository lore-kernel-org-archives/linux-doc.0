Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78539C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 16 Jul 2022 12:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbiGPMqD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Jul 2022 08:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiGPMqD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Jul 2022 08:46:03 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1CE1FCCA
        for <linux-doc@vger.kernel.org>; Sat, 16 Jul 2022 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=JEuVBdogldedQGbUWUd0sZpvFlwXQK/CMK7kW
        l+ZQmg=; b=bGC47sFxLayIn2CcysZO9DaiiiMJLH/mMCV9AX6cLXdcQy+8w+G70
        asc3o00x4vUN1cyxDFdlGsAl/lN5ws+7FlqG7vnKYl2inOsuwhTZ2LOORbCYVAwp
        dGeVbLq9AK6MsDJV7qUGVSXHo2PgqRsWrBl/vaCYupi8xiEjz9ST3I=
Received: from bobwxc.mipc (unknown [120.242.68.196])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgC3Z2T7stJiFsgvAA--.50086S2;
        Sat, 16 Jul 2022 20:45:49 +0800 (CST)
Date:   Sat, 16 Jul 2022 20:45:47 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, zhoubb.aaron@gmail.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/4] docs/zh_CN: core-api: Add idr Chinese translation
Message-ID: <YtKy+z+iSA6D8r9m@bobwxc.mipc>
References: <cover.1657796498.git.zhoubinbin@loongson.cn>
 <173707ec644d2a8ba394254f5596d5ce80290f23.1657796499.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173707ec644d2a8ba394254f5596d5ce80290f23.1657796499.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgC3Z2T7stJiFsgvAA--.50086S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFW5GF47JrW8Aw13CF4rZrb_yoW5AF1rpF
        y7Kr97Ga1IkF9Fkas7WryUJwnxAFWxC39rJ3srX3Z8Xr95AFWfKrZrKayDK3y7G340yFy8
        Cr4SgFWj9ryjk3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Xr1l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUUBWlPUUUUU==
X-Originating-IP: [120.242.68.196]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Binbin,

On Thu, Jul 14, 2022 at 09:06:00PM +0800, Binbin Zhou wrote:
> Translate core-api/idr.rst into Chinese.
> 
> Last English version used:
> 
> commit 85656ec193e9 ("IDR: Note that the IDR API is deprecated").
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../translations/zh_CN/core-api/idr.rst       | 74 +++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |  2 +-
>  2 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/idr.rst b/Documentation/translations/zh_CN/core-api/idr.rst
> new file mode 100644
> index 000000000000..73458247deb7
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/idr.rst
> @@ -0,0 +1,74 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/idr.rst
> +
> +:翻译:
> +
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +======
> +ID分配
> +======
> +
> +:作者: Matthew Wilcox
> +
> +概述
> +====
> +
> +要解决的一个常见问题是分配标识符（IDs）；它通常是标识事物的数字。比如包括文件描述
> +符、进程ID、网络协议中的数据包标识符、SCSI标记和设备实例编号。IDR和IDA为这个问题
> +提供了一个合理的解决方案，以避免每个人都自创。IDR提供将ID映射到指针的能力，而IDA
> +仅提供ID分配，因此内存效率更高。
> +
> +IDR接口已经被废弃，请使用 `XArray <xarray>` 代替。
> +
> +IDR的用法
> +=========
> +
> +首先初始化一个IDR，对于静态分配的IDR使用DEFINE_IDR()，或者对于动态分配的IDR使用
> +idr_init()。
> +
> +您可以调用idr_alloc()来分配一个未使用的ID。通过调用idr_find()查询与该ID相关的指针，
> +并通过调用idr_remove()释放该ID。
> +
> +如果需要更改与一个ID相关联的指针，可以调用idr_replace()。这样做的一个常见原因是通
> +过将 ``NULL`` 指针传递给分配函数来保留ID；用保留的ID初始化对象，最后将初始化的对
> +象插入IDR。
> +
> +一些用户需要分配大于 ``INT_MAX`` 的ID。到目前为止，所有这些用户都满足于 ``UINT_MAX``

满足于 -> 满足

> +限制，他们使用idr_alloc_u32()。如果您需要的ID不适合在u32中使用，我们将与您合作以

不符合u32 or 超出u32

> +满足您的需求。
> +
> +如果需要按顺序分配ID，可以使用idr_alloc_cyclic()。处理较大数量的ID时，IDR的效率会
> +降低，所以使用这个函数会有一点代价。
> +

Thanks,
	Wu


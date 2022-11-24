Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41080C43219
	for <linux-doc@archiver.kernel.org>; Thu, 24 Nov 2022 07:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiKXHMi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Nov 2022 02:12:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiKXHM1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Nov 2022 02:12:27 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D0475CDFFC
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 23:14:54 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8DxM_DZGH9j6XkAAA--.1339S3;
        Thu, 24 Nov 2022 15:10:17 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxiFfXGH9jRUEZAA--.47737S3;
        Thu, 24 Nov 2022 15:10:16 +0800 (CST)
Message-ID: <d4543b3d-8eeb-e621-1d78-9fc371643e35@loongson.cn>
Date:   Thu, 24 Nov 2022 15:10:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/2] docs/LoongArch: Add boot image header
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     chenhuacai@kernel.org, corbet@lwn.net, alexs@kernel.org,
        seakeel@gmail.com, kernel@xen0n.name, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, loongarch@lists.linux.dev,
        siyanteng01@gmail.com, Xiaotian Wu <wuxiaotian@loongson.cn>,
        Yun Liu <liuyun@loongson.cn>
References: <cover.1669032230.git.siyanteng@loongson.cn>
 <08df007c7488b88ff5400bef6183f9cc68d87616.1669032230.git.siyanteng@loongson.cn>
 <Y3uuGXo3SNtzARP0@bobwxc.mipc>
Content-Language: en-US
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <Y3uuGXo3SNtzARP0@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxiFfXGH9jRUEZAA--.47737S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Ww15Xr1kuFWxtryUXw4rGrg_yoW7Xw45pr
        nxJFyxJF1DJryUJr17Jr1UXr1UJr48J3WUGF18try8Jr1jvr1DJr1UJr18XryUGry8AFyU
        Xw1UJryjyF1UJrDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
        87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
        JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
        cSsGvfC2KfnxnUUI43ZEXa7IU8q2NtUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 11/22/22 00:58, Wu XiangCheng wrote:
> +Cc: Yun Liu <liuyun@loongson.cn>
>
> 2022-11-21 (一) 20:16:30 +0800 Yanteng Si 曰：
>> Describes the meaning and value of the image header field.
>>
>> Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   Documentation/loongarch/boot-image-header.rst | 76 +++++++++++++++++++
>>   Documentation/loongarch/index.rst             |  1 +
>>   2 files changed, 77 insertions(+)
>>   create mode 100644 Documentation/loongarch/boot-image-header.rst
>>
>> diff --git a/Documentation/loongarch/boot-image-header.rst b/Documentation/loongarch/boot-image-header.rst
>> new file mode 100644
>> index 000000000000..92a953a6f2e6
>> --- /dev/null
>> +++ b/Documentation/loongarch/boot-image-header.rst
>> @@ -0,0 +1,76 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +====================================
>> +Boot image header in LoongArch Linux
>> +====================================
>> +
>> +:Author: Yanteng Si <siyanteng@loongson.cn>
>> +:Date:   18 Nov 2022
>> +
>> +This document only describes the boot image header details for
>> +LoongArch Linux.
>> +
>> +The following 64-byte header is present in decompressed Linux
>> +kernel image::
>> +
>> +	u32	MZ_MAGIC		/* "MZ", MS-DOS header */
>> +	u32	res0 = 0		/* reserved */
>> +	u64	kernel_entry		/* Kernel entry point */
>> +	u64	_end - _text		/* Kernel image effective size */
>> +	u64	0			/* Kernel image load offset from start of RAM */
>> +	u64	res1 = 0		/* reserved */
>> +	u64	res2 = 0		/* reserved */
>> +	u64	res3 = 0		/* reserved */
>> +	u32	res4 = 0		/* reserved */
>> +	u32	pe_header - _head	/* Offset to the PE header */
>> +
> Any code related need to be linked here?

The related code is in line 22 of the arch/loongarch/kernel/head.S, 
which is not very readable.


>
>> +
>> +Header notes
>> +============
>> +
>> +Currently, LoongArch has removed the "magic" field.
>> +
>> +According to the EFI specification, the PE/COFF image file header is
>> +required at the beginning of the kernel image; the LoongArch kernel
>> +supports the EFI stub, so the first two bytes of the kernel image header
>> +are "MZ" magic characters, and 0x3c should point to the rest of the
>> +PE/COFF file header, between which The kernel entry point, image
>> +effectivesize, and image load offset layout are as follows::
>> +
>> +          +-----------------------------------------------+
>> +    0x0:  |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |
>> +          +-----------------------------------------------+
>> +    0x8:  | MZ_MAGIC              |          res0         |
>> +          +-----------------------------------------------+
>> +    0x10: |                 kernel_entry                  |
>> +          +-----------------------------------------------+
>> +    0x18: |                  _end - _text                 |
>> +          +-----------------------------------------------+
>> +    0x20: |                       0                       |
>> +          +-----------------------------------------------+
>> +    0x28: |                      res1                     |
>> +          +-----------------------------------------------+
>> +    0x30: |                      res2                     |
>> +          +-----------------------------------------------+
>> +    0x38: |                      res3                     |
>> +          +-----------------------------------------------+
>> +    0x40: |          res14        |       PE header       |
>> +          +-----------------------------------------------+
>> +
> emmm, this figure...
>
> So MZ_MAGIC start from 0x08 ?
Form 0x00.
>
> Or
>
>              0     1     2     3     4     5     6     7
>           +-----------------------+-----------------------+
>      0x00 |        MZ_MAGIC       |          res0         |
>           +-----------------------+-----------------------+
>      0x08 |                 kernel_entry                  |
>           +-----------------------------------------------+
>      0x10 |                  _end - _text                 |
>           +-----------------------------------------------+
>      0x18 |                       0                       |
>           +-----------------------------------------------+
>      0x20 |                      res1                     |
>           +-----------------------------------------------+
>      0x28 |                      res2                     |
>           +-----------------------------------------------+
>      0x30 |                      res3                     |
>           +-----------------------+-----------------------+
>      0x38 |          res14        |       PE header       |
>           +-----------------------+-----------------------+

Great!


In patch V2:

res14 -> res4, I don't know why, I misspelled.


Thanks,

Yanteng


>
> If the figure is too difficult to draw, a simple table can also be used
> to instead.
>
> Offset	Name	Size	Note
> ...
>
>> +
>> +All bit fields are in little endian:
>> +
>> +    - MZ: Effective length of 2 bytes;
>> +
>> +    - kernel entry point: leaving 6 bytes blank in front, starting
>> +      from 0x8, with a effective length of 8 bytes;
>> +
>> +    - kernel image effective size: Immediately following the kernel
>> +      entry point, with a effective length of 8 bytes, this field is
>> +      required for the bootloader;
>> +
>> +    - kernel image load offset: Immediately following the kernel
>> +      image effective size, with a effective length of 8 bytes;
>> +
>> +    - Offset to the PE header: leaving 28 bytes blank in front,
>> +      starting from 0x3c, with a effective length of 4 bytes.
>> diff --git a/Documentation/loongarch/index.rst b/Documentation/loongarch/index.rst
>> index aaba648db907..97419821adf9 100644
>> --- a/Documentation/loongarch/index.rst
>> +++ b/Documentation/loongarch/index.rst
>> @@ -10,6 +10,7 @@ LoongArch Architecture
>>   
>>      introduction
>>      irq-chip-model
>> +   boot-image-header
>>   
>>      features
>>   
>> -- 
>> 2.31.1
>>


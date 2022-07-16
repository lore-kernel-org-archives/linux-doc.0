Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157B1C43334
	for <linux-doc@archiver.kernel.org>; Sat, 16 Jul 2022 15:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbiGPP1Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Jul 2022 11:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiGPP1Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Jul 2022 11:27:24 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D7C6D1F62F
        for <linux-doc@vger.kernel.org>; Sat, 16 Jul 2022 08:27:18 -0700 (PDT)
Received: from [192.168.0.101] (unknown [153.35.206.193])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axf+LR2NJiZvMiAA--.3421S3;
        Sat, 16 Jul 2022 23:27:15 +0800 (CST)
Message-ID: <e723e0d0-eebd-a48d-d17f-88ed677623e7@loongson.cn>
Date:   Sat, 16 Jul 2022 23:27:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH 0/4] docs/zh_CN: core-api: Add some translations for the
 "Data structures" section(Part 1)
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, zhoubb.aaron@gmail.com,
        linux-doc@vger.kernel.org
References: <cover.1657796498.git.zhoubinbin@loongson.cn>
 <YtLF2g8fQdi4/aKQ@bobwxc.mipc>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <YtLF2g8fQdi4/aKQ@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axf+LR2NJiZvMiAA--.3421S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWF43GFyrWF4UXr45uw17ZFb_yoW5ArW8pF
        13KF1fG3ZrAF17Crs7Wr1UXry8JFWxW3yqga12qwnYqFn5trWFvrs8tryagFWfJrn2vFW0
        vr4fKrWku34jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
        AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
        rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
        v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j
        6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHU
        DUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/16 22:06, Wu XiangCheng 写道:
> On Thu, Jul 14, 2022 at 09:05:59PM +0800, Binbin Zhou wrote:
>> Hi all:
>>
>> I have translated all the docs for section "Data structures and low-level utilities"
>> of the core-api, and I plan to split them into two patchset submissions.
>>
>> This patchset contains the following files:
>>
>> idr.rst
>> circular-buffers.rst
>> generic-radix-tree.rst
>> packing.rst
>>
>> For more details, please see TODOLIST in core-api/index.rst.
>>
>> Thanks.
>>
>> Binbin Zhou (4):
>>    docs/zh_CN: core-api: Add idr Chinese translation
>>    docs/zh_CN: core-api: Add circular-buffers Chinese translation
>>    docs/zh_CN: core-api: Add generic-radix-tree Chinese translation
>>    docs/zh_CN: core-api: Add packing Chinese translation
> $ git am ~/Desktop/20220714_zhoubinbin_docs_zh_cn_core_api_add_some_translations_for_the_data_structures_section_part_1.mbx
> 应用：docs/zh_CN: core-api: Add idr Chinese translation
> 应用：docs/zh_CN: core-api: Add circular-buffers Chinese translation
> error: 打补丁失败：Documentation/translations/zh_CN/core-api/index.rst:44
> error: Documentation/translations/zh_CN/core-api/index.rst：补丁未应用
> 打补丁失败于 0002 docs/zh_CN: core-api: Add circular-buffers Chinese translation
>
> Since your patches are based on linux-next, 2-4 couldn't be applied to
> docs-next now.
>
> commit 4313a24985f00340eeb591fd66aa2b257b9e0a69 from linux-next have changed
> core-api/index.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 26d9913fc8b60..c52175fc1b610 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -52,7 +52,6 @@ Todolist:
>      circular-buffers
>      generic-radix-tree
>      packing
> -   bus-virt-phys-mapping
>      this_cpu_ops
>      timekeeping
>      errseq
>
> So please rebase your patch set on jc/docs-next.

Hi XiangCheng:

ok, I will rebase my patch set later...

Thanks,

Binbin

>
> Thanks,
> 	Wu
>
>>   .../zh_CN/core-api/circular-buffers.rst       | 205 ++++++++++++++++++
>>   .../zh_CN/core-api/generic-radix-tree.rst     |  23 ++
>>   .../translations/zh_CN/core-api/idr.rst       |  74 +++++++
>>   .../translations/zh_CN/core-api/index.rst     |   8 +-
>>   .../translations/zh_CN/core-api/packing.rst   | 154 +++++++++++++
>>   5 files changed, 460 insertions(+), 4 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/core-api/circular-buffers.rst
>>   create mode 100644 Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
>>   create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst
>>   create mode 100644 Documentation/translations/zh_CN/core-api/packing.rst
>>
>> -- 
>> 2.20.1


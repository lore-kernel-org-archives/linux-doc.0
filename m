Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01687C43334
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 02:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236994AbiFMCjE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 12 Jun 2022 22:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbiFMCjC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 12 Jun 2022 22:39:02 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 72AB65FCA
        for <linux-doc@vger.kernel.org>; Sun, 12 Jun 2022 19:39:00 -0700 (PDT)
Received: from [192.168.1.133] (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_04+o6ZiekA9AA--.29466S3;
        Mon, 13 Jun 2022 10:38:56 +0800 (CST)
Subject: Re: [PATCH 3/3] docs/zh_CN: Update the translation of vm index to
 5.19-rc1
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn
References: <cover.1654780922.git.siyanteng@loongson.cn>
 <41ce34c3f296ae6f615f6a1a61f49186c54139d5.1654780922.git.siyanteng@loongson.cn>
 <YqNtfTmaFzRKfBFK@bobwxc.mipc>
From:   Yanteng Si <siyanteng@loongson.cn>
Message-ID: <0a244ef6-10b0-f09a-6ec6-484506db0dff@loongson.cn>
Date:   Mon, 13 Jun 2022 10:38:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YqNtfTmaFzRKfBFK@bobwxc.mipc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_04+o6ZiekA9AA--.29466S3
X-Coremail-Antispam: 1UD129KBjvJXoW3KFWkZw4kCw1rtrykJFW3Awb_yoWkJr18pa
        4kKFySgan7J345C34xKw1UGF17AF4xua1UGr1Iqw1FvwnFyr1ktr4Dtryqgas3Wry8AFWU
        XwsYqFyjkr1jy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73UjIFyTuYvjfUF3kuDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/6/11 上午12:12, Wu X.C. wrote:
> On Thu, Jun 09, 2022 at 09:27:20PM +0800, Yanteng Si wrote:
>> update to commit 481cc97349d6 ("mm,doc: Add new
>> documentation structure")
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/vm/bootmem.rst         | 13 +++++++
>>   Documentation/translations/zh_CN/vm/index.rst | 39 +++++++++++++++----
>>   Documentation/translations/zh_CN/vm/oom.rst   | 13 +++++++
>>   .../translations/zh_CN/vm/page_allocation.rst | 13 +++++++
>>   .../translations/zh_CN/vm/page_cache.rst      | 13 +++++++
>>   .../translations/zh_CN/vm/page_reclaim.rst    | 13 +++++++
>>   .../translations/zh_CN/vm/page_tables.rst     | 13 +++++++
>>   .../translations/zh_CN/vm/physical_memory.rst | 13 +++++++
>>   .../translations/zh_CN/vm/process_addrs.rst   | 13 +++++++
>>   Documentation/translations/zh_CN/vm/shmfs.rst | 13 +++++++
>>   Documentation/translations/zh_CN/vm/swap.rst  | 13 +++++++
>>   .../translations/zh_CN/vm/vmalloc.rst         | 13 +++++++
>>   12 files changed, 175 insertions(+), 7 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/page_allocation.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/page_tables.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/physical_memory.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/process_addrs.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst
>>
>> diff --git a/Documentation/translations/zh_CN/vm/bootmem.rst b/Documentation/translations/zh_CN/vm/bootmem.rst
>> new file mode 100644
>> index 000000000000..45652031a9cc
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/bootmem.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/bootmem.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +========
>> +启动内存
>> +========
>> diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
>> index a1c6d529b6ff..e9adc693184d 100644
>> --- a/Documentation/translations/zh_CN/vm/index.rst
>> +++ b/Documentation/translations/zh_CN/vm/index.rst
>> @@ -12,11 +12,38 @@
>>   Linux内存管理文档
>>   =================
>>   
>> -这是一个关于Linux内存管理（mm）子系统内部的文档集，其中有不同层次的细节，包括注释
>> -和邮件列表的回复，用于阐述数据结构和算法的基本情况。如果你正在寻找关于简单分配内存的建
>> -议，请参阅(Documentation/translations/zh_CN/core-api/memory-allocation.rst)。
>> -对于控制和调整指南，请参阅(Documentation/admin-guide/mm/index)。
>> -TODO:待引用文档集被翻译完毕后请及时修改此处）
>> +这是一份关于了解Linux的内存管理子系统的指南。如果你正在寻找关于简单分配内存的
>> +建议，请参阅内存分配指南
>> +(Documentation/translations/zh_CN/core-api/memory-allocation.rst)。
>> +关于控制和调整的指南，请看管理指南
>> +(Documentation/translations/zh_CN/admin-guide/mm/index.rst)。
>> +
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   physical_memory
>> +   page_tables
>> +   process_addrs
>> +   bootmem
>> +   page_allocation
>> +   vmalloc
>> +   highmem
>> +   page_reclaim
>> +   swap
>> +   page_cache
>> +   shmfs
>> +   oom
>> +
>> +TODOLIST:
>> +* slab
>> +
>> +遗留文档
>> +========
>> +
>> +这是一个关于Linux内存管理（MM）子系统内部的旧文档的集合，其中有不同层次的细节，
>> +包括注释和邮件列表的回复，用于阐述数据结构和算法的描述。它应该被很好地整合到上述
>> +结构化的文档中，如果它已经完成了它的使命，可以删除。
>>   
>>   .. toctree::
>>      :maxdepth: 1
>> @@ -25,7 +52,6 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
>>      balance
>>      damon/index
>>      free_page_reporting
>> -   highmem
>>      ksm
>>      frontswap
>>      hmm
>> @@ -48,7 +74,6 @@ TODOLIST:
>>   * free_page_reporting
>>   * hugetlbfs_reserv
>>   * page_migration
>> -* slub
>>   * transhuge
>>   * unevictable-lru
>>   * vmalloced-kernel-stacks
>> diff --git a/Documentation/translations/zh_CN/vm/oom.rst b/Documentation/translations/zh_CN/vm/oom.rst
>> new file mode 100644
>> index 000000000000..00cc444cf86b
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/oom.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/oom.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +============
>> +内存不足处理
>> +============
>> diff --git a/Documentation/translations/zh_CN/vm/page_allocation.rst b/Documentation/translations/zh_CN/vm/page_allocation.rst
>> new file mode 100644
>> index 000000000000..ab779498abe6
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/page_allocation.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/page_allocation.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +========
>> +页面分配
>> +========
>> diff --git a/Documentation/translations/zh_CN/vm/page_cache.rst b/Documentation/translations/zh_CN/vm/page_cache.rst
>> new file mode 100644
>> index 000000000000..6e000699da78
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/page_cache.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/page_cache.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +========
>> +页面缓存
>> +========
>> diff --git a/Documentation/translations/zh_CN/vm/page_reclaim.rst b/Documentation/translations/zh_CN/vm/page_reclaim.rst
>> new file mode 100644
>> index 000000000000..3939d4c4a67b
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/page_reclaim.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/page_reclaim.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +========
>> +页面回收
>> +========
>> diff --git a/Documentation/translations/zh_CN/vm/page_tables.rst b/Documentation/translations/zh_CN/vm/page_tables.rst
>> new file mode 100644
>> index 000000000000..180fb79befd0
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/page_tables.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/page_tables.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +====
>> +页表
>> +====
>> diff --git a/Documentation/translations/zh_CN/vm/physical_memory.rst b/Documentation/translations/zh_CN/vm/physical_memory.rst
>> new file mode 100644
>> index 000000000000..5427baea5306
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/physical_memory.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/physical_memory.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +========
>> +物理内存
>> +========
>> diff --git a/Documentation/translations/zh_CN/vm/process_addrs.rst b/Documentation/translations/zh_CN/vm/process_addrs.rst
>> new file mode 100644
>> index 000000000000..980fa32ecf07
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/process_addrs.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/process_addrs.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +========
>> +进程地址
>> +========
>> diff --git a/Documentation/translations/zh_CN/vm/shmfs.rst b/Documentation/translations/zh_CN/vm/shmfs.rst
>> new file mode 100644
>> index 000000000000..5b3c85e5f992
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/shmfs.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/shmfs.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +================
>> +共享内存文件系统
>> +================
> 
> Missing:
> 
> diff --git a/Documentation/vm/slab.rst b/Documentation/vm/slab.rst
> new file mode 100644
> index 000000000000..87d5a5bb172f
> --- /dev/null
> +++ b/Documentation/vm/slab.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============
> +Slab Allocation
> +===============
> 
OK,Thanks.

Thanks,
Yanteng
> --
> Thanks,
> 	Wu
> 
>> diff --git a/Documentation/translations/zh_CN/vm/swap.rst b/Documentation/translations/zh_CN/vm/swap.rst
>> new file mode 100644
>> index 000000000000..568a4472ff11
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/swap.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/swap.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +========
>> +交换内存
>> +========
>> diff --git a/Documentation/translations/zh_CN/vm/vmalloc.rst b/Documentation/translations/zh_CN/vm/vmalloc.rst
>> new file mode 100644
>> index 000000000000..efb542878f8c
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/vmalloc.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:Original: Documentation/vm/vmalloc.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +================
>> +连续虚拟内存分配
>> +================
>> -- 
>> 2.27.0


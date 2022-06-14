Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A03C43334
	for <linux-doc@archiver.kernel.org>; Tue, 14 Jun 2022 13:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242995AbiFNND0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Jun 2022 09:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245344AbiFNNCS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jun 2022 09:02:18 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3E6E8393CC
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 06:02:16 -0700 (PDT)
Received: from [192.168.1.133] (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_0_OhqhinUlBAA--.3364S3;
        Tue, 14 Jun 2022 21:02:10 +0800 (CST)
Subject: Re: [PATCH v2 3/3] docs/zh_CN: Update the translation of vm index to
 5.19-rc1
To:     Alex Shi <seakeel@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>, zhoubinbin@loongson.cn
References: <cover.1655094814.git.siyanteng@loongson.cn>
 <9f458a7be9ef3b9eea3d7bba4e97fc962f6a061e.1655094814.git.siyanteng@loongson.cn>
 <CAJy-AmkF6uCreGjK_iJVOfO6x+yXCecPvL42V+DpXNchm5_bxQ@mail.gmail.com>
From:   Yanteng Si <siyanteng@loongson.cn>
Message-ID: <4d48992c-b09d-3a56-19d5-23b5f971cbcd@loongson.cn>
Date:   Tue, 14 Jun 2022 21:02:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJy-AmkF6uCreGjK_iJVOfO6x+yXCecPvL42V+DpXNchm5_bxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_0_OhqhinUlBAA--.3364S3
X-Coremail-Antispam: 1UD129KBjvAXoW3KF4kAF1rWF48JFyDZFy7Wrg_yoW8Jr4Uto
        ZxKw43CrZ2krn8JFs8Cw4UJr47CF1xCFZ7Jr4UC3yqga4qy3W8Gw10yw15t39I9rW5G3Wf
        JF92g3y3JayUJ3Z5n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYf7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6ry8MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjHGQDUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/6/13 下午2:30, Alex Shi wrote:
> On Mon, Jun 13, 2022 at 1:02 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>>
>> update to commit 481cc97349d6 ("mm,doc: Add new
>> documentation structure")
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/vm/bootmem.rst         | 14 +++++++
>>   Documentation/translations/zh_CN/vm/index.rst | 37 +++++++++++++++----
>>   Documentation/translations/zh_CN/vm/oom.rst   | 14 +++++++
>>   .../translations/zh_CN/vm/page_allocation.rst | 14 +++++++
>>   .../translations/zh_CN/vm/page_cache.rst      | 14 +++++++
>>   .../translations/zh_CN/vm/page_reclaim.rst    | 14 +++++++
>>   .../translations/zh_CN/vm/page_tables.rst     | 14 +++++++
>>   .../translations/zh_CN/vm/physical_memory.rst | 14 +++++++
>>   .../translations/zh_CN/vm/process_addrs.rst   | 14 +++++++
>>   Documentation/translations/zh_CN/vm/shmfs.rst | 14 +++++++
>>   Documentation/translations/zh_CN/vm/slab.rst  | 14 +++++++
>>   Documentation/translations/zh_CN/vm/swap.rst  | 14 +++++++
>>   .../translations/zh_CN/vm/vmalloc.rst         | 14 +++++++
>>   13 files changed, 198 insertions(+), 7 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/page_allocation.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/page_tables.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/physical_memory.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/process_addrs.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/slab.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
>>   create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst
> 
> It's better to add above doc completely one by one, not just
> unfinished few words.
In the beginning, I thought so too.

To be honest, My original intention was that a zh_CN update patch should 
equal an English patch. Because My commit simply updates vm/index.rst to 
5.19rc-1. I don't know why there are so many empty files mixed in with 
the original patch(commit: 481cc97349d694e3211e14a886ad2b7ef55b5a2c).

Of course, I'm willing to add them to the TODOLIST if you insist. :)

Thanks,
Yanteng


> 
> Thanks
> Alex
> 
>>
>> diff --git a/Documentation/translations/zh_CN/vm/bootmem.rst b/Documentation/translations/zh_CN/vm/bootmem.rst
>> new file mode 100644
>> index 000000000000..8f8fa82281f1
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/bootmem.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> index a1c6d529b6ff..a02929bb0d31 100644
>> --- a/Documentation/translations/zh_CN/vm/index.rst
>> +++ b/Documentation/translations/zh_CN/vm/index.rst
>> @@ -12,11 +12,36 @@
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
>> +   slab
>> +   highmem
>> +   page_reclaim
>> +   swap
>> +   page_cache
>> +   shmfs
>> +   oom
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
>> @@ -25,7 +50,6 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
>>      balance
>>      damon/index
>>      free_page_reporting
>> -   highmem
>>      ksm
>>      frontswap
>>      hmm
>> @@ -48,7 +72,6 @@ TODOLIST:
>>   * free_page_reporting
>>   * hugetlbfs_reserv
>>   * page_migration
>> -* slub
>>   * transhuge
>>   * unevictable-lru
>>   * vmalloced-kernel-stacks
>> diff --git a/Documentation/translations/zh_CN/vm/oom.rst b/Documentation/translations/zh_CN/vm/oom.rst
>> new file mode 100644
>> index 000000000000..633b02d79f24
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/oom.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> index 000000000000..3d5b2743d96a
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/page_allocation.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> index 000000000000..b0c9c72ccde8
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/page_cache.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> index 000000000000..83275afc07bf
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/page_reclaim.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> index 000000000000..b525d8f0438c
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/page_tables.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> index 000000000000..129962d496ce
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/physical_memory.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> index 000000000000..c1319938101b
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/process_addrs.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> index 000000000000..2987939f5e25
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/shmfs.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> diff --git a/Documentation/translations/zh_CN/vm/slab.rst b/Documentation/translations/zh_CN/vm/slab.rst
>> new file mode 100644
>> index 000000000000..0af77c8612b8
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/slab.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/vm/slab.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +========
>> +Slab分配
>> +========
>> diff --git a/Documentation/translations/zh_CN/vm/swap.rst b/Documentation/translations/zh_CN/vm/swap.rst
>> new file mode 100644
>> index 000000000000..1c1a3e61a80c
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/swap.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>> index 000000000000..d65ed70642c9
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/vm/vmalloc.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
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
>>


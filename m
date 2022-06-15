Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1024CC43334
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jun 2022 08:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240275AbiFOIds (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jun 2022 04:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343616AbiFOIdU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 04:33:20 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8B067237DD
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 01:32:34 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_90Xmali_GNDAA--.5735S3;
        Wed, 15 Jun 2022 16:32:25 +0800 (CST)
Message-ID: <18d42a91-0203-9f83-0989-5b9ca25a08cd@loongson.cn>
Date:   Wed, 15 Jun 2022 16:32:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
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
 <4d48992c-b09d-3a56-19d5-23b5f971cbcd@loongson.cn>
 <CAJy-AmkAHT80n7BUfCi0kj4zMZYtUdG7q=WrUnnkUbg_mVZ4_g@mail.gmail.com>
 <5be7a9e0-7968-f38e-6d4c-ca1900c58524@loongson.cn>
 <CAJy-Am=sr07ZaDhLJdipubZs5bSpFHmv9ht2-zBbv6YAc85UYw@mail.gmail.com>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <CAJy-Am=sr07ZaDhLJdipubZs5bSpFHmv9ht2-zBbv6YAc85UYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_90Xmali_GNDAA--.5735S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1UKw1fGr4UCFWxGr18AFb_yoWrAry5pa
        97KF1fWFsxJw13Cw4Igw18Gr1FyF1xWa1UWr12gwnaqrs7trs5trs8tr9I9FZ3Xry8Ja4U
        Zw4rKFy7ur1YyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjNJ55UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/15 11:55, Alex Shi 写道:
> On Wed, Jun 15, 2022 at 10:38 AM YanTeng Si <siyanteng@loongson.cn> wrote:
>>
>> 在 2022/6/14 21:42, Alex Shi 写道:
>>> On Tue, Jun 14, 2022 at 9:02 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>>>> On 2022/6/13 下午2:30, Alex Shi wrote:
>>>>> On Mon, Jun 13, 2022 at 1:02 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>>>>>> update to commit 481cc97349d6 ("mm,doc: Add new
>>>>>> documentation structure")
>> Note: There are some empty files that do not need to be updated for now,
>>
>> they are:
>>
>> bootmem,
>> oom,
>> page_allocation,
>> page_cache,
>> page_reclaim,
>> page_tables,
>> physical_memory
>> process_addrs,
>> shmfs,
>> slab,
>> swap.
>>>>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>>>>> ---
>>>>>>     .../translations/zh_CN/vm/bootmem.rst         | 14 +++++++
>>>>>>     Documentation/translations/zh_CN/vm/index.rst | 37 +++++++++++++++----
>>>>>>     Documentation/translations/zh_CN/vm/oom.rst   | 14 +++++++
>>>>>>     .../translations/zh_CN/vm/page_allocation.rst | 14 +++++++
>>>>>>     .../translations/zh_CN/vm/page_cache.rst      | 14 +++++++
>>>>>>     .../translations/zh_CN/vm/page_reclaim.rst    | 14 +++++++
>>>>>>     .../translations/zh_CN/vm/page_tables.rst     | 14 +++++++
>>>>>>     .../translations/zh_CN/vm/physical_memory.rst | 14 +++++++
>>>>>>     .../translations/zh_CN/vm/process_addrs.rst   | 14 +++++++
>>>>>>     Documentation/translations/zh_CN/vm/shmfs.rst | 14 +++++++
>>>>>>     Documentation/translations/zh_CN/vm/slab.rst  | 14 +++++++
>>>>>>     Documentation/translations/zh_CN/vm/swap.rst  | 14 +++++++
>>>>>>     .../translations/zh_CN/vm/vmalloc.rst         | 14 +++++++
>>>>>>     13 files changed, 198 insertions(+), 7 deletions(-)
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/page_allocation.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/page_tables.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/physical_memory.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/process_addrs.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/slab.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
>>>>>>     create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst
>>>>> It's better to add above doc completely one by one, not just
>>>>> unfinished few words.
>>>> In the beginning, I thought so too.
>>>>
>>>> To be honest, My original intention was that a zh_CN update patch should
>>>> equal an English patch. Because My commit simply updates vm/index.rst to
>>>> 5.19rc-1. I don't know why there are so many empty files mixed in with
>>>> the original patch(commit: 481cc97349d694e3211e14a886ad2b7ef55b5a2c).
>>>>
>>>> Of course, I'm willing to add them to the TODOLIST if you insist. :)
>>>>
>>> Uh, I understand these awkward empty files may imply a plan, but until now
>>> It's just meaningless file, may not worth to translate them now. We'd
>>> better leave
>>> them off and do translation after some meaningful info added, and then the
>>> translator sign will be more accountable.  Is this good for you or any
>>> more ideas?
>> OK, remove them, and add them to the TODOLIST.
> Hi yanteng,
>
> After thought twice about TODOLIST, we hope TODOLIST become the
> guide list for next translation target, on this pointview, these meaningless
> files are not worth to get into them, otherwise, the TODDOLIST is just all
> files list without guiding function.
> So on this point, we may leave off them totally until sth meaningful fulfilled
> into these files.  Is this better?

agree!


Thanks,

Yanteng


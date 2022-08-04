Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7170C19F29
	for <linux-doc@archiver.kernel.org>; Thu,  4 Aug 2022 01:12:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237097AbiHDBM5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 21:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236360AbiHDBMy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 21:12:54 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6677240BD3
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 18:12:52 -0700 (PDT)
Received: from [192.168.100.119] (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxCs0QHetiU7gEAA--.5454S3;
        Thu, 04 Aug 2022 09:12:49 +0800 (CST)
Message-ID: <d56e5f57-66be-f052-7711-1762270d3961@loongson.cn>
Date:   Thu, 4 Aug 2022 09:12:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH v2 2/4] docs/zh_CN: core-api: Add circular-buffers Chinese
 translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        "Wu X.C." <bobwxc@email.cn>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1658196777.git.zhoubinbin@loongson.cn>
 <945ab16a062dd6f832633fec0eccbde1899fa705.1658196777.git.zhoubinbin@loongson.cn>
 <CAJy-AmkZFxNPL52M6Yuxu9prgdPSxkaO-FUs=tfY7ZB=YHoR1w@mail.gmail.com>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <CAJy-AmkZFxNPL52M6Yuxu9prgdPSxkaO-FUs=tfY7ZB=YHoR1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxCs0QHetiU7gEAA--.5454S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Kry8Zr4rCFy5Wry5Cw4rXwb_yoWkWw4DpF
        9Fga9akFn2y340y3s8KFy5WFnFka48AF17Kws7KFyUWF4vywn3Xr9Fk3429F1fW34xAFyD
        AFWqkryIkFyUA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUHpB-UUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Alex:


在 2022/8/3 15:11, Alex Shi 写道:
> On Tue, Jul 19, 2022 at 9:04 PM Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>>
>> Translate core-api/circular-buffers.rst into Chinese.
>>
>> Last English version used:
>>
>> commit 714b6904e23e ("doc: Remove ".vnet" from paulmck email addresses").
>>
>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>> ---
>>   .../zh_CN/core-api/circular-buffers.rst       | 209 ++++++++++++++++++
>>   .../translations/zh_CN/core-api/index.rst     |   2 +-
>>   2 files changed, 210 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/core-api/circular-buffers.rst
>>
>> diff --git a/Documentation/translations/zh_CN/core-api/circular-buffers.rst b/Documentation/translations/zh_CN/core-api/circular-buffers.rst
>> new file mode 100644
>> index 000000000000..7c7eab7c386f
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/core-api/circular-buffers.rst
>> @@ -0,0 +1,209 @@
>> +.. SPDX-License-Identifier: GPL-2.0+
>> +
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/core-api/circular-buffers.rst
>> +
>> +:翻译:
>> +
>> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
>> +
>> +:校译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> + 吴想成 Wu Xiangcheng <bobwxc@email.cn>
>> +
>> +==========
>> +环形缓冲区
>> +==========
>> +
>> +:作者: David Howells <dhowells@redhat.com>
>> +:作者: Paul E. McKenney <paulmck@linux.ibm.com>
>> +
>> +
>> +Linux 提供了许多可用于实现循环缓冲的特性。有两组这样的特性：
>> +
>> + (1) 用于确定2次方大小的缓冲区信息的便利函数。
>> +
>> + (2) 当缓冲区中对象的生产者和消费者不想共享一个锁时的内存屏障。
> 
> the word by word translation maybe hard to understand in another
> language, So let try:
> 
> 可以代替缓冲区中对象的生产者和消费者共享锁的内存屏障
OK, I see and try to avoid word by word translations in the future.
> 
>> +
>> +如下所述，要使用这些设施，只需要一个生产者和一个消费者。可以通过序列化来处理多个
>> +生产者，并通过序列化来处理多个消费者。
>> +
>> +.. Contents:
>> +
>> + (*) 什么是环形缓冲区？
>> +
>> + (*) 测量2次幂缓冲区
>> +
>> + (*) 内存屏障与环形缓冲区的结合使用
>> +     - 生产者
>> +     - 消费者
>> +
>> + (*) 延伸阅读
>> +
>> +
>> +
>> +什么是环形缓冲区？
>> +==================
>> +
>> +首先，什么是环形缓冲区？环形缓冲区是具有固定的有限大小的缓冲区，它有两个索引：
>> +
>> + (1) 'head'索引 - 生产者将元素插入缓冲区的位置。
>> +
>> + (2) 'tail'索引 - 消费者在缓冲区中找到下一个元素的位置。
>> +
>> +通常，当tail指针等于head指针时，表明缓冲区是空的；而当head指针比tail指针少一个时，
>> +表明缓冲区是满的。
>> +
>> +添加元素时，递增head索引；删除元素时，递增tail索引。tail索引不应该跳过head索引，
>> +两个索引在到达缓冲区末端时都应该被赋值为0，从而允许海量的数据流过缓冲区。
>> +
>> +通常情况下，元素都有相同的单元大小，但这并不是使用以下技术的严格要求。如果要在缓
>> +冲区中包含多个元素或可变大小的元素，则索引可以增加超过1，前提是两个索引都没有超过
>> +另一个。然而，实现者必须小心，因为超过一个单位大小的区域可能会覆盖缓冲区的末端并
>> +且缓冲区会被分成两段。
>> +
>> +测量2次幂缓冲区
>> +===============
>> +
>> +计算任意大小的环形缓冲区的占用或剩余容量通常是一个费时的操作，需要使用模（除法）
>> +指令。但是如果缓冲区的大小为2次幂，则可以使用更快的按位与指令代替。
>> +
>> +Linux提供了一组用于处理2次幂环形缓冲区的宏。可以通过以下方式使用::
>> +
>> +       #include <linux/circ_buf.h>
>> +
>> +这些宏包括：
>> +
>> + (#) 测量缓冲区的剩余容量::
>> +
>> +       CIRC_SPACE(head_index, tail_index, buffer_size);
>> +
>> +     返回缓冲区[1]中可插入元素的剩余空间大小。
>> +
>> +
>> + (#) 测量缓冲区中的最大连续即时空间::
> 
> 测量缓冲区中的最大连续立即可用空间
> 
>> +
>> +       CIRC_SPACE_TO_END(head_index, tail_index, buffer_size);
>> +
>> +     返回缓冲区[1]中剩余的连续空间的大小，元素可以立即插入其中，而不必绕回到缓冲
>> +     区的开头。
>> +
>> +
>> + (#) 测量缓冲区的占用率::
> 
> 测量缓冲区的使用数
> There has no 'rate' meaning.Yes, It's better.
> 
>> +
>> +       CIRC_CNT(head_index, tail_index, buffer_size);
>> +
>> +     返回当前占用缓冲区[2]的元素数量。
>> +
>> +
>> + (#) 测量缓冲区的非覆盖占用率::
> 
>   测量缓冲区的连续使用数
OK..
> 
>> +
>> +       CIRC_CNT_TO_END(head_index, tail_index, buffer_size);
>> +
>> +     返回可以从缓冲区中提取的连续元素[2]的数量，而不必绕回到缓冲区的开头。
>> +
>> +这里的每一个宏名义上都会返回一个介于0和buffer_size-1之间的值，但是：
>> +
>> + (1) CIRC_SPACE*()是为了在生产者中使用。对生产者来说，它们将返回一个下限，因为生
>> +     产者控制着head索引，但消费者可能仍然在另一个CPU上耗尽缓冲区并移动tail索引。
>> +
>> +     对消费者来说，它将显示一个上限，因为生产者可能正忙于耗尽空间。
>> +
>> + (2) CIRC_CNT*()是为了在消费者中使用。对消费者来说，它们将返回一个下限，因为消费
>> +     者控制着tail索引，但生产者可能仍然在另一个CPU上填充缓冲区并移动head索引。
>> +
>> +     对于生产者，它将显示一个上限，因为消费者可能正忙于清空缓冲区。
>> +
>> + (3) 对于第三方来说，生产者和消费者对索引的写入顺序是无法保证的，因为它们是独立的，
>> +     而且可能是在不同的CPU上进行的，所以在这种情况下的结果只是一种猜测，甚至可能
>> +     是错误的。
>> +
>> +内存屏障与环形缓冲区的结合使用
>> +==============================
>> +
>> +通过将内存屏障与环形缓冲区结合使用，可以避免以下需求：
>> +
>> + (1) 使用单个锁来控制对缓冲区两端的访问，从而允许同时填充和清空缓冲区；以及
>> +
>> + (2) 使用原子计数器操作。
>> +
>> +这有两个方面：填充缓冲区的生产者和清空缓冲区的消费者。在任何时候，只应有一个生产
>> +者在填充缓冲区，同样的也只应有一个消费者在清空缓冲区，但双方可以同时操作。
>> +
>> +
>> +生产者
>> +------
>> +
>> +生产者看起来像这样::
>> +
>> +       spin_lock(&producer_lock);
>> +
>> +       unsigned long head = buffer->head;
>> +       /* spin_unlock()和下一个spin_lock()提供必要的排序。 */
>> +       unsigned long tail = READ_ONCE(buffer->tail);
>> +
>> +       if (CIRC_SPACE(head, tail, buffer->size) >= 1) {
>> +               /* 添加一个元素到缓冲区 */
>> +               struct item *item = buffer[head];
>> +
>> +               produce_item(item);
>> +
>> +               smp_store_release(buffer->head,
>> +                                 (head + 1) & (buffer->size - 1));
>> +
>> +               /* wake_up()将确保在唤醒任何人之前提交head */
>> +               wake_up(consumer);
>> +       }
>> +
>> +       spin_unlock(&producer_lock);
>> +
>> +这将表明CPU必须在head索引使其对消费者可用之前写入新项目的内容，同时CPU必须在唤醒
>> +消费者之前写入修改后的head索引。
>> +
>> +请注意，wake_up()并不保证任何形式的屏障，除非确实唤醒了某些东西。因此我们不能依靠
>> +它来进行排序。但是数组中始终有一个元素留空，因此生产者必须产生两个元素，然后才可
>> +能破坏消费者当前正在读取的元素。同时，消费者连续调用之间成对的解锁-加锁提供了索引
>> +读取（指示消费者已清空给定元素）和生产者对该相同元素的写入之间的必要顺序。
>> +
>> +
>> +消费者
>> +------
>> +
>> +消费者看起来像这样::
>> +
>> +       spin_lock(&consumer_lock);
>> +
>> +       /* 读取该索引处的内容之前，先读取索引 */
>> +       unsigned long head = smp_load_acquire(buffer->head);
>> +       unsigned long tail = buffer->tail;
>> +
>> +       if (CIRC_CNT(head, tail, buffer->size) >= 1) {
>> +
>> +               /* 从缓冲区中提取一个元素 */
>> +               struct item *item = buffer[tail];
>> +
>> +               consume_item(item);
>> +
>> +               /* 在递增tail之前完成对描述符的读取。 */
>> +               smp_store_release(buffer->tail,
>> +                                 (tail + 1) & (buffer->size - 1));
>> +       }
>> +
>> +       spin_unlock(&consumer_lock);
>> +
>> +这表明CPU在读取新元素之前确保索引是最新的，然后在写入新的尾指针之前应确保CPU已完
>> +成读取该元素，这将擦除该元素。
>> +
>> +请注意，使用READ_ONCE()和smp_load_acquire()来读取反向索引。这可以防止编译器丢弃并
>> +重新加载其缓存值。如果您能确定反向索引将仅使用一次，则这不是严格需要的。
> 
> 反向索引。==> 反向（head）索引。
> 则这不是严格需要的 ==> 则这不是必须的。OK, I got it.

Thanks for review.

Binbin

> 
> Fot the left:
> Reviewed-by: Alex Shi <alexs@kernel.org>
> 
> 
>> +smp_load_acquire()还可以强制CPU对后续的内存引用进行排序。类似地，两种算法都使用
>> +smp_store_release()来写入线程的索引。这记录了我们正在写入可以并发读取的内容的事实，
>> +以防止编译器破坏存储，并强制对以前的访问进行排序。
>> +
>> +
>> +延伸阅读
>> +========
>> +
>> +关于Linux的内存屏障设施的描述，请查看Documentation/memory-barriers.txt。
>> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
>> index 94eeef20c042..854b923f3b30 100644
>> --- a/Documentation/translations/zh_CN/core-api/index.rst
>> +++ b/Documentation/translations/zh_CN/core-api/index.rst
>> @@ -45,12 +45,12 @@
>>      xarray
>>      rbtree
>>      idr
>> +   circular-buffers
>>
>>   Todolist:
>>
>>
>>
>> -   circular-buffers
>>      generic-radix-tree
>>      packing
>>      bus-virt-phys-mapping
>> --
>> 2.20.1
>>

